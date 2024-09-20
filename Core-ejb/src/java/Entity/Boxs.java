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
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Persistence;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "boxs")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Boxs.findAll", query = "SELECT b FROM Boxs b"),
    @NamedQuery(name = "Boxs.findById", query = "SELECT b FROM Boxs b WHERE b.id = :id"),
    @NamedQuery(name = "Boxs.findAllOrderByOrOrdinal", query = "SELECT b FROM Boxs b ORDER BY b.location"),
    @NamedQuery(name = "Boxs.findByTitle", query = "SELECT b FROM Boxs b WHERE b.title = :title"),
    @NamedQuery(name = "Boxs.findByDescription", query = "SELECT b FROM Boxs b WHERE b.description = :description"),
    @NamedQuery(name = "Boxs.findByCreated", query = "SELECT b FROM Boxs b WHERE b.created = :created"),
    @NamedQuery(name = "Boxs.findByTreelevel", query = "SELECT b FROM Boxs b WHERE b.treelevel = :treelevel")})
public class Boxs implements Serializable {

    @Lob
    @Column(name = "location")
    private String location;

    @OneToMany(mappedBy = "boxId")
    @OrderBy("sticky DESC")
    private List<Threads> threadsList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "title")
    private String title;
    @Size(max = 2147483647)
    @Column(name = "description")
    private String description;
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    @Column(name = "treelevel")
    private Integer treelevel;

    public Boxs() {
    }

    public Boxs(Integer id) {
        this.id = id;
    }

    public Boxs(Integer id, String title) {
        this.id = id;
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Integer getTreelevel() {
        return treelevel;
    }

    public void setTreelevel(Integer treelevel) {
        this.treelevel = treelevel;
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
        if (!(object instanceof Boxs)) {
            return false;
        }
        Boxs other = (Boxs) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Boxs[" + "id=" + id + ", title=" + title + ", description=" + description + ", treelevel=" + treelevel + ", location=" + location + ']';
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @XmlTransient
    public List<Threads> getThreadsList() {
        return threadsList;
    }
    public void setThreadsList(List<Threads> threadsList) {
        this.threadsList = threadsList;
    }
    
//    public List<Threads> getRangeThreadsList(int first, int max) {
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("forumPU");
//        EntityManager em = emf.createEntityManager();
//        javax.persistence.Query q
//                = em.createNativeQuery("SELECT t.*, MAX(p.created) as max FROM  threads t, posts p WHERE (t.id = p.thread_id) AND t.box_id = "
//                        + this.id
//                        + " GROUP BY t.id, p.thread_id ORDER BY t.sticky DESC, max DESC", Model.Entity.Threads.class);
//        q.setMaxResults(max);
//        q.setFirstResult(first);
//        return q.getResultList();
//    }

    public Posts getLastPost() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Core-ejbPU");
        EntityManager em = emf.createEntityManager();
        javax.persistence.Query q = em.createNativeQuery("SELECT p.* FROM posts p, threads t WHERE p.thread_id = t.id AND t.box_id = "
                + this.id
                + " AND p.created = (SELECT MAX(posts.created) FROM posts, threads WHERE posts.thread_id = threads.id AND threads.box_id = "
                + this.id
                + ")", Posts.class);

        List<Posts> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    

    public int countThreads() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Core-ejbPU");
        EntityManager em = emf.createEntityManager();
        javax.persistence.Query q = em.createNativeQuery("SELECT count(t.*) FROM threads t WHERE t.box_id = " + this.id);
        int count = ((Long) q.getSingleResult()).intValue();
        return count;
    }

    public int countPosts() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Core-ejbPU");
        EntityManager em = emf.createEntityManager();
        javax.persistence.Query q = em.createNativeQuery("SELECT count(p.*) FROM posts p, threads t WHERE p.thread_id = t.id AND t.box_id = " + this.id);
        int count = ((Long) q.getSingleResult()).intValue();
        return count;
    }

}
