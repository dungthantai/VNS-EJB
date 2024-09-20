/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.RoleRelation;
import Entity.UserRelation;
import Entity.Users;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author root
 */
@Stateless
public class UserRelationFacade extends AbstractFacade<UserRelation> implements UserRelationFacadeLocal {

    @EJB
    private UsersFacadeLocal usersFacade;
    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserRelationFacade() {
        super(UserRelation.class);
    }

    public String woo(int id, String username) {
        Users u = usersFacade.find(id);

        if (Integer.parseInt(u.getReputation()) <= 1000) {
            return "het rep nhe cung";
        }

        Users u2 = usersFacade.findByUserName(username);
        if (null == u2) {
            return "d co ai";
        }

        usersFacade.editRep(id, "-1000");

        UserRelation ur = new UserRelation();
        ur.setUserId(u);
        ur.setUserIdRef(u2);
        ur.setRelationship("woo");
        em.persist(ur);

        return "Ban da cau hon " + username;
    }

    @Override
    public boolean editRelation(int id, int id2, String str) {
        try {
            Query q = em.createNamedQuery("UserRelation.findUserandRef");
            q.setParameter("id", id);
            q.setParameter("id2", id2);
            UserRelation ur = (UserRelation) q.getSingleResult();
            ur.setRelationship(str);

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<UserRelation> controlPanelUserRelation(int id) {
        Query q = em.createNamedQuery("UserRelation.findAllRef");
        q.setParameter("id", id);
        return q.getResultList();
    }
}
