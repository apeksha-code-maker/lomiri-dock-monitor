import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 1200
    height: 700
    title: "LomiriDock Monitor"
    color: "#121212"

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
                }

                Button {
                    text: "Monitor"
                    width: 160
                }

                Button {
                    text: "Logs"
                    width: 160
                }

                Button {
                    text: "Commands"
                    width: 160
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#121212"

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20

                Text {
                    text: "LomiriDock Monitor"
                    color: "white"
                    font.pixelSize: 32
                }

                Rectangle {
                    width: parent.width
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
                    width: parent.width
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
                            text: "Status: Running"
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
            console.log("Start button clicked")
        }
    }

    Button {
        text: "Stop"

        onClicked: {
            console.log("Stop button clicked")
        }
    }

    Button {
        text: "Logs"

        onClicked: {
            console.log("Logs button clicked")
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
