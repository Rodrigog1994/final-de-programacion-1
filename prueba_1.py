import sys
import mysql.connector
from mysql.connector import Error
from PySide6.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget, QLineEdit, QPushButton, QTableWidget, \
    QTableWidgetItem, QLabel, QMessageBox



class Actor:
    def __init__(self, id_actor, nombre):
        self.id_actor = id_actor
        self.nombre = nombre
        self.peliculas = []

    def agregar_pelicula(self, pelicula):
        if pelicula not in self.peliculas:
            self.peliculas.append(pelicula)

    def listar_peliculas(self):
        return [p.titulo for p in self.peliculas]

class Pelicula:
    def __init__(self, id_pelicula, titulo, anio, puntuacion, sinopsis):
        self.id_pelicula = id_pelicula
        self.titulo = titulo
        self.anio = anio
        self.puntuacion = puntuacion
        self.sinopsis = sinopsis
        self.actores = []

    def agregar_actor(self, actor):
        if actor not in self.actores:
            self.actores.append(actor)
            actor.agregar_pelicula(self)

    def listar_actores(self):
        return [a.nombre for a in self.actores]



class GestorPeliculas:
    def __init__(self):
        self.__conexion = None
        self.__cursor = None
        self.peliculas = {}
        self.actores = {}
        self.conectar()
        self.cargar_datos()

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

    def cargar_datos(self):
        self.cargar_peliculas()
        self.cargar_actores()
        self.cargar_relaciones()

    def cargar_peliculas(self):
        try:
            query = "SELECT ID_Pelicula, Título, Año, Puntuación, Sinopsis FROM Tabla_Peliculas_Normalizada"
            self.__cursor.execute(query)
            for row in self.__cursor.fetchall():
                pelicula = Pelicula(*row)
                self.peliculas[pelicula.id_pelicula] = pelicula
        except Error as e:
            print(f"Error al cargar películas: {e}")

    def cargar_actores(self):
        try:
            query = "SELECT ID_Actor, Nombre FROM Tabla_Actores_Normalizada"
            self.__cursor.execute(query)
            for row in self.__cursor.fetchall():
                actor = Actor(*row)
                self.actores[actor.id_actor] = actor
        except Error as e:
            print(f"Error al cargar actores: {e}")

    def cargar_relaciones(self):
        try:
            query = "SELECT ID_Pelicula, ID_Actor FROM Tabla_Pelicula_Actor_Normalizada"
            self.__cursor.execute(query)
            for id_pelicula, id_actor in self.__cursor.fetchall():
                pelicula = self.peliculas.get(id_pelicula)
                actor = self.actores.get(id_actor)
                if pelicula and actor:
                    pelicula.agregar_actor(actor)
        except Error as e:
            print(f"Error al cargar relaciones: {e}")

    def buscar_pelicula_por_titulo(self, titulo):

        return [p for p in self.peliculas.values() if titulo.lower() in p.titulo.lower()]

    def buscar_peliculas_comunes(self, actor1_nombre, actor2_nombre):

        actor1 = next((a for a in self.actores.values() if actor1_nombre.lower() in a.nombre.lower()), None)
        actor2 = next((a for a in self.actores.values() if actor2_nombre.lower() in a.nombre.lower()), None)
        if actor1 and actor2:

            peliculas_comunes = set(actor1.peliculas) & set(actor2.peliculas)
            return list(peliculas_comunes)
        return []

    def obtener_actores_por_pelicula(self, id_pelicula):
        pelicula = self.peliculas.get(id_pelicula)
        if pelicula:
            return pelicula.actores
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
        self.result_table.cellDoubleClicked.connect(self.mostrar_detalles_pelicula)

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
        id_pelicula = int(self.result_table.item(row, 0).text())
        titulo = self.result_table.item(row, 1).text()
        sinopsis = self.result_table.item(row, 4).text()

        actores = self.gestor.obtener_actores_por_pelicula(id_pelicula)
        nombres_actores = ", ".join([actor.nombre for actor in actores])

        QMessageBox.information(
            self, "Detalles de la Película",
            f"ID: {id_pelicula}\nTítulo: {titulo}\nSinopsis: {sinopsis}\nActores: {nombres_actores}"
        )



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