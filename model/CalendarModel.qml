import QtQuick 2.0
import Ubuntu.Components 1.1
import QtQml 2.2

ListModel {
    id: calendarModel

    ListElement {
        dia: "26"
        mes: "9"
        hora: 8.5
        route:"Zuera-Cruce Las Pedrosas-La Paul"
        km:106
        stop: "La Paul"
    }
    ListElement {dia: "27";mes: "9";hora: 8.5;route:"Villanueva de Huerva";km:90;stop: "Villanueva";}
	
	ListElement {dia: "4";mes: "10";hora:9;route:"ZUERA-SAN MATEO-LECIÑENA";km:80;stop: "LECIÑENA"}
	ListElement {dia: "5";mes: "10";hora:9;route:"CARIÑENA ";km:90;stop: "CARIÑENA"}
	ListElement {dia: "11";mes: "10";hora:9;route:"ALTO DE MEZALOCHA";km:76;stop: "MUEL"}
	ListElement {dia: "12";mes: "10";hora:10;route:"CRUCE DE MEDIANA – FUENTES";km:80;stop: "FUENTES"}
	ListElement {dia: "13";mes: "10";hora:9;route:"ALTO DE VALMADRID";km:76;stop: "VALMADRID"}
	ListElement {dia: "18";mes: "10";hora:9;route:"LONGARES";km:78;stop: "LONGARES"}
	ListElement {dia: "19";mes: "10";hora:9;route:"LA MUELA-ÉPILA";km:94;stop: "ÉPILA"}
	ListElement {dia: "25";mes: "10";hora:9;route:"ERMITA DE LECIÑENA-SAN MATEO";km:78;stop: "LECIÑENA"}
	ListElement {dia: "26";mes: "10";hora:9;route:"MUEL-BODEGAS AYLÉS";km:80;stop: "MUEL"}

	ListElement {dia: "6";mes: "11";hora:9;route:"ERMITA DE LECIÑENA-SAN MATEO";km:78;stop: "LECIÑENA"}
	ListElement {dia: "7";mes: "11";hora:9;route:"FARLETE";km:76;stop: "FARLETE"}
	ListElement {dia: "8";mes: "11";hora:9;route:"ALTO DE VALMADRID";km:76;stop: "VALMADRID"}
	ListElement {dia: "13";mes: "11";hora:9;route:"LONGARES";km:78;stop: "LONGARES"}
	ListElement {dia: "14";mes: "11";hora:9;route:"LA MUELA – MUEL";km:80;stop: "MUEL"}
	ListElement {dia: "20";mes: "11";hora:9;route:"ZUERA – EL TEMPLE";km:92;stop: "EL TEMPLE"}
	ListElement {dia: "21";mes: "11";hora:9;route:"ALAGÓN – REMOLINOS";km:72;stop: "REMOLINOS"}
	ListElement {dia: "25";mes: "11";hora:10;route:"MUEL";km:56;stop: "MUEL"}
	ListElement {dia: "27";mes: "11";hora:9;route:"ZUERA – ONTINAR";km:72;stop: "ONTINAR"}
	ListElement {dia: "28";mes: "11";hora:9;route:"LONGARES – ALFAMÉN";km:92;stop: "ALFAMÉN"}

	ListElement {dia: "1";mes: "12";hora:9;route:"LONGARES ";km:78;stop: "LONGARES"}
	ListElement {dia: "2";mes: "12";hora:9;route:"ZUERA – EL TEMPLE";km:92;stop: "TEMPLE"}
	ListElement {dia: "8";mes: "12";hora:9;route:"ALTO DE ALCUBIERRE- LECIÑENA - SAN MATEO";km:90;stop: "LECIÑENA"}
	ListElement {dia: "9";mes: "12";hora:9;route:"REMOLINOS";km:72;stop: "REMOLINOS"}
	ListElement {dia: "15";mes: "12";hora:9;route:"ALTO DE VALMADRID";km:76;stop: "VALMADRID"}
	ListElement {dia: "16";mes: "12";hora:9;route:"LA MUELA – MUEL";km:80;stop: "MUEL"}
	ListElement {dia: "22";mes: "12";hora:9;route:"VILLANUEVA DE HUERVA";km:90;stop: "VILLANUEVA"}
	ListElement {dia: "23";mes: "12";hora:9;route:"CRUCE DE MEDIANA – FUENTES";km:80;stop: "FUENTES"}
	ListElement {dia: "29";mes: "12";hora:9;route:"MUEL-BODEGAS AYLÉS";km:80;stop: "MUEL"}
	ListElement {dia: "30";mes: "12";hora:9;route:"ALAGÓN – LUCENI";km:78;stop: "LUCENI"}

}


/*
    ListElement {
        dia: "27"
        mes: "6"
        hora: 8
        route:"Muel-Cariñena-Alfamén"
        km: 102
        stop: "Alfamén"
    }
    ListElement {
        dia: "28"
        mes: "6"
        hora: 8
        route:"San Jorge-Gurrea-La Paul"
        km: 100
        stop: "La Paul"
    }
    ListElement {
        dia: "04"
        mes: "7"
        hora: 8
        route:"Monegrillo"
        km: 96
        stop: "Monegrillo"
    }
    ListElement {
        dia: "05"
        mes: "7"
        hora: 8
        route:"Jaulin-Villanueva"
        km: 100
        stop: "Villanueva"
    }
    ListElement {
        dia: "11"
        mes: "7"
        hora: 8
        route:"Alcubierre"
        km: 100
        stop: "Alcubierre"
    }
    ListElement {
        dia: "12"
        mes: "7"
        hora: 8
        route:"Zuera-Sierra Luna"
        km: 110
        stop: "Sierra Luna"
    }
    ListElement {
        dia: "18"
        mes: "7"
        hora: 8
        route:"Alto de Aguilón"
        km: 120
        stop: "Villanueva"
    }
    ListElement {
        dia: "19"
        mes: "7"
        hora: 8
        route:"La Muela-Épila"
        km: 94
        stop: "Épila"
    }
    ListElement {
        dia: "25"
        mes: "7"
        hora: 8
        route:"La Puebla-Fuendetodos"
        km:120
        stop:"Fuendetodos"
    }
    ListElement {
        dia: "26"
        mes: "7"
        hora: 8
        route:"Alagón-Pozuelo-Épila"
        km:124
        stop: "Épila"
    }
    ListElement {
        dia: "01"
        mes: "8"
        hora: 8
        route:"Zuera-Sierra Luna"
        km:106
        stop: "Sierra Luna"
    }
    ListElement {
        dia: "02"
        mes: "8"
        hora: 8
        route:"Remolinos-Pradilla-Luceni"
        km:98
        stop: "Pradilla"
    }
    ListElement {
        dia: "08"
        mes: "8"
        hora: 8
        route:"Castejón de Valdejasa"
        km:90
        stop: "Castejón"
    }
    ListElement {
        dia: "09"
        mes: "8"
        hora: 8
        route:"Zuera - El temple - Ontinar"
        km:82
        stop: "Ontinar"
    }
    ListElement {
        dia: "15"
        mes: "8"
        hora: 8
        route:"Alcubierre"
        km:100
        stop: "Alcubierre"
    }
    ListElement {
        dia: "16"
        mes: "8"
        hora: 8
        route:"Longares-Alfamén-Almonacid"
        km:112
        stop: "Almonacid"
    }
    ListElement {
        dia: "22"
        mes: "8"
        hora: 8
        route:"La Muela-Calatorao-Epila"
        km:114
        stop: "Épila"
    }
    ListElement {
        dia: "23"
        mes: "8"
        hora: 8
        route:"Monegrillo"
        km:96
        stop: "Monegrillo"
    }
    ListElement {
        dia: "29"
        mes: "8"
        hora: 8
        route:"San Jorge-Gurrea-La Paul"
        km:100
        stop: "La Paul"
    }
    ListElement {
        dia: "30"
        mes: "8"
        hora: 8
        route:"Jaulín-Villanueva"
        km:100
        stop: "Villanueva"
    }


    ListElement {
        dia: "05"
        mes: "9"
        hora: 8.5
        route:"Longares-Alfamén"
        km:90
        stop: "Alfamén"
    }
    ListElement {
        dia: "06"
        mes: "9"
        hora: 8.5
        route:"Jaulin-Fuendetodos"
        km:90
        stop: "Fuendetodos"
    }
    ListElement {
        dia: "12"
        mes: "9"
        hora: 8.5
        route:"La Muela-Épila"
        km:94
        stop: "Épila"
    }
    ListElement {
        dia: "13"
        mes: "9"
        hora: 8.5
        route:"Cruce de Mediana - Fuentes"
        km:80
        stop: "Fuentes"
    }
    ListElement {
        dia: "19"
        mes: "9"
        hora: 8.5
        route:"Muel-Cariñena"
        km:90
        stop: "Cariñena"
    }
    ListElement {
        dia: "20"
        mes: "9"
        hora: 8.5
        route:"Castejón de Valdejasa"
        km:90
        stop: "Castejón"
    }*/
