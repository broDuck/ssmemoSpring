package ssm.duck.service;

import ssm.duck.domain.UserVO;

public interface UserService {
	
	public void regist(UserVO user) throws Exception;
	
	public UserVO read(Integer user_id) throws Exception;
	
	public void modify(UserVO user) throws Exception;
	
	public void remove(Integer user_id) throws Exception;
	
	public UserVO readFriend(Integer user_id) throws Exception;
	
	public void modifyFriend(UserVO user) throws Exception;
	
	public int readCheck(UserVO user) throws Exception;

	public String readGetId(String access_id) throws Exception;

}
