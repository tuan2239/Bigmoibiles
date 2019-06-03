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
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "contactus", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Contactus.findAll", query = "SELECT c FROM Contactus c"),
    @NamedQuery(name = "Contactus.findByContactID", query = "SELECT c FROM Contactus c WHERE c.contactID = :contactID"),
    @NamedQuery(name = "Contactus.findByName", query = "SELECT c FROM Contactus c WHERE c.name = :name"),
    @NamedQuery(name = "Contactus.findByCreateDate", query = "SELECT c FROM Contactus c WHERE c.createDate = :createDate"),
    @NamedQuery(name = "Contactus.findByStatus", query = "SELECT c FROM Contactus c WHERE c.status = :status")})
public class Contactus implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ContactID", nullable = false)
    private Integer contactID;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Email", length = 2147483647)
    private String email;
    @Size(max = 50)
    @Column(name = "Name", length = 50)
    private String name;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Content", length = 2147483647)
    private String content;
    @Size(max = 10)
    @Column(name = "CreateDate", length = 10)
    private String createDate;
    @Column(name = "Status")
    private Boolean status;

    public Contactus() {
    }

    public Contactus(Integer contactID) {
        this.contactID = contactID;
    }

    public Integer getContactID() {
        return contactID;
    }

    public void setContactID(Integer contactID) {
        this.contactID = contactID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (contactID != null ? contactID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Contactus)) {
            return false;
        }
        Contactus other = (Contactus) object;
        if ((this.contactID == null && other.contactID != null) || (this.contactID != null && !this.contactID.equals(other.contactID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Contactus[ contactID=" + contactID + " ]";
    }
    
}
