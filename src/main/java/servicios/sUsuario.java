/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import utils.Constantes;
import static utils.Util_Servios.getServicios;

/**
 *
 * @author Cristhian
 */
public class sUsuario {
    public static String permisoUsuario(String cedula) {
        String strJson = "";
        strJson = getServicios(Constantes.PREFIJO, Constantes.IP, Constantes.SERVICIO_biometricoV2, "/biometricoWs/usuario/" + cedula,Constantes.SERVIDORP,2);//1 ñ   2UTF-8
        return strJson;
    }
}
