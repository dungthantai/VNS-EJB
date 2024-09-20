/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Boxs;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Administrator
 */
@Local
public interface BoxsFacadeLocal {

    void create(Boxs boxs);

    void edit(Boxs boxs);

    void remove(Boxs boxs);

    Boxs find(Object id);

    List<Boxs> findAll();

    List<Boxs> findRange(int[] range);

    int count();

    List<Boxs> findAllOrderByOrOrdinal();

    List<Boxs> findAllSubboxOrderByOrOrdinal(Integer intbox);
    
    List<Boxs> getTreeDirectory(Integer intbox);
}
