/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.util.List;
import javax.ejb.Local;
import model.Rating;

/**
 *
 * @author congm
 */
@Local
public interface RatingFacadeLocal {

    void create(Rating rating);

    void edit(Rating rating);

    void remove(Rating rating);

    Rating find(Object id);

    List<Rating> findAll();

    List<Rating> findRange(int[] range);

    int count();

    double agvStar(String id);

    long totalvote(String id);

    long countvote(int rating, String id);

    int madanhgia(String customerID, String productID);

    int sao(String customerID, String productID);
    
}
