package model;

import bd.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Data {
    private Conexion con;
    private ResultSet rs;
    private String query;

    public Data() throws SQLException, ClassNotFoundException {
        con = new Conexion(
                "localhost",
                "bd_RedSocial",//nombre BD
                "root",
                ""//Password
        );
    }
    
    public Usuario getUsuario(String user, String pass) throws SQLException{
        query ="SELECT * FROM usuario WHERE nombre_Usuario = '"+user+"' AND pass = '"+pass+"';";
        
        rs = con.ejecutarSelect(query);
        
        Usuario u = null;
        if (rs.next()) {
            u = new Usuario();
            u.setCorreo(rs.getString(1));
            u.setNombre(rs.getString(2));
            u.setApellido(rs.getString(3));
            u.setFecha_Nacimiento(rs.getString(4));
            u.setSexo(rs.getInt(5));
           // u.setPass(rs.getString(7));
        }
        return u;
    }
}
