package com.spring.webic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webic.dto.UserDTO;
import com.spring.webic.service.UserService;

@Controller
public class loginController {
	
	@Autowired
    UserService userService;
	
	@RequestMapping(value="login")
	private ModelAndView logging(HttpServletRequest request, HttpServletResponse response) {
		
		userService.getUserList();
		String acceptId = "";
		String logined = "no";
		if(request.getParameter("inputId") != null) {
			try {
				List<UserDTO> list = userService.getUserId(request.getParameter("inputId"));
				
				String inputId = request.getParameter("inputId");
				String inputPwd = request.getParameter("inputPwd");
				String tempId = list.get(0).getUserId();
				String tempPwd = list.get(0).getUserPw();
				if(inputId.equals(tempId) && inputPwd.equals(tempPwd)) {
					logined = "successLogin";
					acceptId = tempId;
					System.out.println("로그인 성공");
				}else {
					logined = "failed";
					System.out.println("로그인 실패");
				}
				
			} catch (IndexOutOfBoundsException e) {
				logined = "failed";
				System.out.println("로그인 실패");
			}
		}

		System.out.println(logined);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginId", acceptId);
		session.setAttribute("logined", logined);
		ModelAndView mv = new ModelAndView();
	
			mv.setViewName("login");
		
		return mv;
	}
	
	@RequestMapping(value="create")
	private String create(HttpServletRequest request, HttpServletResponse response) {
		
		return "redirect:/login";
	}
}
