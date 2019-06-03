/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.CategoryFacadeLocal;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Category;

@MultipartConfig
public class InsertCategoryServlet extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    private static final long serialVersionUID = 1L;
    private String path = "";
    public static final String SAVE_DIRECTORY = "uploadDir";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = "";
            Integer numIdentity = Integer.valueOf(this.categoryFacade.count() + 1);
            switch (numIdentity.toString().length()) {
                case 1:
                    id = "CA00" + numIdentity;
                    break;
                case 2:
                    id = "CA0" + numIdentity;
                    break;
                case 3:
                    id = "CA" + numIdentity;
                    break;
            }
            String name = request.getParameter("name");

            path = uploadFile(request);

            Category cate = new Category(id, name, path, Boolean.TRUE);
            categoryFacade.create(cate);
            request.getRequestDispatcher("adminViewDashBoard").forward(request, response);

        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file1");
            // fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            fileName = (String) getFileName(filePart);
            String basePath = getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator;
            //String warFile = basePath.substring(0, basePath.length() - 74) + "\\DKHK4\\Web Pahes\\images" + File.separator + SAVE_DIRECTORY + File.separator;

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
//                request.setAttribute("msg", SAVE_DIRECTORY + "/" + fileName);
//                request.setAttribute("message",
//                        "Upload has been done successfully >>" + SAVE_DIRECTORY + "/" + fileName);
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
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
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
