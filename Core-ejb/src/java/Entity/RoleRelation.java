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
@Table(name = "role_relation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RoleRelation.findAll", query = "SELECT r FROM RoleRelation r"),
    @NamedQuery(name = "RoleRelation.findById", query = "SELECT r FROM RoleRelation r WHERE r.id = :id")})
public class RoleRelation implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "group_id", referencedColumnName = "id")
    @ManyToOne
    private Groups groupId;
    @JoinColumn(name = "permission_id", referencedColumnName = "id")
    @ManyToOne
    private Permissions permissionId;

    public RoleRelation() {
    }

    public RoleRelation(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Groups getGroupId() {
        return groupId;
    }

    public void setGroupId(Groups groupId) {
        this.groupId = groupId;
    }

    public Permissions getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Permissions permissionId) {
        this.permissionId = permissionId;
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
        if (!(object instanceof RoleRelation)) {
            return false;
        }
        RoleRelation other = (RoleRelation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.RoleRelation[ id=" + id + " ]";
    }
    
}
