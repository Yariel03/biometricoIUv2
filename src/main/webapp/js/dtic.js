$(document).ready(function () {
    if ($(window).width() < 992) {
        $('.left-sidebar').addClass('minified');
        $('.content-wrapper').addClass('expanded');
    }
});

function abrecierra() {
    if (!$('.left-sidebar').hasClass('left-sidebar')) {
        $('.left-sidebar').addClass('sidebar-float-active');
    }
    if (!$('.left-sidebar').hasClass('left-sidebar sidebar-float-active')) {
        $('.left-sidebar').removeClass('sidebar-float-active');
    }
}

function VentanaPorte() {
    if ($(window).width() < 992) {

        $('.left-sidebar').addClass('minified');
        $('.content-wrapper').addClass('expanded');

    } else {


    }
}

function CerrarMenu() {
    $('#menu1').removeClass('active');
    $('#submenu1').css("display", "none");
    $('#ico1').removeClass("fa fa-angle-down");
    $('#ico1').addClass("fa fa-angle-left");
}

function MuestraLoad() {
    $('body').loadingModal({text: 'No cierre el navegador, estamos trabajando en ello....'});
    $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'black');
    var delay = function (ms) {
        return new Promise(function (r) {
            setTimeout(r, ms);
        })
    };
    var time = 2500;
    delay(time)
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red').loadingModal('text', 'Tomará un poco de tiempo, por favor espere....');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'black');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red').loadingModal('text', 'Puede ir por un café mientras terminamos el trabajo....');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'black').loadingModal('text', 'Su información la estamos procesando....');
                ;
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })

}

function TerminaLoad() {
    $('body').loadingModal('hide');
    $('body').loadingModal('destroy');
}

function fncLnkAdmin() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#304A54");
    $("#contenidoDinamico").html("");
    var idUser = $("#codCas").text();
    $.ajax({
        url: "AdminMenu.jsp",
        type: "GET",
        data: {idUser: idUser},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Certificaciones</h2><em>Certificaciones honoríficas</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>Estimado(a) Administrador(a) del Sistema, usted podrá asignar, descargar y administrar las Certificaciones Honoríficas al Desempeño Integral Docente del Personal Académico (a partir del periodo octubre 2017 - marzo 2018).</p></br><img src='assets/img/dashboard-normal-sidebar.png' class='img-responsive center-block' alt='Normal Sidebar'><div class='bottom-30px'></div></div>");
        },
        error: function (error) {
            location.reload();
        }
    });
}


function convertirObjetoJson(idFrm) {

    var result = JSON.stringify($('#' + idFrm).serialize());
    var uscape = "";

    result = result.replace(/&/gi, '","');
    result = result.replace(/=/gi, '":"');

    result = '{'.concat(result);
    result = result.concat('}');

    uscape = unescape(result);
    result = uscape;

    var obj = JSON.parse(result);

    for (var propiedad in obj) {
        if (propiedad.substring(0, 3) == 'str') {
            obj[propiedad] = decodeURI(obj[propiedad]);
        }
        if (propiedad.substring(0, 3) == 'int') {
            obj[propiedad] = parseInt(obj[propiedad]);
        }
        if (propiedad.substring(0, 2) == 'dt') {
            obj[propiedad] = toSQLDate(obj[propiedad]);
        }
    }
    return JSON.stringify(obj);
}

//    Convertir la fecha a formato DateSQL 
function toSQLDate(fechaInput) {
    var fechaFormato = new Date(fechaInput + 'T12:00-0500');
    var fecha = fechaFormato.toDateString().substr(4, 11);
    fecha = fecha.replace('' + fechaFormato.getDate(), '' + (fechaFormato.getDate()) + ',');
    fecha = fecha.replace(fecha.substr(0, 3), traducirMes(fecha.substr(0, 3)));
    return fecha;
}

//    Traducir meses de Ingles a Español
function traducirMes(mes) {
    var traducido = '';
    switch (mes) {
        case 'Jan':
            traducido = 'ene';
            break;
        case 'Feb':
            traducido = 'feb';
            break;
        case 'Mar':
            traducido = 'mar';
            break;
        case 'Apr':
            traducido = 'abr';
            break;
        case 'May':
            traducido = 'may';
            break;
        case 'Jun':
            traducido = 'jun';
            break;
        case 'Jul':
            traducido = 'jul';
            break;
        case 'Aug':
            traducido = 'ago';
            break;
        case 'Sep':
            traducido = 'sep';
            break;
        case 'Oct':
            traducido = 'oct';
            break;
        case 'Nov':
            traducido = 'nov';
            break;
        case 'Dec':
            traducido = 'dic';
            break;
    }
    return traducido;
}

// Recoge un parametro de la URL segun su nombre 
// @name: Nombre del parametro a recoger 
function getURLParameter(name) {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [, ""])[1].replace(/\+/g, '%20')) || null;
}

// Cambia un parametro de la URL 
// @param: Nombre del parametro a cambiar 
// @value: Valor nuevo asignado para el parametro 
function changeUrlParam(param, value) {
    var currentURL = window.location.href + '&';
    var change = new RegExp('(' + param + ')=(.*)&', 'g');
    var newURL = currentURL.replace(change, '$1=' + value + '&');

    if (getURLParameter(param) !== null) {
        try {
            window.history.replaceState('', '', newURL.slice(0, -1));
        } catch (e) {
            console.log(e);
        }
    } else {
        var currURL = window.location.href;
        if (currURL.indexOf("?") !== -1) {
            window.history.replaceState('', '', currentURL.slice(0, -1) + '&' + param + '=' + value);
        } else {
            window.history.replaceState('', '', currentURL.slice(0, -1) + '?' + param + '=' + value);
        }
    }
}

// Funciones para las alertas del Salchichon
function alertAdd() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha ingresado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}
function listarcorrecto() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha ingresado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertEdit() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha editado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertDel() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha eliminado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertError() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong> Ha ocurrido un error.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertCancel() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-info' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong> Acción cancelada por el usuario.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}
//Yariel*** alertas adicionales para el sistema de control biometrico
function alertVacio() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-warning' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ah ocurrido un inconveniente!</strong> Por favor, debe ingresar los valores que se solicitan.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}
function alertMarcacionVacia() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-warning' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>No cuenta con marcaciones!</strong> Por favor, intente con otro usuario.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}
function alertCompleteExcel() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>EXITO!</strong> Exportación de Excel ha terminado .</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}
function alertErrorExcel() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong> No se pudo descargar el Excel.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertFechasIncorrectas() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Fechas Incorrectas!</strong> La fecha inicial no puede ser mayor a la fecha final.</div>");
    $("#alerta").fadeTo(3000, 50).slideUp(500, function () {
        $(this).remove();
    });
}
//Alerta Personalizada
function alertPersonal(titulo, descripcion, tipo, tiempo) {
    var alert;
    if (tipo === 1) {
        alert = "alert alert-success";
    } else if (tipo === 2) {
        alert = "alert alert-danger";
    } else if (tipo === 3) {
        alert = "alert alert-warning";
    } else if (tipo === 4) {
        alert = "alert alert-info";
    }

    $('#alert-dtic').html("<div id='alerta' class='" + alert + "' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>" + titulo + "</strong> " + descripcion + "</div>");
    $("#alerta").fadeTo(tiempo, 50).slideUp(500, function () {
        $(this).remove();
    });
}
