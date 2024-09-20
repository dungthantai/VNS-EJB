/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Chapters;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author root
 */
@Local
public interface ChaptersFacadeLocal {

    void create(Chapters chapters);

    void edit(Chapters chapters);

    void remove(Chapters chapters);

    Chapters find(Object id);

    List<Chapters> findAll();

    List<Chapters> findRange(int[] range);

    int count();
    
    List<Chapters> findAllNew();
    
    Chapters findByVCS(String[] cvs);
    
}
