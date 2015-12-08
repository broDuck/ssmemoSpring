package ssm.duck.service.old;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ssm.duck.dao.old.ReplyDAO;
import ssm.duck.domain.Criteria;
import ssm.duck.domain.old.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
	}

	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(bno);
	}
	
	

	
	
	
}
