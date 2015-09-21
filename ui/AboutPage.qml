import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem
import Ubuntu.Components.Popups 1.0
Page {
    id: aboutPage

    title: i18n.tr("About")
    head.sections.model: [i18n.tr("About"), i18n.tr("Credits"), i18n.tr("Copyright")]
   /* head.actions: [ no es necesario ya que al estar dentro del pageStack ya viene el botoncico a la izq
        //acciones de la barra
        Action {
            id: openAbout
            text: i18n.tr("Calendar...")
            iconName: "return"
            onTriggered: pageStack.push(Qt.resolvedUrl("./CalendarList.qml"))
        }
    ]*/

    property string version

    Loader {
        id: view

        anchors {
            fill: parent
            margins: units.gu(2)
        }

        sourceComponent: {
            if (aboutPage.head.sections.selectedIndex === 0)
                return aboutSection

            if (aboutPage.head.sections.selectedIndex === 1)
                return creditSection

            if (aboutPage.head.sections.selectedIndex === 2)
                return katapinSection
        }
    }


    // about SECTION
    Component {
        id: aboutSection

        Column {
            anchors.fill: parent
            width: root.width > units.gu(50) ? units.gu(50) : parent.width

            ListItem.Header {
                text: i18n.tr("Hecho por:")
            }

            ListItem.Subtitled {
                text: "Riki"
                subText: "DPR"
            }

            ListItem.Subtitled {
                text: "enbizzi club"
                subText: "sin ellos no existiria"
            }
        }
    }   // END CREDIT SECTION

    // CREDITS SECTION
    Component {
        id: creditSection

        Column {
            anchors.fill: parent
            width: root.width > units.gu(50) ? units.gu(50) : parent.width

            ListItem.Header {
                text: i18n.tr("A big thanks to:")
            }

            ListItem.Subtitled {
                text: "Marieta"
                subText: "Mas maja que las pesetas"
            }

            ListItem.Subtitled {
                text: "Vega y Malena"
                subText: "tremendas"
            }
        }
    }   // END CREDIT SECTION
    // Katapin SECTION
    Component {
        id: katapinSection

        Column {
            anchors.fill: parent
            width: root.width > units.gu(50) ? units.gu(50) : parent.width

            ListItem.Header {
                text: i18n.tr("Eguan epei:")
            }

            ListItem.Subtitled {
                text: "El gorrion"
                subText: "Vaya tropa"
            }

            ListItem.Subtitled {
                text: "Los palomos"
                subText: "vaya tela"
            }
        }
    }   // END Katapin SECTION

}
