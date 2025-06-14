import sys
import mysql.connector
from mysql.connector import Error
from PySide6.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget, QLineEdit, QPushButton, QTableWidget, \
    QTableWidgetItem, QLabel, QMessageBox



class Actor:
    def __init__(self, id_actor, nombre):
        self.id_actor = id_actor
        self.nombre = nombre



class Pelicula:
    def __init__(self, id_pelicula, titulo, anio, puntuacion, sinopsis):
        self.id_pelicula = id_pelicula
        self.titulo = titulo
        self.anio = anio
        self.puntuacion = puntuacion
        self.sinopsis = sinopsis



class GestorPeliculas:
    def __init__(self):
        self.__conexion = None
        self.__cursor = None
        self.conectar()

    def conectar(self):
        try:
            self.__conexion = mysql.connector.connect(
                host='localhost',
                database='peliculasDB',
                user='root',
                password='rodri'
            )
            if self.__conexion.is_connected():
                self.__cursor = self.__conexion.cursor()
                print("Conexión exitosa a la base de datos")
        except Error as e:
            print(f"Error al conectar a la base de datos: {e}")

    def buscar_pelicula_por_titulo(self, titulo):
        try:
            query = """
            SELECT p.ID_Pelicula, p.Titulo, p.Anio, p.Puntuacion, p.Sinopsis
            FROM Peliculas p
            WHERE p.Titulo LIKE %s
            """
            self.__cursor.execute(query, (f'%{titulo}%',))
            return [Pelicula(*pelicula) for pelicula in self.__cursor.fetchall()]
        except Error as e:
            print(f"Error al buscar película: {e}")
            return []

    def buscar_peliculas_comunes(self, actor1, actor2):
        try:
            query = """
            SELECT DISTINCT p.ID_Pelicula, p.Titulo, p.Anio, p.Puntuacion, p.Sinopsis
            FROM Peliculas p
            JOIN Tabla_Pelicula_Actor pa1 ON p.ID_Pelicula = pa1.ID_Pelicula
            JOIN Tabla_Pelicula_Actor pa2 ON p.ID_Pelicula = pa2.ID_Pelicula
            JOIN actores a1 ON a1.ID_Actor = pa1.ID_Actor
            JOIN actores a2 ON a2.ID_Actor = pa2.ID_Actor
            WHERE a1.Actor_Protagonista LIKE %s AND a2.Actor_Protagonista LIKE %s
            """
            self.__cursor.execute(query, (f'%{actor1}%', f'%{actor2}%'))
            return [Pelicula(*pelicula) for pelicula in self.__cursor.fetchall()]
        except Error as e:
            print(f"Error al buscar películas comunes: {e}")
            return []

    def obtener_actores(self):
        try:
            query = "SELECT ID_Actor, Actor_Protagonista FROM actores"
            self.__cursor.execute(query)
            return [Actor(id_actor, nombre) for id_actor, nombre in self.__cursor.fetchall()]
        except Error as e:
            print(f"Error al obtener actores: {e}")
            return []



class VistaCatalogoPeliculas(QMainWindow):
    def __init__(self, gestor):
        super().__init__()
        self.gestor = gestor
        self.setWindowTitle("Catálogo de Películas")
        self.setGeometry(100, 100, 800, 600)
        self.initUI()

    def initUI(self):
        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        self.layout = QVBoxLayout(self.central_widget)

        self.buscar_input = QLineEdit(self)
        self.buscar_input.setPlaceholderText("Buscar película por título")
        self.layout.addWidget(self.buscar_input)

        self.buscar_button = QPushButton("Buscar", self)
        self.layout.addWidget(self.buscar_button)

        self.result_table = QTableWidget(self)
        self.result_table.setColumnCount(5)
        self.result_table.setHorizontalHeaderLabels(["ID", "Título", "Año", "Puntuación", "Sinopsis"])
        self.layout.addWidget(self.result_table)

        self.actor1_input = QLineEdit(self)
        self.actor1_input.setPlaceholderText("Escribir Actor 1")
        self.layout.addWidget(QLabel("Seleccionar Actor 1:"))
        self.layout.addWidget(self.actor1_input)

        self.actor2_input = QLineEdit(self)
        self.actor2_input.setPlaceholderText("Escribir Actor 2")
        self.layout.addWidget(QLabel("Seleccionar Actor 2:"))
        self.layout.addWidget(self.actor2_input)

        self.buscar_comunes_button = QPushButton("Buscar Películas Comunes", self)
        self.layout.addWidget(self.buscar_comunes_button)

    def mostrar_detalles_pelicula(self, row, column):
        id_pelicula = self.result_table.item(row, 0).text()
        titulo = self.result_table.item(row, 1).text()
        sinopsis = self.result_table.item(row, 4).text()
        QMessageBox.information(self, "Detalles de la Película",
                                f"ID: {id_pelicula}\nTítulo: {titulo}\nSinopsis: {sinopsis}")



class ControladorCatalogoPeliculas:
    def __init__(self, vista, gestor):
        self.vista = vista
        self.gestor = gestor

        self.vista.buscar_button.clicked.connect(self.buscar_pelicula)
        self.vista.buscar_comunes_button.clicked.connect(self.buscar_peliculas_comunes)

    def buscar_pelicula(self):
        titulo = self.vista.buscar_input.text()
        if titulo:
            peliculas = self.gestor.buscar_pelicula_por_titulo(titulo)
            self.vista.result_table.setRowCount(len(peliculas))
            for row_index, pelicula in enumerate(peliculas):
                self.vista.result_table.setItem(row_index, 0, QTableWidgetItem(str(pelicula.id_pelicula)))
                self.vista.result_table.setItem(row_index, 1, QTableWidgetItem(pelicula.titulo))
                self.vista.result_table.setItem(row_index, 2, QTableWidgetItem(str(pelicula.anio)))
                self.vista.result_table.setItem(row_index, 3, QTableWidgetItem(str(pelicula.puntuacion)))
                self.vista.result_table.setItem(row_index, 4, QTableWidgetItem(pelicula.sinopsis))
        else:
            QMessageBox.warning(self.vista, "Campo Vacío", "Por favor, ingrese un título para buscar.")

    def buscar_peliculas_comunes(self):
        actor1 = self.vista.actor1_input.text()
        actor2 = self.vista.actor2_input.text()

        if actor1 and actor2:
            peliculas = self.gestor.buscar_peliculas_comunes(actor1, actor2)
            if peliculas:
                resultados = "\n".join([f"{p.titulo} ({p.anio}, Puntuación: {p.puntuacion})" for p in peliculas])
                QMessageBox.information(self.vista, "Películas Comunes", f"Películas en común:\n{resultados}")
            else:
                QMessageBox.warning(self.vista, "Sin Resultados", "No se encontraron películas comunes.")
        else:
            QMessageBox.warning(self.vista, "Campos Vacíos", "Por favor, complete ambos campos de actores.")



if __name__ == "__main__":
    app = QApplication(sys.argv)
    gestor = GestorPeliculas()
    vista = VistaCatalogoPeliculas(gestor)
    controlador = ControladorCatalogoPeliculas(vista, gestor)
    vista.show()
    sys.exit(app.exec())
