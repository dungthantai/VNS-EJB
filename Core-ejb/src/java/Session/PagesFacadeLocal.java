/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Pages;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface PagesFacadeLocal {

    void create(Pages pages);

    void edit(Pages pages);

    void remove(Pages pages);

    Pages find(Object id);

    List<Pages> findAll();

    List<Pages> findRange(int[] range);

    int count();
    
}
