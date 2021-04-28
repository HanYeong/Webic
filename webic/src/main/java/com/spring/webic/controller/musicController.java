package com.spring.webic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.webic.dto.musicDTO;
import com.spring.webic.dto.playDTO;
import com.spring.webic.service.playService;

@Controller
public class musicController {
	
	@Autowired
	playService playService;
	
	@RequestMapping(value="play")
	public String play(HttpServletRequest request, HttpServletResponse response, Model aModel) {
		
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("loginId");
		
		
		List<playDTO> list = playService.getPlayList(sessionId);
		aModel.addAttribute("list", list);
		
		return "play";
	}
}
