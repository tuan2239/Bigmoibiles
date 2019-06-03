/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.util.List;
import javax.ejb.Local;
import model.Contactus;

/**
 *
 * @author ASUS
 */
@Local
public interface ContactusFacadeLocal {

    void create(Contactus contactus);

    void edit(Contactus contactus);

    void remove(Contactus contactus);

    Contactus find(Object id);

    List<Contactus> findAll();

    List<Contactus> findRange(int[] range);

    int count();
    
    void addvip(Contactus c);
    
}
