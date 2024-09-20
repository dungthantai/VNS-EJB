/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author root
 */
@Entity
@Table(name = "bookmarks")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bookmarks.findAll", query = "SELECT b FROM Bookmarks b"),
    @NamedQuery(name = "Bookmarks.findById", query = "SELECT b FROM Bookmarks b WHERE b.id = :id"),
    @NamedQuery(name = "Bookmarks.findByChecked", query = "SELECT b FROM Bookmarks b WHERE b.checked = :checked")})
public class Bookmarks implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "checked")
    private Boolean checked;
    @JoinColumn(name = "comic_id", referencedColumnName = "id")
    @ManyToOne
    private Comics comicId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    private Users userId;

    public Bookmarks() {
    }

    public Bookmarks(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Comics getComicId() {
        return comicId;
    }

    public void setComicId(Comics comicId) {
        this.comicId = comicId;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
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
        if (!(object instanceof Bookmarks)) {
            return false;
        }
        Bookmarks other = (Bookmarks) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Bookmarks[ id=" + id + " ]";
    }
    
}
