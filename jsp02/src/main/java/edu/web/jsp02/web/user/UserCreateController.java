package edu.web.jsp02.web.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.jsp02.dto.UserCreateDto;
import edu.web.jsp02.service.UserService;
import edu.web.jsp02.service.UserServiceImpl;
import lombok.extern.slf4j.Slf4j;

/**
 * Servlet implementation class UserCreateController
 */

@Slf4j
@WebServlet(name = "userCreateController", urlPatterns = { "/user/create" })
public class UserCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreateController() {
        userService = UserServiceImpl.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("doGet()");
		
		request.getRequestDispatcher("/WEB-INF/user/create.jsp")
		    .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info("doPost()");
		
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		Integer points = Integer.valueOf(request.getParameter("points"));
		
		UserCreateDto dto = new UserCreateDto().builder()
		            .userName(userName).password(password).email(email).points(points)
		            .build();
		log.info("dto = {}", dto);
		
		int result = userService.create(dto);
		log.info("result ={}", result);
		
		response.sendRedirect("/jsp02/user");
	}

}
