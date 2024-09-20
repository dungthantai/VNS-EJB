/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Genres;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface GenresFacadeLocal {

    void create(Genres genres);

    void edit(Genres genres);

    void remove(Genres genres);

    Genres find(Object id);

    List<Genres> findAll();

    List<Genres> findRange(int[] range);

    int count();
    
}
