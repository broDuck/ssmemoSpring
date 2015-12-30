package ssm.duck.service;

import ssm.duck.dao.SaveDAO;
import ssm.duck.domain.SaveVO;

/**
 * Created by broDuck on 2015-12-27.
 */
public interface SaveService {
    public void regist(SaveVO save) throws Exception;

    public void update(SaveVO save) throws Exception;

    public SaveVO read(String id) throws Exception;

    public int isExist(String id) throws Exception;
}
