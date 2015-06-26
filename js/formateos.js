.pragma library

function getMoth(index) {
    if (index === "1") return "Enero (9h)";
    else if (index === "2") return "Febrero (9h)";
    else if (index === "3") return "Marzo (9h)";
    else if (index === "4") return "Abril (8:30h)";
    else if (index === "5") return "Mayo (8h)";
    else if (index === "6") return "Junio (8h)";
    else if (index === "7") return "Julio (8h)";
    else if (index === "8") return "Agosto (8h)";
    else if (index === "9") return "Septiembre (8:30h)";
    else if (index === "10") return "Octubre (9h)";
    else if (index === "11") return "Noviembre (9h)";
    else if (index === "12") return "Diciembre (9h)";
    else return index;
}

