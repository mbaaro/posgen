/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.posgen;
import java.sql.*;
import javax.swing.*;
import java.util.*;
/**
 *
 * @author ben
 */
public class POSGEN {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //setting the look and feel
        try {
            UIManager.setLookAndFeel("com.jtattoo.plaf.texture.TextureLookAndFeel");
            
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger("uimanager");
        }
        
        // TODO code application logic here
        login show=new login(null, true);
        show.setVisible(true);
    }
    
}
