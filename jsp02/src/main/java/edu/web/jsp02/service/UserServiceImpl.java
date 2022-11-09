package edu.web.jsp02.service;

import java.util.List;

import edu.web.jsp02.domain.User;
import edu.web.jsp02.dto.UserCreateDto;
import edu.web.jsp02.repository.UserDao;
import edu.web.jsp02.repository.UserDaoImpl;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserServiceImpl implements UserService {

    private UserDao userDao;
    
    // Singleton
    private static UserServiceImpl instance = null;
    
    private UserServiceImpl() {
        userDao = UserDaoImpl.getInstance();
    }
    
    public static UserServiceImpl getInstance() {
        if (instance == null) {
            instance = new UserServiceImpl();
        }
        
        return instance;
    }
    
    @Override
    public List<User> read() {
        log.info("read()");
        
        return userDao.select();
    }

    @Override
    public int create(UserCreateDto dto) {
        log.info("create(dto = {})", dto);
        return userDao.insert(dto.toEntity());
    }

    @Override
    public User read(Integer id) {
        log.info("read(id = {})", id);
        
        return userDao.selectById(id);
    }

    @Override
    public int delete(Integer id) {
        log.info("delete(id = {})", id);
        
        return userDao.delete(id);
    }

    @Override
    public int update(User user) {
        log.info("update(dto = {})", user);
        
        return userDao.update(user);
    }
    

}
