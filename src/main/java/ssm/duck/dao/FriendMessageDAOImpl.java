package ssm.duck.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ssm.duck.domain.FriendVO;

@Repository
public class FriendMessageDAOImpl implements FriendMessageDAO {

	@Inject
	private SqlSession session;
	
	private String namespace = "ssm.duck.mapper.FriendMapper";

	@Override
	public void create(FriendVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void delete(Integer friend_id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", friend_id);
	}
}
