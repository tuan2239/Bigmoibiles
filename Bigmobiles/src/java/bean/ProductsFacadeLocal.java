/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.util.List;
import javax.ejb.Local;
import model.Products;

/**
 *
 * @author congm
 */
@Local
public interface ProductsFacadeLocal {

    void create(Products products);

    void edit(Products products);

    void remove(Products products);

    Products find(Object id);

    List<Products> findAll();

    List<Products> findRange(int[] range);

    int count();

    List<Products> AllProductByCategory(String categoryID);

    List<Products> AllProduct();

    List<Products> AllProductNew();

    List<Products> AllProductHot();

    List<Products> AllProductByBrand(String brandID);

    List<Products> ProductDetails(String id);

    List<Products> SearchByName(String Name);
    
    double getMinPrice();
    double getMaxPrice();
    public List<Products> searchPrice(int from, int to);
    
    public List<Products> searchPriceName(int from, int to,String name);
}
