/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.CustomersFacadeLocal;
import bean.OrdersFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Orders;

@WebServlet(name = "adminReportCustomer", urlPatterns = {"/adminReportCustomer"})

public class adminReportCustomer extends HttpServlet {
    @EJB
    private OrdersFacadeLocal ordersFacade;
    @EJB
    private CustomersFacadeLocal customersFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
           request.setAttribute("cusList", customersFacade.findAll());
        request.getRequestDispatcher("adminReportCustomer.jsp").forward(request, response);
   
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         String cusid = request.getParameter("customerID");
         List<Orders> reportList = ordersFacade.CustomerReport(cusid);
        int totalProfit = 0;
        for (int i = 0; i < reportList.size(); i++) {
            if (!reportList.get(i).getProcessStatus().equals("Canceled")) {
                totalProfit += reportList.get(i).getTotal();
            }
        }
        request.setAttribute("totalProfit", totalProfit);
        request.setAttribute("cus", customersFacade.find(cusid));
        request.setAttribute("reportList", reportList);
        request.getRequestDispatcher("adminViewReportCustomer.jsp").forward(request, response);
 
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
