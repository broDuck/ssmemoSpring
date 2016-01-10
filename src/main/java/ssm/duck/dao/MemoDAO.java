package ssm.duck.dao;

import java.util.List;
import java.util.StringTokenizer;

import ssm.duck.domain.Criteria;
import ssm.duck.domain.MemoVO;
import ssm.duck.domain.SearchCriteria;

public interface MemoDAO {
public void create(MemoVO vo) throws Exception;
	
	public MemoVO read(String memo_hash) throws Exception;
	
	public void update(MemoVO vo) throws Exception;
	
	public void delete(String memo_hash) throws Exception;
	
	public List<MemoVO> listPage(String user_id) throws Exception;
	
	public List<MemoVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<MemoVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(String memo_hash) throws Exception;

	public void deleteGroup(int memo_id) throws Exception;
}
