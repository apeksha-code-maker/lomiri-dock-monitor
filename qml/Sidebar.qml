import QtQuick 2.4
import Lomiri.Components 1.3

Rectangle {
    width: units.gu(22)
    color: "#1E1E1E"

    Column {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: units.gu(2)
        spacing: units.gu(2)

        Label {
            text: "MENU"
            color: "white"
            fontSize: "large"
        }

        Button {
            text: "Home"
        }

        Button {
            text: "Monitor"
        }

        Button {
            text: "Logs"
        }

        Button {
            text: "Commands"
        }
    }
}
