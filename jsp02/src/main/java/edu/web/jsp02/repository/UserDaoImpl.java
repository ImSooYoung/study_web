package edu.web.jsp02.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zaxxer.hikari.HikariDataSource;

import edu.web.jsp02.datasource.HikariDataSourceUtil;
import edu.web.jsp02.domain.User;
import lombok.Cleanup;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserDaoImpl implements UserDao {
    
    // Singleton
    private static UserDaoImpl instance = null;
    
    private HikariDataSource ds;
    
    private UserDaoImpl() {
        ds = HikariDataSourceUtil.getInstance().getDataSource();
    }
    
    public static UserDaoImpl getInstance() {
        if (instance == null) {
            instance = new UserDaoImpl();
        }
        return instance;
    }

    private static final String SQL_INSERT_USER = 
          "insert into USERS (USERNAME, PASSWORD, EMAIL) "
          + "values (?, ?, ?)";
    
    @Override
    public int insert(User entity) {
        log.info("insert(entity = {})", entity);
        
        int result = 0; // DB 테이블에 insert한 결과를 저장할 변수
        
        try {
          @Cleanup
          Connection conn = ds.getConnection();
          
          @Cleanup
          PreparedStatement stmt = conn.prepareStatement(SQL_INSERT_USER);
          log.info(SQL_INSERT_USER);
          
          // prepared statement의 바인딩 파라미터(binding parameter) 값들을 세팅.
          stmt.setString(1, entity.getUserName());
          stmt.setString(2, entity.getPassword());
          stmt.setString(3, entity.getEmail());
          
          result = stmt.executeUpdate();
          
      } catch (SQLException e) {
          e.printStackTrace();
      }
        
        return result;
    }

    private static final String SQL_SELECT_BY_USERNAME_AND_PASSWORD =
            "select * from USERS where USERNAME = ? and PASSWORD = ?";
    
    @Override
    public User selectByUsernameAndPassword(User user) {
        log.info("selectByUsernameAndPassword({})", user);
        
        User entity = null; // DB에서 select한 결과를 저장할 객체
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_USERNAME_AND_PASSWORD);
            log.info(SQL_SELECT_BY_USERNAME_AND_PASSWORD);
            
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getPassword());
            
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) { // select 결과가 있으면
                Integer id = rs.getInt("ID");
                String username = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String email = rs.getString("EMAIL");
                int points = rs.getInt("POINTS");
                
                entity = User.builder()
                        .id(id).userName(username).password(password)
                        .email(email).points(id)
                        .build();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return entity;
    }
    
    
    
    
    
    public static final String SQL_SELECT = "select * from USERS order by id desc";
    
    @Override
    public List<User> select() {
        log.info("select()");
        
        List<User> list = new ArrayList<>();
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_SELECT);
            
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Integer id = rs.getInt("ID");
                String username = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String email = rs.getString("EMAIL");
                Integer points = rs.getInt("POINTS");
                
                User entity = User.builder()
                            .id(id)
                            .userName(username)
                            .password(password)
                            .email(email)
                            .points(points)
                            .build();
                list.add(entity);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }

    public static final String SQL_INSERT = 
            "insert into USERS (USERNAME, PASSWORD, EMAIL, POINTS) "
            + "values (?, ?, ?, ?)";
    
    @Override
    public int insertUser(User entity) {
        log.info("insert(entity = {})", entity);
        log.info(SQL_INSERT);
        
        Integer result = 0;
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, entity.getUserName());
            stmt.setString(2, entity.getPassword());
            stmt.setString(3, entity.getEmail());
            stmt.setInt(4, entity.getPoints());
            
            result = stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }

    public static final String SQL_SELECT_BY_ID = "select * from USERS where ID = ?";
    
    @Override
    public User selectById(Integer id) {
        log.info("selectById(id = {})", id);
        
        User entity = null;
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            log.info(SQL_SELECT_BY_ID);
            
            stmt.setInt(1, id);
            
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                String username = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String email = rs.getString("EMAIL");
                Integer points = rs.getInt("POINTS");
                
                entity = User.builder()
                        .id(id)
                        .userName(username)
                        .password(password)
                        .email(email)
                        .points(points)
                        .build();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return entity;
    }

    public static final String SQL_DELETE = "delete from USERS where ID = ?";
    
    @Override
    public int delete(Integer id) {
        log.info("delete(id ={})", id);
        
        int result = 0;
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_DELETE);
            log.info(SQL_DELETE);
            
            stmt.setInt(1, id);
            
            result = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    public static final String SQL_UPDATE = 
            "update USERS set USERNAME = ?, PASSWORD = ?, EMAIL = ?, POINTS = ? where ID = ?";

    @Override
    public int update(User entity) {
        log.info("update(entity = {})", entity);
        
        int result = 0;
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE);
            log.info(SQL_UPDATE);
            
            stmt.setString(1, entity.getUserName());
            stmt.setString(2, entity.getPassword());
            stmt.setString(3, entity.getEmail());
            stmt.setInt(4, entity.getPoints());
            stmt.setInt(5, entity.getId());
            
            result = stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    
    
}
