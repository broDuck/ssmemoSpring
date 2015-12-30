package ssm.duck.dao;

import ssm.duck.domain.SaveVO;

/**
 * Created by broDuck on 2015-12-27.
 */
public interface SaveDAO {
    public void create(SaveVO vo) throws Exception;

    public void update(SaveVO vo) throws Exception;

    public SaveVO read(String id) throws Exception;

    public int isExist(String id) throws Exception;
}
