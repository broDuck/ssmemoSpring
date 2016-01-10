package ssm.duck.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ssm.duck.dao.UserDAO;
import ssm.duck.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public void regist(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		dao.create(user);
	}

	@Override
	public UserVO read(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(user_id);
	}

	@Override
	public void modify(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		dao.update(user);
	}

	@Override
	public void remove(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(user_id);
	}

	@Override
	public UserVO readFriend(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.readFriend(user_id);
	}

	@Override
	public void modifyFriend(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		dao.updateFriend(user);
	}
	
	@Override
	public int readCheck(UserVO user) throws Exception {
		return dao.check(user);
	}

	@Override
	public String readGetId(String access_id) throws Exception {
		return dao.getId(access_id);
	}
}
