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

/**
 *
 * @author starixc
 */
public class savedata extends HttpServlet {

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
        doPost(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            // String error = "";
            System.out.println("In Inserting Records ...");
            //initialize data recieved
            String user_id=request.getParameter("user_id");
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
            String ID = SubCountyRegNo + "_" + mflcode;
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
            // Create a SQL query to insert data into demo table 

            String Insert_data = "INSERT INTO `tibu_tb_raw`(`id`, `SubPartnerID`, `registrationdate`, `sex`, `age`, "
                    + "`treatmentdate`, `hivstatus`,`hivtestdate`,`artstatus`,`artdate`,`Mflcode`,`SubPartnerNom`, "
                    + "`supporttype`,`smear0`,`genexpert`, `tested_within_facility`, "
                    + "`initial_modality`,`subcounty_regno`,`serialno`,`xray`,`user_id`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(Insert_data);

            // get the data using request object 
            // sets the data to st pointer 
            conn.pst.setString(1, ID);
            conn.pst.setString(2, SubPartnerID);
            conn.pst.setString(3, RegDate);
            conn.pst.setString(4, Sex);
            conn.pst.setString(5, Age);
            conn.pst.setString(6, TreatmentDate);
            conn.pst.setString(7, HIVStatus);
            conn.pst.setString(8, HIVTestDate);
            conn.pst.setString(9, ArtStatus);
            conn.pst.setString(10, ArtDate);
            conn.pst.setString(11, mflcode);
            conn.pst.setString(12, SubPartnerNom);
            conn.pst.setString(13, SupportType);
            conn.pst.setString(14, Smear0);
            conn.pst.setString(15, GenExpert);
            conn.pst.setString(16, WithinFacility);
            conn.pst.setString(17, HIVModality);
            conn.pst.setString(18, SubCountyRegNo);
            conn.pst.setString(19, SerialNumber);
            conn.pst.setString(20, Xray);
            conn.pst.setString(21, user_id);
            String result = "";
            // Execute the insert command using executeUpdate() 
            // to make changes in database 
            if (conn.pst.executeUpdate() == 1) {
                // Get a writer pointer  
                //response.sendRedirect("home.jsp");
                // to display the succesful result 
                result += "Record Submited Successfully";
                out.println(result);
                System.out.println("SUCCESS...");
            }else{
                       System.out.println("fAILED TO SAVE ");
                    out.println("Oops! Something went wrong...");
                       
            }
            
            // Close all the connections 
            conn.pst.close();
            conn.conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
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
