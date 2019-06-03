/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.CustomersFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomerChart;
import model.Customers;
import model.OrderDetails;
import model.Orders;

/**
 *
 * @author congm
 */
public class ChartCustomerServlet extends HttpServlet {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;
    @EJB
    private CustomersFacadeLocal customersFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<CustomerChart> list = new ArrayList<CustomerChart>();
            double total = 0.0D;
            for (Customers c : customersFacade.findAll()) {
                String email = c.getEmail();
                String name = c.getFullName();
                double income = 0.0D;
                for (Orders o : orderofCus(c)) {

                    for (OrderDetails od : oddofod(o)) {
                        income += od.getTotal() * od.getQuantity();
                    }
                }
                if (income > 0.0D) {
                    CustomerChart cus = new CustomerChart(email, name, income);
                    list.add(cus);
                }
            }
            for (int i = 0; i < list.size(); i++) {
                for (int j = 0; j < list.size(); j++) {
                    if (((CustomerChart)list.get(i)).getIncome() < ((CustomerChart) list.get(j)).getIncome()) {
                        CustomerChart tem = new CustomerChart((CustomerChart) list.get(i));
                        list.set(i, new CustomerChart((CustomerChart) list.get(j)));
                        list.set(j, new CustomerChart(tem));
                    }
                }
            }
            int endIndex = (list.size() >= 11) ? 11  : list.size();
            for (CustomerChart cr : list.subList(1, endIndex)) {
                total += cr.getIncome();
                request.setAttribute("list", list.subList(1, endIndex)); 
            }
           

          
            request.getRequestDispatcher("AdminManageOrder_1.jsp").forward(request, response);
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

    private List<OrderDetails> oddofod(Orders o) {
        
        return em.createQuery("SELECT o FROM OrderDetails o WHERE o.orderID = :br")
                .setParameter("br", o)
                .getResultList();
    }

    private List<Orders> orderofCus(Customers c) {
        return em.createQuery("SELECT o FROM Orders o WHERE o.customerID = :br")
                .setParameter("br", c)
                .getResultList();
    }

    
}
