/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.BrandFacadeLocal;
import bean.CategoryFacadeLocal;
import bean.ContactusFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Contactus;
import model.Products;

/**
 *
 * @author congm
 */
public class FeedbackServlet extends HttpServlet {
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private BrandFacadeLocal brandFacade;
    @EJB
    private ContactusFacadeLocal contactusFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
             List<Category> listCategory = categoryFacade.FindAllByStatus();
            List<Brand> listBrand = brandFacade.FindBrandByStatus();                                
            request.setAttribute("catelist",listCategory);
            request.setAttribute("brandList",listBrand);    
//            if (action.equals("contactus")) {
//                request.getRequestDispatcher("Contact.jsp").forward(request, response);
//            }
//            if (action.equals("Contactus")) {
//                  String Name= request.getParameter("name");
//            String Email= request.getParameter("email");
//            String Content= request.getParameter("content");      
//            LocalDate da =LocalDate.now();
//            Contactus c= new Contactus();
//            c.setEmail(Email);
//            c.setName(Name);
//            c.setContent(Content);
//            c.setCreateDate(da.toString());
//            contactusFacade.create(c);
//            request.setAttribute("note1", "Thanks For you Feedback");
//            out.println("Thanks For you Feedback");
////            request.getRequestDispatcher("Contact.jsp").forward(request, response);
//            }
           
          
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
//        processRequest(request, response);
        laydulieu(request, response);
        request.getRequestDispatcher("Contact.jsp").forward(request, response);
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
//        processRequest(request, response);
        laydulieu(request, response);
         String Name= request.getParameter("name");
            String Email= request.getParameter("email");
            String Content= request.getParameter("content");
            
            LocalDate da = LocalDate.now();
            
            Contactus c= new Contactus();
            c.setEmail(Email);
            c.setName(Name);
            c.setContent(Content);
            c.setCreateDate(da.toString());
            c.setStatus(true);
            contactusFacade.create(c);
            request.setAttribute("note1", "Thanks For you Feedback");
            response.getWriter().println("Thanks For you Feedback");
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

    private void laydulieu(HttpServletRequest request, HttpServletResponse response) {
        
             List<Category> listCategory = categoryFacade.FindAllByStatus();
            List<Brand> listBrand = brandFacade.FindBrandByStatus();                                
            request.setAttribute("catelist",listCategory);
            request.setAttribute("brandList",listBrand);  
    }

}
