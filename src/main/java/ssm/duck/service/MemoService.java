package ssm.duck.service;

import java.util.List;

import ssm.duck.domain.Criteria;
import ssm.duck.domain.MemoVO;
import ssm.duck.domain.SearchCriteria;

public interface MemoService {

	public void regist(MemoVO memo) throws Exception;
	
	public void modify(MemoVO memo) throws Exception;
	
	public MemoVO read(Integer memo_id) throws Exception;
	
	public void remove(Integer memo_id) throws Exception;
	
	public List<MemoVO> listPage(int page) throws Exception;
	
	public List<MemoVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<MemoVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listsearchCount(SearchCriteria cri) throws Exception;
}
