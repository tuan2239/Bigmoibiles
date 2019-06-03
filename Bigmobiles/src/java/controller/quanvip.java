/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.BrandChart;
import model.OrderDetails;
import model.Products;

/**
 *
 * @author congm
 */
@WebServlet(name = "quanvip", urlPatterns = {"/abc"})
public class quanvip extends HttpServlet {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Brand> brandlist = em.createQuery("SELECT b FROM Brand b").getResultList();
        int br = 0, pr = 0, odd=0;
        String brand = "";
        double income = 0.0D;
        double total = 0.0D;
        for (Brand b : brandlist) {
            out.println("brand "+(++br)+" :");
                brand = b.getBrandName();
                income = 0.0D;
                for (Products p : productsofBrand(b)) {
                    //out.println("-------product "+(++pr)+" :");
                    for (OrderDetails od : odbyp(p)) {
                        //out.println("----------------orddd "+(++odd)+" :");
                        income += od.getTotal() * od.getQuantity();
                    }
                }
                        //out.println("-----------------------"+brand+"-----------income: "+income);
            }
    }
    
    private List<Products> productsofBrand(Brand b) {
        return em.createQuery("SELECT p FROM Products p WHERE p.brandID = :br")
                .setParameter("br", b)
                .getResultList();
    }

    private List<OrderDetails> odbyp(Products p) {
        
        return em.createQuery("SELECT o FROM OrderDetails o WHERE o.productID = :br")
                .setParameter("br", p)
                .getResultList();
    }

}
