package com.spring.webic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.webic.dto.playDTO;
import com.spring.webic.service.playService;

@Controller
public class editController {
	
	@Autowired
	playService playService;
	
	
	
	@RequestMapping(value="save")
	public String save(HttpServletRequest request, HttpServletResponse response, Model aModel) {
		
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("loginId");
		
		playService.deletePlayList(sessionId);
		
		String listData = request.getParameter("listData");
		if(listData != "") {
			String[] dataArr = listData.split("_");
			
			for(int i=0; i<dataArr.length; i++) {
				playService.setPlayList(dataArr[i]);
			}
		}
		
		
		
		return "save";
	}
}
