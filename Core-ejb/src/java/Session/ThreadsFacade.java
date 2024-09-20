/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Threads;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Administrator
 */
@Stateless
public class ThreadsFacade extends AbstractFacade<Threads> implements ThreadsFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ThreadsFacade() {
        super(Threads.class);
    }
    
    
    @Override
    public Threads findLastOfBox(Integer boxid) {
        javax.persistence.Query q = em.createNativeQuery("SELECT t.* FROM threads t WHERE t.box_id = "
                + boxid
                + " AND t.created = (SELECT MAX(threads.created) FROM threads WHERE threads.box_id = "
                + boxid
                + ")", Threads.class);

        List<Threads> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    
    
    @Override
    public int countByBox(int id) {
        javax.persistence.Query q = em.createNativeQuery("SELECT count(t.*) FROM threads t WHERE t.box_id = " + id);
        int count = ((Long) q.getSingleResult()).intValue();
        return count;
    }

    @Override
    public List<Threads> findByBox(int id) {
        javax.persistence.Query q
                = em.createNativeQuery("SELECT t.*, MAX(p.created) as max FROM  threads t, posts p WHERE (t.id = p.thread_id) AND t.box_id = "
                        + id
                        + " GROUP BY t.id, p.thread_id ORDER BY t.sticky DESC, max DESC", Threads.class);
        return q.getResultList();
    }

    @Override
    public List<Threads> findRangeByBox(int id, int first, int max) {
        javax.persistence.Query q
                = em.createNativeQuery("SELECT t.*, MAX(p.created) as max FROM  threads t, posts p WHERE (t.id = p.thread_id) AND t.box_id = "
                        + id
                        + " GROUP BY t.id, p.thread_id ORDER BY t.sticky DESC, max DESC", Threads.class);
        q.setMaxResults(max);
        q.setFirstResult(first);
        return q.getResultList();
    }

}
