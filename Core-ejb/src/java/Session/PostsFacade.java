/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Posts;
import Entity.Threads;
import Entity.Users;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Administrator
 */
@Stateless
public class PostsFacade extends AbstractFacade<Posts> implements PostsFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostsFacade() {
        super(Posts.class);
    }


    @Override
    public boolean editContent(int id, String content, int userUpdate) {
        try {
            Posts p = find(id);
            p.setContent(content);
            p.setUserUpdated(new Users(userUpdate));
            p.setUpdated(new Date());
            return true;
        } catch (Exception e) {
            return false;
        }
    }

//    @Override
//    public Posts findLastOfBox(Integer boxid) {
//        javax.persistence.Query q = em.createNativeQuery("SELECT p.* FROM posts p, threads t WHERE p.thread_id = t.id AND t.box_id = "
//                + boxid
//                + " AND p.created = (SELECT MAX(posts.created) FROM posts, threads WHERE posts.thread_id = threads.id AND threads.box_id = "
//                + boxid
//                + ")", Posts.class);
//
//        List<Posts> results = q.getResultList();
//        return results.isEmpty() ? null : results.get(0);
//    }
//
//    @Override
//    public Posts findLastOfThread(Integer threadid) {
//        javax.persistence.Query q = em.createNativeQuery("SELECT p.* FROM posts p WHERE p.thread_id = "
//                + threadid
//                + " AND p.created = (SELECT MAX(posts.created) FROM posts WHERE posts.thread_id = "
//                + threadid
//                + ")", Posts.class);
//
//        List<Posts> results = q.getResultList();
//        return results.isEmpty() ? null : results.get(0);
//    }
//    @Override
//    public int countByBox(int id) {
//        javax.persistence.Query q = em.createNativeQuery("SELECT count(p.*) FROM posts p, threads t WHERE p.thread_id = t.id AND t.box_id = " + id);
//        int count = ((Long) q.getSingleResult()).intValue();
//        return count;
//    }
    @Override
    public int countByThread(int id) {
        javax.persistence.Query q = em.createNativeQuery("SELECT count(p.*) FROM posts p WHERE p.thread_id = " + id);
        int count = ((Long) q.getSingleResult()).intValue();
        return count;
    }
//    @Override
//    public List<Posts> findByThread(int id) {
//        javax.persistence.Query q
//                = em.createNativeQuery("SELECT p.* FROM posts p WHERE p.thread_id = "
//                        + id
//                        + " ORDER BY p.created", Posts.class);
//        return q.getResultList();
//    }
    @Override
    public List<Posts> findRangeByThread(int id, int first, int max) {
        javax.persistence.Query q
                = em.createNativeQuery("SELECT p.* FROM posts p WHERE p.thread_id = "
                        + id
                        + " ORDER BY p.created", Posts.class);
        q.setMaxResults(max);
        q.setFirstResult(first);
        return q.getResultList();
    }
}
