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
                }
            }

            // LOGS PAGE
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
                        height: 500
                        radius: 18
                        color: "#0A0A0A"
                        border.color: "#2E7D32"
                        border.width: 2

                        Flickable {
                            anchors.fill: parent
                            contentWidth: parent.width
                            contentHeight: logColumn.height + 40
                            clip: true

                            Column {
                                id: logColumn
                                spacing: 16
                                anchors.margins: 20

                                Text {
                                    text: "[INFO] Docker daemon initialized"
                                    color: "#4CAF50"
                                    font.family: "monospace"
                                    font.pixelSize: 18
                                }

                                Text {
                                    text: "[INFO] nginx-container started"
                                    color: "white"
                                    font.family: "monospace"
                                    font.pixelSize: 18
                                }

                                Text {
                                    text: "[WARNING] CPU usage spike detected"
                                    color: "#FFC107"
                                    font.family: "monospace"
                                    font.pixelSize: 18
                                }

                                Text {
                                    text: "[ERROR] Failed image pull request"
                                    color: "#F44336"
                                    font.family: "monospace"
                                    font.pixelSize: 18
                                }
                            }
                        }
                    }
                }
            }

            // COMMANDS PAGE
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

                        Column {
                            anchors.margins: 20
                            spacing: 14

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
                        }
                    }
                }
            }
        }
    }
}
