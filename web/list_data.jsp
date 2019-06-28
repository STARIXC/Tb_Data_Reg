<%@page import="com.database.dbConn"%>
<%
    // String id = (String) session.getAttribute("ID");
    String ID, record_id, SerialNumber, SubCountyRegNo, SubPartnerID, RegDate, sex, age, Xray, treatmentdate, hivStatus, hivtestdate, artstatus, artdate, Mflcode, SubPartnerNom, smear0, genexpert, withinfacility, initialmodality, user_id;

    dbConn conn = new dbConn();
    System.out.println("Your Id: " + id);
    try {
        //record_id = request.getParameter("id");
        //query
        String sql = "SELECT * FROM `tibu_tb_raw` WHERE `user_id`='" + id + "'";
        conn.rs = conn.st.executeQuery(sql);

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


%>
<tr>

    <td><%=SerialNumber%></td>
    <td><%=SubPartnerID%></td>
    <td><%=SubCountyRegNo%></td>
    <td><%=Mflcode%></td>
    <td><%=SubPartnerNom%></td>
    <td><%=hivStatus%></td>
    <td><%=artstatus%></td>
    <td><%=sex%></td>
    <td><%=age%></td>
    <td><%=RegDate%></td>

    <td>

        <a class='btn btn-sm btn-success' title="Edit" href='edit.jsp?id=<%=ID%>'><i class="glyphicon glyphicon-edit"></i></a>
        <a class='btn btn-sm btn-warning'title="Update" href='update.jsp?id=<%=ID%>'><i class="glyphicon glyphicon-open"></i></a>

    </td>
</tr>
<%      }
    } catch (Exception e) {
        out.println(e);
    }

%>
