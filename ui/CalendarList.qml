import QtQuick 2.0
import Ubuntu.Components 1.1
import QtQuick.XmlListModel 2.0
import Ubuntu.Components.Popups 1.0
import "../js/formateos.js" as Formateos
import "../common"

PageWithBottomEdge {
    id:calendarListPage
    title: i18n.tr("EnbizziUbApp")
    head.actions: [//15.04 en adelante (en desktop no rula, solo en movil)
        //acciones de la barra
        Action {
            id: openAbout
            text: i18n.tr("About...")
            iconName: "help"
            onTriggered: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
        }
       /*, Action {
            id: openMapViewer
            text: i18n.tr("map...")
            iconName: "map"
            onTriggered: pageStack.push(Qt.resolvedUrl("MapViewer.qml"))
        }*/
    ]

    Column {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
        }

        QtObject {
            id:cons
            property int mult:2;
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
                width: parent.width; height: 30*cons.mult;
                gradient: clubcolors
            }
            //highlight: Rectangle {
            //    width: parent.width
            //    color: "lightgray"
            //}
            section {//para agrupar los resultados por un termino
                property: "mes"
                criteria: ViewSection.FullString
                delegate: Rectangle {
                    color: "#58D3F7"
                    width: parent.width
                    height: childrenRect.height + 4*cons.mult
                    Text { anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 16*cons.mult
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
                width: parent.width; height: 50*cons.mult
                gradient: clubcolors
                border {color: cons.azulEnbizzi; width: 2*cons.mult}
                Text {
                    anchors.centerIn: parent
                    text: "Calendario Enbizzi"
                    color: "#FFFFFF"
                    font.pixelSize: 25*cons.mult
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
                      radius: 5*cons.mult
                  }
                // Create a property to contain the visibility of the details.
                // We can bind multiple element's opacity to this one property,
                // rather than having a "PropertyChanges" line for each element we
                // want to fade.
                property real detailsOpacity : 0

                width: listView.width
                height: 30*cons.mult

                MouseArea {
                    anchors.fill: parent
                    onClicked: recipe.state = 'Details';
                }

                Row {
                    id: topLayout
                    anchors {
                        fill: parent
                        topMargin: 5*cons.mult
                    }
                    Text{width:10*cons.mult}
                    Text {
                        id:txtFecha
                        //text:  Qt.formatDateTime(date,"dd/MMM/yyyy HH:mm")
                        text: dia
                        font.pixelSize: 15*cons.mult
                        wrapMode: Text.Wrap
                        width: 30*cons.mult
                        anchors {
                            topMargin:  units.gu(2)
                            leftMargin: units.gu(20)
                            rightMargin: units.gu(20)
                        }
                    }

                    Text {
                        id:txtDestino
                        text: route
                        font.pointSize: 10*cons.mult; font.bold: true
                        anchors {
                            topMargin:  units.gu(2)
                            leftMargin: units.gu(20)
                        }
                    }
                }
                Item {
                    id: details
                    x: 10*cons.mult; width: parent.width - 20*cons.mult
    //                        anchors { top: recipe.top+20; topMargin: 10; bottom: parent.bottom; bottomMargin: 10 }
                    opacity: recipe.detailsOpacity
                    MouseArea {
                        anchors.fill: parent
                        onClicked: recipe.state = '';
                    }
                    Column{
                        anchors {
                            fill: parent
                            topMargin: 5*cons.mult
                        }
                        id:detailsRow
                        Text {
                            id:txtVacio
                            text: "    "
                        }
                        Text {
                            id:txtkm
                            text: "Km:"+km
                            font.pointSize: 12*cons.mult; font.bold: true
                        }
                        Text {
                            id:txtParada
                            text: "Parada:"+stop
                            font.pointSize: 12*cons.mult; font.bold: true
                        }
                        // A button to close the detailed view, i.e. set the state back to default ('').
                    }
                }
                Button {
                    id:closeBtn
                    y: 25*cons.mult
                    anchors { right: background.right; rightMargin: 10*cons.mult }
                    opacity: recipe.detailsOpacity
                    text: "Close"
                    onClicked: recipe.state = '';
                }
                states: State {
                    name: "Details"

                    PropertyChanges { target: background; color: "white" }
                    PropertyChanges { target: recipe; detailsOpacity: 1; x: 0 } // Make details visible
                    PropertyChanges { target: recipe; height: 65*cons.mult}//listView.height } // Fill the entire list area with the detailed view

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

    bottomEdgeTitle: i18n.tr("Mapa")
    bottomEdgePageComponent: MapViewer{}
    // Disable bottomEdge when MultiSelectionHandler is active
    bottomEdgeEnabled: false
}
