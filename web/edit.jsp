<%-- 
    Document   : home
    Created on : Jun 7, 2019, 1:04:06 PM
    Author     : starixc
--%>

<%@page import="com.database.dbConn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head><style id="stndz-style"></style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Tb Register Data Entry and Management System</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link href="assets/bootstrap/css/bootstrap-glyphicons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/bootstrap/maps/glyphicons-fontawesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/footable.bootstrap.css">
    <!--<link rel="stylesheet" href="assets/DT-Tables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="assets/DT-Tables/css/responsive.dataTables.min.css">
    <link rel="stylesheet" href="assets/DT-Tables/css/buttons.dataTables.min.css">-->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-formhelpers.min.css">
    <link rel="stylesheet" href="assets/calender/lib/jquery-ui.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link href="assets/offcanvas.css" rel="stylesheet">

</head>

<body class="bg-light">
    <%
        String name = (String) session.getAttribute("name");
        String id = (String) session.getAttribute("ID");
        if(id!=null){
        %>
    <%
        String ID, record_id, SerialNumber, SubCountyRegNo, SubPartnerID, RegDate, sex, age, Xray, treatmentdate, hivStatus, hivtestdate, artstatus, artdate, Mflcode, SubPartnerNom, smear0, genexpert, withinfacility, initialmodality;

        dbConn conn = new dbConn();
    %>
    <%
        try {
            record_id = request.getParameter("id");
            //query
            String sql = "SELECT * FROM `tibu_tb_raw` WHERE `id`='" + record_id + "'";
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

    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
        <a class="navbar-brand mr-auto mr-lg-0" href="#">TB Register System</a>
        <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Dashboard <span class="sr-only">(current)</span></a>
                </li>

                <!-- <li class="nav-item">
                     <a class="nav-link" href="#">Notifications</a>
                 </li>
                -->

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item">
                    <a class="nav-link" href="#">Welcome :<i class="glyphicon glyphicon-user"></i><%=name%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" title="Help" data-toggle="modal" href="#help">
                        <i class="glyphicon glyphicon-question-sign"></i>
                        Help
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">
                        <i class="glyphicon glyphicon-lock"></i>
                        Logout
                    </a>
                </li>


                </li>

            </ul>

        </div>
    </nav>

    <div class="nav-scroller bg-white box-shadow">
        <nav class="nav nav-underline">
            <a class="nav-link active" href="#">Dashboard</a>
          
        </nav>
    </div>

    <main role="main" class="container">
        <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded box-shadow" style="background-color: rgb(0, 128, 255);">

            <div class="lh-100">
                <h6 class="mb-0 text-white lh-100">Tb Date Entry and Management System</h6>

            </div>
        </div>

        <div class="my-1 p-2 bg-white rounded box-shadow">
            <section id="tabs" class="project-tab">
                <div class="container1">
                    <div class="row">
                        <div class="col-md-12">
                              <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <h3 class="border-bottom border-primary pb-2 mb-1 mt-2">Editing <%=ID%></h3>
                                    <div class="text-white pt-3 bg-primary">
                                        <center><div id="loading" class='alert-success'> </div></center>
                                        <form id="form_data" autocomplete="off">
                                            <input type="hidden" class="form-control col-md-6 " id="id" name="id" value="<%=ID%>" disabled >
                                            <div class="row offset-1">
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label for="serialNumber">Serial Number</label>
                                                        <input type="text" class="form-control " id="serialNumber" name="serialNumber" value="<%=SerialNumber%>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="dateOfRegistration">Date of Registration</label>
                                                        <input type="text" class="form-control" id="dateOfRegistration" name="dateOfRegistration" value="<%=RegDate%>" >
                                                    </div>	
                                                    <div class="form-group">
                                                        <label for="subCountyRegNo">Sub County Registration No.</label>
                                                        <input type="text" class="form-control" id="subCountyRegNo" name="subCountyRegNo" value="<%=SubCountyRegNo%>">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="county">County</label>
                                                        <select class="form-control"  onchange="patasubcounty()" name='county' id='county'>
                                                            <option value=""> Select County</option>
                                                            <option value="1"> Nakuru</option>
                                                            <option value="2"> Laikipia</option>
                                                            <option value="3"> Narok</option>
                                                            <option value="4"> Baringo</option>
                                                            <option value="5"> Kajiado</option>
                                                            <option value="7"> Samburu</option>
                                                            <option value="8"> Turkana</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="subCounty">Sub-County</label>
                                                        <select class="form-control"  onchange='patafacility()' name='subcounty' id='subcounty' >


                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="healthFaciities">Health Facilities</label>
                                                        <select class="form-control"  name='facility' id='facility' >
                                                            <option id='facility_select' value='<%=SubPartnerNom%>' data-subpartnerid='<%=SubPartnerID%>' data-mfl='<%=Mflcode%>' data-facility='<%=SubPartnerNom%>' ><%=SubPartnerNom%> </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row offset-1">
                                                <div class="col-md-5">

                                                    <div class="form-group">
                                                        <label for="sex">Sex</label>
                                                        <select class="form-control" id="sex" name="sex">
                                                            <option value="<%=sex%>"><%=sex%></option>
                                                            <option value="M">Male</option>
                                                            <option value="F">Female</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="ageOnRegistration">Age on Registration</label>
                                                        <input type="Number" class="form-control" id="ageOnRegistration" name="ageOnRegistration" value="<%=age%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="xray">Xray</label>
                                                        <select class="form-control" id="xray" name="xray">
                                                            <option value="<%=Xray%>"><%=Xray%></option>
                                                            <option value="Y">Yes</option>
                                                            <option value="N">No</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="hivStatus">HIV Status</label>
                                                        <select class="form-control" id="hivStatus" name="hivStatus">
                                                            <option value="<%=hivStatus%>"><%=hivStatus%></option>
                                                            <option value="ND">ND</option>
                                                            <option value="Neg">Neg</option>
                                                            <option value="Pos">Pos</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="hivTestDate">HIV Test Date</label>
                                                        <input type="text" class=" form-control" name="hivTestDate" id="hivTestDate" value="<%=hivtestdate%>">
                                                    </div>
                                                    <div class="form-group" id="dttreatment" >
                                                        <label for="dateTreamentStarted">Date of Treatment Started</label>
                                                        <input type="text" class="form-control" name="dateTreamentStarted" id="dateTreatmentStarted" value="<%=treatmentdate%>">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="art">ART</label>
                                                        <select class="form-control" id="art" name="art">
                                                            <option value="<%=artstatus%>"><%=artstatus%></option>
                                                            <option value="Y">YES</option>
                                                            <option value="N">NO</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="artDate">ART Date</label>
                                                        <input type="text" class=" form-control" name="artdate" id="artdate" value="<%=artdate%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sputumSmear">Sputum Smear Examination 0th Month Result</label>
                                                        <select class="form-control" id="sputumSmear" name="sputumSmear">
                                                            <option value="<%=smear0%>"><%=smear0%></option>
                                                            <option value="ND">ND</option>
                                                            <option value="Neg">Neg</option>
                                                            <option value="Pos">Pos</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="generalExpert">General Expert</label>
                                                        <select class="form-control" id="generalExpert" name="generalExpert">
                                                            <option value="<%=genexpert%>"><%=genexpert%></option>
                                                            <option value="MTB detected, Rifampicin resistance detected">MTB detected, Rifampicin resistance detected</option>
                                                            <option value="MTB detected, Rifampicin resistance indeterminate">MTB detected, Rifampicin resistance indeterminate</option>
                                                            <option value="MTB detected, Rifampicin resistance not detected">MTB detected, Rifampicin resistance not detected</option>
                                                            <option value="MTB not detected">MTB not detected</option>
                                                            <option value="Not Applicable">Not Applicable</option>
                                                            <option value="Not Done">Not Done</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="testedWithinFacility">Was the Client Tested for HIV within the Facility ?</label>
                                                        <select class="form-control" id="withinFacility" name="withinFacility">
                                                            <option value="<%=withinfacility%>"><%=withinfacility%></option>
                                                            <option value="Y">YES</option>
                                                            <option value="N">NO</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="hivTestModality">What was the HIV Test Modality ?</label>
                                                        <select class="form-control" id="hivModality" name="hivModality">
                                                            <option value="<%=initialmodality%>"><%=initialmodality%></option>
                                                            <option value="Other PITC">Other PITC</option>
                                                            <option value="Inpatient">Inpatient</option>
                                                            <option value="Emergency">Emergency</option>
                                                            <option value="Malnutrition">Malnutrition</option>
                                                            <option value="Pediatrics">Pediatrics</option>
                                                            <option value="PMTCT- ANC1 Only">PMTCT- ANC1 Only</option>
                                                            <option value="STI">STI</option>
                                                            <option value="VCT">VCT</option>
                                                            <option value="Index Testing">Index Testing</option>
                                                            <option value="PMTCT POST ANC1">PMTCT POST ANC1</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row offset-1">

                                               <div class="pull-left col-6"><a href="home.jsp" id="cancel" name="cancel" class="btn btn-warning btn-lg mb-2 ">Cancel</a></div>
                                                <div class="pull-right col-6"><input type="submit" class="btn btn-success btn-lg mb-2 " id="update_data" name="update_data"  value="Update"/></div>
                                            </div>

                                        </form>
                                    </div>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }
                               %>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>
      

    </main>
   <!-- Modal -->
    <div class="modal fade" id="help" tabindex="-1" role="dialog" aria-labelledby="Help" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title" id="Help">HELP ?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>This  system is created for aiding users in collecting data. One is expected to enter data per facility.</p>
                    <h3>Required Data</h3>
                    <p>The specific data that one should enter data for are;</p>
                    <ul>

                        <li> A. Serial Number </li>
                        <li>B. Date of Registration( dd mmm YYYY e.g 01 Jan 2019)</li>

                        <li>C. Sub-County Registration Number</li>

                        <li>D. Sex (M/F)</li>

                        <li>E. Age on Registration <br>(If Age is Bellow 12 Months, round up to 1 yr)</li>

                        <li>F. Date of Treatment started( dd mmm YYYY e.g 01 Jan 2019)<br> if HIV Status is negative the Date can be Ignored</li>

                        <li>G. HIV Status (Pos,Neg,ND)</li>

                        <li>H. HIV Test Date( dd mmm YYYY e.g 01 Jan 2019)</li>

                        <li>I. ART Status(Y/N)</li>

                        <li>J. ART DATE(Date Started)( dd mmm YYYY e.g 01 Jan 2019)</li>

                        <li>K. Smear0 -Sputum Smear Examination 0th Month Result</li>

                        <li>L. General Expert- to be Chosen from the Drop Down </li>
                        <li>M. Tested within facility - Was the Client test for HIV within the facility? Y/N</li>
                        <li>N. Initial Modality - What was the HIV Test Modality (Use the Availed Dropdown) </li>
                    </ul>
                    <h3>Data Validation</h3>
                    <ul>
                        <li>A. ART Date should be latter or equal to Date Tested</li>
                        <li>B. If HIV status is Positive or Negative the Date Tested is a Must</li>
                        <li>C. IF ART Status is equal to Yes, Date Tested is a Must Enter</li>
                        <li>D. All the Dates Entered should follow the format( dd mmm YYYY e.g 01 Jan 2019) </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/bootstrap/js/jquery-3.4.1.min.js" ></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/additional/additional.js"></script>
    <script src="assets/popper.min.js"></script>
    <script src="assets/bootstrap.min.js"></script>
    <script src="assets/holder.min.js"></script>
    <script src="assets/offcanvas.js"></script>
    <script src="assets/bootstrap/js/bootstrap-formhelpers.js"></script>
    <script src="assets/calender/lib/jquery-ui.min.js"></script>



    <script src="js/scripts.js"></script>

    <script>


                                                            //form validation
                                                            $(document).ready(function () {

                                                                $("#dateOfRegistration").datepicker({
                                                                    dateFormat: 'dd M yy',
                                                                    numberOfMonths: 1,
                                                                    changeMonth: true,
                                                                    changeYear: true,
                                                                    onSelect: function (selected) {
                                                                        var dt = new Date(selected);
                                                                        dt.setDate(dt.getDate() + 1);
                                                                        $("#dateTreatmentStarted").datepicker("option", "minDate", dt);
                                                                    }
                                                                });
                                                                $("#dateTreatmentStarted").datepicker({
                                                                    dateFormat: 'dd M yy',
                                                                    changeMonth: true,
                                                                    changeYear: true,
                                                                    numberOfMonths: 1,
                                                                    onSelect: function (selected) {
                                                                        var dt = new Date(selected);
                                                                        dt.setDate(dt.getDate() - 1);
                                                                        $("dateOfRegistration").datepicker("option", "maxDate", dt);
                                                                    }
                                                                });
                                                                //  $("#artdate").datepicker();
                                                                // $("#hivTestDate").datepicker(  );


                                                                $("#hivTestDate").datepicker({
                                                                    dateFormat: 'dd M yy',
                                                                    changeMonth: true,
                                                                    changeYear: true,
                                                                    yearRange: new Date().getFullYear().toString() + ':' + new Date().getFullYear().toString(),
                                                                    onClose: function (selectedDate) {
                                                                        $("#artdate").datepicker("option", "minDate", selectedDate);
                                                                    }
                                                                });
                                                                $("#artdate").datepicker({
                                                                    dateFormat: 'dd M yy',
                                                                    changeMonth: true,
                                                                    changeYear: true,
                                                                    yearRange: new Date().getFullYear().toString() + ':' + new Date().getFullYear().toString(),
                                                                    onClose: function (selectedDate) {
                                                                        $("#hivTestDate").datepicker("option", "maxDate", selectedDate);
                                                                    }
                                                                });


                                                               
                                                            });
    </script>
     <script src="js/update.js"></script>
  
    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="2" style="font-weight:bold;font-size:2pt;font-family:Arial, Helvetica, Open Sans, sans-serif">32x32</text></svg>
<%
        }else{
            response.sendRedirect("login.jsp");
        }
%>
</body>
</html>
