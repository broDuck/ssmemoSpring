package ssm.duck.service;

import ssm.duck.domain.FriendVO;

public interface FriendService {

	public void regist(FriendVO friend) throws Exception;
	
	public void remove(Integer friend_id) throws Exception;
}
