/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.BrandFacadeLocal;
import bean.CategoryFacadeLocal;
import bean.ProductsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Products;

public class SearchServlet extends HttpServlet {

    @EJB
    private BrandFacadeLocal brandFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private ProductsFacadeLocal productsFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<Category> listCategory = categoryFacade.FindAllByStatus();
            List<Brand> listBrand = brandFacade.FindBrandByStatus();

            request.setAttribute("catelist", listCategory);
            request.setAttribute("brandList", listBrand);
            request.setAttribute("currfrom", 10);
            request.setAttribute("currto", 300);
            request.setAttribute("maxPr", productsFacade.getMaxPrice());
            String action = request.getParameter("action");
            String searchName = request.getParameter("searchName");
            if (action.equals("searchname")) {
                if (searchName.isEmpty()) {
                    List<Products> listProduct = productsFacade.AllProduct();
                    request.setAttribute("listP", listProduct);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                } else {
                    List<Products> listProduct = productsFacade.SearchByName(searchName);
                    request.setAttribute("listP", listProduct);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                }
            }
            if (action.equals("searchprice")) {
                int from = Integer.parseInt(request.getParameter("from"));
                int to = Integer.parseInt(request.getParameter("to"));
                if (from == 0 && to == 0) {
                    request.setAttribute("listP", productsFacade.AllProduct());
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                } else {
                    request.setAttribute("curfrom", from);
                    request.setAttribute("currto", to);
                    request.setAttribute("maxPr", productsFacade.getMaxPrice());
                    request.setAttribute("listP", productsFacade.searchPrice(from, to));
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                }

            }

//            request.setAttribute("maxPr", productsFacade.getMaxPrice());
//            request.setAttribute("currfrom", 10);
//            request.setAttribute("currto", 300);
//            request.setAttribute("listP", productsFacade.AllProduct());
//            request.getRequestDispatcher("search.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
