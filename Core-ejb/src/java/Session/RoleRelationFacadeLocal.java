/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.RoleRelation;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Administrator
 */
@Local
public interface RoleRelationFacadeLocal {

    void create(RoleRelation roleRelation);

    void edit(RoleRelation roleRelation);

    void remove(RoleRelation roleRelation);

    RoleRelation find(Object id);

    List<RoleRelation> findAll();

    List<RoleRelation> findRange(int[] range);

    int count();
    
}
