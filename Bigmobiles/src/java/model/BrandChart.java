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
public class BrandChart {
    private String brand;
    private  double  income;

    public BrandChart() {
    }

    public BrandChart(String brand, double income) {
        this.brand = brand;
        this.income = income;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }
    
}
