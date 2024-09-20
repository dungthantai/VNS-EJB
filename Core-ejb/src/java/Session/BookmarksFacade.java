/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Bookmarks;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author root
 */
@Stateless
public class BookmarksFacade extends AbstractFacade<Bookmarks> implements BookmarksFacadeLocal {
    @PersistenceContext(unitName = "Core-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BookmarksFacade() {
        super(Bookmarks.class);
    }
    
}
