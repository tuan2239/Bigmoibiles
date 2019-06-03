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
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
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
@Table(name = "Products", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p"),
    @NamedQuery(name = "Products.findByProductID", query = "SELECT p FROM Products p WHERE p.productID = :productID"),
    @NamedQuery(name = "Products.findByProductName", query = "SELECT p FROM Products p WHERE p.productName = :productName"),
    @NamedQuery(name = "Products.findByImage1", query = "SELECT p FROM Products p WHERE p.image1 = :image1"),
    @NamedQuery(name = "Products.findByImage2", query = "SELECT p FROM Products p WHERE p.image2 = :image2"),
    @NamedQuery(name = "Products.findByImage3", query = "SELECT p FROM Products p WHERE p.image3 = :image3"),
    @NamedQuery(name = "Products.findByImage4", query = "SELECT p FROM Products p WHERE p.image4 = :image4"),
    @NamedQuery(name = "Products.findByPrice", query = "SELECT p FROM Products p WHERE p.price = :price"),
    @NamedQuery(name = "Products.findByCreatedDate", query = "SELECT p FROM Products p WHERE p.createdDate = :createdDate"),
    @NamedQuery(name = "Products.findByFeature", query = "SELECT p FROM Products p WHERE p.feature = :feature"),
    @NamedQuery(name = "Products.findByProductState", query = "SELECT p FROM Products p WHERE p.productState = :productState")})
public class Products implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "ProductID", nullable = false, length = 20)
    private String productID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "ProductName", nullable = false, length = 100)
    private String productName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "Image1", nullable = false, length = 255)
    private String image1;
    @Size(max = 255)
    @Column(name = "Image2", length = 255)
    private String image2;
    @Size(max = 255)
    @Column(name = "Image3", length = 255)
    private String image3;
    @Size(max = 255)
    @Column(name = "Image4", length = 255)
    private String image4;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Price", nullable = false)
    private double price;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Description", length = 2147483647)
    private String description;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Des2", length = 2147483647)
    private String des2;
    @Size(max = 10)
    @Column(name = "CreatedDate", length = 10)
    private String createdDate;
    @Size(max = 50)
    @Column(name = "Feature", length = 50)
    private String feature;
    @Column(name = "ProductState")
    private Boolean productState;
    @JoinColumn(name = "BrandID", referencedColumnName = "BrandID")
    @ManyToOne
    private Brand brandID;
    @JoinColumn(name = "CategoryID", referencedColumnName = "CategoryID")
    @ManyToOne
    private Category categoryID;
    @OneToMany(mappedBy = "productID")
    private Collection<OrderDetails> orderDetailsCollection;
    @OneToMany(mappedBy = "productID")
    private Collection<Wishlist> wishlistCollection;
    @OneToMany(mappedBy = "productID")
    private Collection<Rating> ratingCollection;

    public Products() {
    }

    public Products(String productID) {
        this.productID = productID;
    }

    public Products(String productID, String productName, String image1, double price) {
        this.productID = productID;
        this.productName = productName;
        this.image1 = image1;
        this.price = price;
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

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDes2() {
        return des2;
    }

    public void setDes2(String des2) {
        this.des2 = des2;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public Boolean getProductState() {
        return productState;
    }

    public void setProductState(Boolean productState) {
        this.productState = productState;
    }

    public Brand getBrandID() {
        return brandID;
    }

    public void setBrandID(Brand brandID) {
        this.brandID = brandID;
    }

    public Category getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Category categoryID) {
        this.categoryID = categoryID;
    }

    @XmlTransient
    public Collection<OrderDetails> getOrderDetailsCollection() {
        return orderDetailsCollection;
    }

    public void setOrderDetailsCollection(Collection<OrderDetails> orderDetailsCollection) {
        this.orderDetailsCollection = orderDetailsCollection;
    }

    @XmlTransient
    public Collection<Wishlist> getWishlistCollection() {
        return wishlistCollection;
    }

    public void setWishlistCollection(Collection<Wishlist> wishlistCollection) {
        this.wishlistCollection = wishlistCollection;
    }

    @XmlTransient
    public Collection<Rating> getRatingCollection() {
        return ratingCollection;
    }

    public void setRatingCollection(Collection<Rating> ratingCollection) {
        this.ratingCollection = ratingCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productID != null ? productID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.productID == null && other.productID != null) || (this.productID != null && !this.productID.equals(other.productID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Products[ productID=" + productID + " ]";
    }
    
}
