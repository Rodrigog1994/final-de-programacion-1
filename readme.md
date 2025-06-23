# Final de Programación 1

Este es el trabajo final de la materia Programación 1. 
La aplicación está hecha en Python con PySide6 para la interfaz gráfica y MySQL para la base de datos.


Requisitos

- Python 3.10 o superior
- MySQL instalado

1. Abrí una terminal.
2. Navegá hasta la carpeta donde se encuentra el archivo `peliculasDB.sql`.
3. Ejecutá el siguiente comando (reemplazá `usuario` por tu usuario de MySQL, por ejemplo `root`):

```bash
mysql -u usuario -p < peliculasDB.sql
Ingresá tu contraseña de MySQL cuando te lo pida (aunque no se vea lo que escribís, es normal).

¡Listo! Ya vas a tener la base de datos peliculasDB cargada en tu sistema.

INSTALACION MYSQL DESDE LA TERMINAL:1) sudo apt update
2)sudo apt install mysql-client

INSTALACION DE PYSIDE6 GUIA SENCILLA:1) Instalación de dependencias previas
bash
sudo apt update
sudo apt install python3-pip python3-venv build-essential
2) Creación del entorno virtual (recomendado)
bash
python3 -m venv ~/venv_pyside6
source ~/venv_pyside6/bin/activate
3) Instalación de PySide6
bash
pip install PySide6
Para VS Code en Ubuntu
1) Instalación de VS Code
bash
sudo apt install code
2) Extensiones necesarias
Abre VS Code

Instala estas extensiones:

Python (Microsoft)

Pylance (opcional pero recomendado)

Qt for Python (soporte para sintaxis)

3) Configuración
Abre tu proyecto

Selecciona el intérprete:

Ctrl+Shift+P → "Python: Select Interpreter"

Elige ~/venv_pyside6/bin/python

Configura el linter:

Ctrl+, → busca "Python Linting"

Activa "Pylint" o "Flake8"








