package ssm.duck.dao;

import ssm.duck.domain.FriendVO;

public interface FriendMessageDAO {

	public void create(FriendVO vo) throws Exception;
	
	public void delete(Integer friend_id) throws Exception;
	
}
