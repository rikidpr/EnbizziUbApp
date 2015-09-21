import QtQuick 2.0

// Background
Rectangle {
    id: bg
    anchors.fill: parent
    z: -10; opacity: 0.5

    property bool __parentPageAboutToBeClosed: false

    /* MainView clips its content, so that it does not overlap the header.
       We need to bypass this, using another Rectangle that specifically overlap the header. */
    Rectangle {
        parent: root.header
        z: -10; opacity: 0.5

        width: root.width
        height: root.header.height
        color: bg.color

        // FIXME: Header background should progressively change opacity to 0.0 when the BottomEdge page is dismissed.
        visible: !bg.__parentPageAboutToBeClosed
    }
}

