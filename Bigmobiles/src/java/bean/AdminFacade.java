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
import model.Admin;

/**
 *
 * @author congm
 */
@Stateless
public class AdminFacade extends AbstractFacade<Admin> implements AdminFacadeLocal {

    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdminFacade() {
        super(Admin.class);
    }

    @Override
    public Admin checkLogin(String email, String password) {
        Admin ad = new Admin();
        try {
            Query query = em.createQuery("SELECT a FROM Admin a WHERE a.email = :email and a.password = :password");
            query.setParameter("email", email);
            query.setParameter("password", password);
            ad = (Admin) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            ad = null;
        }
        return ad;
    }

    @Override
    public boolean aa(String email) {
        Query q = em.createQuery("SELECT a FROM Admin a WHERE a.email = :email");
        q.setParameter("email", email);
        List<Admin> list = new ArrayList<Admin>();
        list = q.getResultList();
        if (list.isEmpty()) {
            return true;
        }
        return false;
    }

}
