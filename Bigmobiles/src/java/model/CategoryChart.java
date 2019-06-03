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
public class CategoryChart {
    private String category;
    private double income;

    public CategoryChart() {
    }

    public CategoryChart(String category, double income) {
        this.category = category;
        this.income = income;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }
    
}
