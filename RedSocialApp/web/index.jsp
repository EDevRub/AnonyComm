<%-- 
    Document   : index
    Created on : 14-nov-2017, 12:08:22
    Author     : erubio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Sesion</title>
    </head>
    <body>
        <h1>Inicio Sesion</h1>
        <form action="validar.do" method="POST" role="form">
            <input type="text" class="form-control" name="txtUsuario" placeholder="Ingrese Usuario:">
            <input type="password" class="form-control" name="txtPass" placeholder="Ingrese Contraseña:">
            <input type="submit" value="Iniciar Sesión" align="center" class="btn btn-cod btn-lg btn-block">
        </form>
    </body>
</html>
