package ssm.duck.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ssm.duck.dao.MessageDAO;
import ssm.duck.domain.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO dao;

	@Override
	public MessageVO read(Integer user_to) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(user_to);
	}

	@Override
	public void remove(Integer user_to) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(user_to);
	}

	@Override
	public void regist(MessageVO message) throws Exception {
		// TODO Auto-generated method stub
		dao.create(message);
	}
	
	
}
