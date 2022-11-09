package edu.web.jsp02.dto;

import edu.web.jsp02.domain.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 기본 생성자 만듦.
@AllArgsConstructor // 모든 필드들을 argument로 갖는 생성자를 만듦.
@Builder // Builder 패턴에서 필요한 내부 클래스와 메서드들을 만듦.
@Data // @Getter, @Setter, @ToString, @EqualsAndHashCode, @RequiredArgsConstructor

public class UserCreateDto {

    private String userName;
    private String password;
    private String email;
    private Integer points;
    
    public User toEntity() {
        return User.builder()
                .userName(userName).password(password).email(email).points(points)
                .build();
    }
    
}
