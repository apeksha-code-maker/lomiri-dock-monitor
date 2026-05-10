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

                    Text {
                        anchors.centerIn: parent
                        text: "Logs Page"
                        color: "white"
                        font.pixelSize: 30
                    }
                }

                Rectangle {
                    color: "#121212"

                    Text {
                        anchors.centerIn: parent
                        text: "Commands Page"
                        color: "white"
                        font.pixelSize: 30
                    }
                }
            }
        }
    }
}
