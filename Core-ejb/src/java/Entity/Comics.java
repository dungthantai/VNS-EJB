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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.*;

/**
 *
 * @author root
 */
@Entity
@Table(name = "comics")
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@NamedQueries({
    @NamedQuery(name = "Comics.findAll", query = "SELECT c FROM Comics c"),
    @NamedQuery(name = "Comics.findAllAlphabet", query = "SELECT c FROM Comics c ORDER BY c.name ASC"),
    @NamedQuery(name = "Comics.findAllNew", query = "SELECT c FROM Comics c ORDER BY c.created DESC"),
    @NamedQuery(name = "Comics.findAllHot", query = "SELECT c FROM Comics c ORDER BY c.viewed DESC"),
    @NamedQuery(name = "Comics.findById", query = "SELECT c FROM Comics c WHERE c.id = :id"),
    @NamedQuery(name = "Comics.findByName", query = "SELECT c FROM Comics c WHERE c.name = :name"),
    @NamedQuery(name = "Comics.findByStub", query = "SELECT c FROM Comics c WHERE c.stub = :stub"),
    @NamedQuery(name = "Comics.findByUniqid", query = "SELECT c FROM Comics c WHERE c.uniqid = :uniqid"),
    @NamedQuery(name = "Comics.findByAuthor", query = "SELECT c FROM Comics c WHERE c.author = :author"),
    @NamedQuery(name = "Comics.findByDescription", query = "SELECT c FROM Comics c WHERE c.description = :description"),
    @NamedQuery(name = "Comics.findByThumbnail", query = "SELECT c FROM Comics c WHERE c.thumbnail = :thumbnail"),
    @NamedQuery(name = "Comics.findByCustomchapter", query = "SELECT c FROM Comics c WHERE c.customchapter = :customchapter"),
    @NamedQuery(name = "Comics.findByHidden", query = "SELECT c FROM Comics c WHERE c.hidden = :hidden"),
    @NamedQuery(name = "Comics.findByAdult", query = "SELECT c FROM Comics c WHERE c.adult = :adult"),
    @NamedQuery(name = "Comics.findByCreated", query = "SELECT c FROM Comics c WHERE c.created = :created"),
    @NamedQuery(name = "Comics.findByChecked", query = "SELECT c FROM Comics c WHERE c.checked = :checked"),
    @NamedQuery(name = "Comics.findByViewed", query = "SELECT c FROM Comics c WHERE c.viewed = :viewed"),
    @NamedQuery(name = "Comics.findByArtist", query = "SELECT c FROM Comics c WHERE c.artist = :artist")})
public class Comics implements Serializable {

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
    @XmlTransient
    private String stub;
    @Size(max = 2147483647)
    @Column(name = "uniqid")
    @XmlTransient
    private String uniqid;
    @Size(max = 2147483647)
    @Column(name = "author")
    private String author;
    @Size(max = 2147483647)
    @Column(name = "description")
    private String description;
    @Size(max = 2147483647)
    @Column(name = "thumbnail")
    @XmlTransient
    private String thumbnail;
    @Size(max = 2147483647)
    @Column(name = "customchapter")
    @XmlTransient
    private String customchapter;
    @Column(name = "hidden")
    @XmlTransient
    private Boolean hidden;
    @Column(name = "adult")
    private Boolean adult;
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    @XmlTransient
    private Date created;
    @Column(name = "checked")
    @XmlTransient
    private Boolean checked;
    @Column(name = "viewed")
    private Integer viewed;
    @Size(max = 2147483647)
    @Column(name = "artist")
    @XmlTransient
    private String artist;
    @OneToMany(mappedBy = "comicId")
    @XmlTransient
    private List<Bookmarks> bookmarksList;
    @OneToMany(mappedBy = "comicId")
    @OrderBy("volume DESC, chapter DESC, subchapter DESC")
    @XmlTransient
    private List<Chapters> chaptersList;
    @OneToMany(mappedBy = "comicId")
    @OrderBy("genre ASC")
    @XmlTransient
    private List<Genres> genresList;
    @JoinColumn(name = "creator", referencedColumnName = "id")
    @ManyToOne
    @XmlTransient
    private Users creator;
    
    
    @Transient
    @XmlTransient
    private String thumb_url = "";
    @Transient
    @XmlTransient
    private String href = "";
    @Transient
    @XmlTransient
    private int latest_chapter_id = 0;
    @Transient
    @XmlTransient
    private String latest_chapter_title = "";
    @Transient
    @XmlTransient
    private Chapters latest_chapter;

    public Comics() {
    }

    
    public Comics(Integer id) {
        this.id = id;
    }

    public Comics(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public Chapters getLatest_chapter() {
        return chaptersList.get(0);
    }

    @XmlElement
    public int getLatest_chapter_id() {
        return chaptersList.get(0).getId();
    }
    @XmlElement
    public String getLatest_chapter_title() {
        try {
            Chapters c = chaptersList.get(0);
            return c.getTitle();
        } catch (Exception e) {
            return null;
        }
    }

    @XmlElement
    public String getThumb_url() {
        return Config.image_direct + stub + "_" + uniqid + "/thumb_" + thumbnail;
    }

    public void setThumb_url(String thumb_url) {
        this.thumb_url = thumb_url;
    }

    @XmlElement
    public String getHref() {
        return Config.site_truyen + "series/" + stub;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getUrl() {
        return "<a href=\"" + getHref() +"\">"+ name+"</a>";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Genres> getGenresList() {
        return genresList;
    }

    public void setGenresList(List<Genres> genresList) {
        this.genresList = genresList;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getCustomchapter() {
        return customchapter;
    }

    public void setCustomchapter(String customchapter) {
        this.customchapter = customchapter;
    }

    public Boolean getHidden() {
        return hidden;
    }

    public void setHidden(Boolean hidden) {
        this.hidden = hidden;
    }

    public Boolean getAdult() {
        return adult;
    }

    public void setAdult(Boolean adult) {
        this.adult = adult;
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

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    @XmlTransient
    public List<Bookmarks> getBookmarksList() {
        return bookmarksList;
    }

    public void setBookmarksList(List<Bookmarks> bookmarksList) {
        this.bookmarksList = bookmarksList;
    }

    @XmlTransient
    public List<Chapters> getChaptersList() {
        return chaptersList;
    }

    public void setChaptersList(List<Chapters> chaptersList) {
        this.chaptersList = chaptersList;
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
        if (!(object instanceof Comics)) {
            return false;
        }
        Comics other = (Comics) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Comics[ id=" + id + " ]";
    }

}
