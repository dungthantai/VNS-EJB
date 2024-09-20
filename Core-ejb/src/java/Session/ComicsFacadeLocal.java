/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Comics;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface ComicsFacadeLocal {

    void create(Comics comics);

    void edit(Comics comics);

    void remove(Comics comics);

    Comics find(Object id);

    List<Comics> findAll();

    List<Comics> findRange(int[] range);

    int count();

    List<Comics> findAllAlphabet();

    List<Comics> findAllNew();

    List<Comics> findAllHot();
    
    public Comics findByStub(String stub);
}
