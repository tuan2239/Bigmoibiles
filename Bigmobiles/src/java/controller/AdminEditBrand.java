/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.BrandFacadeLocal;
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
import model.Brand;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
public class AdminEditBrand extends HttpServlet {
@EJB
    private BrandFacadeLocal brandFacade;

    private static final long serialVersionUID = 1L;
    private String path = "";
    public static final String SAVE_DIRECTORY = "uploadDir";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            
            String name = request.getParameter("name");
            path = uploadFile(request);
            String logo = path;
//            boolean status;
//            if ("mo".equals(request.getParameter("status"))) {
//                status = true;
//            } else {
//                status = false;
//            }
            Brand brand = brandFacade.find(id);
              brand.setBrandID(id);
            brand.setBrandName(name);

            if (!logo.equalsIgnoreCase("nochange")) {
                brand.setBrandImages(logo);
            }
          
            brand.setBrandState(brand.getBrandState());
            brandFacade.edit(brand);
            request.setAttribute("message", logo);
            request.getRequestDispatcher("AdminShowBrand").forward(request, response);

            if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file1");
            // fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            fileName = (String) getFileName(filePart);
            if (fileName.length() == 0) {
                return "nochange";
            }
            String basePath = getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY + File.separator;
            //String warFile = basePath.substring(0, basePath.length() - 74) + "\\DKHK4\\Web Pahes\\images" + File.separator + SAVE_DIRECTORY + File.separator;

            File uploadDir = new File(basePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            InputStream inputStream = null;
            OutputStream outputStream = null;
            filePath = getServletContext().getContextPath() + SAVE_DIRECTORY + "//" + fileName;
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
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
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
