/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author congm
 */
@Entity
@Table(name = "Category", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c"),
    @NamedQuery(name = "Category.findByCategoryID", query = "SELECT c FROM Category c WHERE c.categoryID = :categoryID"),
    @NamedQuery(name = "Category.findByCategoryName", query = "SELECT c FROM Category c WHERE c.categoryName = :categoryName"),
    @NamedQuery(name = "Category.findByCategoryImages", query = "SELECT c FROM Category c WHERE c.categoryImages = :categoryImages"),
    @NamedQuery(name = "Category.findByCategoryState", query = "SELECT c FROM Category c WHERE c.categoryState = :categoryState")})
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "CategoryID", nullable = false, length = 20)
    private String categoryID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "CategoryName", nullable = false, length = 50)
    private String categoryName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "CategoryImages", nullable = false, length = 100)
    private String categoryImages;
    @Column(name = "CategoryState")
    private Boolean categoryState;
    @OneToMany(mappedBy = "categoryID")
    private Collection<Products> productsCollection;

    public Category() {
    }

    public Category(String categoryID) {
        this.categoryID = categoryID;
    }

    public Category(String categoryID, String categoryName, String categoryImages, Boolean categoryState) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryImages = categoryImages;
        this.categoryState = true;
    }

    public Category(String categoryID, String categoryName, String categoryImages) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryImages = categoryImages;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryImages() {
        return categoryImages;
    }

    public void setCategoryImages(String categoryImages) {
        this.categoryImages = categoryImages;
    }

    public Boolean getCategoryState() {
        return categoryState;
    }

    public void setCategoryState(Boolean categoryState) {
        this.categoryState = categoryState;
    }

    @XmlTransient
    public Collection<Products> getProductsCollection() {
        return productsCollection;
    }

    public void setProductsCollection(Collection<Products> productsCollection) {
        this.productsCollection = productsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (categoryID != null ? categoryID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Category)) {
            return false;
        }
        Category other = (Category) object;
        if ((this.categoryID == null && other.categoryID != null) || (this.categoryID != null && !this.categoryID.equals(other.categoryID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Category[ categoryID=" + categoryID + " ]";
    }
    
}
