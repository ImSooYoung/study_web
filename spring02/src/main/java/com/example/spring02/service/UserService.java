package com.example.spring02.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserCreateDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
    
    private final UserMapper userMapper;
    
    public List<User> read() {
        log.info("read()");
        
        return userMapper.selectOrderByIdDesc();
    }
    
    public int create(UserCreateDto dto) {
        log.info("create()");
        
        return userMapper.insert(dto.toEntity());
    }
    
    public User read(int id) {
        log.info("read(id={})", id);
        
        return userMapper.selectById(id);
    }

    public int delete(Integer id) {
        log.info("delete(id={})", id);
        
        return userMapper.deleteById(id);
    }
    
    public int update(UserUpdateDto dto) {
        log.info("update(dto={})", dto);
        
        return userMapper.updateById(dto);
    }
    
    
}
