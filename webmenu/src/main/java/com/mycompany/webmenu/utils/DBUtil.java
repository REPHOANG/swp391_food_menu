/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.webmenu.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 15tha
 */
public class DBUtil {
    public static Connection getConnection() {
        String url = "jdbc:sqlserver://localhost;databaseName=EcommmercePlatform;trustServerCertificate=true"
                + ";user=sa;password=123";
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return conn;
    }
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
