/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.database.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author starixc
 */
public class updatedata extends HttpServlet {

    PrintWriter out;
    HttpSession session;
    int status = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            // String error = "";
            System.out.println("In Update");
    
            //initialize data recieved
            String ID = request.getParameter("ID");
            String SerialNumber = request.getParameter("SerialNumber");
            String SubCountyRegNo = request.getParameter("SubCountyRegNo");
            String SubPartnerID = request.getParameter("SubPartnerID");
            String RegDate = request.getParameter("RegDate");
            String Sex = request.getParameter("Sex");
            String Age = request.getParameter("Age");
            String Xray = request.getParameter("Xray");
            String TreatmentDate = request.getParameter("TreatmentDate");
            String HIVStatus = request.getParameter("HIVStatus");
            String HIVTestDate = request.getParameter("HIVTestDate");
            String ArtStatus = request.getParameter("ArtStatus");
            String ArtDate = request.getParameter("ArtDate");
            String mflcode = request.getParameter("mflcode");
            String SubPartnerNom = request.getParameter("SubPartnerNom");
            String SupportType = request.getParameter("SupportType");
            String Smear0 = request.getParameter("Smear0");
            String GenExpert = request.getParameter("GenExpert");
            String WithinFacility = request.getParameter("WithinFacility");
            String HIVModality = request.getParameter("HIVModality");
            
            System.out.println(
                    "ID : " + ID
                    + "Serial No: " + SerialNumber
                    + "SubCountyReg No: " + SubCountyRegNo
                    + " SubpartnerID : " + SubPartnerID
                    + " facility Name " + SubPartnerNom
                    + " MFLCODE " + mflcode
                    + "Reg Date :" + RegDate
                    + "Sex :" + Sex
                    + "Age: " + Age
                    + "Xray: " + Xray
                    + "Treatment Date :" + TreatmentDate
                    + "HIV Status :" + HIVStatus
                    + "HIV Test Date :" + HIVTestDate
                    + "Art Status :" + ArtStatus
                    + "Art Date :" + ArtDate
                    + "Support Type :" + SupportType
                    + "Smear0 :" + Smear0
                    + "GenExpert :" + GenExpert
                    + "Tested withing the Facility :" + WithinFacility
                    + "HIV Modality : " + HIVModality
            );
            // Initialize the database 
            dbConn conn = new dbConn();
            System.out.println("Processing");
            // Create a SQL query to insert data into demo table 
            String result="";
            String update_data="UPDATE `tibu_tb_raw` SET `SubPartnerID`='"+SubPartnerID+"',`registrationdate`='"+RegDate+"',`sex`='"+Sex+"',`age`='"+Age+"',`treatmentdate`='"+TreatmentDate+"',`hivstatus`='"+HIVStatus+"',`hivtestdate`='"+HIVTestDate+"',`artstatus`='"+ArtStatus+"',`artdate`='"+ArtDate+"',`Mflcode`='"+mflcode+"',`SubPartnerNom`='"+SubPartnerNom+"',`supporttype`='"+SupportType+"',`smear0`='"+Smear0+"',`genexpert`='"+GenExpert+"',`tested_within_facility`='"+WithinFacility+"',`initial_modality`='"+HIVModality+"',`subcounty_regno`='"+SubCountyRegNo+"',`serialno`='"+SerialNumber+"',`xray`='"+Xray+"' WHERE id='"+ID+"'";
            conn.pst = conn.conn.prepareStatement(update_data);
            status = conn.pst.executeUpdate();
            if (status > 0) {
                result += "Record has been updated Successfully..";
                out.println(result);
                //session.setAttribute("email", email);
                //session.setAttribute("updated",'"+result+"');
               // response.sendRedirect("home.jsp");
                System.out.println("Record has been updated Successfully..");
            } else {
                out.println("Oops! Something went wrong...");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
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
