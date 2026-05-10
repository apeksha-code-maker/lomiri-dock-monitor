import QtQuick 2.4
import Lomiri.Components 1.3

Rectangle {
    width: units.gu(40)
    height: units.gu(18)
    radius: 12
    color: "#1E1E1E"

    Column {
        anchors.fill: parent
        anchors.margins: units.gu(2)
        spacing: units.gu(1)

        Label {
            text: "Container: nginx"
            color: "white"
        }

        Label {
            text: "Status: Running"
            color: "#4CAF50"
        }

        Label {
            text: "Image: nginx:latest"
            color: "#AAAAAA"
        }

        Row {
            spacing: units.gu(1)

            Button {
                text: "Start"
            }

            Button {
                text: "Stop"
            }

            Button {
                text: "Logs"
            }
        }
    }
}
