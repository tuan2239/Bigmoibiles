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
import model.Category;

/**
 *
 * @author congm
 */
@Stateless
public class CategoryFacade extends AbstractFacade<Category> implements CategoryFacadeLocal {
    @PersistenceContext(unitName = "BigmobilesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoryFacade() {
        super(Category.class);
    }

    @Override
    public List<Category> FindAllByStatus() {
        Query q = getEntityManager().createQuery("SELECT c FROM Category c WHERE c.categoryState = :categoryState");
        boolean status=true;
        q.setParameter("categoryState", status);
        return q.getResultList();
    }
    
    
}
