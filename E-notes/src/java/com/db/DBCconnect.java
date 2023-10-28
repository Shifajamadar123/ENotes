/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.db;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

/**
 *
 * @author HP
 */
public class DBCconnect {
    private static Connection conn=null;
    
    public static Connection getConn()
    {
        try{
            if(conn==null)
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","shifa@MYSQL11");
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return conn;
    }
    
}
