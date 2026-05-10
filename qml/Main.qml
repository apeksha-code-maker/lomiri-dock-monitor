
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 1200
    height: 700
    title: "LomiriDock Monitor"
    color: "#121212"

    property int currentPage: 0

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // SIDEBAR
        Rectangle {
            width: 220
            color: "#141414"
            Layout.fillHeight: true

            Column {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 20
                spacing: 20

                Text {
                    text: "LOMIRI DOCK"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
                    font.letterSpacing: 2
                }

                Button {
                    text: "Dashboard"
                    width: 180
                    height: 50
                    onClicked: currentPage = 0
                }

                Button {
                    text: "Monitor"
                    width: 180
                    height: 50
                    onClicked: currentPage = 1
                }

                Button {
                    text: "Logs"
                    width: 180
                    height: 50
                    onClicked: currentPage = 2
                }

                Button {
                    text: "Commands"
                    width: 180
                    height: 50
                    onClicked: currentPage = 3
                }
            }
        }

        // PAGE STACK
        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: currentPage

            // DASHBOARD PAGE
            Rectangle {
                color: "#0B0B0B"

                Column {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 20

                    Text {
                        text: "Docker Dashboard"
                        color: "white"
                        font.pixelSize: 42
                        font.bold: true
                    }

                    Rectangle {
                        width: 850
                        height: 240
                        radius: 18
                        color: "#1E1E1E"

                        Column {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 14

                            Text {
                                id: statusText
                                text: "Status: Running"
                                color: "#4CAF50"
                                font.pixelSize: 20
                                font.bold: true
                            }

                            Text {
                                text: "Image: nginx:latest"
                                color: "#AAAAAA"
                                font.pixelSize: 18
                            }

                            Text {
                                text: "Port: 80:8080"
                                color: "#AAAAAA"
                                font.pixelSize: 18
                            }

                            Row {
                                spacing: 14

                                Button {
                                    text: "Start"
                                    width: 120
                                    height: 42

                                    onClicked: {
                                        var result = backend.startContainer()
                                        statusText.text = "Status: Running"
                                        terminalOutput.text += "\n$ docker start nginx-container\n"
                                        terminalOutput.text += result + "\n"
                                    }
                                }

                                Button {
                                    text: "Stop"
                                    width: 120
                                    height: 42

                                    onClicked: {
                                        var result = backend.stopContainer()
                                        statusText.text = "Status: Stopped"
                                        terminalOutput.text += "\n$ docker stop nginx-container\n"
                                        terminalOutput.text += result + "\n"
                                    }
                                }

                                Button {
                                    text: "Logs"
                                    width: 120
                                    height: 42

                                    onClicked: {
                                        var result = backend.runCommand("docker logs nginx")
                                        terminalOutput.text += "\n$ docker logs nginx\n"
                                        terminalOutput.text += result + "\n"
                                    }
                                }
                            }
                        }
                    }

                    Row {
                        spacing: 20

                        Rectangle {
                            width: 190
                            height: 130
                            radius: 18
                            color: "#1A1A1A"

                            Column {
                                anchors.centerIn: parent
                                spacing: 10

                                Text {
                                    text: "CPU"
                                    color: "#AAAAAA"
                                    font.pixelSize: 20
                                }

                                Text {
                                    text: "34%"
                                    color: "#00C853"
                                    font.pixelSize: 38
                                    font.bold: true
                                }
                            }
                        }

                        Rectangle {
                            width: 190
                            height: 130
                            radius: 18
                            color: "#1A1A1A"

                            Column {
                                anchors.centerIn: parent
                                spacing: 10

                                Text {
                                    text: "RAM"
                                    color: "#AAAAAA"
                                    font.pixelSize: 20
                                }

                                Text {
                                    text: "61%"
                                    color: "#00BCD4"
                                    font.pixelSize: 38
                                    font.bold: true
                                }
                            }
                        }
                    }
                }
            }

            // MONITOR PAGE
            Rectangle {
                color: "#0B0B0B"

                Column {
                    anchors.centerIn: parent
                    spacing: 20

                    Text {
                        text: "System Monitor"
                        color: "white"
                        font.pixelSize: 42
                        font.bold: true
                    }

                    ProgressBar {
                        value: 0.34
                        width: 500
                    }

                    Text {
                        text: "CPU Usage: 34%"
                        color: "#4CAF50"
                        font.pixelSize: 24
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

                        Flickable {
                            anchors.fill: parent
                            anchors.margins: 20
                            clip: true

                            Column {
                                width: parent.width
                                spacing: 18

                                Text {
                                    text: "[INFO] Docker daemon initialized"
                                    color: "#00C853"
                                    font.family: "monospace"
                                    font.pixelSize: 20
                                }

                                Text {
                                    text: "[INFO] nginx-container started"
                                    color: "white"
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
                            }

                            TextField {
                                id: commandInput
                                width: 520
                                height: 36
                                text: "docker ps"
                            }

                            Button {
                                text: "Execute"
                                width: 120
                                height: 38

                                onClicked: {
                                    var result = backend.runCommand(commandInput.text)
                                    terminalOutput.text += "\n$ " + commandInput.text + "\n"
                                    terminalOutput.text += result + "\n"
                                }
                            }
                        }
                    }

                    Rectangle {
                        width: parent.width - 50
                        height: 420
                        radius: 18
                        color: "#050505"

                        ScrollView {
                            anchors.fill: parent
                            anchors.margins: 18

                            TextArea {
                                id: terminalOutput
                                readOnly: true
                                text: "Linux terminal ready...\n"
                                color: "#00FF99"
                                font.family: "monospace"
                                font.pixelSize: 16

                                background: Rectangle {
                                    color: "#050505"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
