/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Chapters;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author root
 */
@Stateless
public class ChaptersFacade extends AbstractFacade<Chapters> implements ChaptersFacadeLocal {
    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ChaptersFacade() {
        super(Chapters.class);
    }

    @Override
    public List<Chapters> findAllNew() {
        javax.persistence.Query q = em.createNamedQuery("Chapters.findAllNew");
        return (List<Chapters>) q.getResultList();
    }

    @Override
    public Chapters findByVCS(String[] cvs) {
        javax.persistence.Query q = em.createNamedQuery("Chapters.findByVCS");
        q.setParameter("stub", cvs[0]);
        q.setParameter("language", cvs[1]);        
        q.setParameter("volume", Integer.parseInt(cvs[2]));
        q.setParameter("chapter", Integer.parseInt(cvs[3]));
        q.setParameter("subchapter", Integer.parseInt(cvs[4]));
        q.setMaxResults(1);
        return (Chapters) q.getResultList().get(0);
    }
    
}
