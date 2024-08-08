import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1

Button {
    text: qsTr( " S T A R T ")

    style: ButtonStyle {
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 50
            border.width: control.activeFocus ? 2 : 1
            border.color: "#888"
            radius: 4

            gradient: Gradient {
                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
            }
        }
    }

}
