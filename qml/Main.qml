// MAIN PAGE STACK
StackLayout {
    id: pages

    Layout.fillWidth: true
    Layout.fillHeight: true

    currentIndex: currentPage

    // DASHBOARD PAGE
    Rectangle {
        color: "#121212"

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
        }
    }

    // MONITOR PAGE
    Rectangle {
        color: "#0B0B0B"

        Text {
            anchors.centerIn: parent
            text: "System Monitor"
            color: "white"
            font.pixelSize: 42
            font.bold: true
        }
    }

    // LOGS PAGE
    Rectangle {
        color: "#0B0B0B"

        Text {
            anchors.centerIn: parent
            text: "Docker Logs Console"
            color: "white"
            font.pixelSize: 42
            font.bold: true
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
                height: 500
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
