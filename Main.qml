import QtQuick 2.0
import Ubuntu.Components 1.1
import "ui"
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


   CalendarModel{
       id:calendarModel;
   }

  // XmlListModel {
//
//           source: "http://localhost:8282/rest/calendar/nextActivitiesXml"
//            query: "/calendarEventList/list"

//            XmlRole { name: "num";  query: "num/string()";  isKey: true }
//            XmlRole { name: "date";   query: "xs:dateTime(date)";   isKey: false }
//            //XmlRole { name: "mes";  query: "month-from-dateTime(date)";  isKey: false }//xpath functions
//            XmlRole { name: "route";   query: "route/string()";   isKey: false }
//            //XmlRole { name: "returnRoute";  query: "returnRoute/string()"; isKey: false }
//            XmlRole { name: "stop";  query: "stop/string()";  isKey: false }
//            XmlRole { name: "km";  query: "km/string()";  isKey: false }
//            //XmlRole { name: "elevationGain";  query: "elevationGain/string()";  isKey: false }
//            //XmlRole { name: "difficulty";  query: "difficulty/string()";  isKey: false }
//            //XmlRole { name: "type";  query: "type/string()";  isKey: false }
//        }
   /**
        PageStack nos permite hacer saltos de qml a qml (pantalla a pantalla)
        Notese que para ello, hay que llenarlo de "qmls", sino, petara diciendo que esta nulo
   */
   PageStack {
       id: pageStack    
   }
   Component.onCompleted: pageStack.push(Qt.resolvedUrl("ui/CalendarList.qml"));

}

