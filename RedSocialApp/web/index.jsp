<%-- 
    Document   : index
    Created on : 14-nov-2017, 12:08:22
    Author     : erubio
--%>

<%@page import="model.Sexo"%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Esto es del calendario JQUERY -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Esto es del calendario JQUERY -->

        <script>
            $(function () {
                $("#fechaNacimiento").datepicker();
                $("#fechaNacimiento").datepicker({
                    dateFormat: "yy-mm-dd"
                });

                // Getter
                var dateFormat = $("#fechaNacimiento").datepicker("option", "dateFormat");

                // Setter
                $("#fechaNacimiento").datepicker("option", "dateFormat", "yy-MM-dd");
            });
        </script>

        <script>
            // español
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '<Ant',
                nextText: 'Sig>',
                currentText: 'Hoy',
                monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: '',
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0"
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

        </script>

        <title>Inicio Sesion</title>
    </head>
    <body>
        <nav class="navbar navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">RedSocialApp Inicio De Sesión</a>
                </div>
                <ul class="nav navbar-nav">
                </ul>
                <form class="navbar-form navbar-right" action="validar.do" method="POST">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtUsuario" placeholder="Ingrese Correo:" required="">
                        <input type="password" class="form-control" name="txtPass" placeholder="Ingrese Contraseña:" required="">
                    </div>
                    <input type="submit" value="Iniciar Sesión" class="btn btn-default">
                </form>
            </div>
            <%
                if (request.getParameter("m") != null) {
                    int m = Integer.parseInt(request.getParameter("m"));
                    switch (m) {
                        case 2:
                            out.println("<div class='alert alert-danger'>ERROR al iniciar Sesion verifique datos</div>");
                            break;
                    }
                }
            %>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <h1>Registro De Usuario</h1>

                    <form action="registrar.do" method="POST">

                        <%
                            if (request.getParameter("m") != null) {
                                int m = Integer.parseInt(request.getParameter("m"));
                                switch (m) {
                                    case 1:
                                        out.println("<div class='alert alert-success'>Usuario creado con exito</div>");
                                        break;
                                    case 3:
                                        out.println("<div class='alert alert-danger'>Correo Ya Registrado</div>");
                                }
                            }
                        %>

                        <div class="form-group">
                            <input type="text" name="txtNom" placeholder="Nombre: " required="" class="form-control">
                        </div>

                        <div class="form-group">
                            <input type="text" name="txtApell" placeholder="Apellido: " required="" class="form-control">
                        </div>

                        <div class="form-group">
                            <input class="form-control" id="fechaNacimiento" name="txtFechaNacimineto" readonly="" required="">
                        </div>

                        <div class="form-group">
                            <select name="cboSexo" class="form-control">
                                <%
                                    Data d = new Data();
                                    for (Sexo s : d.getSexo()) {
                                        out.print("<option value=" + s.getId() + ">" + s.getDescripcion() + "</option>");
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <input type="email" name="txtCorreo" placeholder="Correo: " required="" class="form-control">
                        </div>

                        <div class="form-group">
                            <input type="Password" name="txtPass" placeholder="Contraseña: " class="form-control">
                        </div>

                        <input type="submit" value="Registrar" class="btn btn-primary">
                    </form>
                </div>
            </div>
            <div class="col-sm-4" algin="center"></div>
            <div class="col-sm-4"></div>
        </div>
    </body>
</html>
