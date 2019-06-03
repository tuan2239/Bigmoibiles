/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.ProductsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Products;

/**
 *
 * @author congm
 */
public class CartServlet extends HttpServlet {
    @EJB
    private ProductsFacadeLocal productsFacade;

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
            throws ServletException, IOException {
           response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            String command = request.getParameter("command");
            String productID= request.getParameter("productID");
           
            Cart cart= (Cart) session.getAttribute("cart");
            try {
            Products product = productsFacade.find(productID);
            switch(command){
                case "plus":
                    if (cart.getCartItems().containsKey(productID)) {
                        cart.plusToCart(productID, new Item(product, cart.getCartItems().get(productID).getQuantity()));
                    }else{
                        cart.plusToCart(productID, new Item(product, 1));
                    }
                break;
                case "remove":
                    cart.removeToCart(productID);
                    break;
              
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
           session.setAttribute("cart", cart);
           request.getRequestDispatcher("ProductServlet").forward(request, response);
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
