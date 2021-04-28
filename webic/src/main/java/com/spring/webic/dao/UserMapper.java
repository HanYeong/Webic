package com.spring.webic.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
 
import com.spring.webic.dto.UserDTO;

public interface UserMapper {
    public List<UserDTO> selectAllUser();
    public List<UserDTO> selectUserId(String id);
}
