import QtQuick 2.4
import Lomiri.Components 1.3

Page {
    title: "Logs"

    Rectangle {
        anchors.fill: parent
        color: "#121212"

        Flickable {
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: logText.height + units.gu(4)

            TextArea {
                id: logText
                width: parent.width
                text: "Docker logs will appear here..."
                color: "white"
                readOnly: true
            }
        }
    }
}
