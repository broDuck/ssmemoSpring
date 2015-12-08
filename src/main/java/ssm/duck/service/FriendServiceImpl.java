package ssm.duck.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ssm.duck.dao.FriendMessageDAO;
import ssm.duck.domain.FriendVO;

@Service
public class FriendServiceImpl implements FriendService {

	@Inject
	private FriendMessageDAO dao;

	@Override
	public void regist(FriendVO friend) throws Exception {
		// TODO Auto-generated method stub
		dao.create(friend);
	}

	@Override
	public void remove(Integer friend_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(friend_id);
	}
	
	
}
