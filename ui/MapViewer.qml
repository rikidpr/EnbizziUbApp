import QtQuick 2.0
import Ubuntu.Components 1.1
import QtLocation 5.0
import QtPositioning 5.2
import "../model"
import "../js/ApiKeys.js" as ApiKeys;

Page {
    id: mapViewer
    x: 0
    y: 0
    width: 500
    height: 500

    title: i18n.tr("MapViewer")

    Column{
        Map{
            id: map

            anchors {
                fill: parent
            }

            center: QtPositioning.coordinate(53.351, -6.260)
            zoomLevel: 15

            plugin: Plugin {
                id: plugin
                allowExperimental: true
                preferred: ["nokia", "osm"]
                required.mapping: Plugin.AnyMappingFeatures
                required.geocoding: Plugin.AnyGeocodingFeatures

                parameters: [
                    PluginParameter { name: "app_id"; value: ApiKeys.here_app_id },
                    PluginParameter { name: "token"; value: ApiKeys.here_token },
                    PluginParameter { name: "proxy"; value: "system" }
                ]
            }
        }
    }
}
