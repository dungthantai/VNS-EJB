/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Threads;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Administrator
 */
@Local
public interface ThreadsFacadeLocal {

    void create(Threads threads);

    void edit(Threads threads);

    void remove(Threads threads);

    Threads find(Object id);

    List<Threads> findAll();

    List<Threads> findRange(int[] range);

    int count();

    Threads findLastOfBox(Integer boxid);

    int countByBox(int id);

    List<Threads> findByBox(int id);

    List<Threads> findRangeByBox(int id, int first, int max);
}
