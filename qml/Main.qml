


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

                Flickable {
                    anchors.fill: parent
                    contentWidth: parent.width
                    contentHeight: 900
                    clip: true

                    Column {
                        width: parent.width
                        spacing: 24

                        anchors.top: parent.top
                        anchors.topMargin: 24
                        anchors.horizontalCenter: parent.horizontalCenter

                        // HEADER
                        Rectangle {
                            width: parent.width - 60
                            height: 150
                            radius: 28
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "#1F1F1F" }
                                GradientStop { position: 1.0; color: "#111111" }
                            }
                            border.color: "#2E2E2E"
                            border.width: 1

                            Row {
                                anchors.fill: parent
                                anchors.margins: 28
                                spacing: 24

                                Rectangle {
                                    width: 84
                                    height: 84
                                    radius: 24
                                    color: "#00C853"

                                    Text {
                                        anchors.centerIn: parent
                                        text: "🐳"
                                        font.pixelSize: 42
                                    }
                                }

                                Column {
                                    spacing: 12
                                    anchors.verticalCenter: parent.verticalCenter

                                    Text {
                                        text: "Docker Dashboard"
                                        color: "white"
                                        font.pixelSize: 44
                                        font.bold: true
                                    }

                                    Text {
                                        text: "Real-time container monitoring and management"
                                        color: "#AAAAAA"
                                        font.pixelSize: 18
                                    }

                                    Row {
                                        spacing: 12

                                        Rectangle {
                                            width: 120
                                            height: 36
                                            radius: 12
                                            color: "#1E2A1F"

                                            Row {
                                                anchors.centerIn: parent
                                                spacing: 8

                                                Rectangle {
                                                    width: 10
                                                    height: 10
                                                    radius: 5
                                                    color: "#00C853"
                                                }

                                                Text {
                                                    text: "System Online"
                                                    color: "#00E676"
                                                    font.pixelSize: 14
                                                    font.bold: true
                                                }
                                            }
                                        }

                                        Rectangle {
                                            width: 110
                                            height: 36
                                            radius: 12
                                            color: "#1A1A1A"
                                            border.color: "#2B2B2B"

                                            Text {
                                                anchors.centerIn: parent
                                                text: "4 Containers"
                                                color: "white"
                                                font.pixelSize: 14
                                                font.bold: true
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        // STATUS CARDS
                        Row {
                            spacing: 20
                            anchors.horizontalCenter: parent.horizontalCenter

                            Rectangle {
                                width: 210
                                height: 140
                                radius: 20
                                color: "#171717"
                                border.color: "#2C2C2C"
                                border.width: 1

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 12

                                    Text {
                                        text: "Running"
                                        color: "#AAAAAA"
                                        font.pixelSize: 20
                                    }

                                    Text {
                                        text: "4"
                                        color: "#00C853"
                                        font.pixelSize: 46
                                        font.bold: true
                                    }
                                }
                            }

                            Rectangle {
                                width: 210
                                height: 140
                                radius: 20
                                color: "#171717"
                                border.color: "#2C2C2C"
                                border.width: 1

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 12

                                    Text {
                                        text: "CPU Usage"
                                        color: "#AAAAAA"
                                        font.pixelSize: 20
                                    }

                                    Text {
                                        text: "34%"
                                        color: "#00BCD4"
                                        font.pixelSize: 42
                                        font.bold: true
                                    }
                                }
                            }

                            Rectangle {
                                width: 210
                                height: 140
                                radius: 20
                                color: "#171717"
                                border.color: "#2C2C2C"
                                border.width: 1

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 12

                                    Text {
                                        text: "RAM"
                                        color: "#AAAAAA"
                                        font.pixelSize: 20
                                    }

                                    Text {
                                        text: "61%"
                                        color: "#FFC107"
                                        font.pixelSize: 42
                                        font.bold: true
                                    }
                                }
                            }
                        }

                        // MAIN CONTAINER CARD
                        Rectangle {
                            width: parent.width - 60
                            height: 320
                            radius: 24
                            color: "#181818"
                            border.color: "#2B2B2B"
                            border.width: 1

                            Column {
                                anchors.fill: parent
                                anchors.margins: 24
                                spacing: 18

                                Row {
                                    spacing: 14

                                    Rectangle {
                                        width: 18
                                        height: 18
                                        radius: 9
                                        color: "#00C853"
                                        anchors.verticalCenter: parent.verticalCenter
                                    }

                                    Text {
                                        text: "nginx-container"
                                        color: "white"
                                        font.pixelSize: 32
                                        font.bold: true
                                    }
                                }

                                Text {
                                    id: statusText
                                    text: "Status: Running"
                                    color: "#00C853"
                                    font.pixelSize: 22
                                    font.bold: true
                                }

                                Text {
                                    text: "Image: nginx:latest"
                                    color: "#BBBBBB"
                                    font.pixelSize: 20
                                }

                                Text {
                                    text: "Port Mapping: 80 → 8080"
                                    color: "#BBBBBB"
                                    font.pixelSize: 20
                                }

                                Text {
                                    text: "Container ID: 84hf92kd"
                                    color: "#BBBBBB"
                                    font.pixelSize: 20
                                }

                                Rectangle {
                                    width: parent.width
                                    height: 1
                                    color: "#2A2A2A"
                                }

                                Row {
                                    spacing: 18

                                    Button {
                                        text: "Start"
                                        width: 130
                                        height: 48

                                        background: Rectangle {
                                            radius: 14
                                            color: "#00C853"
                                        }

                                        onClicked: {
                                            var result = backend.startContainer()
                                            statusText.text = "Status: Running"
                                            terminalOutput.text += "
$ docker start nginx-container
"
                                            terminalOutput.text += result + "
"
                                        }
                                    }

                                    Button {
                                        text: "Stop"
                                        width: 130
                                        height: 48

                                        background: Rectangle {
                                            radius: 14
                                            color: "#D32F2F"
                                        }

                                        onClicked: {
                                            var result = backend.stopContainer()
                                            statusText.text = "Status: Stopped"
                                            terminalOutput.text += "
$ docker stop nginx-container
"
                                            terminalOutput.text += result + "
"
                                        }
                                    }

                                    Button {
                                        text: "Logs"
                                        width: 130
                                        height: 48

                                        background: Rectangle {
                                            radius: 14
                                            color: "#1976D2"
                                        }

                                        onClicked: {
                                            var result = backend.runCommand("docker logs nginx")
                                            terminalOutput.text += "
$ docker logs nginx
"
                                            terminalOutput.text += result + "
"
                                        }
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
                    contentHeight: 1100
                    clip: true

                    Column {
                        width: parent.width
                        spacing: 26

                        anchors.top: parent.top
                        anchors.topMargin: 24
                        anchors.horizontalCenter: parent.horizontalCenter

                        // HEADER
                        Rectangle {
                            width: parent.width - 60
                            height: 140
                            radius: 28
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "#1C1C1C" }
                                GradientStop { position: 1.0; color: "#121212" }
                            }
                            border.color: "#2B2B2B"
                            border.width: 1

                            Row {
                                anchors.fill: parent
                                anchors.margins: 26
                                spacing: 22

                                Rectangle {
                                    width: 82
                                    height: 82
                                    radius: 22
                                    color: "#00BCD4"

                                    Text {
                                        anchors.centerIn: parent
                                        text: "📊"
                                        font.pixelSize: 42
                                    }
                                }

                                Column {
                                    spacing: 12
                                    anchors.verticalCenter: parent.verticalCenter

                                    Text {
                                        text: "System Monitor"
                                        color: "white"
                                        font.pixelSize: 42
                                        font.bold: true
                                    }

                                    Text {
                                        text: "Track CPU, RAM, network and Docker statistics"
                                        color: "#AAAAAA"
                                        font.pixelSize: 18
                                    }

                                    Rectangle {
                                        width: 150
                                        height: 34
                                        radius: 12
                                        color: "#102027"

                                        Row {
                                            anchors.centerIn: parent
                                            spacing: 8

                                            Rectangle {
                                                width: 10
                                                height: 10
                                                radius: 5
                                                color: "#00E5FF"
                                            }

                                            Text {
                                                text: "Live Monitoring"
                                                color: "#00E5FF"
                                                font.pixelSize: 14
                                                font.bold: true
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        // SYSTEM CARDS
                        Row {
                            spacing: 22
                            anchors.horizontalCenter: parent.horizontalCenter

                            Rectangle {
                                width: 260
                                height: 180
                                radius: 22
                                color: "#171717"
                                border.color: "#2C2C2C"
                                border.width: 1

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 14

                                    Text {
                                        text: "CPU Usage"
                                        color: "white"
                                        font.pixelSize: 26
                                        font.bold: true
                                    }

                                    ProgressBar {
                                        value: 0.34
                                        width: 180
                                    }

                                    Text {
                                        text: "34%"
                                        color: "#00E676"
                                        font.pixelSize: 42
                                        font.bold: true
                                    }

                                    Text {
                                        text: "8 Cores Active"
                                        color: "#AAAAAA"
                                        font.pixelSize: 16
                                    }
                                }
                            }

                            Rectangle {
                                width: 260
                                height: 180
                                radius: 22
                                color: "#171717"
                                border.color: "#2C2C2C"
                                border.width: 1

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 14

                                    Text {
                                        text: "RAM Usage"
                                        color: "white"
                                        font.pixelSize: 26
                                        font.bold: true
                                    }

                                    ProgressBar {
                                        value: 0.61
                                        width: 180
                                    }

                                    Text {
                                        text: "61%"
                                        color: "#00BCD4"
                                        font.pixelSize: 42
                                        font.bold: true
                                    }

                                    Text {
                                        text: "6.1 GB / 10 GB"
                                        color: "#AAAAAA"
                                        font.pixelSize: 16
                                    }
                                }
                            }

                            Rectangle {
                                width: 260
                                height: 180
                                radius: 22
                                color: "#171717"
                                border.color: "#2C2C2C"
                                border.width: 1

                                Column {
                                    anchors.centerIn: parent
                                    spacing: 14

                                    Text {
                                        text: "Network"
                                        color: "white"
                                        font.pixelSize: 26
                                        font.bold: true
                                    }

                                    Text {
                                        text: "120 Mbps"
                                        color: "#FFC107"
                                        font.pixelSize: 38
                                        font.bold: true
                                    }

                                    Text {
                                        text: "Download Speed"
                                        color: "#AAAAAA"
                                        font.pixelSize: 16
                                    }

                                    Text {
                                        text: "Latency: 12 ms"
                                        color: "#AAAAAA"
                                        font.pixelSize: 14
                                    }
                                }
                            }
                        }

                        // DOCKER STATS PANEL
                        Rectangle {
                            width: parent.width - 60
                            height: 280
                            radius: 24
                            color: "#181818"
                            border.color: "#2B2B2B"
                            border.width: 1

                            Column {
                                anchors.fill: parent
                                anchors.margins: 24
                                spacing: 20

                                Text {
                                    text: "Docker Environment"
                                    color: "white"
                                    font.pixelSize: 32
                                    font.bold: true
                                }

                                Row {
                                    spacing: 26

                                    Rectangle {
                                        width: 180
                                        height: 140
                                        radius: 20
                                        color: "#202020"

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
                                                color: "#00E676"
                                                font.pixelSize: 44
                                                font.bold: true
                                            }
                                        }
                                    }

                                    Rectangle {
                                        width: 180
                                        height: 140
                                        radius: 20
                                        color: "#202020"

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
                                                font.pixelSize: 44
                                                font.bold: true
                                            }
                                        }
                                    }

                                    Rectangle {
                                        width: 180
                                        height: 140
                                        radius: 20
                                        color: "#202020"

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
                                                font.pixelSize: 44
                                                font.bold: true
                                            }
                                        }
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
