package edu.web.jsp02.service;

import java.util.List;

import edu.web.jsp02.domain.User;
import edu.web.jsp02.dto.UserCreateDto;

public interface UserService {
    public List<User> read(); // User의 전체 목록 불러오기
    
    public int create(UserCreateDto dto); // User 등록
    
    public User read(Integer id); // id가 일치하는 User 1개 읽어오기
    
    public int delete(Integer id); // id가 일치하는 User 1개 삭제

    public int update(User user); // id가 일치하는 유저 업데이트
}
