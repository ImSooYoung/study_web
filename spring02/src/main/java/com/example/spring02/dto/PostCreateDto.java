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
@AllArgsConstructor
@Builder
@Data
public class PostCreateDto {
    private String title;
    private String content;
    private String author;
    
    public Post toEntity() {
        return Post.builder()
                    .title(title).content(content).author(author)
                    .build();
    }
}
