/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.CustomersFacadeLocal;
import bean.ProductsFacadeLocal;
import bean.RatingFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customers;
import model.Products;
import model.Rating;

/**
 *
 * @author congm
 */
public class ratingServlet extends HttpServlet {

    @EJB
    private RatingFacadeLocal ratingFacade;
    @EJB
    private CustomersFacadeLocal customersFacade;

    @EJB
    private ProductsFacadeLocal productsFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            String productId = request.getParameter("productID");
            String cusId = request.getParameter("cusId");

            int star = Integer.parseInt(request.getParameter("rating"));

            LocalDate dater1 = LocalDate.now();

            if (action.equals("Rate")) {

                Products pro = productsFacade.find(productId);
                Customers cus = customersFacade.find(cusId);
                Rating obj = new Rating();
                obj.setCustomerID(cus);
                obj.setProductID(pro);
                obj.setRate(star);
                obj.setRatingDate(dater1.toString());
                ratingFacade.create(obj);
                request.getRequestDispatcher("ProductDetailsServlet?id=" + productId).forward(request, response);
            }
            if (action.equals("Update")) {
                int ratingid = Integer.parseInt(request.getParameter("ratingid"));

                Customers cus = customersFacade.find(cusId);
                Products pro = productsFacade.find(productId);
                Rating ra = new Rating();
                ra.setRatingID(ratingid);
                ra.setCustomerID(cus);
                ra.setProductID(pro);
                ra.setRate(star);
                ra.setRatingDate(dater1.toString());
                ratingFacade.edit(ra);
                request.getRequestDispatcher("ProductDetailsServlet?id=" + productId).forward(request, response);
            }
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
