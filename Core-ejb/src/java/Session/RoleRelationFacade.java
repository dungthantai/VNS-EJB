/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.RoleRelation;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Administrator
 */
@Stateless
public class RoleRelationFacade extends AbstractFacade<RoleRelation> implements RoleRelationFacadeLocal {

    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RoleRelationFacade() {
        super(RoleRelation.class);
    }


}
