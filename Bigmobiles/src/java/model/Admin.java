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
@Table(name = "Admin", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admin.findAll", query = "SELECT a FROM Admin a"),
    @NamedQuery(name = "Admin.findByAdminID", query = "SELECT a FROM Admin a WHERE a.adminID = :adminID"),
    @NamedQuery(name = "Admin.findByEmail", query = "SELECT a FROM Admin a WHERE a.email = :email"),
    @NamedQuery(name = "Admin.findByPassword", query = "SELECT a FROM Admin a WHERE a.password = :password"),
    @NamedQuery(name = "Admin.findByFullname", query = "SELECT a FROM Admin a WHERE a.fullname = :fullname"),
    @NamedQuery(name = "Admin.findByAvatar", query = "SELECT a FROM Admin a WHERE a.avatar = :avatar"),
    @NamedQuery(name = "Admin.findByCreatedDate", query = "SELECT a FROM Admin a WHERE a.createdDate = :createdDate"),
    @NamedQuery(name = "Admin.findByAdminState", query = "SELECT a FROM Admin a WHERE a.adminState = :adminState")})
public class Admin implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AdminID", nullable = false)
    private Integer adminID;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "Email", length = 100)
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Password", nullable = false, length = 20)
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Fullname", nullable = false, length = 50)
    private String fullname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Avatar", nullable = false, length = 200)
    private String avatar;
    @Size(max = 10)
    @Column(name = "CreatedDate", length = 10)
    private String createdDate;
    @Column(name = "AdminState")
    private Boolean adminState;

    public Admin() {
    }

    public Admin(Integer adminID) {
        this.adminID = adminID;
    }

    public Admin(Integer adminID, String password, String fullname, String avatar) {
        this.adminID = adminID;
        this.password = password;
        this.fullname = fullname;
        this.avatar = avatar;
    }

    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public Boolean getAdminState() {
        return adminState;
    }

    public void setAdminState(Boolean adminState) {
        this.adminState = adminState;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (adminID != null ? adminID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admin)) {
            return false;
        }
        Admin other = (Admin) object;
        if ((this.adminID == null && other.adminID != null) || (this.adminID != null && !this.adminID.equals(other.adminID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Admin[ adminID=" + adminID + " ]";
    }
    
}
