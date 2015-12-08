package ssm.duck.dao;

import java.util.List;

import ssm.duck.domain.Criteria;
import ssm.duck.domain.MemoVO;
import ssm.duck.domain.SearchCriteria;

public interface MemoDAO {
public void create(MemoVO vo) throws Exception;
	
	public MemoVO read(Integer memo_id) throws Exception;
	
	public void update(MemoVO vo) throws Exception;
	
	public void delete(Integer memo_id) throws Exception;
	
	public List<MemoVO> listPage(int page) throws Exception;
	
	public List<MemoVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<MemoVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
