package com.database;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author @author starixc
 */
public class DbConnect {

    public ResultSet rs0, rs, rs1, rs2;
    public Statement st0, st, st1, stmt;
    public Statement state, state1;
    public PreparedStatement pst1, pst2, pst3, pst;
    public Connection con;

    /**
     * Get database connection
     *
     * @return a Connection object
     * @throws SQLException
     */
    public DbConnect(){
        Connection con = null;

        try (FileInputStream f = new FileInputStream("db.properties")) {

            // load the properties file
            Properties pros = new Properties();
            pros.load(f);

            // assign db parameters
            String url = pros.getProperty("url");
            String user = pros.getProperty("user");
            String password = pros.getProperty("password");

            try {
                // create a connection to the database
                con = DriverManager.getConnection(url, user, password);
            
            
               st = con.createStatement();
               
               } catch (SQLException ex) {
                Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
            }

            //
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
     
    }

}
