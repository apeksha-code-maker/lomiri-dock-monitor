import psutil

def cpu_usage():
    return psutil.cpu_percent()

def ram_usage():
    return psutil.virtual_memory().percent


if __name__ == "__main__":
    print("CPU Usage:", cpu_usage(), "%")
    print("RAM Usage:", ram_usage(), "%")
