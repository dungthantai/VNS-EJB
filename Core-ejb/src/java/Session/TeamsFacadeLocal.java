/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Teams;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface TeamsFacadeLocal {

    void create(Teams teams);

    void edit(Teams teams);

    void remove(Teams teams);

    Teams find(Object id);

    List<Teams> findAll();

    List<Teams> findRange(int[] range);

    int count();
    
}
