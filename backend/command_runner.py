import subprocess
from PySide6.QtCore import QObject, Slot

class CommandRunner(QObject):

    @Slot(str, result=str)
    def runCommand(self, command):
        try:
            result = subprocess.check_output(
                command,
                shell=True,
                stderr=subprocess.STDOUT,
                text=True
            )

            return result

        except subprocess.CalledProcessError as e:
            return e.output

    @Slot(result=str)
    def startContainer(self):
        return self.runCommand("docker start nginx-container")

    @Slot(result=str)
    def stopContainer(self):
        return self.runCommand("docker stop nginx-container")
