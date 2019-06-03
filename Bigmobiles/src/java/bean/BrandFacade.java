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
import model.Brand;

/**
 *
 * @author congm
 */
@Stateless
public class BrandFacade extends AbstractFacade<Brand> implements BrandFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BrandFacade() {
        super(Brand.class);
    }

    @Override
    public List<Brand> FindBrandByStatus() {
       Query q = getEntityManager().createQuery("SELECT b FROM Brand b WHERE b.brandState = :brandState");
        boolean status=true;
        q.setParameter("brandState", status);
        return q.getResultList();
    }
    
    
}
