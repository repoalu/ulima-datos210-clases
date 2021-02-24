/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ulima.ingdat.proyecto;

import edu.ulima.ingdat.proyecto.bean.Empleado;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JC
 */
public class PruebaSelect {
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
    
    public static List<Empleado> obtenerEmpleados() throws Exception{
        ArrayList<Empleado> listaEmpleados = new ArrayList<>();        
        Connection conn = DriverManager.getConnection(url, usuario, password);
        String sql = "SELECT * FROM CLIENTE";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            String nombre = rs.getString("FIRST_NAME");
            String apellido = rs.getString("LAST_NAME");
            Float salario = rs.getFloat("SALARY");
            Empleado emp = new Empleado(nombre, apellido, salario);
            listaEmpleados.add(emp);
        }
        rs.close();
        pst.close();
        conn.close();
        return listaEmpleados;
    }
    public static void main(String[] args) throws Exception{
        List<Empleado> empleados = obtenerEmpleados();
        System.out.println(empleados);
    }
    /*
        Referencia adicional: https://www.javatpoint.com/ResultSet-interface
    */
}
