package com.spring.webic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webic.dto.UserDTO;
import com.spring.webic.dto.musicDTO;
import com.spring.webic.service.musicService;

@Controller
public class mainController {
	
	@Autowired
    musicService musicService;
	
	@RequestMapping(value="/")
	public String main() {
		
		return "main";
	}
	
	@RequestMapping(value="account")
	public String createAccount() {
		return "createaccount";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model aModel) {
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="edit")
	public String edit(HttpServletRequest request, HttpServletResponse response, Model aModel) {
		
		
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("loginId");
		List<musicDTO> list = musicService.getMusicList(sessionId);
		List<musicDTO> list2 = musicService.getPlayList(sessionId);
		
		
		aModel.addAttribute("list", list);
		aModel.addAttribute("list2", list2);
		return "edit";
		
	}
	
}
