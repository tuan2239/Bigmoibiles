/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Products;

/**
 *
 * @author congm
 */
@Stateless
public class ProductsFacade extends AbstractFacade<Products> implements ProductsFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductsFacade() {
        super(Products.class);
    }

    @Override
    public List<Products> AllProductByCategory(String categoryID) {
        Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.categoryID.categoryID = :cateid and p.productState = :productState");
        q.setParameter("cateid", categoryID);
        boolean status=true;
        q.setParameter("productState", status);
        return q.getResultList();
    }

    @Override
    public List<Products> AllProduct() {
         Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.productState = :productState");
        boolean status=true;
        q.setParameter("productState", status);
        return q.getResultList();
    }
    
    
    @Override
    public List<Products> AllProductNew() {
        Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.productState = :productState and p.feature = :feature");
        boolean status=true;
        q.setParameter("productState", status);
        q.setParameter("feature", "New");   
        return q.getResultList();
    }

    @Override
    public List<Products> AllProductHot() {
        Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.productState = :productState and p.feature = :feature");
        boolean status=true;
        q.setParameter("productState", status);
        q.setParameter("feature", "Hot");   
        return q.getResultList();
    }

    @Override
    public List<Products> AllProductByBrand(String brandID) {
        Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.brandID.brandID = :brandID and p.productState = :productState");
        q.setParameter("brandID", brandID);
        boolean status=true;
        q.setParameter("productState", status);
        return q.getResultList();
    }

    @Override
    public List<Products> ProductDetails(String id) {
        Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.productID = :productID");
        q.setParameter("productID", id);
        return q.getResultList();
    }

    @Override
    public List<Products> SearchByName(String Name) {
         Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.productState = :productState and p.productName LIKE :productName");
        boolean status=true;
        q.setParameter("productState", status);
        q.setParameter("productName","%"+Name+"%");
        return q.getResultList();
    }
    @Override
     public double getMinPrice() {
         return (double)this.em.createQuery("SELECT MIN(p.price) FROM Products p").getSingleResult();
     }
     
     @Override
     public double getMaxPrice() { return (double)this.em.createQuery("SELECT MAX(p.price) FROM Products p").getSingleResult(); }
     
     @Override
     public List<Products> searchPrice(int from, int to) {
        List<Products> list= new ArrayList<>();
        Query q =em.createQuery("SELECT p FROM Products p WHERE p.productState = :productState and p.price >= :from and p.price <= :to");
        boolean productState=true;
        q.setParameter("productState", productState);
        q.setParameter("from", from);
        q.setParameter("to", to);
        list=q.getResultList();
        return list;
    }
      @Override
     public List<Products> searchPriceName(int from, int to,String name) {
        List<Products> list= new ArrayList<>();
        Query q =em.createQuery("SELECT p FROM Products p WHERE p.productState = :productState and p.price >= :from and p.price <= :to and p.productName LIKE :productName");
        boolean productState=true;
        q.setParameter("productState", productState);
        q.setParameter("name", "%"+name+"%");
        q.setParameter("from", from);
        q.setParameter("to", to);
        list=q.getResultList();
        return list;
    }
    
    
    
}
