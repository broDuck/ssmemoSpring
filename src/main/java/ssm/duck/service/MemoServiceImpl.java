package ssm.duck.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ssm.duck.dao.MemoDAO;
import ssm.duck.domain.Criteria;
import ssm.duck.domain.MemoVO;
import ssm.duck.domain.SearchCriteria;

@Service
public class MemoServiceImpl implements MemoService {

	@Inject
	private MemoDAO dao;

	@Override
	public void regist(MemoVO memo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(memo);
	}

	@Override
	public MemoVO read(Integer memo_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(memo_id);
	}
	
	@Override
	public void modify(MemoVO memo) throws Exception {
		dao.update(memo);
	}

	@Override
	public void remove(Integer memo_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(memo_id);
	}

	@Override
	public List<MemoVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(page);
	}

	@Override
	public List<MemoVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public List<MemoVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listsearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}
	
	
}
