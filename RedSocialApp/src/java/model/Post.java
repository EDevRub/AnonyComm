package model;

import java.text.DateFormat;

/**
 *
 * @author erubio
 */
public class Post {
    
    private int id;
    private int id_usuario;
    private String post;
    private DateFormat fecha;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public DateFormat getFecha() {
        return fecha;
    }

    public void setFecha(DateFormat fecha) {
        this.fecha = fecha;
    }
    
    
}
