/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.posgen;
import java.net.InetAddress;
import java.sql.*;
import javax.swing.*;



/*
import java.net.*;*/
/**
 *
 * @author ben
 */
public class connect {
    public static Connection connectdb(){
            try {
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/genpos","root","");
//JOptionPane.showMessageDialog(null,"Connected to the database successfully");
 return con;
      } catch (Exception e) {
           JOptionPane.showMessageDialog(null, e);
        try{
          InetAddress ipaddress=InetAddress.getByName("SERVER");
          String address=ipaddress.getHostAddress();
          Class.forName("com.mysql.jdbc.Driver");
          
          Connection con=DriverManager.getConnection("jdbc:mysql://"+address+":3306/fastfoodpos","root","");
//JOptionPane.showMessageDialog(null,"Connected to the database successfully");
 return con;
          }
          catch(Exception ex){
                JOptionPane.showMessageDialog(null, e);
          JOptionPane.showMessageDialog(null,"SORRY! \n connection to the main server seems to have a problem. \nplease contact the System administrator","NO CONNECTION",2);
       
          System.exit(0);
          }
 
   return null;    
   } 
}}
