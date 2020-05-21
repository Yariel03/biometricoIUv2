<%-- 
    Document   : contMarcaciones
    Created on : 20-may-2020, 21:32:25
    Author     : YARIEL
--%>


<%@page import="entidades.ClFuncionario"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%--<%@page import="org.apache.poi.util.SystemOutLogger"%>--%>
<%@page import="java.text.Format"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.net.NetworkInterface"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.util.Base64"%>
<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<%@page import="servicios.WSCentralizada"%>
<%@page import="servicios.*"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Obtinene el número de cédula del usuario que esta logueado en el sistema
    String UsuLinea = session.getAttribute("codigoPersona").toString();
    String strOpc = request.getParameter("opc");
//    String strDatos = request.getParameter("datos");
    if (strOpc != null) {

        if (strOpc.equals("migrarCodBiometrico")) {
            try {
//                    //////////////////////////////////////Migrar Funcionarios//////////////////////////////////////
//                ArrayList<ClFuncionario> listaPersonal = new ArrayList<ClFuncionario>();
                String resultadoPersonal = "{\"respuesta\":" + sMigraciones.listarTodosPersonal() + "}";
                
                resultadoPersonal = resultadoPersonal.replaceAll("T00:00:00-05:00", "");
                resultadoPersonal = resultadoPersonal.replaceAll("apellidos", "apellidosfun");
                resultadoPersonal = resultadoPersonal.replaceAll("gremio", "codfirma");
                resultadoPersonal = resultadoPersonal.replaceAll("ci\"", "cifun\"");
                resultadoPersonal = resultadoPersonal.replaceAll("dependencia", "dependencia");
                resultadoPersonal = resultadoPersonal.replaceAll("discapacidad", "discapacidad");
                resultadoPersonal = resultadoPersonal.replaceAll("FIng", "dtingresofun");
                resultadoPersonal = resultadoPersonal.replaceAll("genero", "genero");
                resultadoPersonal = resultadoPersonal.replaceAll("nombres", "nombresfun");
                resultadoPersonal = resultadoPersonal.replaceAll("cargo", "puesto");
                resultadoPersonal = resultadoPersonal.replaceAll("RLaboral", "rlaboral"); //se usa para saber que tipo de funcionario es

                JSONObject jsonPersonal = new JSONObject(resultadoPersonal);
                JSONArray arrayPersonal = jsonPersonal.getJSONArray("respuesta");
                for (int i = 0; i < arrayPersonal.length(); i++) {
                    String jsonPersona = arrayPersonal.getJSONObject(i).toString();
                    sMigraciones.ingresarPersonal(jsonPersona);
//                    //////////////////////////////////////FIN Personal//////////////////////////////////////
//
//                    //////////////////////////////////////Migrar Código BIOMÉTRICO//////////////////////////////////////
//                    ArrayList<TblRecursoHumano> listRecursoHumano = new ArrayList<TblRecursoHumano>();
//                    String resultadoHorarioPersonal = "{\"respuesta\":" + sMigraciones.listarTodosRecHumBiometrico() + "}";
//                    resultadoHorarioPersonal = resultadoHorarioPersonal.replaceAll("T00:00:00-05:00", "");
//                    resultadoHorarioPersonal = resultadoHorarioPersonal.replaceAll("FEnrolClock", "strFechaEnrolClock");
//                    resultadoHorarioPersonal = resultadoHorarioPersonal.replaceAll("FIngSist", "strFechaIngresoSistema");
//                    resultadoHorarioPersonal = resultadoHorarioPersonal.replaceAll("ci", "strCiPersonal\":{\"strCiPersonal");
//                    resultadoHorarioPersonal = resultadoHorarioPersonal.replaceAll(",\"rhCodigo", "},\"intCodLogicaNegocioTh");
//                    JSONObject jsonRecursoHumano = new JSONObject(resultadoHorarioPersonal);
//
//                    JSONArray arrayRecursoHumano = jsonRecursoHumano.getJSONArray("respuesta");
//                    for (int i = 0; i < arrayRecursoHumano.length(); i++) {
//                        JSONObject childJSONObject = arrayRecursoHumano.getJSONObject(i);
//                        TblRecursoHumano objMenus = new Gson().fromJson(childJSONObject.toString(), TblRecursoHumano.class);
//                        listRecursoHumano.add(objMenus);
//                    }
//                    for (TblRecursoHumano objRecursoHumano : listRecursoHumano) {
//                        TblRecursoHumano objRecursoHumanoNew = new TblRecursoHumano();
//                        objRecursoHumanoNew.setIntCodLogicaNegocioTh(objRecursoHumano.getIntCodLogicaNegocioTh());
//                        objRecursoHumanoNew.setStrCiPersonal(objRecursoHumano.getStrCiPersonal());
//                        objRecursoHumanoNew.setStrFechaEnrolClock(objRecursoHumano.getStrFechaEnrolClock());
//                        objRecursoHumanoNew.setStrFechaIngresoSistema(objRecursoHumano.getStrFechaIngresoSistema());
//                        String jsonRecursoHumanoNew = new Gson().toJson(objRecursoHumanoNew, TblRecursoHumano.class);
//                        sMigraciones.insertarTodosRecHumBiometrico(jsonRecursoHumanoNew);
//                    }
//                    //////////////////////////////////////FIN Código BIOMÉTRICO//////////////////////////////////////
//                    //////////////////////////////////////Migrar HORARIOS Jornada UNICA//////////////////////////////////////
//                    ArrayList<TblHorarioPersonal> listHorarioPersonal = new ArrayList<TblHorarioPersonal>();
////                    sMigraciones.truncarTodosRecHumBiometrico();
//                    String resultadoHorarioPersonal1 = "{\"respuesta\":" + sMigraciones.listarTodosJornada1() + "}";
//                    resultadoHorarioPersonal1 = resultadoHorarioPersonal1.replaceAll("1970-01-01T", "");
//                    resultadoHorarioPersonal1 = resultadoHorarioPersonal1.replaceAll(":00-05:00", "");
//                    JSONObject jsonHorarioPersonal = new JSONObject(resultadoHorarioPersonal1);
//
//                    JSONArray arrayHorarioPersonal = jsonHorarioPersonal.getJSONArray("respuesta");
//                    String jsonLunes = "";
//                    String jsonMartes = "";
//                    String jsonMiercoles = "";
//                    String jsonJueves = "";
//                    String jsonViernes = "";
//                    String jsonSabado = "";
//                    String jsonDomingo = "";
//                    Integer intLunes = 1;
//                    Integer intMartes = 2;
//                    Integer intMiercoles = 3;
//                    Integer intJueves = 4;
//                    Integer intViernes = 5;
//                    Integer intSabado = 6;
//                    Integer intDomingo = 7;
//                    for (int i = 0; i < arrayHorarioPersonal.length(); i++) {
//                        TblHorarioPersonal objHorarioPersonalNew = new TblHorarioPersonal();
//                        JSONObject childJSONObject = arrayHorarioPersonal.getJSONObject(i);
//                        Jornadauno objMenus = new Gson().fromJson(childJSONObject.toString(), Jornadauno.class);
////                        DATOS DE LUNES
//                        jsonLunes = jsonLunes + "{'tblDias':{'intCodDia':" + intLunes + "},";
//                        jsonLunes = jsonLunes + "'tblHorarioPersonalPK':{'intCodDia':" + intLunes + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(objMenus.getLuHoraEnt()) + ", 'intCodHoraEntradaDescanso':" + 50 + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(objMenus.getLuHoraSal()) + ",'intCodHoraSalidaDescanso':" + 50 + ",'strCiPersonal':'" + objMenus.getCi() + "','strTipoJordana':'1'},";
//                        jsonLunes = jsonLunes + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getLuHoraEnt()) + "},";
//                        jsonLunes = jsonLunes + "'tblHoras1':{'intCodHora':" + 50 + "},";
//                        jsonLunes = jsonLunes + "'tblHoras2':{'intCodHora':" + 50 + "},";
//                        jsonLunes = jsonLunes + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getLuHoraSal()) + "},";
//                        jsonLunes = jsonLunes + "'tblPersonal':{'strCiPersonal':'" + objMenus.getCi() + "'}},";
////                        DATOS DE Martes
//                        jsonMartes = jsonMartes + "{'tblDias':{'intCodDia':" + intMartes + "},";
//                        jsonMartes = jsonMartes + "'tblHorarioPersonalPK':{'intCodDia':" + intMartes + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(objMenus.getMaHoraEnt()) + ", 'intCodHoraEntradaDescanso':" + 50 + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(objMenus.getMaHoraSal()) + ",'intCodHoraSalidaDescanso':" + 50 + ",'strCiPersonal':'" + objMenus.getCi() + "','strTipoJordana':'1'},";
//                        jsonMartes = jsonMartes + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getMaHoraEnt()) + "},";
//                        jsonMartes = jsonMartes + "'tblHoras1':{'intCodHora':" + 50 + "},";
//                        jsonMartes = jsonMartes + "'tblHoras2':{'intCodHora':" + 50 + "},";
//                        jsonMartes = jsonMartes + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getMaHoraSal()) + "},";
//                        jsonMartes = jsonMartes + "'tblPersonal':{'strCiPersonal':'" + objMenus.getCi() + "'}},";
////                        DATOS DE Miercoles
//                        jsonMiercoles = jsonMiercoles + "{'tblDias':{'intCodDia':" + intMiercoles + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHorarioPersonalPK':{'intCodDia':" + intMiercoles + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(objMenus.getMiHoraEnt()) + ", 'intCodHoraEntradaDescanso':" + 50 + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(objMenus.getMiHoraSal()) + ",'intCodHoraSalidaDescanso':" + 50 + ",'strCiPersonal':'" + objMenus.getCi() + "','strTipoJordana':'1'},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getMiHoraEnt()) + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras1':{'intCodHora':" + 50 + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras2':{'intCodHora':" + 50 + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getMiHoraSal()) + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblPersonal':{'strCiPersonal':'" + objMenus.getCi() + "'}},";
////                        DATOS DE JUEVES
//                        jsonJueves = jsonJueves + "{'tblDias':{'intCodDia':" + intJueves + "},";
//                        jsonJueves = jsonJueves + "'tblHorarioPersonalPK':{'intCodDia':" + intJueves + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(objMenus.getJuHoraEnt()) + ", 'intCodHoraEntradaDescanso':" + 50 + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(objMenus.getJuHoraSal()) + ",'intCodHoraSalidaDescanso':" + 50 + ",'strCiPersonal':'" + objMenus.getCi() + "','strTipoJordana':'1'},";
//                        jsonJueves = jsonJueves + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getJuHoraEnt()) + "},";
//                        jsonJueves = jsonJueves + "'tblHoras1':{'intCodHora':" + 50 + "},";
//                        jsonJueves = jsonJueves + "'tblHoras2':{'intCodHora':" + 50 + "},";
//                        jsonJueves = jsonJueves + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getJuHoraSal()) + "},";
//                        jsonJueves = jsonJueves + "'tblPersonal':{'strCiPersonal':'" + objMenus.getCi() + "'}},";
////                        DATOS DE VIERNES
//                        jsonViernes = jsonViernes + "{'tblDias':{'intCodDia':" + intViernes + "},";
//                        jsonViernes = jsonViernes + "'tblHorarioPersonalPK':{'intCodDia':" + intViernes + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(objMenus.getViHoraEnt()) + ", 'intCodHoraEntradaDescanso':" + 50 + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(objMenus.getViHoraSal()) + ",'intCodHoraSalidaDescanso':" + 50 + ",'strCiPersonal':'" + objMenus.getCi() + "','strTipoJordana':'1'},";
//                        jsonViernes = jsonViernes + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getViHoraEnt()) + "},";
//                        jsonViernes = jsonViernes + "'tblHoras1':{'intCodHora':" + 50 + "},";
//                        jsonViernes = jsonViernes + "'tblHoras2':{'intCodHora':" + 50 + "},";
//                        jsonViernes = jsonViernes + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getViHoraSal()) + "},";
//                        jsonViernes = jsonViernes + "'tblPersonal':{'strCiPersonal':'" + objMenus.getCi() + "'}},";
//                        //DATOS DE SABADO
//                        jsonSabado = jsonSabado + "{'tblDias':{'intCodDia':" + intSabado + "},";
//                        jsonSabado = jsonSabado + "'tblHorarioPersonalPK':{'intCodDia':" + intSabado + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(objMenus.getSaHoraEnt()) + ", 'intCodHoraEntradaDescanso':" + 50 + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(objMenus.getSaHoraSal()) + ",'intCodHoraSalidaDescanso':" + 50 + ",'strCiPersonal':'" + objMenus.getCi() + "','strTipoJordana':'1'},";
//                        jsonSabado = jsonSabado + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getSaHoraEnt()) + "},";
//                        jsonSabado = jsonSabado + "'tblHoras1':{'intCodHora':" + 50 + "},";
//                        jsonSabado = jsonSabado + "'tblHoras2':{'intCodHora':" + 50 + "},";
//                        jsonSabado = jsonSabado + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getSaHoraSal()) + "},";
//                        jsonSabado = jsonSabado + "'tblPersonal':{'strCiPersonal':'" + objMenus.getCi() + "'}},";
//                        //DATOS DE DOMINGO
//                        jsonDomingo = jsonDomingo + "{'tblDias':{'intCodDia':" + intDomingo + "},";
//                        jsonDomingo = jsonDomingo + "'tblHorarioPersonalPK':{'intCodDia':" + intDomingo + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(objMenus.getDoHoraEnt()) + ", 'intCodHoraEntradaDescanso':" + 50 + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(objMenus.getDoHoraSal()) + ",'intCodHoraSalidaDescanso':" + 50 + ",'strCiPersonal':'" + objMenus.getCi() + "','strTipoJordana':'1'},";
//                        jsonDomingo = jsonDomingo + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getDoHoraEnt()) + "},";
//                        jsonDomingo = jsonDomingo + "'tblHoras1':{'intCodHora':" + 50 + "},";
//                        jsonDomingo = jsonDomingo + "'tblHoras2':{'intCodHora':" + 50 + "},";
//                        jsonDomingo = jsonDomingo + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(objMenus.getDoHoraSal()) + "},";
//                        jsonDomingo = jsonDomingo + "'tblPersonal':{'strCiPersonal':'" + objMenus.getCi() + "'}},";
//
//                        jsonLunes = jsonLunes.replaceAll("'", "\"");
//                        jsonMartes = jsonMartes.replaceAll("'", "\"");
//                        jsonMiercoles = jsonMiercoles.replaceAll("'", "\"");
//                        jsonJueves = jsonJueves.replaceAll("'", "\"");
//                        jsonViernes = jsonViernes.replaceAll("'", "\"");
//                        jsonSabado = jsonSabado.replaceAll("'", "\"");
//                        jsonDomingo = jsonDomingo.replaceAll("'", "\"");
//                        sMigraciones.insertarTodosJornada1(jsonLunes);
//                        sMigraciones.insertarTodosJornada1(jsonMartes);
//                        sMigraciones.insertarTodosJornada1(jsonMiercoles);
//                        sMigraciones.insertarTodosJornada1(jsonJueves);
//                        sMigraciones.insertarTodosJornada1(jsonViernes);
//                        sMigraciones.insertarTodosJornada1(jsonSabado);
//                        sMigraciones.insertarTodosJornada1(jsonDomingo);
//                        jsonLunes = "";
//                        jsonMartes = "";
//                        jsonMiercoles = "";
//                        jsonJueves = "";
//                        jsonViernes = "";
//                        jsonSabado = "";
//                        jsonDomingo = "";
//                    }
//
//                    //////////////////////////////////////FIN HORARIOS//////////////////////////////////////
//                    //////////////////////////////////////Migrar HORARIOS Jornada Doble//////////////////////////////////////
//                    ArrayList<TblHorarioPersonal> listHorarioPersonalJornada2 = new ArrayList<TblHorarioPersonal>();
////                    sMigraciones.truncarTodosRecHumBiometrico();
//                    String resultadoHorarioPersonalJornada2 = "{\"respuesta\":" + sMigraciones.listarTodosJornada2() + "}";
//                    resultadoHorarioPersonalJornada2 = resultadoHorarioPersonalJornada2.replaceAll("1970-01-01T", "");
//                    resultadoHorarioPersonalJornada2 = resultadoHorarioPersonalJornada2.replaceAll(":00-05:00", "");
//                    resultadoHorarioPersonalJornada2 = resultadoHorarioPersonalJornada2.replaceAll("T00:00", "");
////                    resultadoHorarioPersonalJornada2 = resultadoHorarioPersonalJornada2.replaceAll("\"motChJd\":\"\",", "");
//                    JSONObject jsonHorarioPersonal2 = new JSONObject(resultadoHorarioPersonalJornada2);
//
//                    JSONArray arrayHorarioPersonal2 = jsonHorarioPersonal2.getJSONArray("respuesta");
//
//                    for (int i = 0; i < arrayHorarioPersonal2.length(); i++) {
//                        String luMhoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("luMhoraEntr");
//                        String luMhoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("luMhoraSal");
//                        String luThoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("luThoraEntr");
//                        String luThoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("luThoraSal");
//
//                        String maMhoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("maMhoraEntr");
//                        String maMhoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("maMhoraSal");
//                        String maThoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("maThoraEntr");
//                        String maThoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("maThoraSal");
//
//                        String miMhoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("miMhoraEntr");
//                        String miMhoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("miMhoraSal");
//                        String miThoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("miThoraEntr");
//                        String miThoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("miThoraSal");
//
//                        String juMhoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("juMhoraEntr");
//                        String juMhoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("juMhoraSal");
//                        String juThoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("juThoraEntr");
//                        String juThoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("juThoraSal");
//
//                        String viMhoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("viMhoraEntr");
//                        String viMhoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("viMhoraSal");
//                        String viThoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("viThoraEntr");
//                        String viThoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("viThoraSal");
//
//                        String saMhoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("saMhoraEntr");
//                        String saMhoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("saMhoraSal");
//                        String saThoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("saThoraEntr");
//                        String saThoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("saThoraSal");
//
//                        String doMhoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("doMhoraEntr");
//                        String doMhoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("doMhoraSal");
//                        String doThoraEntr = arrayHorarioPersonal2.getJSONObject(i).getString("doThoraEntr");
//                        String doThoraSal = arrayHorarioPersonal2.getJSONObject(i).getString("doThoraSal");
//                        String ci = arrayHorarioPersonal2.getJSONObject(i).getString("ci");
//
//                        Jornadauno objMenus = new Jornadauno();
////                        DATOS DE LUNES
//                        jsonLunes = jsonLunes + "{'tblDias':{'intCodDia':" + intLunes + "},";
//                        jsonLunes = jsonLunes + "'tblHorarioPersonalPK':{'intCodDia':" + intLunes + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(luMhoraEntr) + ", 'intCodHoraEntradaDescanso':" + objMenus.cambiarHoraxCodigo(luThoraEntr) + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(luThoraSal) + ",'intCodHoraSalidaDescanso':" + objMenus.cambiarHoraxCodigo(luMhoraSal) + ",'strCiPersonal':'" + ci + "','strTipoJordana':'2'},";
//                        jsonLunes = jsonLunes + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(luMhoraEntr) + "},";
//                        jsonLunes = jsonLunes + "'tblHoras1':{'intCodHora':" + objMenus.cambiarHoraxCodigo(luMhoraSal) + "},";
//                        jsonLunes = jsonLunes + "'tblHoras2':{'intCodHora':" + objMenus.cambiarHoraxCodigo(luThoraEntr) + "},";
//                        jsonLunes = jsonLunes + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(luThoraSal) + "},";
//                        jsonLunes = jsonLunes + "'tblPersonal':{'strCiPersonal':'" + ci + "'}},";
////                        DATOS DE Martes
//                        jsonMartes = jsonMartes + "{'tblDias':{'intCodDia':" + intMartes + "},";
//                        jsonMartes = jsonMartes + "'tblHorarioPersonalPK':{'intCodDia':" + intMartes + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(maMhoraEntr) + ", 'intCodHoraEntradaDescanso':" + objMenus.cambiarHoraxCodigo(maThoraEntr) + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(maThoraSal) + ",'intCodHoraSalidaDescanso':" + objMenus.cambiarHoraxCodigo(maMhoraSal) + ",'strCiPersonal':'" + ci + "','strTipoJordana':'2'},";
//                        jsonMartes = jsonMartes + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(maMhoraEntr) + "},";
//                        jsonMartes = jsonMartes + "'tblHoras1':{'intCodHora':" + objMenus.cambiarHoraxCodigo(maMhoraSal) + "},";
//                        jsonMartes = jsonMartes + "'tblHoras2':{'intCodHora':" + objMenus.cambiarHoraxCodigo(maThoraEntr) + "},";
//                        jsonMartes = jsonMartes + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(maMhoraSal) + "},";
//                        jsonMartes = jsonMartes + "'tblPersonal':{'strCiPersonal':'" + ci + "'}},";
////                        DATOS DE Miercoles
//                        jsonMiercoles = jsonMiercoles + "{'tblDias':{'intCodDia':" + intMiercoles + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHorarioPersonalPK':{'intCodDia':" + intMiercoles + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(miMhoraEntr) + ", 'intCodHoraEntradaDescanso':" + objMenus.cambiarHoraxCodigo(miThoraEntr) + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(miThoraSal) + ",'intCodHoraSalidaDescanso':" + objMenus.cambiarHoraxCodigo(miMhoraSal) + ",'strCiPersonal':'" + ci + "','strTipoJordana':'2'},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(miMhoraEntr) + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras1':{'intCodHora':" + objMenus.cambiarHoraxCodigo(miMhoraSal) + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras2':{'intCodHora':" + objMenus.cambiarHoraxCodigo(miThoraEntr) + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(miThoraSal) + "},";
//                        jsonMiercoles = jsonMiercoles + "'tblPersonal':{'strCiPersonal':'" + ci + "'}},";
////                        DATOS DE JUEVES
//                        jsonJueves = jsonJueves + "{'tblDias':{'intCodDia':" + intJueves + "},";
//                        jsonJueves = jsonJueves + "'tblHorarioPersonalPK':{'intCodDia':" + intJueves + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(juMhoraEntr) + ", 'intCodHoraEntradaDescanso':" + objMenus.cambiarHoraxCodigo(juThoraEntr) + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(juThoraSal) + ",'intCodHoraSalidaDescanso':" + objMenus.cambiarHoraxCodigo(juMhoraSal) + ",'strCiPersonal':'" + ci + "','strTipoJordana':'2'},";
//                        jsonJueves = jsonJueves + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(juMhoraEntr) + "},";
//                        jsonJueves = jsonJueves + "'tblHoras1':{'intCodHora':" + objMenus.cambiarHoraxCodigo(juMhoraSal) + "},";
//                        jsonJueves = jsonJueves + "'tblHoras2':{'intCodHora':" + objMenus.cambiarHoraxCodigo(juThoraEntr) + "},";
//                        jsonJueves = jsonJueves + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(juThoraSal) + "},";
//                        jsonJueves = jsonJueves + "'tblPersonal':{'strCiPersonal':'" + ci + "'}},";
//
//                        //                        DATOS DE VIERNES
//                        jsonViernes = jsonViernes + "{'tblDias':{'intCodDia':" + intViernes + "},";
//                        jsonViernes = jsonViernes + "'tblHorarioPersonalPK':{'intCodDia':" + intViernes + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(viMhoraEntr) + ", 'intCodHoraEntradaDescanso':" + objMenus.cambiarHoraxCodigo(viThoraEntr) + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(viThoraSal) + ",'intCodHoraSalidaDescanso':" + objMenus.cambiarHoraxCodigo(viMhoraSal) + ",'strCiPersonal':'" + ci + "','strTipoJordana':'2'},";
//                        jsonViernes = jsonViernes + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(viMhoraEntr) + "},";
//                        jsonViernes = jsonViernes + "'tblHoras1':{'intCodHora':" + objMenus.cambiarHoraxCodigo(viMhoraSal) + "},";
//                        jsonViernes = jsonViernes + "'tblHoras2':{'intCodHora':" + objMenus.cambiarHoraxCodigo(viThoraEntr) + "},";
//                        jsonViernes = jsonViernes + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(viThoraSal) + "},";
//                        jsonViernes = jsonViernes + "'tblPersonal':{'strCiPersonal':'" + ci + "'}},";
//                        //                        DATOS DE SABADO
//                        jsonSabado = jsonSabado + "{'tblDias':{'intCodDia':" + intSabado + "},";
//                        jsonSabado = jsonSabado + "'tblHorarioPersonalPK':{'intCodDia':" + intSabado + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(saMhoraEntr) + ", 'intCodHoraEntradaDescanso':" + objMenus.cambiarHoraxCodigo(saThoraEntr) + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(saThoraSal) + ",'intCodHoraSalidaDescanso':" + objMenus.cambiarHoraxCodigo(saMhoraSal) + ",'strCiPersonal':'" + ci + "','strTipoJordana':'2'},";
//                        jsonSabado = jsonSabado + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(saMhoraEntr) + "},";
//                        jsonSabado = jsonSabado + "'tblHoras1':{'intCodHora':" + objMenus.cambiarHoraxCodigo(saMhoraSal) + "},";
//                        jsonSabado = jsonSabado + "'tblHoras2':{'intCodHora':" + objMenus.cambiarHoraxCodigo(saThoraEntr) + "},";
//                        jsonSabado = jsonSabado + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(saThoraSal) + "},";
//                        jsonSabado = jsonSabado + "'tblPersonal':{'strCiPersonal':'" + ci + "'}},";
//                        //                        DATOS DE DOMINGO
//                        jsonDomingo = jsonDomingo + "{'tblDias':{'intCodDia':" + intDomingo + "},";
//                        jsonDomingo = jsonDomingo + "'tblHorarioPersonalPK':{'intCodDia':" + intDomingo + ",'intCodHoraEntrada':" + objMenus.cambiarHoraxCodigo(doMhoraEntr) + ", 'intCodHoraEntradaDescanso':" + objMenus.cambiarHoraxCodigo(doThoraEntr) + ",'intCodHoraSalida':" + objMenus.cambiarHoraxCodigo(doThoraSal) + ",'intCodHoraSalidaDescanso':" + objMenus.cambiarHoraxCodigo(doMhoraSal) + ",'strCiPersonal':'" + ci + "','strTipoJordana':'2'},";
//                        jsonDomingo = jsonDomingo + "'tblHoras':{'intCodHora':" + objMenus.cambiarHoraxCodigo(doMhoraEntr) + "},";
//                        jsonDomingo = jsonDomingo + "'tblHoras1':{'intCodHora':" + objMenus.cambiarHoraxCodigo(doMhoraSal) + "},";
//                        jsonDomingo = jsonDomingo + "'tblHoras2':{'intCodHora':" + objMenus.cambiarHoraxCodigo(doThoraEntr) + "},";
//                        jsonDomingo = jsonDomingo + "'tblHoras3':{'intCodHora':" + objMenus.cambiarHoraxCodigo(doThoraSal) + "},";
//                        jsonDomingo = jsonDomingo + "'tblPersonal':{'strCiPersonal':'" + ci + "'}},";
//
//                        jsonLunes = jsonLunes.replaceAll("'", "\"");
//                        jsonMartes = jsonMartes.replaceAll("'", "\"");
//                        jsonMiercoles = jsonMiercoles.replaceAll("'", "\"");
//                        jsonJueves = jsonJueves.replaceAll("'", "\"");
//                        jsonViernes = jsonViernes.replaceAll("'", "\"");
//                        jsonSabado = jsonSabado.replaceAll("'", "\"");
//                        jsonDomingo = jsonDomingo.replaceAll("'", "\"");
//                        sMigraciones.insertarTodosJornada1(jsonLunes);
//                        sMigraciones.insertarTodosJornada1(jsonMartes);
//                        sMigraciones.insertarTodosJornada1(jsonMiercoles);
//                        sMigraciones.insertarTodosJornada1(jsonJueves);
//                        sMigraciones.insertarTodosJornada1(jsonViernes);
//                        sMigraciones.insertarTodosJornada1(jsonSabado);
//                        sMigraciones.insertarTodosJornada1(jsonDomingo);
//                        jsonLunes = "";
//                        jsonMartes = "";
//                        jsonMiercoles = "";
//                        jsonJueves = "";
//                        jsonViernes = "";
//                        jsonSabado = "";
//                        jsonDomingo = "";
                }
                //////////////////////////////////////FIN HORARIOS//////////////////////////////////////
            } catch (Exception ex) {
                System.out.print("problema:c " + ex);
                String aa = "fff" + ex;

            }

        }

    } else if (strOpc.equals("extra")) {///plantilla para añadir mas 

    } else {
        response.sendRedirect("index.jsp");
    }
%>