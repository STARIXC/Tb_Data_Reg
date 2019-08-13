/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.database.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HSDSA
 */
public class records extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String ID, record_id, SerialNumber, SubCountyRegNo, SubPartnerID, RegDate, sex, age, Xray, treatmentdate, hivStatus, hivtestdate, artstatus, artdate, Mflcode, SubPartnerNom, smear0, genexpert, withinfacility, initialmodality, user_id;
            user_id = request.getParameter("id");
            String id = user_id;
            dbConn conn = new dbConn();
            String sql = "SELECT * FROM `tibu_tb_raw` WHERE `user_id`='" + id + "'";
            conn.rs = conn.st.executeQuery(sql);
            String record = "";
           
            while (conn.rs.next()) {
                 ID = conn.rs.getString("id");
                SerialNumber = conn.rs.getString("serialno");
                SubPartnerID = conn.rs.getString("SubPartnerID");
                SubCountyRegNo = conn.rs.getString("subcounty_regno");
                RegDate = conn.rs.getString("registrationdate");
                sex = conn.rs.getString("sex");
                age = conn.rs.getString("age");
                Xray = conn.rs.getString("xray");
                treatmentdate = conn.rs.getString("treatmentdate");
                hivStatus = conn.rs.getString("hivstatus");
                hivtestdate = conn.rs.getString("hivtestdate");
                artstatus = conn.rs.getString("artstatus");
                artdate = conn.rs.getString("artdate");
                Mflcode = conn.rs.getString("Mflcode");
                SubPartnerNom = conn.rs.getString("SubPartnerNom");
                smear0 = conn.rs.getString("smear0");
                genexpert = conn.rs.getString("genexpert");
                withinfacility = conn.rs.getString("tested_within_facility");
                initialmodality = conn.rs.getString("initial_modality");
                       record = "<tr>"
                        + "<td>" + SerialNumber + "</td>"
                        + "<td>" + SubPartnerID + "</td>"
                        + "<td>" + SubCountyRegNo + "</td>"
                        + "<td>" + Mflcode + "</td>"
                        + "<td>" + SubPartnerNom + "</td>"
                        + "<td>" + hivStatus + "</td>"
                        + "<td>" + artstatus + "</td>"
                        + "<td>" + sex + "</td>"
                        + "<td>" + age + "</td>"
                        + "<td>" + RegDate + "</td>"
                        + "<td>"
                        + "<a class='btn btn-sm btn-success' title='Edit' href='edit.jsp?id="+ID+"'><i class='glyphicon glyphicon-edit'></i></a>"
                        + "<a class= 'btn btn-sm btn-warning' title = 'Update' href ='update.jsp?id="+ID+">'><i class='glyphicon glyphicon-open'></i > </a>"
                        +"</td>"
                        + "</tr>";

            }
            out.println(record);
          

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(records.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(records.class.getName()).log(Level.SEVERE, null, ex);
        }
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
