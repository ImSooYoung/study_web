package com.example.spring02.mapper;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.example.spring02.domain.Post;
import com.example.spring02.domain.User;
import com.example.spring02.dto.UserUpdateDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/applicationContext.xml"
})
public class TestMapper {
    
    @Autowired
    private PostMapper postMapper;
    
//    @Test
    public void testSelectById() {
        Post post = postMapper.selectById(2);
        Assertions.assertNotNull(post);
        log.info(post.toString());
    }
    
//    @Test
    public void testPostMapper() {
        Assertions.assertNotNull(postMapper);
        log.info("postMapper = {}", postMapper);
    
        Post post = Post.builder()
                    .title("Spring MyBatis")
                    .content("스프링 마이바티스 insert 테스트")
                    .author("admin")
                    .build();
        int result = postMapper.insert(post);
        Assertions.assertEquals(1, result);
        
        List<Post> list = postMapper.selectOrderByIdDesc();
        for (Post p : list) {
            log.info(p.toString());
        }
    }
    
    
    @Autowired
    private UserMapper userMapper;
    
//    @Test
    public void testUserMapper() {
        Assertions.assertNotNull(userMapper);
        log.info("userMapper = {}", userMapper);
        
        User user = User.builder()
                    .userName("test1")
                    .password("test1")
                    .email("test@test.com")
                    .build();
//        int result = userMapper.insert(user);
//        Assertions.assertEquals(1, result);
        
        List<User> list = userMapper.selectOrderByIdDesc();
        for (User u : list) {
            log.info(u.toString());
        }
        
        User user1 = userMapper.selectById(16);
        log.info(user1.toString());
    }
    
    @Test
    public void testUserUpdate() {
        Assertions.assertNotNull(userMapper);
        
        UserUpdateDto user = UserUpdateDto.builder()
                .id(24)
                .userName("admin1")
                .password("test1")
                .email("test@")
                .build();
        int result = userMapper.updateById(user);
        Assertions.assertEquals(1, result);
    }
    
    
}
