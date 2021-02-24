/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ulima.ingdat.proyecto;

import edu.ulima.ingdat.proyecto.bean.Producto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


/**
 *
 * @author JC
 */
public class PruebaInsert {
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
    
    public static void registrarProducto(Producto prod) throws Exception{
        Connection conn = DriverManager.getConnection(url, usuario, password);
        String sql = "INSERT INTO PRODUCTO1 VALUES(?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, prod.getCodigo());
        pst.setString(2, prod.getNombre());
        pst.setFloat(3, prod.getPrecioUnitario());
        pst.executeUpdate();
        pst.close();
        conn.close();
    }    

    public static void main(String[] args) throws Exception{
        Producto p1 = new Producto(800, "Teclado Inalambrico u88", 60.75f);
        Producto p2 = new Producto(900, "Teclado Inalambrico u88", 60.75f);
        registrarProducto(p1);
        registrarProducto(p2);
        System.out.println("Producto registrado correctamente");
    }
}