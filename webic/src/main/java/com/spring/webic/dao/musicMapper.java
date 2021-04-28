package com.spring.webic.dao;

import java.util.List;

import com.spring.webic.dto.musicDTO;

public interface musicMapper {
    public List<musicDTO> selectMusicList(String id);
    public List<musicDTO> selectPlayList(String idc);
    public List<musicDTO> insertMusicList(String id, String title, String address);
}
