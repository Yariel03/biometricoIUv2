/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import javax.net.ssl.HttpsURLConnection;
import java.net.URL;
import org.json.JSONException;
import utils.Constantes;
import static utils.Util_Servios.getServicios;
import static utils.Util_Servios.postServicios;

public class sFuncionario {
    public static String funcionarioactivo(String codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO_MIGRAR + Constantes.IP_MIGRAR + "/" + Constantes.SERVICIO_empleado + "/wstthh/Funcionario/" + codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort" + ex);
        }
        return strJson;
    }
}
