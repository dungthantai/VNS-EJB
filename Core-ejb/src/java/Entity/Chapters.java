/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import Config.Config;
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
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author root
 */
@Entity
@Table(name = "chapters")
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@NamedQueries({
    //select * from chapters where created IN (SELECT MAX(created) FROM chapters GROUP BY comic_id) order by created desc
    @NamedQuery(name = "Chapters.findAll", query = "SELECT c FROM Chapters c"),
    @NamedQuery(name = "Chapters.findAllNew", query = "SELECT c FROM Chapters c WHERE c.created IN (SELECT MAX(cx.created) FROM Chapters cx GROUP BY cx.comicId.id) ORDER BY c.created DESC"),
    @NamedQuery(name = "Chapters.findLastChapterByComicId", query = "SELECT c FROM Chapters c WHERE c.comicId.id = :id"),
    @NamedQuery(name = "Chapters.findById", query = "SELECT c FROM Chapters c WHERE c.id = :id"),
    @NamedQuery(name = "Chapters.findByVCS", query = "SELECT c FROM Chapters c WHERE c.comicId.stub = :stub AND c.language = :language AND c.volume = :volume AND c.chapter = :chapter AND c.subchapter = :subchapter"),
    @NamedQuery(name = "Chapters.findByChapter", query = "SELECT c FROM Chapters c WHERE c.chapter = :chapter"),
    @NamedQuery(name = "Chapters.findBySubchapter", query = "SELECT c FROM Chapters c WHERE c.subchapter = :subchapter"),
    @NamedQuery(name = "Chapters.findByVolume", query = "SELECT c FROM Chapters c WHERE c.volume = :volume"),
    @NamedQuery(name = "Chapters.findByLanguage", query = "SELECT c FROM Chapters c WHERE c.language = :language"),
    @NamedQuery(name = "Chapters.findByName", query = "SELECT c FROM Chapters c WHERE c.name = :name"),
    @NamedQuery(name = "Chapters.findByStub", query = "SELECT c FROM Chapters c WHERE c.stub = :stub"),
    @NamedQuery(name = "Chapters.findByUniqid", query = "SELECT c FROM Chapters c WHERE c.uniqid = :uniqid"),
    @NamedQuery(name = "Chapters.findByCreated", query = "SELECT c FROM Chapters c WHERE c.created = :created"),
    @NamedQuery(name = "Chapters.findByChecked", query = "SELECT c FROM Chapters c WHERE c.checked = :checked"),
    @NamedQuery(name = "Chapters.findByViewed", query = "SELECT c FROM Chapters c WHERE c.viewed = :viewed")})
public class Chapters implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "chapter")
    @XmlTransient
    private Integer chapter;
    @Column(name = "subchapter")
    @XmlTransient
    private Integer subchapter;
    @Column(name = "volume")
    @XmlTransient
    private Integer volume;
    @Size(max = 2147483647)
    @Column(name = "language")
    @XmlTransient
    private String language;
    @Size(max = 2147483647)
    @Column(name = "name")
    private String name;
    @Size(max = 2147483647)
    @Column(name = "stub")
    @XmlTransient
    private String stub;
    @Size(max = 2147483647)
    @Column(name = "uniqid")
    @XmlTransient
    private String uniqid;
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    @XmlTransient
    private Date created;
    @Column(name = "checked")
    @XmlTransient
    private Boolean checked;
    @Column(name = "hidden")
    @XmlTransient
    private Boolean hidden;

    @Column(name = "viewed")
    private Integer viewed;
    @OneToMany(mappedBy = "chapterId")
    @OrderBy("filename ASC")
    @XmlTransient
    private List<Pages> pagesList;
    @JoinColumn(name = "comic_id", referencedColumnName = "id")
    @ManyToOne
    @XmlTransient
    private Comics comicId;
    @JoinColumn(name = "team_id", referencedColumnName = "id")
    @ManyToOne
    @XmlTransient
    private Teams teamId;
    @JoinColumn(name = "creator", referencedColumnName = "id")
    @ManyToOne
    @XmlTransient
    private Users creator;

    @Transient
    @XmlTransient
    private String href = "";

    public String getHref() {
        return Config.site_truyen + "read"
                + "/" + comicId.getStub()
                + "/" + language
                + "/" + volume
                + "/" + chapter
                + "/" + subchapter;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getUrl() {
        return "<a href=\"" + getHref() + "\">" + getTitle() + "</a>";
    }

    public String getTitle() {
        return (this.volume.equals(0) ? "" : "Volume " + this.volume + " ")
                + (this.chapter.equals(0)
                        ? this.name
                        : "Chapter "
                        + this.getChapter() + (this.subchapter.equals(0) ? "" : this.subchapter)
                        + (this.name.equals("") ? "" : " : ") + this.name);
    }

    public Chapters next() {
        int index = 0;
        for (Chapters ch : comicId.getChaptersList()) {
            if (id.equals(ch.id)) {
                if (null != comicId.getChaptersList().get(index - 1)) {
                    return comicId.getChaptersList().get(index - 1);
                }
            }
            index++;
        }
        return null;
    }

    public Chapters prev() {
        int index = 0;
        for (Chapters ch : comicId.getChaptersList()) {
            if (id.equals(ch.id)) {
                if (null != comicId.getChaptersList().get(index + 1)) {
                    return comicId.getChaptersList().get(index + 1);
                }
            }
            index++;
        }
        return null;
    }

    public Chapters() {
    }

    public Chapters(Integer id) {
        this.id = id;
    }

    public Boolean getHidden() {
        return hidden;
    }

    public void setHidden(Boolean hidden) {
        this.hidden = hidden;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getChapter() {
        return chapter;
    }

    public void setChapter(Integer chapter) {
        this.chapter = chapter;
    }

    public Integer getSubchapter() {
        return subchapter;
    }

    public void setSubchapter(Integer subchapter) {
        this.subchapter = subchapter;
    }

    public Integer getVolume() {
        return volume;
    }

    public void setVolume(Integer volume) {
        this.volume = volume;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
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

    public String getUniqid() {
        return uniqid;
    }

    public void setUniqid(String uniqid) {
        this.uniqid = uniqid;
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

    public Integer getViewed() {
        return viewed;
    }

    public void setViewed(Integer viewed) {
        this.viewed = viewed;
    }

    @XmlTransient
    public List<Pages> getPagesList() {
        return pagesList;
    }

    public void setPagesList(List<Pages> pagesList) {
        this.pagesList = pagesList;
    }

    public Comics getComicId() {
        return comicId;
    }

    public void setComicId(Comics comicId) {
        this.comicId = comicId;
    }

    public Teams getTeamId() {
        return teamId;
    }

    public void setTeamId(Teams teamId) {
        this.teamId = teamId;
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
        if (!(object instanceof Chapters)) {
            return false;
        }
        Chapters other = (Chapters) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Chapters[ id=" + id + " ]";
    }

}
