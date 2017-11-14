/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author nahumada
 */
@WebServlet(name = "MostarServlet", urlPatterns = {"/Mostrar.do"})
public class MostarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nombre, correo, imagen;
            nombre = request.getParameter("nombre");
            correo = request.getParameter("correo");
            imagen = request.getParameter("imagen");
            /**/
            FileItemFactory file_factory = new DiskFileItemFactory();

            /*ServletFileUpload esta clase convierte los input file a FileItem*/
            ServletFileUpload servlet_up = new ServletFileUpload(file_factory);

            File miDir = new File(".");
//        /*
//        /*sacando los FileItem del ServletFileUpload en una lista */
//        List items =null;//= servlet_up.parseRequest();
// 
//        for(int i=0;i<items.size();i++){
//            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
//            FileItem item = (FileItem) items.get(i);
//            /*item.isFormField() false=input file; true=text field*/
//            if (! item.isFormField()){
//                /*cual sera la ruta al archivo en el servidor*/
//                File archivo_server = new File("+item.getName());
//                /*y lo escribimos en el servido*/
//                item.write(archivo_server);
//                out.print("Nombre --> " + item.getName() );
//                out.print("<br> Tipo --> " + item.getContentType());
//                out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
//                out.print("<br>");
//            }
//        }

            /**/
            String path = new java.io.File(".").getCanonicalPath();

            String path2 = System.getProperty("user.dir");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MostarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MostarServlet at " + request.getContextPath() + "</h1>");
            out.println("<h1>nombre :" + nombre + "</h1>");
            out.println("<h1>correo :" + correo + "</h1>");
            out.println("<h1>imagen :" + imagen + "</h1>");
            out.println("<h1>imagen :" + miDir.getAbsolutePath() + "</h1>");
            out.println("<h1>path 1 :" +path+ "</h1>");
            out.println("<h1>path 2 :" + path2+ "</h1>");
            out.println("<h1><a href='index.jsp'>Volver</a></h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MostarServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MostarServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
