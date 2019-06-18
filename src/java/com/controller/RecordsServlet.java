/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.DAO.RecordDAO;
import com.business.Record;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author starixc
 */
public class RecordsServlet extends HttpServlet {
   private DataSource dataSource;
   private RecordDAO recordDAO;
   
   @Override
   public void init(){
       recordDAO= new RecordDAO(dataSource);
   
   }
     
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            List<Record> records = recordDAO.list();
            request.setAttribute("records", records);
            request.getRequestDispatcher("home.jsp").forward(request, response);
          
        } catch (SQLException e) {
                        throw new ServletException("Cannot obtain records from DB",e);
        } catch (ClassNotFoundException ex) { 
           Logger.getLogger(RecordsServlet.class.getName()).log(Level.SEVERE, null, ex);
       } 
       
        
        
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
