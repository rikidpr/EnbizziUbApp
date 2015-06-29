import QtQuick 2.0
import Ubuntu.Components 1.1
import QtQuick.XmlListModel 2.0
import "js/formateos.js" as Formateos
import "model"
import "contracts"

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

    EnbizziContracts {
        id: cons
    }

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

           /* XmlListModel {

                source: "http://localhost:8282/rest/calendar/nextActivitiesXml"
                query: "/calendarEventList/list"

                XmlRole { name: "num";  query: "num/string()";  isKey: true }
                XmlRole { name: "date";   query: "xs:dateTime(date)";   isKey: false }
                //XmlRole { name: "mes";  query: "month-from-dateTime(date)";  isKey: false }//xpath functions
                XmlRole { name: "route";   query: "route/string()";   isKey: false }
                //XmlRole { name: "returnRoute";  query: "returnRoute/string()"; isKey: false }
                XmlRole { name: "stop";  query: "stop/string()";  isKey: false }
                XmlRole { name: "km";  query: "km/string()";  isKey: false }
                //XmlRole { name: "elevationGain";  query: "elevationGain/string()";  isKey: false }
                //XmlRole { name: "difficulty";  query: "difficulty/string()";  isKey: false }
                //XmlRole { name: "type";  query: "type/string()";  isKey: false }
            }*/

            QtObject {
                id:cons
                property color azulEnbizzi: '#0040FF'
                property color azulClaroEnbizzi: '#0000FF'
                property color azulOscuroEnbizzi: '#000099'
            }


            ListView {
                id:listView
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
                            text: Formateos.getMoth(section)
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
                    border {color: cons.azulEnbizzi; width: 2}
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
                GradientStop { position: 0.0; color: cons.azulOscuroEnbizzi}
                GradientStop { position: 0.66; color: cons.azulClaroEnbizzi}
            }

            Component {
                id: nameDelegate
                Item {
                    id: recipe
                    // A simple rounded rectangle for the background
                      Rectangle {
                          id: background
                          x: 2; y: 2; width: parent.width - x*2; height: parent.height - y*2
                          color: "ivory"
                          border.color: "orange"
                          radius: 5
                      }
                    // Create a property to contain the visibility of the details.
                    // We can bind multiple element's opacity to this one property,
                    // rather than having a "PropertyChanges" line for each element we
                    // want to fade.
                    property real detailsOpacity : 0

                    width: listView.width
                    height: 30

                    MouseArea {
                        anchors.fill: parent
                        onClicked: recipe.state = 'Details';
                    }

                    Row {
                        id: topLayout
                        anchors {
                            fill: parent
                            topMargin: 5
                        }
                        Text{width:10}
                        Text {
                            id:txtFecha
                            //text:  Qt.formatDateTime(date,"dd/MMM/yyyy HH:mm")
                            text: dia
                            font.pixelSize: 15
                            wrapMode: Text.Wrap
                            width: 30
                            anchors {
                                topMargin:  units.gu(2)
                                leftMargin: units.gu(20)
                                rightMargin: units.gu(20)
                            }
                        }

                        Text {
                            id:txtDestino
                            text: route
                            font.pointSize: 12; font.bold: true
                            anchors {
                                topMargin:  units.gu(2)
                                leftMargin: units.gu(20)
                            }
                        }
                    }
                    Item {
                        id: details
                        x: 10; width: parent.width - 20
    //                        anchors { top: recipe.top+20; topMargin: 10; bottom: parent.bottom; bottomMargin: 10 }
                        opacity: recipe.detailsOpacity
                        MouseArea {
                            anchors.fill: parent
                            onClicked: recipe.state = '';
                        }
                        Column{
                            anchors {
                                fill: parent
                                topMargin: 5
                            }
                            id:detailsRow
                            Text {
                                id:txtVacio
                                text: "    "
                            }
                            Text {
                                id:txtkm
                                text: "Km:"+km
                                font.pointSize: 12; font.bold: true
                            }
                            Text {
                                id:txtParada
                                text: "Parada:"+stop
                                font.pointSize: 12; font.bold: true
                            }
                            // A button to close the detailed view, i.e. set the state back to default ('').
                        }
                    }
                    Button {
                        id:closeBtn
                        y: 10
                        anchors { right: background.right; rightMargin: 10 }
                        opacity: recipe.detailsOpacity
                        text: "Close"
                        onClicked: recipe.state = '';
                    }
                    states: State {
                        name: "Details"

                        PropertyChanges { target: background; color: "white" }
                        PropertyChanges { target: recipe; detailsOpacity: 1; x: 0 } // Make details visible
                        PropertyChanges { target: recipe; height: 65}//listView.height } // Fill the entire list area with the detailed view

                        // Move the list so that this item is at the top.
                        PropertyChanges { target: recipe.ListView.view; explicit: true; contentY: recipe.y }

                        // Disallow flicking while we're in detailed view
                        PropertyChanges { target: recipe.ListView.view; interactive: false }
                    }

                    transitions: Transition {
                        // Make the state changes smooth
                        ParallelAnimation {
                            ColorAnimation { property: "color"; duration: 500 }
                            NumberAnimation { duration: 300; properties: "detailsOpacity,x,contentY,height,width" }
                        }
                    }
                }

            }

        }
    }
}

