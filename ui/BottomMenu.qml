import QtQuick 2.4
import QtQuick.Controls 1.3
import Ubuntu.Components 1.1

Component {
    id: bottomMenu;
    Menu {
        title: "Edit"

        MenuItem {
            text: "Road"
            shortcut: "Ctrl+R"
            onTriggered: console.log("type road")
        }
        MenuItem {
            text: "Btt"
            shortcut: "Ctrl+B"
            onTriggered: console.log("type btt")
        }
    }
    /*RadialBottomEdge {
        actions: [
            RadialAction {
                iconName: "alarm-clock"
                iconColor: UbuntuColors.coolGrey
                onTriggered: console.log("Alarm..zZz")
            },

            RadialAction {
                iconName: "settings"
                iconColor: UbuntuColors.coolGrey
            },

            RadialAction {
                iconName: "save"
                iconColor: "white"
                enabled: false
                backgroundColor: UbuntuColors.green
                onTriggered: console.log("save")
            },

            RadialAction {
                iconName: "delete"
                iconColor: "white"
                enabled: false
                backgroundColor: UbuntuColors.red
                onTriggered: console.log("delete")
            },

            RadialAction {
                iconName: "add"
                iconColor: "white"
                backgroundColor: UbuntuColors.green
            },

            RadialAction {
                iconName: "stock_email"
                iconColor: UbuntuColors.coolGrey
            }
        ]
    }*/
}
