/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author root
 */
@Entity
@Table(name = "teams")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Teams.findAll", query = "SELECT t FROM Teams t"),
    @NamedQuery(name = "Teams.findById", query = "SELECT t FROM Teams t WHERE t.id = :id"),
    @NamedQuery(name = "Teams.findByName", query = "SELECT t FROM Teams t WHERE t.name = :name"),
    @NamedQuery(name = "Teams.findByStub", query = "SELECT t FROM Teams t WHERE t.stub = :stub"),
    @NamedQuery(name = "Teams.findByUrl", query = "SELECT t FROM Teams t WHERE t.url = :url"),
    @NamedQuery(name = "Teams.findByCreated", query = "SELECT t FROM Teams t WHERE t.created = :created"),
    @NamedQuery(name = "Teams.findByChecked", query = "SELECT t FROM Teams t WHERE t.checked = :checked")})
public class Teams implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "name")
    private String name;
    @Size(max = 2147483647)
    @Column(name = "stub")
    private String stub;
    @Size(max = 2147483647)
    @Column(name = "url")
    private String url;
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    @Column(name = "checked")
    private Boolean checked;
    @JoinColumn(name = "creator", referencedColumnName = "id")
    @ManyToOne
    private Users creator;
    @OneToMany(mappedBy = "teamId")
    private List<Chapters> chaptersList;
    @OneToMany(mappedBy = "teamId")
    private List<Memberships> membershipsList;

    public Teams() {
    }

    public Teams(Integer id) {
        this.id = id;
    }

    public Teams(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStub() {
        return stub;
    }

    public void setStub(String stub) {
        this.stub = stub;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Users getCreator() {
        return creator;
    }

    public void setCreator(Users creator) {
        this.creator = creator;
    }

    @XmlTransient
    public List<Chapters> getChaptersList() {
        return chaptersList;
    }

    public void setChaptersList(List<Chapters> chaptersList) {
        this.chaptersList = chaptersList;
    }

    @XmlTransient
    public List<Memberships> getMembershipsList() {
        return membershipsList;
    }

    public void setMembershipsList(List<Memberships> membershipsList) {
        this.membershipsList = membershipsList;
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
        if (!(object instanceof Teams)) {
            return false;
        }
        Teams other = (Teams) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Teams[ id=" + id + " ]";
    }
    
}
