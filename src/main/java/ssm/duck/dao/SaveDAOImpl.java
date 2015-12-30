package ssm.duck.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import ssm.duck.domain.SaveVO;

import javax.inject.Inject;

/**
 * Created by broDuck on 2015-12-27.
 */

@Repository
public class SaveDAOImpl implements SaveDAO {
    @Inject
    private SqlSession session;

    private static String namespace = "ssm.duck.mapper.SaveMapper";

    @Override
    public void create(SaveVO vo) throws Exception {
        session.insert(namespace +".create", vo);
    }

    @Override
    public void update(SaveVO vo) throws Exception {
        session.update(namespace + ".update", vo);
    }

    @Override
    public SaveVO read(String id) throws Exception {
        return session.selectOne(namespace + ".read", id);
    }

    @Override
    public int isExist(String id) throws Exception {
        return session.selectOne(namespace + ".exist", id);
    }
}
