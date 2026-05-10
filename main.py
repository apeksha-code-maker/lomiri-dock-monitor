import sys
import subprocess

from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot


class Backend(QObject):

    @Slot(str, result=str)
    def runCommand(self, command):

        try:
            output = subprocess.check_output(
                command,
                shell=True,
                stderr=subprocess.STDOUT,
                text=True
            )

            return output

        except subprocess.CalledProcessError as e:
            return e.output


    @Slot(result=str)
    def startContainer(self):

        try:
            output = subprocess.check_output(
                "docker start nginx-container",
                shell=True,
                stderr=subprocess.STDOUT,
                text=True
            )

            return output

        except subprocess.CalledProcessError as e:
            return e.output


    @Slot(result=str)
    def stopContainer(self):

        try:
            output = subprocess.check_output(
                "docker stop nginx-container",
                shell=True,
                stderr=subprocess.STDOUT,
                text=True
            )

            return output

        except subprocess.CalledProcessError as e:
            return e.output


    @Slot(result=str)
    def getLogs(self):

        try:
            output = subprocess.check_output(
                "docker logs nginx-container",
                shell=True,
                stderr=subprocess.STDOUT,
                text=True
            )

            return output

        except subprocess.CalledProcessError as e:
            return e.output


app = QApplication(sys.argv)

engine = QQmlApplicationEngine()

backend = Backend()

engine.rootContext().setContextProperty(
    "backend",
    backend
)

engine.load("qml/Main.qml")

if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
