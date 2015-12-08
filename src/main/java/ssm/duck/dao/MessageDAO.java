package ssm.duck.dao;

import ssm.duck.domain.MessageVO;

public interface MessageDAO {

	public MessageVO read(Integer user_to) throws Exception;
	
	public void delete(Integer user_to) throws Exception;
	
	public void create(MessageVO vo) throws Exception;
}
