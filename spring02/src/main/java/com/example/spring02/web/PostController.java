package com.example.spring02.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.spring02.domain.Post;
import com.example.spring02.dto.PostCreateDto;
import com.example.spring02.dto.PostUpdateDto;
import com.example.spring02.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller // 스프링 컨테이너가 Bean으로 생성, 관리
public class PostController {
    
    private final PostService postService; // 생성자에 의한 의존성 주입
    
    @GetMapping("/home")
    public String home() {
        log.info("home()");
        
        return "/home";
    }
    
    @GetMapping("/list")
    public String list(Model model) {
        log.info("list()");
        
        List<Post> list = postService.read();
        model.addAttribute("list", list);
        
        return "/list";
    }
    
    @GetMapping("/create")
    public String create() {
        log.info("create()");
        
        return "/create";
    }
    
    @PostMapping("/create")
    public String createPost(PostCreateDto post, Model model) {
        log.info("createPost(post = {})", post);
        
        Post entity = post.toEntity();
        int result = postService.create(entity);

        List<Post> list = postService.read();
        model.addAttribute("list", list);
        
        return "/list";
    }
    
    @GetMapping("/detail")
    public String detail(Model model, int id) {
        log.info("detail(id = {})", id);
        
        Post post = postService.readById(id);
        model.addAttribute("id", post.getId());
        model.addAttribute("title", post.getTitle());
        model.addAttribute("content", post.getContent());
        model.addAttribute("author", post.getAuthor());
        model.addAttribute("modifiedTime", post.getModified_time());
        model.addAttribute("createdTime", post.getCreated_time());
        
        return "/detail";
    }
    
    @GetMapping("/modify")
    public String modify(int id, Model model) {
        log.info("modify()");
        
        Post post = postService.readById(id);
        
        model.addAttribute("id", id);
        model.addAttribute("author", post.getAuthor());
        
        return "/modify";
    }
    
    @PostMapping("/modify")
    public String modifyPost(PostUpdateDto post, Model model) {
        log.info("modifyPost(post = {})", post);
        
        Post entity = post.toEntity();
        int result = postService.update(entity);
        log.info("result = {}", result);

        List<Post> list = postService.read();
        model.addAttribute("list", list);
        
        return "/list";
    }
    
    @PostMapping("/delete")
    public String delete(int id, Model model) {
        log.info("delete(id= {})", id);
        
        postService.delete(id);
        
        List<Post> list = postService.read();
        model.addAttribute("list", list);
        
        return "/list";
    }
    
    
    
    // TODO: 목록/새 글 작성/상세보기/수정페이지/수정/삭제 컨트롤러 메서드
    
}
