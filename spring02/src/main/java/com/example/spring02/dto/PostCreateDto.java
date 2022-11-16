package com.example.spring02.dto;

import java.time.LocalDateTime;

import com.example.spring02.domain.Post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data // @RequiredArgsConstructor + @Getter + @Setter + @ToSting + @EqualsAndHashCode
// 포스트 작성 페이지에서 보낸 요청 파라미터들을 저장하고 서비스 계층으로 전달하기 위한 목적.
public class PostCreateDto {
    private String title;
    private String content;
    private String author;
    
    // DTO 객체를 Entity 객체로 변환해서 리턴하는 메서드.
    public Post toEntity() {
        return Post.builder()
                    .title(title).content(content).author(author)
                    .build();
    }
}
