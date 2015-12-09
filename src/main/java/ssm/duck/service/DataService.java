package ssm.duck.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
 
import org.springframework.stereotype.Service;
 
import ssm.duck.dao.User;
 
@Service
public class DataService {
        public List<User> getUserList() {
 
               // preparing user list with few hard coded values
               List<User> userList = new ArrayList<User>();
 
               userList.add(new User(1, "user_a", "user_a@example.com", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())));
               userList.add(new User(2, "user_b", "user_b@example.com", "9767989898"));
               userList.add(new User(3, "user_c", "user_c@example.com", "9898459898"));
 
               return userList;
        }
}
