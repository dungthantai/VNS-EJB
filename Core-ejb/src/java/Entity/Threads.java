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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "threads")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Threads.findAll", query = "SELECT t FROM Threads t"),
    @NamedQuery(name = "Threads.findById", query = "SELECT t FROM Threads t WHERE t.id = :id"),
    @NamedQuery(name = "Threads.findByBoxId", query = "SELECT t FROM Threads t WHERE t.boxId = :boxId"),
    @NamedQuery(name = "Threads.findByTitle", query = "SELECT t FROM Threads t WHERE t.title = :title"),
    @NamedQuery(name = "Threads.findByCreated", query = "SELECT t FROM Threads t WHERE t.created = :created"),
    @NamedQuery(name = "Threads.findByUpdated", query = "SELECT t FROM Threads t WHERE t.updated = :updated"),
    @NamedQuery(name = "Threads.findBySticky", query = "SELECT t FROM Threads t WHERE t.sticky = :sticky")})
public class Threads implements Serializable {

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
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    @Column(name = "updated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updated;
    @Column(name = "sticky")
    private Boolean sticky;
    @JoinColumn(name = "box_id", referencedColumnName = "id")
    @ManyToOne
    private Boxs boxId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    private Users userId;
    @JoinColumn(name = "user_updated", referencedColumnName = "id")
    @ManyToOne
    private Users userUpdated;
    @OneToMany(mappedBy = "threadId")
    @OrderBy("created DESC")
    private List<Posts> postsList;

    public Threads() {
    }

    public Threads(Integer id) {
        this.id = id;
    }

    public Threads(Integer id, String title) {
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

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Boolean getSticky() {
        return sticky;
    }

    public void setSticky(Boolean sticky) {
        this.sticky = sticky;
    }

    public Boxs getBoxId() {
        return boxId;
    }

    public void setBoxId(Boxs boxId) {
        this.boxId = boxId;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    public Users getUserUpdated() {
        return userUpdated;
    }

    public void setUserUpdated(Users userUpdated) {
        this.userUpdated = userUpdated;
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
        if (!(object instanceof Threads)) {
            return false;
        }
        Threads other = (Threads) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Threads[ id=" + id + " ]";
    }

    @XmlTransient
    public List<Posts> getPostsList() {
        return postsList;
    }
    
    public void setPostsList(List<Posts> postsList) {
        this.postsList = postsList;
    }
    
    public Posts getLastPostofThread() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("forumPU");
        EntityManager em = emf.createEntityManager();
        javax.persistence.Query q = em.createNativeQuery("SELECT p.* FROM posts p WHERE p.thread_id = "
                + this.id
                + " AND p.created = (SELECT MAX(posts.created) FROM posts WHERE posts.thread_id = "
                + this.id
                + ")", Posts.class);

        List<Posts> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
        
//        return null;
    }
    public int countPosts() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("forumPU");
        EntityManager em = emf.createEntityManager();
        javax.persistence.Query q = em.createNativeQuery("SELECT count(p.*) FROM posts p WHERE p.thread_id = " + this.id);
        int count = ((Long) q.getSingleResult()).intValue();
        return count;
    }

}
