/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Posts;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Administrator
 */
@Local
public interface PostsFacadeLocal {

    void create(Posts posts);

    void edit(Posts posts);

    void remove(Posts posts);

    Posts find(Object id);

    List<Posts> findAll();

    List<Posts> findRange(int[] range);

    int count();

//    List<Posts> findByThread(int id);
//
//    Posts findLastOfBox(Integer id);
//
//    Posts findLastOfThread(Integer id);
    
    List<Posts> findRangeByThread(int id, int first, int max);
    
    boolean editContent(int id, String content, int userUpdate);
    
//    int countByBox(int id);
//    
    int countByThread(int id);
}
