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

        // SIDEBAR
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

        // MAIN CONTENT
        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: currentPage

            // DASHBOARD PAGE
            Rectangle {
                color: "#121212"

                Column {
                    anchors.fill: parent
                    anchors.margins: 25
                    spacing: 25

                    Text {
                        text: "LomiriDock Monitor"
                        color: "white"
                        font.pixelSize: 38
                        font.bold: true
                    }

                    Rectangle {
                        width: 850
                        height: 130
                        radius: 18
                        color: "#1E1E1E"

                        Column {
                            anchors.centerIn: parent
                            spacing: 12

                            Text {
                                text: "Docker Status"
                                color: "white"
                                font.pixelSize: 28
                                font.bold: true
                            }

                            Text {
                                text: "Running Containers: 4"
                                color: "#4CAF50"
                                font.pixelSize: 22
                            }
                        }
                    }

                    Rectangle {
                        width: 850
                        height: 220
                        radius: 18
                        color: "#1E1E1E"

                        Column {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 14

                            Text {
                                text: "nginx-container"
                                color: "white"
                                font.pixelSize: 28
                                font.bold: true
                            }

                            Text {
                                id: statusText
                                text: "Status: Running"
                                color: "#4CAF50"
                                font.pixelSize: 20
                            }

                            Text {
                                text: "Image: nginx:latest"
                                color: "#AAAAAA"
                                font.pixelSize: 18
                            }

                            Row {
                                spacing: 14

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

                        Text {
                            text: "System Monitor"
                            color: "white"
                            font.pixelSize: 42
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

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

                                Text {
                                    text: "Usage: 34%"
                                    color: "#4CAF50"
                                    font.pixelSize: 22
                                }
                            }
                        }

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

                                Text {
                                    text: "Used: 6.1 GB / 10 GB"
                                    color: "#4CAF50"
                                    font.pixelSize: 22
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

                            Column {
                                spacing: 18

                                Text {
                                    text: "[07:45:10] [INFO] Docker daemon initialized"
                                    color: "#00C853"
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
                                    text: "[07:45:55] [ERROR] Failed image pull request"
                                    color: "#FF3D00"
                                    font.family: "monospace"
                                    font.pixelSize: 20
                                }
                            }
                        }
                    }
                }
            }

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
                                width: 520
                                height: 36
                                placeholderText: "Enter Linux command..."
                                text: "sudo apt update"
                            }

                            Button {
                                text: "Execute"
                                width: 120
                                height: 38
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
                            spacing: 16

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
}
