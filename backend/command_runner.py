import subprocess

class CommandRunner:
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
