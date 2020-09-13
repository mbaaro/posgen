/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.posgen;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


/**
 *
 * @author admin
 */

public class DataProvider {
    //class to get common database data
Connection conn=null;
PreparedStatement pst=null;
ResultSet rst,rst1=null;
    String query;
    
 
   
                    public ResultSet getuom(){
                    //  get the units of measure
                    connect cn=new connect();
                    conn=cn.connectdb();
                    query="select uom from uom order by uom asc";
                        try {
                        pst=conn.prepareStatement(query);
                        rst=pst.executeQuery();
                    } catch (SQLException ex) {
                       // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
                            JOptionPane.showMessageDialog(null, "Error fetching units of measure "+ex);
                    }
                    return rst;
                    }
    public ResultSet getitemcategories(){
     //  get the item categories
     connect cn=new connect();
    conn=cn.connectdb();
      query="select id,category from categories order by category asc";
     try {
     pst=conn.prepareStatement(query);
     rst=pst.executeQuery();
     } catch (SQLException ex) {
      // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
      JOptionPane.showMessageDialog(null, "Error fetching item categories "+ex);
      }
     return rst;
     }  
    
                        public ResultSet stockitems(String category){
                            connect cn=new connect();
                             conn=cn.connectdb();
                        //  get the items of the selected category
                         query="SELECT products.id,categories.Category,`product_name`,`unit_measure`,`Store_qty`,`Shelf_qty`,(`Store_qty`+`Shelf_qty`)as Stock_balance,`lowLevel`,`Profit%`,`VAT%`"
                                 + " FROM `products` inner join categories on products.product_category = categories.id WHERE products.deleted=0 and `product_category`="
                                 + "(select id from categories where category='"+category+"') order by product_category,product_name";
                        try {
                        pst=conn.prepareStatement(query);
                        rst=pst.executeQuery();
                        } catch (SQLException ex) {
                         // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
                         JOptionPane.showMessageDialog(null, "Error fetching item categories "+ex);
                         }
                        return rst;
                        } 
                        
     public ResultSet allstockitems(){
                    connect cn=new connect();
                    conn=cn.connectdb();
                        //  get the items of the selected category
                         query="SELECT products.id,categories.Category,`product_name`,`unit_measure`,`Store_qty`,`Shelf_qty`,(`Store_qty`+`Shelf_qty`)as Stock_balance,`lowLevel`,`Profit%`,`VAT%`"
                                 + " FROM `products` inner join categories on products.product_category = categories.id where products.deleted=0 order by product_category,product_name";
                        try {
                        pst=conn.prepareStatement(query);
                        rst=pst.executeQuery();
                        } catch (SQLException ex) {
                         // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
                         JOptionPane.showMessageDialog(null, "Error fetching item categories "+ex);
                         }
                        return rst;
                        }  
 public ResultSet getcategoryid(String Cat){
     //  get the item categories
     connect cn=new connect();
    conn=cn.connectdb();
      query="select id from categories  where category='"+Cat+"' ";
     try {
     pst=conn.prepareStatement(query);
     rst1=pst.executeQuery();
     } catch (SQLException ex) {
      // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
      JOptionPane.showMessageDialog(null, "Error fetching item categories "+ex);
      }
     return rst1;
     } 
 
                    public ResultSet getsuppliers(){
                        //  get the registered suppliers
                        connect cn=new connect();
                       conn=cn.connectdb();
                         query="select * from suppliers order by name asc";
                        try {
                        pst=conn.prepareStatement(query);
                        rst1=pst.executeQuery();
                        } catch (SQLException ex) {
                         // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
                         JOptionPane.showMessageDialog(null, "Error fetching item Supplier details "+ex);
                         }
                        return rst1;
                        } 
 public ResultSet getitemlots(String item){
     //  get the item categories
     connect cn=new connect();
    conn=cn.connectdb();
      query="SELECT `Lotid`,`Item`,`LotDate`,`Qty`,`UnitPrice`,`LotExpiry`,`Supplier`,`LotBp`,`LotSp` FROM `itemlots` WHERE item=(select id from products where product_name='"+item+"' ) and active=true and LotExpiry>NOW() order by LotDate asc";
     try {
     pst=conn.prepareStatement(query);
     rst1=pst.executeQuery();
     } catch (SQLException ex) {
      // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
      JOptionPane.showMessageDialog(null, "Error fetching Active lots for "+item+": "+ex);
      }
     return rst1;
     } 
  public ResultSet getexpiredlots(String item){
     //  get the item categories
     connect cn=new connect();
    conn=cn.connectdb();
      query="SELECT `Lotid`,`Item`,`LotDate`,`Qty`,`UnitPrice`,`LotExpiry`,`Supplier`,`LotBp`,`LotSp` FROM `itemlots` WHERE item=(select id from products where product_name='"+item+"' ) and active=true and LotExpiry<NOW() order by LotDate asc";
     try {
     pst=conn.prepareStatement(query);
     rst1=pst.executeQuery();
     } catch (SQLException ex) {
      // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
      JOptionPane.showMessageDialog(null, "Error fetching Active lots for "+item+": "+ex);
      }
     return rst1;
     }  
  
                            public ResultSet getitemdetails(String item){
                            connect cn=new connect();
                             conn=cn.connectdb();
                        //  get the item details of a specific item
                         query="SELECT products.id,categories.Category,`product_name`,`unit_measure`,`Store_qty`,`Shelf_qty`,(`Store_qty`+`Shelf_qty`)as Stock_balance,`lowLevel`,`Profit%`,`VAT%`"
                                 + " FROM `products` inner join categories on products.product_category = categories.id WHERE products.deleted=0 and product_name='"+item+"' ";
                        try {
                        pst=conn.prepareStatement(query);
                        rst=pst.executeQuery();
                        } catch (SQLException ex) {
                         // Logger.getLogger(DataProvider.class.getName()).log(Level.SEVERE, null, ex);
                         JOptionPane.showMessageDialog(null, "Error fetching item categories "+ex);
                         }
                        return rst;
                        } 

public ResultSet getlotdetails(String item,String category, String lotid){
query="SELECT `Lotid`,`LotDate`,`Item`,`Qty`,`UnitPrice`,`LotExpiry`,`Supplier`,`LotBp`,`LotSp`,`Active` FROM"
   + " `itemlots` inner join products on itemlots.Item = products.id WHERE itemlots.lotid='"+lotid+"' and itemlots.Item="
        + "(select id from products where product_name='"+item+"') and products.product_category="
        + "(select id from categories where category='"+category+"')";
try{
pst=conn.prepareStatement(query);
rst=pst.executeQuery();
}
catch(SQLException ex){
  JOptionPane.showMessageDialog(null, "Error getting lot details: "+ex);
}
return rst;
}
}