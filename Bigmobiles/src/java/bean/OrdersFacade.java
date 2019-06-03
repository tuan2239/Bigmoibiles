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
import model.Orders;

/**
 *
 * @author congm
 */
@Stateless
public class OrdersFacade extends AbstractFacade<Orders> implements OrdersFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrdersFacade() {
        super(Orders.class);
    }

    @Override
    public List<Orders> CustomerReport(String cusid) {
        Query q=em.createQuery("SELECT o FROM Orders o WHERE o.customerID.customerID = :cus");
        q.setParameter("cus", cusid);
        return q.getResultList(); }
    
}
