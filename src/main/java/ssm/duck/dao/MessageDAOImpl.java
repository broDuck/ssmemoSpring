package ssm.duck.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ssm.duck.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession session;
	
	private String namespace = "ssm.duck.mapper.MessageMapper";

	@Override
	public MessageVO read(Integer user_to) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".read", user_to);
	}

	@Override
	public void delete(Integer user_to) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", user_to);
	}

	@Override
	public void create(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}
	
	
	
}

