import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1


ApplicationWindow {
    id: thismain
    visible: true
    width: 450
    height: 400
    title: qsTr("Renesas RZG2L GPIO Test")

    property var leds: { led1:0; led2:0 }

    property var btns: { btn1:0; btn2:0; btn3:0 }
    property var btns_prev: { btn1:0; btn2:0; btn3:0 }

    Label {
        x:100
        y:120
        text: qsTr("PMOD1 #8")
    }
    Label {
        x:200
        y:120
        text: qsTr("PMOD1 #9")
    }
    Label {
        x:300
        y:120
        text: qsTr("PMOD1 #10")
    }
    Button {
        x:100
        y:200
        width: 120
        height: 50
        id: write_high
        text: qsTr("Led PMOD0-2")
        onClicked : {
        if (thismain.leds.led1 == 0) {
            RzGPIO.Write(1, 1);
            thismain.leds.led1=1;
            }
            else {
                RzGPIO.Write(1, 0);
                thismain.leds.led1=0;
                }

         }
        }
    Button {
        x:220
        y:200
        width: 120
        height: 50
        id: write_low
        text: qsTr("Led PMOD0-3")
        onClicked : {
        if (thismain.leds,led2 == 0) {
            RzGPIO.Write(2, 1);
            thismain.leds.led2=1;
            }
            else {
                RzGPIO.Write(2, 0);
                thismain.leds.led2=0;
                }

         }
        }


    P1{id:p1;x:100; y:50}
    P1{id:p2;x:200; y:50}
    P1{id:p3;x:300; y:50}



    function timeFunc() {

       //  RzGPIO.doSomething("tick");

        thismain.btns.btn1 = RzGPIO.Read(5);
        if (thismain.btns.btn1==1) {
            if (thismain.btns_prev.btn1==0)
                p1.color="red";
            }
        else {
            if (thismain.btns_prev.btn1==1)
                p1.color="gray";
            }
        thismain.btns_prev.btn1 = thismain.btns.btn1;

        thismain.btns.btn2 = RzGPIO.Read(6);
        if (thismain.btns.btn2==1) {
            if (thismain.btns_prev.btn2==0)
                p2.color="red";
            }
        else {
            if (thismain.btns_prev.btn2==1)
                p2.color="gray";
            }
        thismain.btns_prev.btn2 = thismain.btns.btn2;

        thismain.btns.btn3 = RzGPIO.Read(7);
        if (thismain.btns.btn3==1) {
            if (thismain.btns_prev.btn3==0)
                p3.color="red";
            }
        else {
            if (thismain.btns_prev.btn3==1)
                p3.color="gray";
            }
        thismain.btns_prev.btn3 = thismain.btns.btn3;

    }

    Timer {
        interval: 300; running: true; repeat: true;
        onTriggered: thismain.timeFunc()
    }


}
