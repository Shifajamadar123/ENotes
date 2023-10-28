/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.User.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public boolean AddNotes(String title, String content, int uid) {
        boolean f = false;

        try {
            String query = "insert into post(title,content,uid) values(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, uid);

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getData(int id) {
        List<Post> l = new ArrayList<Post>();
        Post p = new Post();
        try {
            String query = "select * from post where uid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Post();
                p.setId(rs.getInt(1));
                p.setTitle(rs.getString(2));
                p.setContent(rs.getString(3));
                p.setPdate(rs.getTimestamp(4));
                l.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return l;
    }
    
    public Post getPostById(int id)
    {
        Post p=new Post();
        try{
            
            String query =  "select * from post where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Post();
                p.setId(id);
                p.setTitle(rs.getString(2));
                p.setContent(rs.getString(3));
                p.setPdate(rs.getTimestamp(4));
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return p;
    }
    
    public boolean editPost(String title,String content,int id)
    {
        boolean f=false;
        
        try{
            String query = "update post set title=?,content=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, id);
            
            int i=ps.executeUpdate();
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
    
    
    public boolean deletePost(int id)
    {
        boolean f=false;
        
        try{
            String query = "delete from post where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            
            int i=ps.executeUpdate();
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

}
