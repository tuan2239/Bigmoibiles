/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Rating;

/**
 *
 * @author congm
 */
@Stateless
public class RatingFacade extends AbstractFacade<Rating> implements RatingFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RatingFacade() {
        super(Rating.class);
    }

    @Override
    public double agvStar(String id) {
        Query q = em.createQuery("select AVG(r.rate) FROM Rating r JOIN r.productID p where p.productID = :product");
        q.setParameter("product", id);
        if (q.getSingleResult() == null) {
            return 0.0D;
        } else {
            double avg = (Double) q.getSingleResult();
            return avg;
        }
    }

    @Override
    public long totalvote(String id) {
        Query q = em.createQuery("select count(r.rate) FROM Rating r JOIN r.productID s WHERE s.productID =:product");
        q.setParameter("product", id);
        long number =(long) q.getSingleResult();
        return number;
    }

    @Override
    public long countvote(int rating, String id) {
        Query q = em.createQuery("select count(r.rate) FROM Rating r JOIN r.productID s WHERE s.productID =:product AND r.rate =:rating");
        q.setParameter("rating", rating);
        q.setParameter("product", id);
        long number =(long) q.getSingleResult();
        return number;
    }

    @Override
    public int madanhgia(String customerID, String productID) {
         Query q = em.createQuery("SELECT r.ratingID FROM Rating r JOIN r.customerID a JOIN r.productID b WHERE a.customerID = :customerID AND b.productID = :productID");
        q.setParameter("customerID", customerID);
        q.setParameter("productID", productID);
        if (q.getResultList().isEmpty()) {
            return 0;
        }
        else{
            int rating = (int) q.getSingleResult();
            return  rating;
        }
    }

    @Override
    public int sao(String customerID, String productID) {
        Query q = em.createQuery("SELECT r.rate FROM Rating r JOIN r.customerID a JOIN r.productID b WHERE a.customerID = :customerID AND b.productID = :productID");
        q.setParameter("customerID", customerID);
        q.setParameter("productID", productID);
        if (q.getResultList().isEmpty()) {
            return 0;
        }
        else{
            int rating = (int) q.getSingleResult();
            return  rating;
        }
    }
    
    
    
    
}
