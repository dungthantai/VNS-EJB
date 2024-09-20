/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Permissions;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Administrator
 */
@Stateless
public class PermissionsFacade extends AbstractFacade<Permissions> implements PermissionsFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PermissionsFacade() {
        super(Permissions.class);
    }
    
    @Override
    public Permissions findByName(String name) {
        javax.persistence.Query q = em.createNamedQuery("Groups.findByName");
        q.setParameter("name", name);

        List<Permissions> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
}
