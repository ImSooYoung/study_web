package com.example.spring02.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserCreateDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user")

@Controller
public class UserController {
    
    private final UserService userService;
    
    @GetMapping("/list")
    public String list(Model model) {
        log.info("list()");
        List<User> list = userService.read();
        model.addAttribute("list", list);
        
        return "/user/list";
    }
    
    @GetMapping("/create")
    public String create() {
        log.info("create()");
            
        return "/user/create";
    }
    
    @PostMapping("/create")
    public String create(UserCreateDto dto) {
        log.info("create(dto={})", dto);
        userService.create(dto);
        
        return "redirect:/user/list";
    }
    
    @GetMapping("/detail")
    public String detail(Integer id, Model model) {
        log.info("detail(id={})", id);
        
        User user = userService.read(id);
        model.addAttribute("user", user);
        
        return "/user/detail";
    }
    
    @GetMapping("/modify")
    public String modify(Integer id, Model model) {
        log.info("modify(id={})", id);
        
        User user = userService.read(id);
        model.addAttribute("user", user);
        
        return "/user/modify";
    }
    
    @PostMapping("/delete")
    public String delete(Integer id) {
        log.info("delete(id={})", id);
        
        userService.delete(id);
        
        return "redirect:/user/list";
    }
    
    @PostMapping("/update")
    public String update(UserUpdateDto dto) {
        log.info("update(dto={})", dto);
        
        userService.update(dto);
        
        return "redirect:/user/detail?id=" + dto.getId();
    }
    
}
