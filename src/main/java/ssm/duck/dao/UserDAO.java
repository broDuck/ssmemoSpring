package ssm.duck.dao;

import ssm.duck.domain.UserVO;

public interface UserDAO {
	public void create(UserVO vo) throws Exception;
	
	public UserVO read(Integer user_id) throws Exception;
	
	public void update(UserVO vo) throws Exception;
	
	public void delete(Integer user_id) throws Exception;
	
	public UserVO readFriend(Integer user_id) throws Exception;
	
	public void updateFriend(UserVO vo) throws Exception;
	
	public int check(UserVO vo) throws Exception;

	public String getId(String access_id) throws Exception;
}
