/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.BrandFacadeLocal;
import bean.CategoryFacadeLocal;
import bean.ProductsFacadeLocal;
import bean.RatingFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Brand;
import model.Category;
import model.Products;

public class ProductDetailsServlet extends HttpServlet {
    @EJB
    private BrandFacadeLocal brandFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private RatingFacadeLocal ratingFacade;
    @EJB
    private ProductsFacadeLocal productsFacade;
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<Category> listCategory = categoryFacade.FindAllByStatus();
            List<Brand> listBrand = brandFacade.FindBrandByStatus();
            List<Products> listProNew = productsFacade.AllProductNew();
             List<Products> listProHot = productsFacade.AllProductHot();
            List<Products> listProduct= productsFacade.AllProduct();
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("catelist",listCategory);
            request.setAttribute("brandList",listBrand);
            request.setAttribute("ProNewList",listProNew);
            request.setAttribute("ProHotList",listProHot);
            String id = request.getParameter("id");
           HttpSession session = request.getSession();
           String code = (String) session.getAttribute("cusID");
           Products product = productsFacade.find(id);
           request.setAttribute("product", product);
           double rating = ratingFacade.agvStar(id);
           request.setAttribute("rating", rating);
           
           long total = ratingFacade.totalvote(id);
           request.setAttribute("total",total);
           long [] vote = new long[10];
            for (int i = 1; i <= 5; i++) {
                vote[i] = ratingFacade.countvote(i, id);
                request.setAttribute("star"+i,vote[i]);
            }
            if (code==null) {
                request.getRequestDispatcher("ProductDetails.jsp").forward(request, response);
            }
            else{
               
                int madanhgia = ratingFacade.madanhgia(code, id);
                //Rating ratings = ratingFacade.find(madanhgia);
                int sao = (int) ratingFacade.sao(code, id);
                   request.setAttribute("code1",code);
                      request.setAttribute("id",id);
                request.setAttribute("ratings",madanhgia);
                request.setAttribute("sao",sao);
                request.getRequestDispatcher("ProductDetails.jsp").forward(request, response);
                
            }
           request.getRequestDispatcher("ProductDetails.jsp").forward(request, response);
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
