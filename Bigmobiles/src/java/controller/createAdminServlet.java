/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.AdminFacadeLocal;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Admin;

/**
 *
 * @author congm
 */
@MultipartConfig
public class createAdminServlet extends HttpServlet {

    @EJB
    private AdminFacadeLocal adminFacade;

    private static final long serialVersionUID = 1L;
    private String path = "";

    public static final String SAVE_DIRECTORY = "uploadDir";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            path = uploadFile(request);
            LocalDate createdate = LocalDate.now();
            if (adminFacade.aa(email) == true) {
                Admin ad = new Admin();
                ad.setEmail(email);
                ad.setPassword(password);
                ad.setFullname(fullname);
                ad.setAvatar(path);
                ad.setCreatedDate(createdate.toString());
                ad.setAdminState(true);
                adminFacade.create(ad);
                request.getRequestDispatcher("ShowAdminServlet").forward(request, response);
            } else {
                request.setAttribute("mess", "Email đã tồn tại, vui lòng nhập email khác");
                request.getRequestDispatcher("createAdmin.jsp").forward(request, response);
            }
        }

    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file");
            fileName = (String) getFileName(filePart);
            String basePath = getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator;

            File uploadDir = new File(basePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            InputStream inputStream = null;
            OutputStream outputStream = null;
            filePath = getServletContext().getContextPath() + SAVE_DIRECTORY + "\\" + fileName;
            try {

                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                return clientFileName.substring(i + 1);
            }
        }
        return null;
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
        processRequest(request, response);
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
        processRequest(request, response);
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
