/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Comics;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author root
 */
@Stateless
public class ComicsFacade extends AbstractFacade<Comics> implements ComicsFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ComicsFacade() {
        super(Comics.class);
    }

    @Override
    public List<Comics> findAllAlphabet() {
        javax.persistence.Query q = em.createNamedQuery("Comics.findAllAlphabet");
        return q.getResultList();
    }

    @Override
    public List<Comics> findAllNew() {
        javax.persistence.Query q = em.createNamedQuery("Comics.findAllNew");
        return q.getResultList();
    }

    @Override
    public List<Comics> findAllHot() {
        javax.persistence.Query q = em.createNamedQuery("Comics.findAllHot");
        return q.getResultList();
    }

    @Override
    public Comics findByStub(String stub) {
        javax.persistence.Query q = em.createNamedQuery("Comics.findByStub");
        q.setParameter("stub", stub);
        return (Comics) q.getSingleResult();
    }

}
