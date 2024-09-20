/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.UserRelation;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface UserRelationFacadeLocal {

    void create(UserRelation userRelation);

    void edit(UserRelation userRelation);

    void remove(UserRelation userRelation);

    UserRelation find(Object id);

    List<UserRelation> findAll();

    List<UserRelation> findRange(int[] range);

    int count();

    String woo(int id, String username);
    
    List<UserRelation> controlPanelUserRelation(int id);
    
    boolean editRelation(int id, int id2, String str);
}
