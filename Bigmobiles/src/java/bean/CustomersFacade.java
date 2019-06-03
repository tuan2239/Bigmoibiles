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
import model.Customers;

/**
 *
 * @author congm
 */
@Stateless
public class CustomersFacade extends AbstractFacade<Customers> implements CustomersFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomersFacade() {
        super(Customers.class);
    }

    @Override
    public Customers checkLogin(String email, String password) {
          Customers custom = new Customers();
        try {
            Query query = em.createQuery("SELECT c FROM Customers c WHERE c.email = :email and c.password = :password");
            query.setParameter("email", email);
            query.setParameter("password", password);
            custom = (Customers) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            custom = null;
        }
        return custom;
    }

    @Override
    public boolean checkMail(String email) {
          Query q = em.createQuery("SELECT c FROM Customers c WHERE c.email = :email");
        q.setParameter("email", email);
        List<Customers> list = new ArrayList<Customers>();
        list = q.getResultList();
        if (list.isEmpty()) {
            return true;
        }
        return false; }

    @Override
    public boolean checkPhone(String phone) {
       Query q = em.createQuery("SELECT c FROM Customers c WHERE c.phone = :phone");
        q.setParameter("phone", phone);
        List<Customers> list = new ArrayList<Customers>();
        list = q.getResultList();
        if (list.isEmpty()) {
            return true;
        }
        return false; }
   
}
