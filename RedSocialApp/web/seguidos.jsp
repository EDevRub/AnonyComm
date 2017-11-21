<%-- 
    Document   : menu.jsp
    Created on : 14-nov-2017, 14:47:37
    Author     : pgonzalez
--%>

<%@page import="model.Post"%>
<%@page import="model.Data"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Inicio AppSocial</title>
    </head>
    <body>
        <style>
            textarea {
                resize: none;
            }
        </style>
        
        <%
            Data d = new Data();
        Usuario u = (Usuario) session.getAttribute("usuario");
        if(u == null){
            response.sendRedirect("menu.jsp");
        }else{
            
        }
        %>
        
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="menu.jsp">RedSocialApp</a>
                </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="menu.jsp"> <%=u.getNombre()+" "+u.getApellido()%> </a></li>
                <li><a href="seguidores.jsp">Seguidores</a></li>
                <li><a href="seguidos.jsp">Seguidos</a></li>
                <li><a href="cerrarSesion.do">Cerrar Sesión</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    
                </div>
                </form>
            </div>
        </nav>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4" algin="center">
                    <table class="table">
                        <tr>
                            <th>Usuarios Seguidos</th>
                        </tr>
                        <%
                                for(Usuario us : d.getUusarioSeguido(u.getId())){
                                    out.print("<tr>");
                                    out.print("<td>"+us.getNombre()+" "+us.getApellido()+"</td>");
                                    out.print("</tr>");
                                }
                            %>
                    </table>
                    
                </div>
                <div class="col-sm-4" align="right"></div>
            </div>
        </div>
    </body>
</html>
