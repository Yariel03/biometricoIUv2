/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import java.io.IOException;
import org.json.JSONException;
import utils.Constantes;
import static utils.Util_Servios.getServicios;
import static utils.Util_Servios.postServicios;

/**
 *
 * @author YARIEL
 */
public class sMigraciones {

    //<editor-fold defaultstate="collapsed" desc="Migrar Personal">

    public static String listarTodosPersonal() throws JSONException, IOException {
        String strJson = "";
        strJson = getServicios(Constantes.PREFIJO_MIGRAR, Constantes.IP_MIGRAR, Constantes.SERVICIO_trabajador, "/wsPersonal/trabajador", Constantes.SERVIDORP,2);
        return strJson;
    }

    //</editor-fold>
    
     //<editor-fold defaultstate="collapsed" desc="Ingresar Personal">

    public static String ingresarPersonal( String Json) throws JSONException, IOException {
        String strJson = postServicios(Json, Constantes.PREFIJO, Constantes.IP, Constantes.SERVICIO_biometricoV2 , "/biometricoWs/funcionarios", 1,2);
        return strJson;
    }

    //</editor-fold>
    
    
      
    
}
