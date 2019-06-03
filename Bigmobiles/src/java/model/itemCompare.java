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
public class itemCompare {
    private String productID;
    private String productName;
    private String description;
    private float price;
    private int pquanity;
    private String category;
    private String brand;
    private String feature;
    private String images;

    public itemCompare() {
    }

    public itemCompare(String productID, String productName, String description, float price, int pquanity, String category, String brand, String feature, String images) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.pquanity = pquanity;
        this.category = category;
        this.brand = brand;
        this.feature = feature;
        this.images = images;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getPquanity() {
        return pquanity;
    }

    public void setPquanity(int pquanity) {
        this.pquanity = pquanity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    
}
