/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author congm
 */
public class Cart {
    private HashMap<String, Item> cartItems;

    public Cart() {
        cartItems = new HashMap<>();
    }

    public Cart(HashMap<String, Item> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<String, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<String, Item> cartItems) {
        this.cartItems = cartItems;
    }
    
    public void plusToCart(String key, Item item){
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old=item.getQuantity();
            item.setQuantity(quantity_old+1);
            cartItems.put(key, item);
        }
        else{
            cartItems.put(key, item);
        }
    }
    
    public void subToCart(String key, Item item){
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old=item.getQuantity();
            if (quantity_old <1) {
                cartItems.remove(key);
            }
            else{
                item.setQuantity(quantity_old);
                cartItems.put(key, item);
            }
        }
    }
    
    public void removeToCart(String key){
        boolean check = cartItems.containsKey(key);
        if (check) {
            cartItems.remove(key);
        }
    }
    public int countItem(){
        return cartItems.size();
    }
    
    public double totalCart(){
        double count = 0;
        for (Map.Entry<String, Item> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getPrice()*list.getValue().getQuantity();
        }
        return  count;
    }
     public int countQty(){
        int count = 0;
        // count = price * quantity
        for (Map.Entry<String, Item> list : cartItems.entrySet()) {
            count += list.getValue().getQuantity();
        }
        return count;
    }
     public double total(){
        double count = 0;
        for (Map.Entry<String, Item> list : cartItems.entrySet()) {
            count = list.getValue().getProduct().getPrice()*list.getValue().getQuantity();
        }
        return  count;
    }
}
