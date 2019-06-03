/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.CustomersFacadeLocal;
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
import model.Customers;

/**
 *
 * @author congm
 */
@MultipartConfig
public class createCUSTOMERServlet extends HttpServlet {

    @EJB
    private CustomersFacadeLocal customersFacade;

    private static final long serialVersionUID = 1L;
    private String path = "";

    public static final String SAVE_DIRECTORY = "uploadDir";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String customerID = "";
            Integer num = Integer.valueOf(customersFacade.count() + 1);
             switch (num.toString().length()) {
                    case 1: // '\001'
                        customerID = (new StringBuilder()).append("PR00").append(num).toString();
                        break;

                    case 2: // '\002'
                        customerID = (new StringBuilder()).append("PR0").append(num).toString();
                        break;

                    case 3: // '\003'
                        customerID = (new StringBuilder()).append("PR").append(num).toString();
                        break;
                }
             String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            path = uploadFile(request);
            boolean gender = false;
            if ("male".equals(request.getParameter("gender"))) {
                gender = true;
            }
          
           LocalDate createddate = LocalDate.now();
            if (customersFacade.checkMail(email) == true) {
                if (customersFacade.checkPhone(phone) == true) {
                    Customers cus = new Customers();
                    cus.setCustomerID(customerID);
                    cus.setFullName(fullname);
                    cus.setPhone(phone);
                    cus.setEmail(email);
                    cus.setPassword(password);
                    cus.setGender(gender);
                    cus.setAvatar(path);
                    cus.setCreatedDate(createddate.toString());
                    cus.setCustomerState(true);
                    customersFacade.create(cus);
                    request.setAttribute("mes", "Bạn đã đăng ký thành công, vui lòng đăng nhập");
                    request.getRequestDispatcher("logreg.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Số điện thoại đã có người dùng , vui lòng nhập số điện thoại khác");
                    request.getRequestDispatcher("/logreg.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Email đã tồn tại, vui lòng nhập email khác");
                request.getRequestDispatcher("/logreg.jsp").forward(request, response);
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
