/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.util.List;
import javax.ejb.Local;
import model.Wishlist;

/**
 *
 * @author congm
 */
@Local
public interface WishlistFacadeLocal {

    void create(Wishlist wishlist);

    void edit(Wishlist wishlist);

    void remove(Wishlist wishlist);

    Wishlist find(Object id);

    List<Wishlist> findAll();

    List<Wishlist> findRange(int[] range);

    int count();

    List<Wishlist> findByCustomer(String cusID);

    List<Wishlist> findByProduct(String productID, String CusID);
    
}
