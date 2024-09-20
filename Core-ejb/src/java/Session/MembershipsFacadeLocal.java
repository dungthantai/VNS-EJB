/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Memberships;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface MembershipsFacadeLocal {

    void create(Memberships memberships);

    void edit(Memberships memberships);

    void remove(Memberships memberships);

    Memberships find(Object id);

    List<Memberships> findAll();

    List<Memberships> findRange(int[] range);

    int count();
    
}
