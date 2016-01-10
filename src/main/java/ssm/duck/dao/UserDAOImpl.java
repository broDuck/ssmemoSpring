package ssm.duck.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ssm.duck.domain.MemoVO;
import ssm.duck.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "ssm.duck.mapper.UserMapper";

	@Override
	public void create(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
		
	}

	@Override
	public UserVO read(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".read", user_id);
	}

	@Override
	public void update(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", user_id);
	}

	@Override
	public UserVO readFriend(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".readFriend", user_id);
	}

	@Override
	public void updateFriend(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".updateFriend", vo);
	}
	
	@Override
	public int check(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".check", vo);
	}

	@Override
	public String getId(String access_id) throws Exception {
		return session.selectOne(namespace + ".getId", access_id);
	}
}
