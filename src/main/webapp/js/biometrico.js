//Querido colega programador: 
//Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
//Ahora solo dios lo sabe!!
//
//Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
//y fracasas (seguramente), por favor, incrementa 
//el siguiente contador como una advertencia para el siguiente colega:
//
//Total_horas_perdidas_aqui = 0

//Funciones de los menus

function MenuSA() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#304A54");
    $("#contenidoDinamico").html("");
    var UsuLinea = $("#codCas").text();
    $("#menuDerecha").removeClass("control-sidebar-open");
    $.ajax({
        url: "MenuSA.jsp",
        type: "GET",
        data: {UsuLinea: UsuLinea},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
        },
        error: function (error) {
            location.reload();
        }
    });
}
function usuario() {

    $("#left-sidebar").css("background-color", "#ececec");
    $("#menuDerecha").removeClass("control-sidebar-open");
    VentanaPorte();
    $.ajax({
        url: "usuario.jsp",
        type: "GET",
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            location.reload();
        }
    });
}
function Menu() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#ececec");
    $("#contenidoDinamico").html("");
    var UsuLinea = $("#codCas").text();
    $("#menuDerecha").removeClass("control-sidebar-open");
    $.ajax({
        url: "Menu.jsp",
        type: "GET",
        data: {UsuLinea: UsuLinea},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
            
        },
        error: function (error) {
            location.reload();
        }
    });
}

