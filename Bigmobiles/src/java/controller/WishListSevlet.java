/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.CustomersFacadeLocal;
import bean.ProductsFacadeLocal;
import bean.WishlistFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customers;
import model.Products;
import model.Wishlist;

/**
 *
 * @author congm
 */
public class WishListSevlet extends HttpServlet {
    @EJB
    private WishlistFacadeLocal wishlistFacade;
    @EJB
    private CustomersFacadeLocal customersFacade;
    @EJB
    private ProductsFacadeLocal productsFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             String productId=request.getParameter("productId");
        String customerId=request.getParameter("cusId");
        try {
            Products products=productsFacade.find(productId);
            Customers customers=customersFacade.find(customerId);
            Wishlist wishlist = new Wishlist();
            wishlist.setProductID(products);
            wishlist.setCustomerID(customers);
            wishlistFacade.create(wishlist);
            HttpSession session=request.getSession();
            session.setAttribute("countWishlist", wishlistFacade.findByCustomer(customerId).size());
            List<Products> productList= new ArrayList<>();
            
            for (Wishlist item :  wishlistFacade.findByCustomer(customerId)) {
                productList.add(item.getProductID());
                
            }
            session.setAttribute("wishlist",productList);
            
        } catch (Exception e) {
            e.printStackTrace();
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
