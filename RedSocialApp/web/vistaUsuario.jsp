<%-- 
    Document   : menu.jsp
    Created on : 14-nov-2017, 14:47:37
    Author     : pgonzalez
--%>

<%@page import="model.ComentarioMostrar"%>
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
                    <a class="navbar-brand" href="menu.jsp">AnonyComm</a>
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
                <div class="col-sm-4">
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        Usuario user = d.getUsuario(id);
                    %>
                    Nombre          : <%=user.getNombre() +" "+ user.getApellido()%><br>
                    Cumpleaños      : <%=user.getFecha_Nacimiento()%>
                    <a href="seguidores.do?id=<%=user.getId()%>">Seguir</a>
                    <a href="seguidores.do?id=<%=user.getId()%>">Dejar De Seguir</a>
                    
                </div>
                
                <div class="col-sm-4" algin="center">
                    <table class="table">
                        <form action ="publicar.do" method="POST">
                        <tr>
                        </tr>
                        </form>
                            <%
                                if (d.getPost(user.getId())!= null) {
                                    int aux;
                                    for(Post p : d.getPost(user.getId())){
                                        aux = p.getId();
                                    //out.print("<tr class='info'>");
                                    //out.print("<td>");
                                        //out.print(p.getPost()+"<hr size='40'>");
                                        //out.print("Fecha Publicación: "+p.getFecha());
                                    //out.print("</td>");
                                    //out.print("</tr>");
                                    out.print("<tr>");
                                    out.print("<td>");
                                    out.print("<div class='panel panel-primary'>");
                                        out.print("<div class='panel-heading'> </div>");
                                            out.print("<div class='panel-body'>");
                                                out.print(p.getPost());
                                            out.print("</div>");
                                        out.print("<div class='panel-footer'>Fecha Publicación: "+p.getFecha()+"</div>");
                                        for (ComentarioMostrar c : d.getComentarioMostrar(aux)) {
                                                    out.print("<div class='panel-footer'>Comentario: " + c.getComentario() + " </br> Fecha Publicación: " + c.getFecha() + "</div>");
                                            }
                                       %>
                                       <form action ="PublicarComentario.do" method="POST">
                                           <tr>
                                               <th><textarea rows="4" cols="48" name="txtComentario" required></textarea>
                                                   <input type="hidden" value="<%=p.getId()%>" name="idComentario">
                                                   <input type="hidden" value="1" name="url">
                                                   <input type="hidden" value="<%=id%>" name="idVista">
                                                   <input type="submit" value="Publicar">
                                               </th>
                                           </tr>
                                       </form>
                                   <%
                                    out.print("</div>");
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                                
                                }else{
                                    response.sendRedirect("menu.jsp?accion=userNoTienePost");
                                }
                                
                            %>
                    </table>
                    
                </div>
                
                    <div class="col-sm-4" align="right">
                        <input type="text" placeholder="Buscar" id="txtBuscar" onkeyup="buscar()">
                        <div id="resultado"></div>
                        
                    </div>
            </div>
        </div>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script>
        function buscar(){
            // lo que el usuario escribió
            var txtFiltro = $("#txtBuscar").val();

            $.ajax({
                url: "buscar.do",
                data: {
                  filtro: txtFiltro
                },
                success: function( result ) {
                  $( "#resultado" ).html(result);
                }
              });
        }
    </script>
    </body>
</html>
