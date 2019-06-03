/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author congm
 */
public class Item {
     private Products product;
     private  int quantity;
     private double itemtotal;

    public double getItemtotal() {
        return quantity*getProduct().getPrice();
    }

    public void setItemtotal(double itemtotal) {
        this.itemtotal = itemtotal;
    }

    public Item() {
    }

    public Item(Products product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
     
}
