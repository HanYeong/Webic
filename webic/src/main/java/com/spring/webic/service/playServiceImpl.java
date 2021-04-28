package com.spring.webic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webic.dao.playMapper;
import com.spring.webic.dto.playDTO;

@Service
public class playServiceImpl implements playService {
    @Autowired
    private playMapper pMapper;
 
    @Override
    public List<playDTO> getPlayList(String idc) {
        // TODO Auto-generated method stub
        return pMapper.selectPlayList(idc);
    }
    
    @Override
    public List<playDTO> setPlayList(String no){
    	return pMapper.insertPlayList(no);
    }
    
    @Override
    public List<playDTO> deletePlayList(String id){
    	return pMapper.deletePlayList(id);
    }
    
}
