<%-- 
    Document   : registrar_usuario
    Created on : 14-nov-2017, 18:34:51
    Author     : erubio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Usuario</title>
    </head>
    <body>
        <h1>Registro De Usuario</h1>
        
        <input type="text" name="txtNom" placeholder="Nombre: " required=""><br>
        <input type="text" name="txtCorreo" placeholder="Correo: " required=""><br>
        <input type="text" name="txtApell" placeholder="Apellido: " required=""><br>
        <input type="text" name="txtFechaNacimiento" placeholder="Fecha Nacimiento: " required=""><br>
        <select name="cboSexo">
            <option>M</option>
        </select><br>
        <input type="Password" name="txtPass" placeholder="Contraseña: "><br>
        <input type="submit" value="Registrar">
        
    </body>
</html>
