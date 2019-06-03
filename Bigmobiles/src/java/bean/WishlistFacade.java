/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Wishlist;

/**
 *
 * @author congm
 */
@Stateless
public class WishlistFacade extends AbstractFacade<Wishlist> implements WishlistFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WishlistFacade() {
        super(Wishlist.class);
    }

    @Override
    public List<Wishlist> findByCustomer(String cusID) {
         Query q=em.createQuery("SELECT w FROM Wishlist w WHERE w.customerID.customerID = :cusId");
        q.setParameter("cusId", cusID);
        return q.getResultList();
    }

    @Override
    public List<Wishlist> findByProduct(String productID, String CusID) {
           Query q=em.createQuery("SELECT w FROM Wishlist w WHERE w.productID.productID = :productId and w.customerID.customerID = :cusId");
        q.setParameter("productId", productID);
        q.setParameter("cusId", CusID);
        return q.getResultList();
    }
    
    
}
