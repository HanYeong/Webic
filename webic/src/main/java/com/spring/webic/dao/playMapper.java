package com.spring.webic.dao;

import java.util.List;

import com.spring.webic.dto.playDTO;

public interface playMapper {
    public List<playDTO> selectPlayList(String id);
    public List<playDTO> insertPlayList(String no);
    public List<playDTO> deletePlayList(String id);
}
