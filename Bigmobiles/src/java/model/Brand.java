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
@Table(name = "Brand", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Brand.findAll", query = "SELECT b FROM Brand b"),
    @NamedQuery(name = "Brand.findByBrandID", query = "SELECT b FROM Brand b WHERE b.brandID = :brandID"),
    @NamedQuery(name = "Brand.findByBrandName", query = "SELECT b FROM Brand b WHERE b.brandName = :brandName"),
    @NamedQuery(name = "Brand.findByBrandImages", query = "SELECT b FROM Brand b WHERE b.brandImages = :brandImages"),
    @NamedQuery(name = "Brand.findByBrandState", query = "SELECT b FROM Brand b WHERE b.brandState = :brandState")})
public class Brand implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "BrandID", nullable = false, length = 20)
    private String brandID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 35)
    @Column(name = "BrandName", nullable = false, length = 35)
    private String brandName;
    @Size(max = 100)
    @Column(name = "BrandImages", length = 100)
    private String brandImages;
    @Column(name = "BrandState")
    private Boolean brandState;
    @OneToMany(mappedBy = "brandID")
    private Collection<Products> productsCollection;

    public Brand() {
    }

    public Brand(String brandID) {
        this.brandID = brandID;
    }

    public Brand(String brandID, String brandName, String brandImages, Boolean brandState) {
        this.brandID = brandID;
        this.brandName = brandName;
        this.brandImages = brandImages;
        this.brandState = true;
        
    }

    

    

    public String getBrandID() {
        return brandID;
    }

    public void setBrandID(String brandID) {
        this.brandID = brandID;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandImages() {
        return brandImages;
    }

    public void setBrandImages(String brandImages) {
        this.brandImages = brandImages;
    }

    public Boolean getBrandState() {
        return brandState;
    }

    public void setBrandState(Boolean brandState) {
        this.brandState = brandState;
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
        hash += (brandID != null ? brandID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Brand)) {
            return false;
        }
        Brand other = (Brand) object;
        if ((this.brandID == null && other.brandID != null) || (this.brandID != null && !this.brandID.equals(other.brandID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Brand[ brandID=" + brandID + " ]";
    }
    
}
