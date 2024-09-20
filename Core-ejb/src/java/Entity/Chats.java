/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import Process.BBcodeParser;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "chats")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Chats.findAll", query = "SELECT c FROM Chats c"),
    @NamedQuery(name = "Chats.findById", query = "SELECT c FROM Chats c WHERE c.id = :id"),
    @NamedQuery(name = "Chats.findByContent", query = "SELECT c FROM Chats c WHERE c.content = :content"),
    @NamedQuery(name = "Chats.findByCreated", query = "SELECT c FROM Chats c WHERE c.created = :created"),
    @NamedQuery(name = "Chats.findByUpdated", query = "SELECT c FROM Chats c WHERE c.updated = :updated")})
public class Chats implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "content")
    private String content;
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    @Column(name = "updated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updated;
    @JoinColumn(name = "user_send_id", referencedColumnName = "id")
    @ManyToOne
    private Users userSendId;
    @JoinColumn(name = "user_receive_id", referencedColumnName = "id")
    @ManyToOne
    private Users userReceiveId;
    @JoinColumn(name = "user_updated", referencedColumnName = "id")
    @ManyToOne
    private Users userUpdated;
    
    @Column(name = "is_private")
    private Boolean isPrivate;

    public Boolean getIsPrivate() {
        return isPrivate;
    }

    public void setIsPrivate(Boolean isPrivate) {
        this.isPrivate = isPrivate;
    }

    public Chats() {
    }

    public Chats(Integer id) {
        this.id = id;
    }

    public Chats(Integer id, String content) {
        this.id = id;
        this.content = content;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        BBcodeParser bbp = new BBcodeParser();
        return bbp.convert(content);
    }

    public void setContent(String content) {
        this.content = content;
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

    public Users getUserSendId() {
        return userSendId;
    }

    public void setUserSendId(Users userSendId) {
        this.userSendId = userSendId;
    }

    public Users getUserReceiveId() {
        return userReceiveId;
    }

    public void setUserReceiveId(Users userReceiveId) {
        this.userReceiveId = userReceiveId;
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
        if (!(object instanceof Chats)) {
            return false;
        }
        Chats other = (Chats) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Entity.Chats[ id=" + id + " ]";
    }
    
}
