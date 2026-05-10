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
                }

                Button {
                    text: "Dashboard"
                    width: 160

                    onClicked: {
                        currentPage = 0
                    }
                }

                Button {
                    text: "Monitor"
                    width: 160

                    onClicked: {
                        currentPage = 1
                    }
                }

                Button {
                    text: "Logs"
                    width: 160

                    onClicked: {
                        currentPage = 2
                    }
                }

                Button {
                    text: "Commands"
                    width: 160

                    onClicked: {
                        currentPage = 3
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#121212"

            StackLayout {
                anchors.fill: parent
                currentIndex: currentPage

                Column {
                    anchors.margins: 20
                    spacing: 20

                    Text {
                        text: "LomiriDock Monitor"
                        color: "white"
                        font.pixelSize: 32
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
                                text: "Running Containers: 0"
                                color: "#4CAF50"
                                font.pixelSize: 20
                            }
                        }
                    }

                    Rectangle {
                        width: 850
                        height: 180
                        radius: 12
                        color: "#1E1E1E"

                        Column {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 10

                            Text {
                                text: "nginx-container"
                                color: "white"
                                font.pixelSize: 22
                            }

                            Text {
                                id: statusText
                                text: "Status: Stopped"
                                color: "#4CAF50"
                            }

                            Text {
                                text: "Image: nginx:latest"
                                color: "#AAAAAA"
                            }

                            Row {
                                spacing: 10

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

            
Rectangle {
    color: "#121212"

    Column {
        anchors.centerIn: parent
        spacing: 30

        Text {
            text: "System Monitor"
            color: "white"
            font.pixelSize: 36
            font.bold: true
        }

        Rectangle {
            width: 520
            height: 170
            radius: 18
            color: "#1E1E1E"

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20

                Text {
                    text: "CPU Usage"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
                }

                ProgressBar {
                    value: 0.34
                    width: 470
                    height: 22
                }

                Text {
                    text: "34%"
                    color: "#4CAF50"
                    font.pixelSize: 22
                }
            }
        }

        Rectangle {
            width: 520
            height: 170
            radius: 18
            color: "#1E1E1E"

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20

                Text {
                    text: "RAM Usage"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
                }

                ProgressBar {
                    value: 0.61
                    width: 470
                    height: 22
                }

                Text {
                    text: "61%"
                    color: "#4CAF50"
                    font.pixelSize: 22
                }
            }
        }

        Rectangle {
            width: 520
            height: 120
            radius: 18
            color: "#1E1E1E"

            Row {
                anchors.centerIn: parent
                spacing: 60

                Column {
                    spacing: 10

                    Text {
                        text: "Containers"
                        color: "white"
                        font.pixelSize: 20
                    }

                    Text {
                        text: "4"
                        color: "#4CAF50"
                        font.pixelSize: 30
                        font.bold: true
                    }
                }

                Column {
                    spacing: 10

                    Text {
                        text: "Images"
                        color: "white"
                        font.pixelSize: 20
                    }

                    Text {
                        text: "12"
                        color: "#4CAF50"
                        font.pixelSize: 30
                        font.bold: true
                    }
                }

                Column {
                    spacing: 10

                    Text {
                        text: "Networks"
                        color: "white"
                        font.pixelSize: 20
                    }

                    Text {
                        text: "3"
                        color: "#4CAF50"
                        font.pixelSize: 30
                        font.bold: true
                    }
                }
            }
        }
    }
}
              Rectangle {
    color: "#121212"

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "Docker Logs Console"
            color: "white"
            font.pixelSize: 36
            font.bold: true
        }

        Rectangle {
            width: parent.width - 40
            height: 560
            radius: 18
            color: "#0A0A0A"
            border.color: "#2E7D32"
            border.width: 2

            Column {
                anchors.fill: parent

                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#1A1A1A"
                    radius: 18

                    Row {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        spacing: 12

                        Rectangle {
                            width: 14
                            height: 14
                            radius: 7
                            color: "#F44336"
                        }

                        Rectangle {
                            width: 14
                            height: 14
                            radius: 7
                            color: "#FFC107"
                        }

                        Rectangle {
                            width: 14
                            height: 14
                            radius: 7
                            color: "#4CAF50"
                        }

                        Text {
                            text: "container_logs.sh"
                            color: "#AAAAAA"
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                Flickable {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 60
                    anchors.bottom: parent.bottom
                    clip: true

                    contentWidth: parent.width
                    contentHeight: logColumn.height + 40

                    Column {
                        id: logColumn
                        width: parent.width - 40
                        spacing: 16
                        anchors.left: parent.left
                        anchors.leftMargin: 20

                        Text {
                            text: "[07:45:10] [INFO] Docker daemon initialized"
                            color: "#4CAF50"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "[07:45:18] [INFO] nginx-container started"
                            color: "white"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "[07:45:32] [WARNING] CPU usage spike detected"
                            color: "#FFC107"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "[07:45:40] [INFO] Monitoring service active"
                            color: "#4CAF50"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "[07:45:55] [ERROR] Failed image pull request"
                            color: "#F44336"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "[07:46:02] [INFO] Docker network connected"
                            color: "white"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "[07:46:15] [INFO] Volume mounted successfully"
                            color: "#4CAF50"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }

                        Text {
                            text: "[07:46:27] [WARNING] RAM usage increased"
                            color: "#FFC107"
                            font.family: "monospace"
                            font.pixelSize: 18
                        }
                    }
                }
            }
        }
    }
}
Rectangle {
    color: "#121212"

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "Linux Command Console"
            color: "white"
            font.pixelSize: 36
            font.bold: true
        }

        Rectangle {
            width: parent.width - 40
            height: 560
            radius: 18
            color: "#0A0A0A"
            border.color: "#00FF99"
            border.width: 2

            Column {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#1A1A1A"
                    radius: 18

                    Row {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        spacing: 12

                        Rectangle {
                            width: 14
                            height: 14
                            radius: 7
                            color: "#F44336"
                        }

                        Rectangle {
                            width: 14
                            height: 14
                            radius: 7
                            color: "#FFC107"
                        }

                        Rectangle {
                            width: 14
                            height: 14
                            radius: 7
                            color: "#4CAF50"
                        }

                        Text {
                            text: "devops_terminal.sh"
                            color: "#AAAAAA"
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                Column {
                    anchors.margins: 20
                    spacing: 20

                    Row {
                        spacing: 10

                        Text {
                            text: "user@lomiri:~$"
                            color: "#00FF99"
                            font.family: "monospace"
                            font.pixelSize: 20
                        }

                        TextField {
                            width: 500
                            placeholderText: "Enter Linux command..."
                            font.pixelSize: 18
                        }

                        Button {
                            text: "Execute"
                        }
                    }

                    Rectangle {
                        width: parent.width - 40
                        height: 400
                        radius: 12
                        color: "#111111"
                        border.color: "#333333"

                        Flickable {
                            anchors.fill: parent
                            contentWidth: parent.width
                            contentHeight: outputColumn.height + 40
                            clip: true

                            Column {
                                id: outputColumn
                                width: parent.width - 40
                                spacing: 14
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.top: parent.top
                                anchors.topMargin: 20

                                Text {
                                    text: "$ docker ps"
                                    color: "#00FF99"
                                    font.family: "monospace"
                                    font.pixelSize: 18
                                }

                                Text {
                                    text: "CONTAINER ID   IMAGE   STATUS"
                                    color: "white"
                                    font.family: "monospace"
                                    font.pixelSize: 18
                                }

                                Text {
                                    text: "7ad21f        nginx   Running"
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
                                    text: "REPOSITORY     TAG       SIZE"
                                    color: "white"
                                    font.family: "monospace"
                                    font.pixelSize: 18
                                }

                                Text {
                                    text: "nginx          latest    187MB"
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
                            }
                        }
                    }
                }
            }
        }
    }
}
              
        }
    }
}
