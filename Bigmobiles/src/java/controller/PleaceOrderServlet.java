/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.OrderDetailsFacadeLocal;
import bean.OrdersFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Customers;
import model.Item;
import model.OrderDetails;
import model.Orders;

/**
 *
 * @author congm
 */
public class PleaceOrderServlet extends HttpServlet {
    @EJB
    private OrderDetailsFacadeLocal orderDetailsFacade;
    @EJB
    private OrdersFacadeLocal ordersFacade;

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
        try (PrintWriter out = response.getWriter()) {
           HttpSession session = request.getSession();
         Cart cart = (Cart) session.getAttribute("cart");
        
        if(cart.countQty()==0){
            request.getRequestDispatcher("emptyCart.jsp").forward(request, response);
        }else{
        Customers cus = (Customers) session.getAttribute("LOGIN_CUSTOMER");
         String id = "";
         Integer numIdentity = Integer.valueOf(this.ordersFacade.count() + 1);
            switch (numIdentity.toString().length()) {
                case 1:
                    id = "OD00" + numIdentity;
                    break;
                case 2:
                    id = "OD0" + numIdentity;
                    break;
                case 3:
                    id = "OD" + numIdentity;
                    break;
            }
        String Shipname = request.getParameter("firstname") +" "+ request.getParameter("lastname");      
        String ShipAddress = request.getParameter("address");
        String ShipPhone = request.getParameter("tel");
        String Shipnote = request.getParameter("shipnote");   
        String shipdate = request.getParameter("shipdate");
        LocalDate local = LocalDate.now();
       
        String processStt = "Pending";
       
        //Orders orders = new Orders(orderid,cart.totalCart(),Shipname,ShipPhone,ShipAddress,date,payMethod,processStt);
        Orders orders = new Orders();
        orders.setOrderID(id);
        orders.setCustomerID(cus);
        orders.setCreatedDate(local.toString());
        orders.setTotal(cart.totalCart());
        orders.setShipName(Shipname);
        orders.setShipAddress(ShipAddress);
        orders.setShipPhone(ShipPhone);       
        orders.setShipNote(Shipnote);
        orders.setShipDate(shipdate);
        orders.setProcessStatus(processStt);
        orders.setOrderState(true);
        ordersFacade.create(orders);
        
        for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {
           
            
            OrderDetails ordersDetails = new OrderDetails();
          
            ordersDetails.setOrderID(orders);
            ordersDetails.setProductID(list.getValue().getProduct());
            ordersDetails.setQuantity(list.getValue().getQuantity());
            ordersDetails.setTotal(list.getValue().getItemtotal());
            
            orderDetailsFacade.create(ordersDetails);
        }
        session.removeAttribute("cart");
        out.println("Ok");
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
