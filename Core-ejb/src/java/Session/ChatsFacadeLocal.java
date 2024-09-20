/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.Chats;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Administrator
 */
@Local
public interface ChatsFacadeLocal {

    void create(Chats chats);

    void edit(Chats chats);

    void remove(Chats chats);

    Chats find(Object id);

    List<Chats> findAll();

    List<Chats> findRange(int[] range);

    int count();

    List<Chats> findBySender(int id);

    List<Chats> findByReceived(int id);
    
    List<Chats> findRangeBySender(int id, int first, int max);
    
    List<Chats> findRangeByReceived(int id, int first, int max);

    int countByRecived(int id);
    
}
