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
 * @author starixc
 */
public class viewData extends HttpServlet {

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
            throws ServletException, IOException {

        try {
           
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            //query
            String sql = "SELECT * FROM tibu_tb_raw ORDER BY `timestamp` DESC";

            dbConn conn = new dbConn();

            conn.rs = conn.st.executeQuery(sql);

            String data = "<table id='tb_report_table' class='table table-striped table-bordered' style='width:100%'><thead><tr><th>SubPartner ID</th><th>Registration Date</th><th>HIV Status</th> <th>MFL Code</th><th>Facility Name</th><th>Edit</th></tr></thead><tbody> ";

            while (conn.rs.next()) {
                String id = conn.rs.getString("id");
                data += "<tr>"
                        + "<td>" + conn.rs.getString("SubPartnerID") + "</td>"
                        + "<td>" + conn.rs.getString("registrationdate") + "</td>"
                        + "<td>" + conn.rs.getString("hivstatus") + "</td>"
                        + "<td>" + conn.rs.getString("Mflcode") + "</td>"
                        + "<td>" + conn.rs.getString("SubPartnerNom") + "</td>"
                        + "<td>"
                        + "<a class='btn btn-small btn-primary btn-edit' href='edit.jsp?id=" + id + "'>Edit</a>"
                        + "</td>"
                        + "</tr>";

                //data+="<li>"+conn.rs.getString("SubPartnerNom")+" </li>";
            }
            data += "</tbody></table>";

            out.println(data);
            out.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(getfacility.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
