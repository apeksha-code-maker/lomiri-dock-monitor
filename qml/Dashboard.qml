import QtQuick 2.4
import Lomiri.Components 1.3

Page {
    title: "Dashboard"

    Rectangle {
        anchors.fill: parent
        color: "#121212"

        Column {
            anchors.centerIn: parent
            spacing: units.gu(2)

            Label {
                text: "LomiriDock Monitor"
                color: "white"
                fontSize: "x-large"
            }

            Label {
                text: "Docker & Linux Dashboard"
                color: "#AAAAAA"
            }
        }
    }
}
