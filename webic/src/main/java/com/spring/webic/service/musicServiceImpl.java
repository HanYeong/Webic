package com.spring.webic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.spring.webic.dao.musicMapper;
import com.spring.webic.dto.musicDTO;

@Service
public class musicServiceImpl implements musicService {
    @Autowired
    private musicMapper mMapper;
 
    @Override
    public List<musicDTO> getMusicList(String idc) {
        // TODO Auto-generated method stub
        return mMapper.selectMusicList(idc);
    }
    
    @Override
    public List<musicDTO> setMusicList(String idc, String title, String address){
    	return mMapper.insertMusicList(idc, title, address);
    }
    
    public List<musicDTO> getPlayList(String idc){
    	return mMapper.selectPlayList(idc);
    }
}
