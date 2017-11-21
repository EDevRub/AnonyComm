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

    public Usuario getUsuario(String user, String pass) throws SQLException {
        query = "SELECT * FROM usuario WHERE correo = '" + user + "' AND pass = '" + pass + "';";

        rs = con.ejecutarSelect(query);

        Usuario u = null;
        if (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt(1));
            u.setCorreo(rs.getString(2));
            u.setNombre(rs.getString(3));
            u.setApellido(rs.getString(4));
            u.setFecha_Nacimiento(rs.getString(5));
            u.setSexo(rs.getInt(6));
            // u.setPass(rs.getString(7));
        }
        con.desconectar();
        return u;
    }

    public List<Post> getPost(int id) throws SQLException {
        List<Post> lista = new ArrayList<>();
        query = "SELECT * FROM post WHERE id_usuario = " + id + " order by fecha desc";

        rs = con.ejecutarSelect(query);

        Post p;

        while (rs.next()) {
            p = new Post();
            p.setId(rs.getInt(1));
            p.setId_usuario(rs.getInt(2));
            p.setPost(rs.getString(3));
            p.setFecha(rs.getString(4));
            lista.add(p);
        }
        con.desconectar();
        return lista;
    }

    public void publicarPost(Post p) throws SQLException {
        query = "INSERT INTO post VALUES(NULL,'" + p.getId_usuario() + "','" + p.getPost() + "',NOW());";
        con.ejecutar(query);
    }

    public List<Sexo> getSexo() throws SQLException {
        List<Sexo> lista = new ArrayList<>();
        query = "select * from sexo;";

        rs = con.ejecutarSelect(query);

        Sexo s;
        while (rs.next()) {
            s = new Sexo();
            s.setId(rs.getInt(1));
            s.setDescripcion(rs.getString(2));
            lista.add(s);
        }
        con.desconectar();
        return lista;
    }

    public void registrarUsuario(Usuario u) throws SQLException {
        query = "INSERT INTO usuario VALUES(NULL,'" + u.getCorreo() + "','" + u.getNombre() + "','" + u.getApellido() + "','" + u.getFecha_Nacimiento() + "','" + u.getSexo() + "','" + u.getPass() + "','nn');";
        con.ejecutar(query);
    }

    public List<Usuario> getUusario(String filtro) throws SQLException {
        List<Usuario> lista = new ArrayList<>();
        query = "select * from usuario where nombre like '%" + filtro + "%' or apellido like '%" + filtro + "%' limit 10; ";
        rs = con.ejecutarSelect(query);

        Usuario u;

        while (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt(1));
            u.setCorreo(rs.getString(2));
            u.setNombre(rs.getString(3));
            u.setApellido(rs.getString(4));
            u.setFecha_Nacimiento(rs.getString(5));
            u.setSexo(rs.getInt(6));
            // u.setPass(rs.getString(7));
            lista.add(u);
        }
        con.desconectar();
        return lista;
    }

    public Usuario getUsuario(int id) throws SQLException {
        query = "SELECT * FROM usuario WHERE id = '" + id + "';";

        rs = con.ejecutarSelect(query);

        Usuario u = null;
        if (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt(1));
            u.setCorreo(rs.getString(2));
            u.setNombre(rs.getString(3));
            u.setApellido(rs.getString(4));
            u.setFecha_Nacimiento(rs.getString(5));
            u.setSexo(rs.getInt(6));
            // u.setPass(rs.getString(7));
        }
        con.desconectar();
        return u;
    }

    public void seguir(int seguidor, int seguido) throws SQLException {
        query = "insert into seguidor values(null,'" + seguidor + "','" + seguido + "');";
        con.ejecutar(query);
    }

    public List<Usuario> getUusarioSeguido(int id) throws SQLException {
        List<Usuario> lista = new ArrayList<>();
        query = "SELECT usuario.nombre,usuario.apellido FROM usuario INNER JOIN seguidor ON usuario.id = seguidor.id_seguido WHERE seguidor.id_seguidor = " + id;
        rs = con.ejecutarSelect(query);

        Usuario u;

        while (rs.next()) {
            u = new Usuario();
            u.setNombre(rs.getString(1));
            u.setApellido(rs.getString(2));
            lista.add(u);
        }
        con.desconectar();
        return lista;
    }

    public List<Usuario> getUusarioSeguidores(int id) throws SQLException {
        List<Usuario> lista = new ArrayList<>();
        query = "SELECT usuario.nombre,usuario.apellido FROM usuario INNER JOIN seguidor ON usuario.id = seguidor.id_seguidor WHERE seguidor.id_seguido = " + id;
        rs = con.ejecutarSelect(query);

        Usuario u;

        while (rs.next()) {
            u = new Usuario();
            u.setNombre(rs.getString(1));
            u.setApellido(rs.getString(2));
            lista.add(u);
        }
        con.desconectar();
        return lista;
    }

    public List<UsuarioPost> getPostInicio(int id_usuario) throws SQLException {
        List<UsuarioPost> lista = new ArrayList<>();
        query ="SELECT usuario.nombre,usuario.apellido,post.post,post.fecha,post.id FROM post INNER JOIN seguidor ON post.id_usuario = seguidor.id_seguido INNER JOIN usuario ON usuario.id = seguidor.id_seguido WHERE seguidor.id_seguidor = "+id_usuario+" ORDER BY fecha desc";
        
        rs = con.ejecutarSelect(query);

        UsuarioPost up;

        while (rs.next()) {
            up = new UsuarioPost();
            up.setNombre(rs.getString(1));
            up.setApellido(rs.getString(2));
            up.setPost(rs.getString(3));
            up.setFecha(rs.getString(4));
            up.setIdPost(rs.getInt(5));
            lista.add(up);
        }
        con.desconectar();
        return lista;
    }

    public Usuario getUsuario(String filtro) throws SQLException {
        query = "SELECT usuario.correo FROM usuario WHERE correo = '" + filtro + "'";
        rs = con.ejecutarSelect(query);

        Usuario u = null;
        if (rs.next()) {
            u = new Usuario();
            u.setCorreo(rs.getString(1));
        }
        con.desconectar();
        return u;
    }
    
      public List<ComentarioMostrar> getComentarioMostrar(int id_comentario) throws SQLException{
        List<ComentarioMostrar> lista = new ArrayList<>();
        query="select comentario.comentario, comentario.fecha from comentario where id_post = "+id_comentario+"";
        rs = con.ejecutarSelect(query);
        
        ComentarioMostrar com;
        
        while(rs.next()){
            com = new ComentarioMostrar();
            com.setComentario(rs.getString(1));
            com.setFecha(rs.getString(2));
            
            lista.add(com);
        }
        
        con.desconectar();
        return lista;
                
    }
      
          public void publicarComentario(Comentario c) throws SQLException{
        query = "insert into comentario values(null,'"+c.getId_post()+"','"+c.getComentario()+"',now());";
        con.ejecutar(query);
    }
}
