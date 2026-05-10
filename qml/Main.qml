import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

ApplicationWindow {
    visible: true
    width: 1200
    height: 700
    title: "LomiriDock Monitor"
    color: "#121212"

    property int currentPage: 0

    MessageDialog {
        id: messageBox
        title: "Docker Action"
        text: "Action Executed"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            width: 220
            color: "#1E1E1E"
            Layout.fillHeight: true

            Column {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 20
                spacing: 20

                Text {
                    text: "MENU"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
                }

                Button {
                    text: "Dashboard"
                    width: 160
                    onClicked: currentPage = 0
                }

                Button {
                    text: "Monitor"
                    width: 160
                    onClicked: currentPage = 1
                }

                Button {
                    text: "Logs"
                    width: 160
                    onClicked: currentPage = 2
                }

                Button {
                    text: "Commands"
                    width: 160
                    onClicked: currentPage = 3
                }
            }
        }

        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: currentPage

            // DASHBOARD PAGE
            Rectangle {
                color: "#121212"

                Column {
                    anchors.margins: 20
                    anchors.fill: parent
                    spacing: 20

                    Text {
                        text: "LomiriDock Monitor"
                        color: "white"
                        font.pixelSize: 32
                        font.bold: true
                    }

                    Rectangle {
                        width: 850
                        height: 120
                        radius: 12
                        color: "#1E1E1E"

                        Column {
                            anchors.centerIn: parent
                            spacing: 10

                            Text {
                                text: "Docker Status"
                                color: "white"
                                font.pixelSize: 24
                            }

                            Text {
                                text: "Running Containers: 4"
                                color: "#4CAF50"
                                font.pixelSize: 20
                            }
                        }
                    }

                    Rectangle {
                        width: 850
                        height: 200
                        radius: 12
                        color: "#1E1E1E"

                        Column {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 12

                            Text {
                                text: "nginx-container"
                                color: "white"
                                font.pixelSize: 24
                            }

                            Text {
                                id: statusText
                                text: "Status: Running"
                                color: "#4CAF50"
                                font.pixelSize: 18
                            }

                            Text {
                                text: "Image: nginx:latest"
                                color: "#AAAAAA"
                                font.pixelSize: 18
                            }

                            Row {
                                spacing: 12

                                Button {
                                    text: "Start"

                                    onClicked: {
                                        statusText.text = "Status: Running"
                                        messageBox.text = "Docker container started"
                                        messageBox.open()
                                    }
                                }

                                Button {
                                    text: "Stop"

                                    onClicked: {
                                        statusText.text = "Status: Stopped"
                                        messageBox.text = "Docker container stopped"
                                        messageBox.open()
                                    }
                                }

                                Button {
                                    text: "Logs"

                                    onClicked: {
                                        messageBox.text = "Opening container logs"
                                        messageBox.open()
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // MONITOR PAGE
// MONITOR PAGE
Rectangle {
    color: "#0B0B0B"

    Flickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: 900
        clip: true

        Column {
            width: parent.width
            spacing: 28
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "System Monitor"
                color: "white"
                font.pixelSize: 42
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // CPU CARD
            Rectangle {
                width: 620
                height: 180
                radius: 22
                color: "#171717"
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 22

                    Text {
                        text: "CPU Usage"
                        color: "white"
                        font.pixelSize: 30
                        font.bold: true
                    }

                    ProgressBar {
                        value: 0.34
                        width: 560
                        height: 24
                    }

                    Row {
                        spacing: 20

                        Text {
                            text: "Usage: 34%"
                            color: "#4CAF50"
                            font.pixelSize: 22
                        }

                        Text {
                            text: "Cores: 8"
                            color: "#AAAAAA"
                            font.pixelSize: 22
                        }
                    }
                }
            }

            // RAM CARD
            Rectangle {
                width: 620
                height: 180
                radius: 22
                color: "#171717"
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 22

                    Text {
                        text: "RAM Usage"
                        color: "white"
                        font.pixelSize: 30
                        font.bold: true
                    }

                    ProgressBar {
                        value: 0.61
                        width: 560
                        height: 24
                    }

                    Row {
                        spacing: 20

                        Text {
                            text: "Used: 6.1 GB"
                            color: "#4CAF50"
                            font.pixelSize: 22
                        }

                        Text {
                            text: "Total: 10 GB"
                            color: "#AAAAAA"
                            font.pixelSize: 22
                        }
                    }
                }
            }

            // NETWORK CARD
            Rectangle {
                width: 620
                height: 180
                radius: 22
                color: "#171717"
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 18

                    Text {
                        text: "Network Activity"
                        color: "white"
                        font.pixelSize: 30
                        font.bold: true
                    }

                    Row {
                        spacing: 60

                        Column {
                            spacing: 10

                            Text {
                                text: "Download"
                                color: "#AAAAAA"
                                font.pixelSize: 20
                            }

                            Text {
                                text: "120 Mbps"
                                color: "#00BCD4"
                                font.pixelSize: 28
                                font.bold: true
                            }
                        }

                        Column {
                            spacing: 10

                            Text {
                                text: "Upload"
                                color: "#AAAAAA"
                                font.pixelSize: 20
                            }

                            Text {
                                text: "42 Mbps"
                                color: "#4CAF50"
                                font.pixelSize: 28
                                font.bold: true
                            }
                        }
                    }
                }
            }

            // DOCKER STATS
            Row {
                spacing: 22
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    width: 180
                    height: 140
                    radius: 18
                    color: "#171717"

                    Column {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            text: "Containers"
                            color: "#AAAAAA"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "4"
                            color: "#4CAF50"
                            font.pixelSize: 42
                            font.bold: true
                        }
                    }
                }

                Rectangle {
                    width: 180
                    height: 140
                    radius: 18
                    color: "#171717"

                    Column {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            text: "Images"
                            color: "#AAAAAA"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "12"
                            color: "#00BCD4"
                            font.pixelSize: 42
                            font.bold: true
                        }
                    }
                }

                Rectangle {
                    width: 180
                    height: 140
                    radius: 18
                    color: "#171717"

                    Column {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            text: "Networks"
                            color: "#AAAAAA"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "3"
                            color: "#FFC107"
                            font.pixelSize: 42
                            font.bold: true
                        }
                    }
                }
            }
        }
    }
}
          // LOGS PAGE
Rectangle {
    color: "#0B0B0B"

    Column {
        anchors.fill: parent
        anchors.margins: 25
        spacing: 22

        Text {
            text: "Docker Logs Console"
            color: "white"
            font.pixelSize: 38
            font.bold: true
        }

        Rectangle {
            width: parent.width - 50
            height: 560
            radius: 18
            color: "#050505"
            border.color: "#00C853"
            border.width: 2

            Column {
                anchors.fill: parent
                anchors.margins: 18
                spacing: 16

                // Terminal Header
                Row {
                    spacing: 10

                    Rectangle {
                        width: 14
                        height: 14
                        radius: 7
                        color: "#FF5F56"
                    }

                    Rectangle {
                        width: 14
                        height: 14
                        radius: 7
                        color: "#FFBD2E"
                    }

                    Rectangle {
                        width: 14
                        height: 14
                        radius: 7
                        color: "#27C93F"
                    }

                    Text {
                        text: "docker-logs-terminal"
                        color: "#888888"
                        font.pixelSize: 16
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#1E1E1E"
                }

                Flickable {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.topMargin: 10
                    anchors.bottom: parent.bottom
                    clip: true

                    contentWidth: parent.width
                    contentHeight: logsColumn.height + 40

                    Column {
                        id: logsColumn
                        spacing: 18
                        width: parent.width

                        Text {
                            text: "[07:45:10] [INFO] Docker daemon initialized"
                            color: "#00C853"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:45:18] [INFO] nginx-container started"
                            color: "white"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:45:32] [WARNING] CPU usage spike detected"
                            color: "#FFD600"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:45:40] [INFO] Monitoring service active"
                            color: "#00C853"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:45:55] [ERROR] Failed image pull request"
                            color: "#FF3D00"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:46:02] [INFO] Docker network connected"
                            color: "white"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:46:15] [INFO] Volume mounted successfully"
                            color: "#00C853"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:46:27] [WARNING] RAM usage increased"
                            color: "#FFD600"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:46:41] [INFO] Container restart completed"
                            color: "#00C853"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        Text {
                            text: "[07:46:58] [INFO] Docker stats updated"
                            color: "white"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }
                    }
                }
            }
        }
    }
}

            // COMMANDS PAGE
// COMMANDS PAGE
Rectangle {
    color: "#0B0B0B"

    Column {
        anchors.fill: parent
        anchors.margins: 25
        spacing: 22

        Text {
            text: "Linux Command Console"
            color: "white"
            font.pixelSize: 38
            font.bold: true
        }

        Rectangle {
            width: parent.width - 50
            height: 60
            radius: 14
            color: "#111111"
            border.color: "#00FF99"
            border.width: 1

            Row {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 12

                Text {
                    text: "user@lomiri:~$"
                    color: "#00FF99"
                    font.family: "monospace"
                    font.pixelSize: 22
                    anchors.verticalCenter: parent.verticalCenter
                }

                TextField {
                    id: commandInput
                    width: 520
                    height: 36
                    placeholderText: "Enter Linux command..."
                    text: "sudo apt update"
                    font.pixelSize: 18
                    color: "white"

                    background: Rectangle {
                        radius: 8
                        color: "#1A1A1A"
                        border.color: "#333333"
                    }
                }

                Button {
                    text: "Execute"
                    width: 120
                    height: 38

                    background: Rectangle {
                        radius: 10
                        color: "#00C853"
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        font.pixelSize: 16
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }

        Rectangle {
            width: parent.width - 50
            height: 500
            radius: 18
            color: "#050505"
            border.color: "#222222"
            border.width: 2

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 18

                Row {
                    spacing: 10

                    Rectangle {
                        width: 14
                        height: 14
                        radius: 7
                        color: "#FF5F56"
                    }

                    Rectangle {
                        width: 14
                        height: 14
                        radius: 7
                        color: "#FFBD2E"
                    }

                    Rectangle {
                        width: 14
                        height: 14
                        radius: 7
                        color: "#27C93F"
                    }

                    Text {
                        text: "docker-terminal"
                        color: "#888888"
                        font.pixelSize: 16
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#1F1F1F"
                }

                Flickable {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.topMargin: 10
                    anchors.bottom: parent.bottom
                    clip: true

                    contentWidth: parent.width
                    contentHeight: terminalColumn.height + 40

                    Column {
                        id: terminalColumn
                        spacing: 16
                        width: parent.width

                        Text {
                            text: "$ docker ps"
                            color: "#00FF99"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "CONTAINER ID      IMAGE        STATUS"
                            color: "white"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "7ad21f4d91       nginx        Running"
                            color: "#4CAF50"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "$ docker images"
                            color: "#00FF99"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "REPOSITORY        TAG         SIZE"
                            color: "white"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "nginx             latest      187MB"
                            color: "#4CAF50"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "$ systemctl status docker"
                            color: "#00FF99"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "Docker service active (running)"
                            color: "#4CAF50"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "$ docker stats"
                            color: "#00FF99"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "CPU: 34%   RAM: 61%   NET: ACTIVE"
                            color: "#00BCD4"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }
                    }
                }
            }
        }
    }
}
