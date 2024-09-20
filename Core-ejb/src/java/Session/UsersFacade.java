/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Users;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

/**
 *
 * @author Administrator
 */
@TransactionManagement(value = TransactionManagementType.BEAN)
@Stateless
public class UsersFacade extends AbstractFacade<Users> implements UsersFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Resource
    private UserTransaction transaction;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }

    @Override
    public Users login(String username, String password) {
        javax.persistence.Query q = em.createNamedQuery("Users.login");
        q.setParameter("username", username);
        q.setParameter("password", password);
        try {
            return (Users) q.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Users findByUserName(String username) {
        javax.persistence.Query q = em.createNamedQuery("Users.findByUsername");
        q.setParameter("username", username);
        try {
            return (Users) q.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public String transferRep(int id, String username, String repSt) {
        int rep = Integer.parseInt(repSt);
        if (rep < 0) {
            return "chuyen so am ha bay";
        }
        Users u = find(id);

        if (Integer.parseInt(u.getReputation()) <= (rep * 11 / 10)) {
            return "het rep nhe cung";
        }

        Users u2 = findByUserName(username);
        if (null == u2) {
            return "d co ai";
        }

        try {
            transaction.begin();
            repSt = Integer.toString(Integer.parseInt(u.getReputation()) - (rep * 11 / 10));
            u.setReputation(repSt);

            repSt = Integer.toString(Integer.parseInt(u2.getReputation()) + rep);
            u2.setReputation(repSt);
            transaction.commit();
            return "Thanh cong";
        } catch (Exception e) {
            try {
                transaction.rollback();
            } catch (IllegalStateException | SecurityException | SystemException ex) {
                Logger.getLogger(UsersFacade.class.getName()).log(Level.SEVERE, null, ex);
            }
            return e.toString();
        }
    }

    @Override
    public String editRep(int id, String repSt) {
        try {

            int rep = Integer.parseInt(repSt);
            Users u = find(id);
            repSt = Integer.toString(Integer.parseInt(u.getReputation()) + rep);
            u.setReputation(repSt);

            return "Thanh cong";
        } catch (Exception e) {
            return e.toString();
        }
    }

}
