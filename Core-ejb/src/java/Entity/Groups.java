/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "groups")
@XmlRootElement
@NamedNativeQuery(name = "Groups.isSetPermission", query = "SELECT COUNT(p) FROM Users u, Groups g, Role_Relation r, Permissions p "
        + "WHERE u.id = ? AND u.group_Id = g.id AND g.id = r.group_Id AND r.permission_Id = p.id AND p.name = ?")
@NamedQueries({
    @NamedQuery(name = "Groups.findAll", query = "SELECT g FROM Groups g"),
    //@NamedQuery(name = "Groups.isSetPermission", query = "SELECT COUNT(p) FROM Users u, Groups g, RoleRelation r, Permissions p WHERE u.id = :id AND u.groupId.id = g.id AND g.id = r.groupId.id AND r.permissionId.id = p.id AND p.name = :name"),
    @NamedQuery(name = "Groups.findById", query = "SELECT g FROM Groups g WHERE g.id = :id"),
    @NamedQuery(name = "Groups.findByName", query = "SELECT g FROM Groups g WHERE g.name = :name")})
public class Groups implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "name")
    private String name;
    @OneToMany(mappedBy = "groupId")
    private List<RoleRelation> roleRelationList;
    @OneToMany(mappedBy = "groupId")
    private List<Users> usersList;

    public Groups() {
    }

    public Groups(Integer id) {
        this.id = id;
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

    @XmlTransient
    public List<RoleRelation> getRoleRelationList() {
        return roleRelationList;
    }

    public void setRoleRelationList(List<RoleRelation> roleRelationList) {
        this.roleRelationList = roleRelationList;
    }

    @XmlTransient
    public List<Users> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<Users> usersList) {
        this.usersList = usersList;
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
        if (!(object instanceof Groups)) {
            return false;
        }
        Groups other = (Groups) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Groups[ id=" + id + " ]";
    }

}
