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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author root
 */
@Entity
@Table(name = "user_relation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserRelation.findAll", query = "SELECT u FROM UserRelation u"),
    @NamedQuery(name = "UserRelation.findUserandRef", query = "SELECT u FROM UserRelation u WHERE u.userId.id = :id AND u.userIdRef.id = :id2"),
    @NamedQuery(name = "UserRelation.findAllRef", query = "SELECT u FROM UserRelation u WHERE u.userId.id = :id OR u.userIdRef.id = :id ORDER BY u.relationship"),
    @NamedQuery(name = "UserRelation.findById", query = "SELECT u FROM UserRelation u WHERE u.id = :id"),
    @NamedQuery(name = "UserRelation.findByRelationship", query = "SELECT u FROM UserRelation u WHERE u.relationship = :relationship")})
public class UserRelation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "relationship")
    private String relationship;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    private Users userId;

    @JoinColumn(name = "user_id_ref", referencedColumnName = "id")
    @ManyToOne
    private Users userIdRef;

    public UserRelation() {
    }

    public UserRelation(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    public Users getUserIdRef() {
        return userIdRef;
    }

    public void setUserIdRef(Users userIdRef) {
        this.userIdRef = userIdRef;
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
        if (!(object instanceof UserRelation)) {
            return false;
        }
        UserRelation other = (UserRelation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.UserRelation[ id=" + id + " ]";
    }

}
