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
 * @author congm
 */
@Entity
@Table(name = "news", catalog = "T11708A0_Gr06_BigMobiles", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "News.findAll", query = "SELECT n FROM News n"),
    @NamedQuery(name = "News.findByNewsID", query = "SELECT n FROM News n WHERE n.newsID = :newsID"),
    @NamedQuery(name = "News.findByImageNews", query = "SELECT n FROM News n WHERE n.imageNews = :imageNews"),
    @NamedQuery(name = "News.findByNewsDate", query = "SELECT n FROM News n WHERE n.newsDate = :newsDate")})
public class News implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "newsID", nullable = false)
    private Integer newsID;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "Title", nullable = false, length = 2147483647)
    private String title;
    @Size(max = 255)
    @Column(name = "imageNews", length = 255)
    private String imageNews;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Description", length = 2147483647)
    private String description;
    @Size(max = 10)
    @Column(name = "newsDate", length = 10)
    private String newsDate;

    public News() {
    }

    public News(Integer newsID) {
        this.newsID = newsID;
    }

    public News(Integer newsID, String title) {
        this.newsID = newsID;
        this.title = title;
    }

    public Integer getNewsID() {
        return newsID;
    }

    public void setNewsID(Integer newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImageNews() {
        return imageNews;
    }

    public void setImageNews(String imageNews) {
        this.imageNews = imageNews;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate) {
        this.newsDate = newsDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (newsID != null ? newsID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof News)) {
            return false;
        }
        News other = (News) object;
        if ((this.newsID == null && other.newsID != null) || (this.newsID != null && !this.newsID.equals(other.newsID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.News[ newsID=" + newsID + " ]";
    }
    
}
