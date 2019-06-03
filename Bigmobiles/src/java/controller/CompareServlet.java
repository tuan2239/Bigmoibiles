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
import java.util.ArrayList;
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
import model.itemCompare;

/**
 *
 * @author congm
 */
public class CompareServlet extends HttpServlet {
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private BrandFacadeLocal brandFacade;
    @EJB
    private ProductsFacadeLocal productsFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             List<Category> listCategory = categoryFacade.FindAllByStatus();
            List<Brand> listBrand = brandFacade.FindBrandByStatus();                                
            request.setAttribute("catelist",listCategory);
            request.setAttribute("brandList",listBrand);  
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            
            if (action.equals("Add")) {
                String id = request.getParameter("Product_id");

                //get sessuin
                ArrayList<itemCompare> arrCom = new ArrayList<itemCompare>();

                Products arrPro = productsFacade.find(id);

                //store product infomantion to session
                if (session.getAttribute("compare") == null) {
                    //if not exist session cart
                    //add new product to cart
                    arrCom.add(new itemCompare(arrPro.getProductID(), arrPro.getProductName(), arrPro.getDescription(), (float) arrPro.getPrice(), 1,
                            arrPro.getCategoryID().getCategoryName(), arrPro.getBrandID().getBrandName(), arrPro.getFeature(), arrPro.getImage1()));
                } else {
                    arrCom = (ArrayList<itemCompare>) session.getAttribute("compare");
                    //arrCom ID is exist
                    //increase quantity
                    boolean checkID = false;
                    for (int i = 0; i < arrCom.size(); i++) {
                        //neu nhu tim duoc cai category trong mang collection trung voi product detail
                        if (arrCom.get(i).getProductID().equalsIgnoreCase(id)) {
                            arrCom.get(i).setPquanity(arrCom.get(i).getPquanity() + 1);
                            checkID = true;
                            break;
                        } else if (!arrCom.get(i).getCategory().equals(arrPro.getCategoryID().getCategoryName())) {
                            checkID = true;
                            request.setAttribute("note", "cannot add another item have category different !!");
                            request.getRequestDispatcher("ProductDetailsServlet?id="+id).forward(request, response);
                        }
                        else if (arrCom.size() >= 3) {
                            request.setAttribute("note", "Compare k lớn hơn 3");
                            request.getRequestDispatcher("ProductDetailsServlet?id=" + id).forward(request, response);
                        }
                    }
                    //if ID isn't exist
                    if (checkID == false) {
                        // arrCart.add(new Cart(arrPro.get(0).getpId(), arrPro.get(0).getpName(), arrPro.get(0).getpPrice(), 1));
                        arrCom.add(new itemCompare(arrPro.getProductID(), arrPro.getProductName(), arrPro.getDescription(), (float) arrPro.getPrice(), 1,
                                arrPro.getCategoryID().getCategoryName(), arrPro.getBrandID().getBrandName(), arrPro.getFeature(), arrPro.getImage1()));
                    }
                }
                if (arrCom.isEmpty()) {
                    session.setAttribute("totalCount", null);
                } else {
                    session.setAttribute("totalCount", arrCom.size());
                }

                //set session
                session.setAttribute("compare", arrCom);
                //  response.sendRedirect("index.jsp");
                request.getRequestDispatcher("compare.jsp").forward(request, response);

            }// ket thuc Add
            else if (action.equals("Delete")) {
                String id = request.getParameter("Product_id");
                //  out.println(id);
                ArrayList<itemCompare> arrC = (ArrayList<itemCompare>) session.getAttribute("compare");
                for (itemCompare item : arrC) {
                    if (item.getProductID().equals(id)) {
                        arrC.remove(item);
                        break;
                    }
                }
                session.setAttribute("totalCount", arrC.size());

                session.setAttribute("compare", arrC);
                request.getRequestDispatcher("compare.jsp").forward(request, response);
//                response.sendRedirect("Compare.jsp");
            } else if (action.equals("DeleteItem")) {
                String id = request.getParameter("Product_id");
                //  out.println(id);
                ArrayList<itemCompare> arrC = (ArrayList<itemCompare>) session.getAttribute("compare");
                for (itemCompare item : arrC) {
                    if (item.getProductID().equals(id)) {
                        arrC.remove(item);
                        break;
                    }
                }
                if (arrC.isEmpty()) {
                    session.setAttribute("totalCount", null);
                } else {
                    session.setAttribute("totalCount", arrC.size());
                }
                if (arrC.isEmpty()) {
                    session.setAttribute("compare", null);
                } else {
                    session.setAttribute("compare", arrC);
                }
                request.getRequestDispatcher("compare.jsp").forward(request, response);
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
