/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author congm
 */
@Entity
@Table(name = "Rating", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rating.findAll", query = "SELECT r FROM Rating r"),
    @NamedQuery(name = "Rating.findByRatingID", query = "SELECT r FROM Rating r WHERE r.ratingID = :ratingID"),
    @NamedQuery(name = "Rating.findByRate", query = "SELECT r FROM Rating r WHERE r.rate = :rate"),
    @NamedQuery(name = "Rating.findByRatingDate", query = "SELECT r FROM Rating r WHERE r.ratingDate = :ratingDate")})
public class Rating implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
  @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RatingID", nullable = false)
    private Integer ratingID;
    @Column(name = "Rate")
    private Integer rate;
    @Size(max = 10)
    @Column(name = "RatingDate", length = 10)
    private String ratingDate;
    @JoinColumn(name = "CustomerID", referencedColumnName = "CustomerID")
    @ManyToOne
    private Customers customerID;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    @ManyToOne
    private Products productID;

    public Rating() {
    }

    public Rating( Integer rate, String ratingDate, Customers customerID, Products productID) {
        
        this.rate = rate;
        this.ratingDate = ratingDate;
        this.customerID = customerID;
        this.productID = productID;
    }

    public Rating(Integer ratingID) {
        this.ratingID = ratingID;
    }

    public Integer getRatingID() {
        return ratingID;
    }

    public void setRatingID(Integer ratingID) {
        this.ratingID = ratingID;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public String getRatingDate() {
        return ratingDate;
    }

    public void setRatingDate(String ratingDate) {
        this.ratingDate = ratingDate;
    }

    public Customers getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Customers customerID) {
        this.customerID = customerID;
    }

    public Products getProductID() {
        return productID;
    }

    public void setProductID(Products productID) {
        this.productID = productID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ratingID != null ? ratingID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rating)) {
            return false;
        }
        Rating other = (Rating) object;
        if ((this.ratingID == null && other.ratingID != null) || (this.ratingID != null && !this.ratingID.equals(other.ratingID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Rating[ ratingID=" + ratingID + " ]";
    }
    
}
