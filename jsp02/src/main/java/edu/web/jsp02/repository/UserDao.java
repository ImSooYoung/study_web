package edu.web.jsp02.repository;

import java.util.List;

import edu.web.jsp02.domain.User;

public interface UserDao {
    
    public int insert(User entity);

    public User selectByUsernameAndPassword(User user);
    
    
    
    
    public List<User> select();
    
    public int insertUser(User entity);
    
    public User selectById(Integer id);
    
    public int delete(Integer id);
    
    public int update(User entity);
}
