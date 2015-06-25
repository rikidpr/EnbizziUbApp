import QtQuick 2.0
import Ubuntu.Components 1.1
import "model"

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "enbizziubapp.riki"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    Page {
        title: i18n.tr("EnbizziUbApp")

        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }

            CalendarModel{
                id:calendarModel;
            }

            ListView {
                anchors.fill: parent
                clip: true
                model: calendarModel
                delegate: nameDelegate
                header: bannercomponent
                footer: Rectangle {
                    width: parent.width; height: 30;
                    gradient: clubcolors
                }
                /*highlight: Rectangle {
                    width: parent.width
                    color: "lightgray"
                }*/
                section {//para agrupar los resultados por un termino
                    property: "mes"
                    criteria: ViewSection.FullString
                    delegate: Rectangle {
                        color: "#58D3F7"
                        width: parent.width
                        height: childrenRect.height + 4
                        Text { anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 16
                            font.bold: true
                            text: section
                        }
                    }
                }
            }

            Component {     //instantiated when header is processed
                id: bannercomponent
                Rectangle {
                    id: banner
                    width: parent.width; height: 50
                    gradient: clubcolors
                    border {color: "#0040FF"; width: 2}
                    Text {
                        anchors.centerIn: parent
                        text: "Salidas"
                        color: "#FFFFFF"
                        font.pixelSize: 32
                    }
                }
            }
            Gradient {
                id: clubcolors
                GradientStop { position: 0.0; color: "#000099"}
                GradientStop { position: 0.66; color: "#0000FF"}
            }

            Component {
                id: nameDelegate
                Row {
                    Text {
                        text: dia +" "+mes;
                        font.pixelSize: 20
                    }
                    Text {
                        text: " / ";
                        font.pixelSize: 20
                    }
                    Text {
                        text: destino
                        font.pixelSize: 24
                    }
                }
            }

        }
    }
}

