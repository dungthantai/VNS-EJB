/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Chats;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Administrator
 */
@Stateless
public class ChatsFacade extends AbstractFacade<Chats> implements ChatsFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ChatsFacade() {
        super(Chats.class);
    }

    @Override
    public List<Chats> findBySender(int id) {

        javax.persistence.Query q = em.createNativeQuery("SELECT c.* FROM chats c WHERE c.user_send_id = " + id + " ORDER BY c.created DESC", Chats.class);
        return q.getResultList();
    }

    @Override
    public List<Chats> findByReceived(int id) {

        javax.persistence.Query q = em.createNativeQuery("SELECT c.* FROM chats c WHERE c.user_receive_id = " + id + " ORDER BY c.created DESC", Chats.class
        );
        return q.getResultList();
    }

    @Override
    public List<Chats> findRangeByReceived(int id, int first, int max) {
        javax.persistence.Query q = em.createNativeQuery("SELECT c.* FROM chats c WHERE c.user_receive_id = " + id + " ORDER BY c.created DESC", Chats.class);
        q.setMaxResults(max);
        q.setFirstResult(first);
        return q.getResultList();
    }
    
    
    @Override
    public List<Chats> findRangeBySender(int id, int first, int max) {
        javax.persistence.Query q = em.createNativeQuery("SELECT c.* FROM chats c WHERE c.user_send_id = " + id + " ORDER BY c.created DESC", Chats.class);
        q.setMaxResults(max);
        q.setFirstResult(first);
        return q.getResultList();
    }

    @Override
    public int countByRecived(int id) {
        javax.persistence.Query q = em.createNativeQuery("SELECT count(c.*) FROM chats c WHERE c.user_receive_id = " + id);
        int count = ((Long) q.getSingleResult()).intValue();
        return count;
    }

    
}
