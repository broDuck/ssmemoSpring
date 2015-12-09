package ssm.duck.ssmemo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ssm.duck.dao.User;
import ssm.duck.service.DataService;
 
/**
 * OAuth에 의해 권한이 필요한 REST API
 *
 * @author Pure
 *
 */
@RestController
@RequestMapping("/api")
public class AuthRestController {
 
        @Autowired
        private DataService dataService;
 
        @RequestMapping(value = "/users", method = RequestMethod.GET)
        public List<User> list() {
               return dataService.getUserList();
        }
 
}