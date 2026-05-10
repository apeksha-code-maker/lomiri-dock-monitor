import subprocess

def run_command(command):
    try:
        output = subprocess.check_output(
            command,
            shell=True,
            text=True
        )
        return output

    except subprocess.CalledProcessError as error:
        return str(error)


if __name__ == "__main__":
    print(run_command("docker ps"))
