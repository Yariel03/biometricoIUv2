function Matar() {
    var Tipo = $("#Logeo").text();
    $.ajax({
        url: "./final.jsp",
        type: "POST",
        dataType: "text",
        data: {opcion: 'cerrar'},
        success: function (msg) {
            if (Tipo.length === 14) {
                //INSTITUCIONAL
                var urlLogout = "https://login.microsoftonline.com/common/oauth2/logout?post_logout_redirect_uri=";
                var urlQuery = "https://seguridad.espoch.edu.ec/cas/logout?service=https://localhost:8181/biometricoIUV2/index.jsp"; //Local cambiar por el nombre del proyecto
//                var urlQuery = "https://seguridad.espoch.edu.ec/cas/logout?service=https://ejemplodtic.espoch.edu.ec/EjemploDticIU/index.jsp"; //Insitucional
                urlQuery = encodeURI(urlQuery);
                window.location.replace(urlLogout + urlQuery);
            }
            if (Tipo.length === 6) {
                //BD CENTRALIZADA
                var urlLogout = "https://seguridad.espoch.edu.ec/cas/logout?service=";
                var urlQuery = "https://localhost:8181/biometricoIUV2/index.jsp"; //Local cambiar por el nombre del proyecto
//                var urlQuery = "https://ejemplodtic.espoch.edu.ec/EjemploDticIU/index.jsp"; //Institucional
                urlQuery = encodeURI(urlQuery);
                window.location.replace(urlLogout + urlQuery);
            }
        }
    });
}