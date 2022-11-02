package edu.web.jsp01.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.jsp01.domain.Post;

/**
 * Servlet implementation class PostRegisterController
 */
@WebServlet( name="postRegisterController", urlPatterns = {"/post/register"} )
public class PostRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostRegisterController() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("postRegisterController.doGet() 호출");
        
        request.getRequestDispatcher("/WEB-INF/post/register.jsp")
            .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("postRegisterController.doPost() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(request.getParameter("createTime"));
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		
		LocalDateTime createTime =  LocalDateTime.parse(request.getParameter("createTime"), formatter);
		System.out.println(createTime);
		
		Post post = new Post(id, title, content, createTime);
		
		request.setAttribute("post", post);
		
		request.getRequestDispatcher("/WEB-INF/post/register-result.jsp")
        .forward(request, response);
		
	}

}
