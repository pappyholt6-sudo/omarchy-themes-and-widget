import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

Item {
    id: root
    property bool openState: false

    function open(payloadJson) { openState = true; return "ok" }
    function close() { openState = false }

    PanelWindow {
        id: island
        visible: root.openState
        implicitWidth: 360
        implicitHeight: 470
        anchors { top: true; right: true }
        margins { top: 52; right: 18 }
        color: "transparent"
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

        Rectangle {
            anchors.fill: parent
            radius: 24
            color: Color.background
            opacity: 0.94
            border.width: 1
            border.color: Qt.alpha(Color.foreground, 0.12)

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 18
                spacing: 12

                RowLayout {
                    Layout.fillWidth: true
                    Text {
                        text: "ISLAND"
                        color: Color.foreground
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        opacity: 0.55
                    }
                    Item { Layout.fillWidth: true }
                    Rectangle {
                        width: 28; height: 28; radius: 14
                        color: Qt.alpha(Color.foreground, 0.07)
                        Text { anchors.centerIn: parent; text: "×"; color: Color.foreground; font.pixelSize: 18; opacity: 0.65 }
                        MouseArea { anchors.fill: parent; onClicked: root.close() }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 112
                    radius: 18
                    color: Qt.alpha(Color.foreground, 0.055)
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 2
                        Text {
                            id: clock
                            text: Qt.formatTime(new Date(), "HH:mm")
                            color: Color.foreground
                            font.pixelSize: 34
                            font.weight: Font.Light
                            Timer { interval: 1000; running: true; repeat: true; onTriggered: clock.text = Qt.formatTime(new Date(), "HH:mm") }
                        }
                        Text {
                            text: Qt.formatDate(new Date(), "dddd, MMMM d")
                            color: Color.foreground
                            opacity: 0.55
                            font.pixelSize: 12
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    IslandSlot { title: "WIDGET"; subtitle: "Drop your widget here" }
                    IslandSlot { title: "WIDGET"; subtitle: "Drop your widget here" }
                }

                IslandSlot {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 96
                    title: "WIDGET SLOT"
                    subtitle: "Add another widget here"
                }

                Item { Layout.fillHeight: true }
                Text {
                    Layout.fillWidth: true
                    text: "Edit Island.qml to add or remove widgets"
                    horizontalAlignment: Text.AlignHCenter
                    color: Color.foreground
                    opacity: 0.32
                    font.pixelSize: 10
                }
            }
        }
    }

    component IslandSlot: Rectangle {
        property string title
        property string subtitle
        Layout.fillWidth: true
        Layout.preferredHeight: 96
        radius: 18
        color: Qt.alpha(Color.foreground, 0.045)
        border.width: 1
        border.color: Qt.alpha(Color.foreground, 0.07)
        Column {
            anchors.centerIn: parent
            spacing: 5
            Text { anchors.horizontalCenter: parent.horizontalCenter; text: title; color: Color.foreground; opacity: 0.48; font.pixelSize: 10; font.weight: Font.DemiBold }
            Text { anchors.horizontalCenter: parent.horizontalCenter; text: subtitle; color: Color.foreground; opacity: 0.28; font.pixelSize: 9 }
        }
    }
}
