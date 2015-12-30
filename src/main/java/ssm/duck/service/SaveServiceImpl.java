package ssm.duck.service;

import org.springframework.stereotype.Service;
import ssm.duck.dao.SaveDAO;
import ssm.duck.domain.SaveVO;

import javax.inject.Inject;

/**
 * Created by broDuck on 2015-12-27.
 */

@Service
public class SaveServiceImpl implements SaveService {
    @Inject
    SaveDAO dao;

    @Override
    public void regist(SaveVO save) throws Exception {
        dao.create(save);
    }

    @Override
    public void update(SaveVO save) throws Exception {
        dao.update(save);
    }

    @Override
    public SaveVO read(String id) throws Exception {
        return dao.read(id);
    }

    @Override
    public int isExist(String id) throws Exception {
        return dao.isExist(id);
    }
}
