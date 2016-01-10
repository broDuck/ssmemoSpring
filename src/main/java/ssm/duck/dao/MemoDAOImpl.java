package ssm.duck.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ssm.duck.domain.Criteria;
import ssm.duck.domain.MemoVO;
import ssm.duck.domain.SearchCriteria;

@Repository
public class MemoDAOImpl implements MemoDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "ssm.duck.mapper.MemoMapper";

	@Override
	public void create(MemoVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}

	@Override
	public MemoVO read(String memo_hash) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".read", memo_hash);
	}

	@Override
	public void update(MemoVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String memo_hash) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", memo_hash);
	}

	@Override
	public List<MemoVO> listPage(String user_id) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectList(namespace + ".listPage", user_id);
	}

	@Override
	public List<MemoVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<MemoVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(String memo_hash) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listSearchCount", memo_hash);
	}

	@Override
	public void deleteGroup(int memo_id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".deleteGroup", memo_id);
	}
}
