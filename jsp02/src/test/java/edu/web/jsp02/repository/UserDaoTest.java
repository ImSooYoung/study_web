package edu.web.jsp02.repository;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;
import edu.web.jsp02.domain.Post;
import edu.web.jsp02.domain.User;

@Slf4j
public class UserDaoTest {
    
    private UserDao userDao = UserDaoImpl.getInstance();
    
//    @Test
//    public void test() {
//        List<User> list = userDao.select();
//        for (User u : list) {
//            log.info(u.toString());
//        }  
//        
//    }
    
    @Test
    public void testInsert() {
        // DB 테이블에 insert할 데이터(제목, 내용, 작성)
        User entity = User.builder()
                    .userName("DAO test")
                    .password("111")
                    .email("admin")
                    .points(111)
                    .build();
        
        // DataSource를 사용한 DB insert 실행
        int result = userDao.insert(entity);
        
        // 테스트 성공: DB insert 실행 결과(insert된 행의 개수) = 1;
        Assertions.assertEquals(1, result);
    }
    
}
