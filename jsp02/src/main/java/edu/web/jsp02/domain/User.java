package edu.web.jsp02.domain;

public class User {
    private Integer id;
    private String userName;
    private String password;
    private String email;
    private Integer points;
    
    public User() {}

    public User(Integer id, String userName, String password, String email, Integer points) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.points = points;
    }

    public Integer getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public Integer getPoints() {
        return points;
    }
    
    @Override
    public String toString() {
        return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", email=" + email + ", points="
                + points + "]";
    }

    // Builder(Factory) 패턴
    public static UserBuilder builder() {
        return new UserBuilder();
    }
    
    public static class UserBuilder {
        private Integer id;
        private String userName;
        private String password;
        private String email;
        private Integer points;
        
        public UserBuilder id(Integer id) {
            this.id = id;
            return this;
        }
        
        public UserBuilder userName(String userName) {
            this.userName = userName;
            return this;
        }

        public UserBuilder password(String password) {
            this.password = password;
            return this;
        }

        public UserBuilder email(String email) {
            this.email = email;
            return this;
        }
        
        public UserBuilder points(Integer points) {
            this.points = points;
            return this;
        }

        public User build() {
            return new User(id, userName, password, email, points);
        }
        
    }
     
    
}
