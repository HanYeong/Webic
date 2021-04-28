package com.spring.webic.service;

import java.util.List;

import com.spring.webic.dto.UserDTO;

public interface UserService {
    public List<UserDTO> getUserList();
    public List<UserDTO> getUserId(String idc);
}
