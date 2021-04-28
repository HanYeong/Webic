package com.spring.webic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.spring.webic.dao.UserMapper;
import com.spring.webic.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper uMapper;
 
    @Override
    public List<UserDTO> getUserList() {
        // TODO Auto-generated method stub
        return uMapper.selectAllUser();
    }
    
    @Override
    public List<UserDTO> getUserId(String idc) {
        // TODO Auto-generated method stub
        return uMapper.selectUserId(idc);
    }
}
