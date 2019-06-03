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
@Table(name = "Orders", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderID", query = "SELECT o FROM Orders o WHERE o.orderID = :orderID"),
    @NamedQuery(name = "Orders.findByCreatedDate", query = "SELECT o FROM Orders o WHERE o.createdDate = :createdDate"),
    @NamedQuery(name = "Orders.findByTotal", query = "SELECT o FROM Orders o WHERE o.total = :total"),
    @NamedQuery(name = "Orders.findByShipName", query = "SELECT o FROM Orders o WHERE o.shipName = :shipName"),
    @NamedQuery(name = "Orders.findByShipAddress", query = "SELECT o FROM Orders o WHERE o.shipAddress = :shipAddress"),
    @NamedQuery(name = "Orders.findByShipPhone", query = "SELECT o FROM Orders o WHERE o.shipPhone = :shipPhone"),
    @NamedQuery(name = "Orders.findByShipDate", query = "SELECT o FROM Orders o WHERE o.shipDate = :shipDate"),
    @NamedQuery(name = "Orders.findByProcessStatus", query = "SELECT o FROM Orders o WHERE o.processStatus = :processStatus"),
    @NamedQuery(name = "Orders.findByOrderState", query = "SELECT o FROM Orders o WHERE o.orderState = :orderState")})
public class Orders implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "OrderID", nullable = false, length = 20)
    private String orderID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "CreatedDate", nullable = false, length = 10)
    private String createdDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Total", nullable = false)
    private double total;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ShipName", nullable = false, length = 50)
    private String shipName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "ShipAddress", nullable = false, length = 200)
    private String shipAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "ShipPhone", nullable = false, length = 20)
    private String shipPhone;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "ShipNote", length = 2147483647)
    private String shipNote;
    @Size(max = 10)
    @Column(name = "ShipDate", length = 10)
    private String shipDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ProcessStatus", nullable = false, length = 50)
    private String processStatus;
    @Column(name = "OrderState")
    private Boolean orderState;
    @JoinColumn(name = "CustomerID", referencedColumnName = "CustomerID")
    @ManyToOne
    private Customers customerID;
    @OneToMany(mappedBy = "orderID")
    private Collection<OrderDetails> orderDetailsCollection;

    public Orders() {
    }

    public Orders(String orderID) {
        this.orderID = orderID;
    }

    public Orders(String orderID, String createdDate, double total, String shipName, String shipAddress, String shipPhone, String processStatus) {
        this.orderID = orderID;
        this.createdDate = createdDate;
        this.total = total;
        this.shipName = shipName;
        this.shipAddress = shipAddress;
        this.shipPhone = shipPhone;
        this.processStatus = processStatus;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getShipPhone() {
        return shipPhone;
    }

    public void setShipPhone(String shipPhone) {
        this.shipPhone = shipPhone;
    }

    public String getShipNote() {
        return shipNote;
    }

    public void setShipNote(String shipNote) {
        this.shipNote = shipNote;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public String getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(String processStatus) {
        this.processStatus = processStatus;
    }

    public Boolean getOrderState() {
        return orderState;
    }

    public void setOrderState(Boolean orderState) {
        this.orderState = orderState;
    }

    public Customers getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Customers customerID) {
        this.customerID = customerID;
    }

    @XmlTransient
    public Collection<OrderDetails> getOrderDetailsCollection() {
        return orderDetailsCollection;
    }

    public void setOrderDetailsCollection(Collection<OrderDetails> orderDetailsCollection) {
        this.orderDetailsCollection = orderDetailsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Orders[ orderID=" + orderID + " ]";
    }
    
}
