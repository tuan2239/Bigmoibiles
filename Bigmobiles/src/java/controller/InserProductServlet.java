/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.BrandFacadeLocal;
import bean.CategoryFacadeLocal;
import bean.ProductsFacadeLocal;
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
import model.Brand;
import model.Category;
import model.Products;

@MultipartConfig
public class InserProductServlet extends HttpServlet {

    @EJB
    private ProductsFacadeLocal productsFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private BrandFacadeLocal brandFacade;

    private static final long serialVersionUID = 1L;
    private String path = "";
    private String path1 = "";
    private String path2 = "";
    private String path3 = "";
    public static final String SAVE_DIRECTORY = "uploadDir";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = "";
            Integer numIdentity = Integer.valueOf(this.productsFacade.count() + 1);
            switch (numIdentity.toString().length()) {
                case 1:
                    id = "PR00" + numIdentity;
                    break;
                case 2:
                    id = "PR0" + numIdentity;
                    break;
                case 3:
                    id = "PR" + numIdentity;
                    break;
            }

            String cname = request.getParameter("cboCategoryName");
            String bname = request.getParameter("cboBrandName");
            String name = request.getParameter("name");
            path = uploadFile(request);
            path1 = uploadFile1(request);
            path2 = uploadFile2(request);
            path3 = uploadFile3(request);
            float price = Float.parseFloat(request.getParameter("price"));
            String description = request.getParameter("des");
            String description1 = request.getParameter("des1");
            LocalDate dater1 = LocalDate.now();
            String feature = request.getParameter("feature");

            Products product = new Products();
            product.setProductID(id);
            product.setProductName(name);
            product.setImage1(path);
            product.setImage2(path1);
            product.setImage3(path2);
            product.setImage4(path3);
            product.setPrice(price);
            product.setDescription(description);
            product.setDes2(description1);
            product.setCreatedDate(dater1.toString());
            product.setFeature(feature);
            product.setProductState(true);

            Category cate = categoryFacade.find(cname);
            product.setCategoryID(cate);
            Brand brand = brandFacade.find(bname);
            product.setBrandID(brand);
            productsFacade.create(product);
            request.getRequestDispatcher("adminViewDashBoard").forward(request, response);
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file");
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

    private String uploadFile1(HttpServletRequest request) throws IOException, ServletException {
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

    private String uploadFile2(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file2");
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

    private String uploadFile3(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String filePath = "";
        try {
            Part filePart = request.getPart("file3");
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
