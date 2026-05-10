import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 1200
    height: 700
    title: "LomiriDock Monitor"

    Rectangle {
        anchors.fill: parent
        color: "#121212"

        Text {
            text: "LomiriDock Monitor"
            color: "white"
            font.pixelSize: 30
            anchors.centerIn: parent
        }
    }
}
