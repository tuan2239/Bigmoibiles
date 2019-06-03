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
import model.OrderDetails;

/**
 *
 * @author congm
 */
@Stateless
public class OrderDetailsFacade extends AbstractFacade<OrderDetails> implements OrderDetailsFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderDetailsFacade() {
        super(OrderDetails.class);
    }

    @Override
    public List<OrderDetails> adminOrderdetail(String oderid) {
        Query q = getEntityManager().createQuery("SELECT o FROM OrderDetails o WHERE o.orderID.orderID = :oderid");
        q.setParameter("oderid", oderid);
        return q.getResultList();
        
    }
    
    
}
