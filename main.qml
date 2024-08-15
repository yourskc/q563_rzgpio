import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1


ApplicationWindow {
    id: thismain
    visible: true
    width: 250
    height: 768
    title: qsTr("Renesas RZG2L GPIO Test")

    property int led1 : 0
    property int led2 : 0

    property var btns: { btn1:0; btn2:0; btn3:0 }

    property int btn1 : 0
    property int btn2 : 0
    property int btn3 : 0

    property var btns_prev: { btn1:0; btn2:0; btn3:0 }

    property int btn1_prev : 0
    property int btn2_prev : 0
    property int btn3_prev : 0

    Label {
        x:50
        y:120
        text: qsTr("P1#8")
    }
    Label {
        x:100
        y:120
        text: qsTr("P1#9")
    }
    Label {
        x:150
        y:120
        text: qsTr("P1#10")
    }
    Button {
        x:70
        y:200
        width: 50
        height: 50
        id: write_high
        text: qsTr("P0#9")
        onClicked : {
        if (thismain.led2 === 0) {
            RzGPIO.Write(2, 1);
            thismain.led2=2;
            }
            else {
                RzGPIO.Write(2, 0);
                thismain.led2=0;
                }

         }
        }
    Button {
        x:120
        y:200
        width: 50
        height: 50
        id: write_low
        text: qsTr("P0#8")
        onClicked : {
        if (thismain.led1 === 0) {
            RzGPIO.Write(1, 1);
            thismain.led1=1;
            }
            else {
                RzGPIO.Write(1, 0);
                thismain.led1=0;
                }

         }
        }


    P1{id:p1;x:45; y:50}
    P1{id:p2;x:100; y:50}
    P1{id:p3;x:155; y:50}



    function timeFunc() {

        // RzGPIO.doSomething("tick");

        thismain.btn1 = RzGPIO.Read(5);
        if (thismain.btn1===1) {
            if (thismain.btn1_prev===0)
                p1.color="red";
            }
        else {
            if (thismain.btn1_prev===1)
                p1.color="gray";
            }
        thismain.btn1_prev = thismain.btn1;

        thismain.btn2 = RzGPIO.Read(6);
        if (thismain.btn2===1) {
            if (thismain.btn2_prev===0)
                p2.color="red";
            }
        else {
            if (thismain.btn2_prev===1)
                p2.color="gray";
            }
        thismain.btn2_prev = thismain.btn2;

        thismain.btn3 = RzGPIO.Read(7);
        if (thismain.btn3===1) {
            if (thismain.btn3_prev===0)
                p3.color="red";
            }
        else {
            if (thismain.btn3_prev===1)
                p3.color="gray";
            }
        thismain.btn3_prev = thismain.btn3;

    }

    Timer {
        interval: 300; running: true; repeat: true;
        onTriggered: thismain.timeFunc()
    }


}
