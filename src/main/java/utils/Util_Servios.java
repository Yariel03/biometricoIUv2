/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

/**
 *
 * @author YARIEL
 */
public class Util_Servios {

    public static String getServicios(String prefijoh, String ip, String servicio, String consumir, int servidor, int bandera) {
        String strJson = "";
        try {
            URL url = new URL(prefijoh + ip + "/" + servicio + consumir);
            if (servidor == 1) {//http
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.setDoOutput(true);
                connection.setDoInput(true);
                InputStream content = (InputStream) connection.getInputStream();
                if (bandera == 1) {//cuando vienen con tildes ñ se debe usar ISO
                    BufferedReader in = new BufferedReader(new InputStreamReader(content, "ISO-8859-1"));
                    String line;
                    while ((line = in.readLine()) != null) {
                        strJson = line;
                    }
                    connection.disconnect();

                } else {//cuando viene con carácteres especiales se debe usar UTF-8
                    BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
                    String line;
                    while ((line = in.readLine()) != null) {
                        strJson = line;
                    }
                    connection.disconnect();
                }

            } else {//https
                HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.setDoOutput(true);
                connection.setDoInput(true);
                InputStream content = (InputStream) connection.getInputStream();
                if (bandera == 1) {//cuando vienen con tildes ñ se debe usar ISO
                    BufferedReader in = new BufferedReader(new InputStreamReader(content, "ISO-8859-1"));
                    String line;
                    while ((line = in.readLine()) != null) {
                        strJson = line;
                    }
                    connection.disconnect();

                } else {//cuando viene con carácteres especiales se debe usar UTF-8
                    BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
                    String line;
                    while ((line = in.readLine()) != null) {
                        strJson = line;
                    }
                    connection.disconnect();
                }
            }

        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallo GET: " + ex);
            strJson = "";
        }
        return strJson;
    }

    public static String postServicios(String json, String prefijo, String ip, String servicio, String consumir, Integer bandera) {
        String strJson = "";
        try {
            URL url = new URL(prefijo + ip + "/" + servicio + consumir);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            if (bandera == 1) {//cuando vienen con tildes ñ se debe usar ISO
                connection.setRequestProperty("Content-Type", "application/json;charset=ISO-8859-1");

            } else {//cuando viene con carácteres especiales se debe usar UTF-8
                connection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            }
            connection.setRequestProperty("Accept", "application/json");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream())) {
//                json=json;
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJson = in.readLine();
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallo POST: " + ex);
            strJson = "";
        }
        return strJson;
    }

    public static String putServicios(String json, String prefijo, String ip, String servicio, String consumir) {

        String status = "";
        String strJsonResponse = "";
        try {
            URL url = new URL(prefijo + ip + "/" + servicio + consumir);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("PUT");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "ISO-8859-1")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (NumberFormatException | IOException e) {
            System.out.println("Fallo metodo PUT: " + e);
        }
        return strJsonResponse;
    }
}
