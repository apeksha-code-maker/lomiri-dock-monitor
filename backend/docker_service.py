import subprocess

def get_containers():
    output = subprocess.check_output(
        ["docker", "ps"],
        text=True
    )
    
    return output


if __name__ == "__main__":
    print(get_containers())
