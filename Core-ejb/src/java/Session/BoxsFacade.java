/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Boxs;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Administrator
 */
@Stateless
public class BoxsFacade extends AbstractFacade<Boxs> implements BoxsFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BoxsFacade() {
        super(Boxs.class);
    }

    @Override
    public List<Boxs> findAllOrderByOrOrdinal() {
        javax.persistence.Query q = em.createNamedQuery("Boxs.findAllOrderByOrOrdinal");
        return q.getResultList();
    }

    @Override
    public List<Boxs> findAllSubboxOrderByOrOrdinal(Integer intbox) {
        Boxs box = find(intbox);
        javax.persistence.Query q = em.createNativeQuery("SELECT * FROM Boxs WHERE location <@ '" + box.getLocation() + "' ORDER BY location;", Boxs.class);
        //q.setParameter("code", box.getLocation());
        return q.getResultList();
    }

    @Override
    public List<Boxs> getTreeDirectory(Integer intbox) {
        Boxs box = find(intbox);
        javax.persistence.Query q = em.createNativeQuery("SELECT * FROM Boxs WHERE location @> '" + box.getLocation() + "' ORDER BY location;", Boxs.class);
        //q.setParameter("code", box.getLocation());
        return q.getResultList();
    }

}
