/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import Config.Config;
import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author root
 */
@Entity
@Table(name = "pages")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pages.findAll", query = "SELECT p FROM Pages p"),
    @NamedQuery(name = "Pages.findById", query = "SELECT p FROM Pages p WHERE p.id = :id"),
    @NamedQuery(name = "Pages.findByFilename", query = "SELECT p FROM Pages p WHERE p.filename = :filename"),
    @NamedQuery(name = "Pages.findByCreated", query = "SELECT p FROM Pages p WHERE p.created = :created"),
    @NamedQuery(name = "Pages.findBySize", query = "SELECT p FROM Pages p WHERE p.size = :size")})
public class Pages implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "filename")
    private String filename;
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    @Column(name = "size")
    private Integer size;
    @JoinColumn(name = "chapter_id", referencedColumnName = "id")
    @ManyToOne
    private Chapters chapterId;
    @JoinColumn(name = "creator", referencedColumnName = "id")
    @ManyToOne
    private Users creator;

    @Transient
    @XmlTransient
    private String href = "";

    public String getHref() {
        return Config.image_url
                + "/" + chapterId.getComicId().getStub() + "_" + chapterId.getComicId().getUniqid()
                + "/" + chapterId.getStub() + "_" + chapterId.getUniqid()
                + "/" + filename;
    }

    public void setHref(String href) {
        this.href = href;
    }
    public Pages() {
    }

    public Pages(Integer id) {
        this.id = id;
    }

    public Pages(Integer id, String filename) {
        this.id = id;
        this.filename = filename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Chapters getChapterId() {
        return chapterId;
    }

    public void setChapterId(Chapters chapterId) {
        this.chapterId = chapterId;
    }

    public Users getCreator() {
        return creator;
    }

    public void setCreator(Users creator) {
        this.creator = creator;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pages)) {
            return false;
        }
        Pages other = (Pages) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Pages[ id=" + id + " ]";
    }
    
}
