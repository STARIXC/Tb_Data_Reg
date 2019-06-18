/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.database.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author starixc
 */
@WebServlet(name = "ViewData", urlPatterns = {"/ViewData"})
public class ViewData extends HttpServlet {

  
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            //query
            String sql = "SELECT * FROM tibu_tb_raw ";

            dbConn conn = new dbConn();

            conn.rs = conn.st.executeQuery(sql);
//
            String data = "<table  id='tb_report_table' class='table table-striped table-bordered' style='width:100%'><tr><thead><td>SubPartner ID</td><td>Registration Date</td><td>HIV Status</td> <td>MFL Code</td><td>Facility Name</td><td>Edit</td> </tr></thead><tbody>";

            while (conn.rs.next()) {

                data += "<tr>"
                        + "<td>" + conn.rs.getString("SubPartnerID") + "</td>"
                        + "<td>" + conn.rs.getString("regostrationdate") + "</td>"
                        + "<td>" + conn.rs.getString("hivstatus") + "</td>"
                        + "<td>" + conn.rs.getString("Mflcode") + "</td>"
                        + "<td>" + conn.rs.getString("SubPartnerNom") + "</td></tr>";

            }
            data += "</tbody></table>";
            out.println(data);

        } catch (Exception e) {
        } finally {

            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
