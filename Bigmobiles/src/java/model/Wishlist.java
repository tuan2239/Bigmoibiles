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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author congm
 */
@Entity
@Table(name = "wishlist", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Wishlist.findAll", query = "SELECT w FROM Wishlist w"),
    @NamedQuery(name = "Wishlist.findByWhishlistID", query = "SELECT w FROM Wishlist w WHERE w.whishlistID = :whishlistID")})
public class Wishlist implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "WhishlistID", nullable = false)
    private Integer whishlistID;
    @JoinColumn(name = "CustomerID", referencedColumnName = "CustomerID")
    @ManyToOne
    private Customers customerID;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    @ManyToOne
    private Products productID;

    public Wishlist() {
    }

    public Wishlist(Integer whishlistID) {
        this.whishlistID = whishlistID;
    }

    public Integer getWhishlistID() {
        return whishlistID;
    }

    public void setWhishlistID(Integer whishlistID) {
        this.whishlistID = whishlistID;
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
        hash += (whishlistID != null ? whishlistID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Wishlist)) {
            return false;
        }
        Wishlist other = (Wishlist) object;
        if ((this.whishlistID == null && other.whishlistID != null) || (this.whishlistID != null && !this.whishlistID.equals(other.whishlistID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Wishlist[ whishlistID=" + whishlistID + " ]";
    }
    
}
