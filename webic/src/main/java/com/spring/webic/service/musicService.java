package com.spring.webic.service;

import java.util.List;

import com.spring.webic.dto.musicDTO;

public interface musicService {
    public List<musicDTO> getMusicList(String idc);
    public List<musicDTO> getPlayList(String idc);
    public List<musicDTO> setMusicList(String idc, String title, String address);
}