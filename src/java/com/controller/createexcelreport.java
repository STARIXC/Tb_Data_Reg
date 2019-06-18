/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author starixc
 */
public class createexcelreport extends HttpServlet {

    PrintWriter out;
    HttpSession session;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            response.setContentType("text/html;charset=UTF-8");
            out = response.getWriter();
            //______________________________________________________________________________________
//                       CREATE THE WORKSHEETS          
//______________________________________________________________________________________  
        XSSFWorkbook wb = new XSSFWorkbook();
        //writeexcell
        FileOutputStream fout = new FileOutputStream(new File("D:/MFL/TB2/Tb_Raw_Data.xls"));
       

        XSSFSheet sheet = wb.createSheet("Tb_Raw_Data");
    
            
            //create workboo sheet
  
            //creating a row
            XSSFRow row = sheet.createRow(0);
            //Create cell in row
            row.createCell(0).setCellValue("id");
            row.createCell(1).setCellValue("SubPartnerID");
            row.createCell(2).setCellValue("registrationdate");
            row.createCell(3).setCellValue("age");
            row.createCell(4).setCellValue("treatmentdate");
            row.createCell(5).setCellValue("hivstatus");
            row.createCell(6).setCellValue("hivtestdate");
            row.createCell(7).setCellValue("artstatus");
            row.createCell(8).setCellValue("artdate");
            row.createCell(9).setCellValue("treatmentoutcome");
            row.createCell(10).setCellValue("outcomedate");
            row.createCell(11).setCellValue("timestamp");
            row.createCell(12).setCellValue("Mflcode");
            row.createCell(13).setCellValue("agebracket");
            row.createCell(14).setCellValue("SubPartnerNom");
            row.createCell(15).setCellValue("supporttype");
            row.createCell(16).setCellValue("tbtype");
            row.createCell(17).setCellValue("patienttype");
            row.createCell(18).setCellValue("smear0");
            row.createCell(19).setCellValue("smear2_3");
            row.createCell(20).setCellValue("smear5");
            row.createCell(21).setCellValue("smear6_8");
            row.createCell(22).setCellValue("genexpert");
            row.createCell(23).setCellValue("tested_within_facility");
            row.createCell(24).setCellValue("initial_modality");
            //write workbok into a file
            //row1.createCell(0).setCellValue("initial_modality");
          
            wb.write(fout);
            fout.close();

        } catch (Exception e) {
            System.out.println(e);
        } finally {
           System.out.println("Excell Page Created Successfull");
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
