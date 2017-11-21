<%-- 
    Document   : menu.jsp
    Created on : 14-nov-2017, 14:47:37
    Author     : pgonzalez
--%>

<%@page import="model.ComentarioMostrar"%>
<%@page import="model.UsuarioPost"%>
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
        Usuario u = (Usuario) session.getAttribute("usuario");
        if(u == null){
            response.sendRedirect("error.jsp");
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
                <li><a href="menuInicio.jsp">Inicio</a></li>
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
                <div class="col-sm-4">
                </div>
                
                <div class="col-sm-4" algin="center">
                    <table class="table">
                        <form action ="publicar.do" method="POST">
                        <tr>
                        </tr>
                        </form>
                            <%
                                Data d = new Data();
                                int aux;
                                for(UsuarioPost up : d.getPostInicio(u.getId())){
                                    aux = up.getIdPost();
                                    out.print("<tr>");
                                    out.print("<td>");
                                    out.print("<div class='panel panel-primary'>");
                                        out.print("<div class='panel-heading'>"+up.getNombre()+" "+up.getApellido()+"</div>");
                                            out.print("<div class='panel-body'>");
                                                out.print(up.getPost());
                                            out.print("</div>");
                                        out.print("<div class='panel-footer'>Fecha Publicación: "+up.getFecha()+"</div>");
                                        for (ComentarioMostrar c : d.getComentarioMostrar(aux)) {
                                                    out.print("<div class='panel-footer'>Comentario: " + c.getComentario() + " </br> Fecha Publicación: " + c.getFecha() + "</div>");
                                            }
                                       %>
                                       <form action ="PublicarComentario.do" method="POST">
                                           <tr>
                                               <th><textarea rows="4" cols="48" name="txtComentario" required></textarea>
                                                   <input type="hidden" value="<%=up.getIdPost()%>" name="idComentario">
                                                   <input type="hidden" value="2" name="url">
                                                   <input type="hidden" value="2" name="idVista">
                                                   <input type="submit" value="Publicar">
                                               </th>
                                           </tr>
                                       </form>
                                   <%
                                        
                                    out.print("</div>");
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
