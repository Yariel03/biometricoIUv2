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
function clickMigrar() {
    $("#contenidoDinamico").html("");
    $("#contenidoDinamico").html("<div class='loader'>Cargando...</div>");
    VentanaPorte();
    $.ajax({
        url: "migraciones/AdminMigracion.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
    //alertPersonal("Titulo", "Usted a pasado a clicl", 4, 4000)
}


function fnMigrarCodigoBiometrico() {
    alertify.confirm(
            '<center><b>Se realizará el proceso de migración.</b><center>',
            'Al continuar con este proceso usted <b>REALIZARÁ EL PROCESO DE MIGRACIÓN</b> de todos los usuarios con su código biométrico de manera <b>DEFINITIVA</b>, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contMarcaciones.jsp",
                    type: "GET",
                    data: {opc: 'migrarCodBiometrico'},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickMigrar();
                        TerminaLoad();
                        alertAdd();
                    }
                    ,
                    error: function (error) {
                        TerminaLoad();
                        clickMigrar();
                    }
                });
            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
//si pasa el tiempo 
        alertCancel();
    });
}

