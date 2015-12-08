package ssm.duck.service;

import ssm.duck.domain.MessageVO;

public interface MessageService {

	public MessageVO read(Integer user_to) throws Exception;
	
	public void remove(Integer user_to) throws Exception;
	
	public void regist(MessageVO message) throws Exception;
}
