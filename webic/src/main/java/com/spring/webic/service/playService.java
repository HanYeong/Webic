package com.spring.webic.service;

import java.util.List;

import com.spring.webic.dto.playDTO;

public interface playService {
    public List<playDTO> getPlayList(String idc);
    public List<playDTO> setPlayList(String no);
    public List<playDTO> deletePlayList(String id);
}
