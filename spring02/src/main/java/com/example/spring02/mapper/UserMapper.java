package com.example.spring02.mapper;

import java.util.List;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserUpdateDto;

public interface UserMapper {
    public List<User> selectOrderByIdDesc();
    public int insert(User entity);
    public User selectById(Integer id);
    public int deleteById(Integer id);
    public int updateById(UserUpdateDto dto);
}
