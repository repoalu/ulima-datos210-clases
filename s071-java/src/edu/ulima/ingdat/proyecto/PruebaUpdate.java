/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ulima.ingdat.proyecto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author JC
 */
public class PruebaUpdate {
    //Para conexiones locales el URL no deberia cambiar.
    //Observen que el ultimo nombre que utilizan es el SID que configuran en SQL Developer
    //(podria ser tambien orclcdb)
    //public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
    
    public static String url = "jdbc:oracle:thin:@129.151.103.165:1521/"
            + "pdbulima.subnetpublica01.vncriccio.oraclevcn.com";
    //Nombre de usuario para la conexion
    public static String usuario = "<su_usuario>";
    //Contrasenia para conectarse
    public static String password = "PeruLima__2020";
    
    
    public static void actualizarPrecio(int codigoProducto, float precio) throws Exception{
        Connection conn = DriverManager.getConnection(url, usuario, password);
        String sql = "UPDATE PRODUCTO1 SET PRECIO_UNITARIO = ? WHERE CODIGO = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setFloat(1, precio);
        pst.setInt(2, codigoProducto);        
        pst.executeUpdate();
        pst.close();
        conn.close();
    }
    
    public static void main(String[] args) throws Exception{
        int codigoProducto = 400;
        float precio = 21.55f;
        actualizarPrecio(codigoProducto, precio);
        System.out.println("Precio actualizado correctamente");
    }
}
