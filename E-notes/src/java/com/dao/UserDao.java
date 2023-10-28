/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.User.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HP
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean addUser(UserDetails user)
    {
        boolean f=false;
        
        try{
            String query = "insert into user(fullname,email,password) values(?,?,?)";
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            
            int i = ps.executeUpdate();
            if(i==1)
            {
                f=true;
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public UserDetails findUser(UserDetails user)
    {
        UserDetails nuser=null;
        
        try{
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps =  con.prepareStatement(query);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            
            ResultSet res= ps.executeQuery();
            
            if(res.next())
            {
                nuser= new UserDetails();
                nuser.setName(res.getString("fullname"));
                nuser.setEmail(res.getString("email"));
                nuser.setPassword(res.getString("password"));
                nuser.setId(res.getInt("id"));
                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return nuser;
    }
    
}
