/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.database.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author starixc
 */
public class save_data extends HttpServlet {

    PrintWriter out;
    HttpSession session;
    int status = 0;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         try{
            out=response.getWriter();
            session=request.getSession();
            if(request.getParameter("save_data")!=null)//request comming from index.jsp page, where register is button name.
            {
                System.out.println("In Progress");
                /* Getting The Value From TextBox  */
                 String SubCountyRegNo = request.getParameter("SubCountyRegNo");
            String SubPartnerID = request.getParameter("SubPartnerID");
            String RegDate = request.getParameter("RegDate");
            String Sex = request.getParameter("Sex");
            String Age = request.getParameter("Age");
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
            System.out.println("ID : " + ID + " SubpartnerID : " + SubPartnerID
                    + " facility Name " + SubPartnerNom
                    + " MFLCODE " + mflcode
                    + "Reg Date :" + RegDate
                    + "Sex :" + Sex
                    + "Age: " + Age
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
                /* JDBC Connection Code  */
                dbConn conn = new dbConn();
                /*Declare and run database Query*/
               String Insert_data = "INSERT INTO `tibu_tb_raw`(`id`, `SubPartnerID`, `registrationdate`, `sex`, `age`, "
                    + "`treatmentdate`, `hivstatus`,`hivtestdate`,`artstatus`,`artdate`,`Mflcode`,`SubPartnerNom`, "
                    + "`supporttype`,`smear0`,`genexpert`, `tested_within_facility`, "
                    + "`initial_modality`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(Insert_data);
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
            String result = "Data Processing";
            // Execute the insert command using executeUpdate() 
            // to make changes in database 
         
                status=conn.pst.executeUpdate();
                if(status>0)
                {
                    // to display the succesful result 
                result += "Record Submited Successfully";
                    //session.setAttribute("email",email);
                    response.sendRedirect("home.jsp");
                }
                else
                {
                    out.println("Oops! Something went wrong...");
                }
            }
            else if(request.getParameter("login")!=null)
            {
                System.out.println("In Login");
                /* Getting The Value From TextBox  */
                String email=request.getParameter("email");
                String password=request.getParameter("password");
                System.out.println(email+" "+password);
                
                 /* JDBC Connection Code  */
                dbConn conn = new dbConn();
                
                String sql="select * from employee where email='"+email+"' and password='"+password+"'";
                conn.rs=conn.st.executeQuery(sql);
                if(conn.rs.next()){
                    session.setAttribute("email",email);   
                    response.sendRedirect("home.jsp");
                }
                else
                {
                    session.setAttribute("error", "Invalid Email and Password...");
                    response.sendRedirect("login.jsp");
                }
            }
            else if(request.getParameter("update")!=null)
            {
                System.out.println("In Update");
                /* Getting The Value From TextBox  */
                int id=Integer.parseInt(request.getParameter("id"));//getting value from hidden field textbox
                String name=request.getParameter("name");
                String email=request.getParameter("email");
                String password=request.getParameter("password");
                String department=request.getParameter("department");
                String designation=request.getParameter("designation");
                
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                String todayDate=sdf.format(new Date());
                
                System.out.println(name+" "+email+" "+password+" "+department+" "+designation+" "+todayDate);
                /* JDBC Connection Code  */
                dbConn conn = new dbConn();
                String sql="update employee set name='"+name+"', email='"+email+"', password='"+password+"', department='"+department+"', designation='"+designation+"' where id="+id+" " ;
                status=conn.pst.executeUpdate();
                if(status>0)
                {
                    session.setAttribute("email",email);
                    session.setAttribute("updated", "Employee has been updated Successfully..");
                    response.sendRedirect("home.jsp");
                }
                else
                {
                    out.println("Oops! Something went wrong...");
                }
            }
            else if(request.getParameter("delete")!=null)
            {
                System.out.println("In Delete");
                int id=Integer.parseInt(request.getParameter("id"));
               /* JDBC Connection Code  */
                dbConn conn = new dbConn();
                
                String sql="delete from employee where id="+id+" " ;
                status=conn.pst.executeUpdate();
                if(status>0)
                {
                    session.setAttribute("deleted", "Employee has been reloved Successfully..");
                    response.sendRedirect("home.jsp");
                }
                else
                {
                    out.println("Oops! Something went wrong...");
                }
                conn.pst.close();
                conn.conn.close();
            }
            
        }catch(Exception e){
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
