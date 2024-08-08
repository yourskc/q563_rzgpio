import QtQuick 2.6
import QtQuick.Controls 1.5

Row
{
    id: root

    property int count
    property int currentIndex
    property Component delegate: bullet
    property bool interactive
    spacing: 5

    Component
    {
        id: bullet
        Rectangle
        {
            height: 10
            width: height
            radius: height/2
            color:"red"
            opacity: currentIndex==index?0.8:0.2
        }
    }

    Repeater
    {
        model: root.count
        Loader
        {
            property int index: model.index
            sourceComponent: delegate
        }
    }

}

