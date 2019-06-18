<%-- 
    Document   : home
    Created on : Jun 7, 2019, 1:04:06 PM
    Author     : starixc
--%>

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

<body class="bg-light" onload="">
    <%
        String email = (String) session.getAttribute("email");
        String id = (String) session.getAttribute("ID");
        if (email != null) {
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
                    <a class="nav-link" href="#">Welcome :<i class="glyphicon glyphicon-user"></i><%=email%> your ID:<%=id%></a>
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
            <!--  <a class="nav-link" href="#">
                  Friends
                  <span class="badge badge-pill bg-light align-text-bottom">27</span>
              </a>
              <a class="nav-link" href="#">Explore</a>
              <a class="nav-link" href="#">Suggestions</a>-->

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
                            <nav>
                                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><i class="glyphicon glyphicon-plus"></i> Add New</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"> <i class="glyphicon glyphicon-search"></i>View Data</a>
                                <!--    <a class="nav-item nav-link" id="nav-update-tab" data-toggle="tab" href="#nav-update" role="tab" aria-controls="nav-contact" aria-selected="false" onclick="displayUpdateData()"></a>-->
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <%
                                    try {
                                        String deleted = (String) session.getAttribute("deleted");
                                        if (deleted != null) {
                                            session.removeAttribute("deleted");
                                            out.println("<center><div class='alert alert-danger'>" + deleted + "</div></center>");
                                        } else {
                                        }
                                        String updated = (String) session.getAttribute("updated");
                                        if (updated != null) {
                                            session.removeAttribute("updated");
                                            out.println("<center><div class='alert alert-success'>" + updated + "</div></center>");
                                        } else {
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }


                                %>
                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <h6 class="border-bottom border-gray pb-2 mb-0 mt-2">Enter New Record</h6>
                                    <div class="text-white pl-5 pt-3 bg-primary">
                                        <center>
                                            <div id="loading"></div>
                                        </center>

                                        <form method="POST"  id="form_data" autocomplete="off" validate >

                                            <div class="row offset-0 p-2">
                                                <input type="hidden" name="id" id="id" value="<%=id%>">
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label for="serialNumber">Serial Number</label>
                                                        <input type="text" class="form-control" id="serialNumber" name="serialNumber" placeholder=" Enter Serial Number">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="dateOfRegistration">Date of Registration</label>
                                                        <input type="text" class="form-control" id="dateOfRegistration" name="dateOfRegistration" >
                                                    </div>	
                                                    <div class="form-group">
                                                        <label for="subCountyRegNo">Sub County Registration No.</label>
                                                        <input type="text" class="form-control" id="subCountyRegNo" name="subCountyRegNo">
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

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row p-2">
                                                <div class="col-md-5">

                                                    <div class="form-group">
                                                        <label for="sex">Sex</label>
                                                        <select class="form-control" id="sex" name="sex">
                                                            <option value="">Select One</option>
                                                            <option value="M">Male</option>
                                                            <option value="F">Female</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="ageOnRegistration">Age on Registration</label>
                                                        <input type="Number" class="form-control" id="ageOnRegistration" name="ageOnRegistration">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="xray">Xray</label>
                                                        <select class="form-control" id="xray" name="xray">
                                                            <option value="">Select One</option>
                                                            <option value="Y">Yes</option>
                                                            <option value="N">No</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="hivStatus">HIV Status</label>
                                                        <select class="form-control" id="hivStatus" name="hivStatus">
                                                            <option value="">Select One</option>
                                                            <option value="ND">ND</option>
                                                            <option value="Neg">Neg</option>
                                                            <option value="Pos">Pos</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="hivTestDate">HIV Test Date</label>
                                                        <input type="text" class=" form-control" name="hivTestDate" id="hivTestDate">
                                                    </div>
                                                    <div class="form-group" id="dttreatment" >
                                                        <label for="dateTreamentStarted">Date of Treatment Started</label>
                                                        <input type="text" class="form-control" name="dateTreamentStarted" id="dateTreatmentStarted">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="art">ART</label>
                                                        <select class="form-control" id="art" name="art">
                                                            <option value="">Select One</option>
                                                            <option value="Y">YES</option>
                                                            <option value="N">NO</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="artDate">ART Date</label>
                                                        <input type="text" class=" form-control" name="artdate" id="artdate">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sputumSmear">Sputum Smear Examination 0th Month Result</label>
                                                        <select class="form-control" id="sputumSmear" name="sputumSmear">
                                                            <option value="">Select One</option>
                                                            <option value="ND">ND</option>
                                                            <option value="Neg">Neg</option>
                                                            <option value="Pos">Pos</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="generalExpert">General Expert</label>
                                                        <select class="form-control" id="generalExpert" name="generalExpert">
                                                            <option value="">Select One</option>
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
                                                            <option value="">Select One</option>
                                                            <option value="Y">YES</option>
                                                            <option value="N">NO</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="hivTestModality">What was the HIV Test Modality ?</label>
                                                        <select class="form-control" id="hivModality" name="hivModality">
                                                            <option value="">Select One</option>
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
                                                <div class="col-md-8">
                                                    <input type="submit" class="btn btn-success btn-lg mb-2" id="save_data" name="save_data" value="Save Record"/>
                                                </div>

                                            </div>

                                        </form>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <h6 class="border-bottom border-gray pb-2 mb-0 mt-2">Tb Register Records</h6>

                                    <div class="text-muted pt-3">
                                        <div class="table-responsive toggle-circle-filled" id="datat">
                                            <table class="table table-bordered footable footable-1 footable-filtering footable-filtering-right footable-paging footable-paging-center breakpoint breakpoint-xs" data-paging="true" data-filtering="true" data-sorting="true" style="display: table;">
                                                <thead>

                                                    <tr>
                                                        <th data-visible="true">S/No:</th>
                                                        <th>SubPartner ID</th>
                                                        <th data-breakpoints="xs sm md">Sub County Reg #</th>
                                                        <th data-breakpoints="xs">MFL Code</th>
                                                        <th data-breakpoints="all">Facility Name</th>
                                                        <th data-breakpoints="all">HIV Status</th> 
                                                        <th data-breakpoints="all">ART Status</th> 
                                                        <th data-breakpoints="all">Sex</th> 
                                                        <th data-breakpoints="all">Age</th> 
                                                        <th data-breakpoints="xs sm md">Registration Date</th>

                                                        <th>Edit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%@ include file = "list_data.jsp" %>
                                                    <!----data from  db table---->

                                                </tbody>

                                            </table>

                                        </div>

                                    </div>
                                </div>
                             <!--   <div class="tab-pane fade" id="nav-update" role="tabpanel" aria-labelledby="nav-update-tab">
                                    <h6 class="border-bottom border-gray pb-2 mb-0 mt-2">Tb Register Records</h6>
                                    <div class="text-muted pt-3">
                                        <div class="col-lg-12 col-md-12">

                                            <table id='tb_report_table' class='table table-striped table-hover ' data-paging="true" style='width:100%'>
                                                <thead>
                                                    <tr>
                                                        <th>SubPartner ID</th>
                                                        <th>Registration Date</th>
                                                        <th>HIV Status</th> 
                                                        <th>MFL Code</th>
                                                        <th>Facility Name</th>
                                                        <th>Edit</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="update_data">
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>SubPartner ID</th>
                                                        <th>Registration Date</th>
                                                        <th>HIV Status</th> 
                                                        <th>MFL Code</th>
                                                        <th>Facility Name</th>
                                                        <th>Edit</th>
                                                    </tr>
                                                </tfoot>
                                            </table>

                                        </div>

                                    </div>
                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>


    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="assets/DT-Tables/js/jquery-3.3.1.min.js" ></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/bootstrap/js/bootstrap.min.js" ></script>
    <!--<script src="assets/DT-Tables/js/jquery.dataTables.min.js" ></script>
    <script src="assets/DT-Tables/js/dataTables.bootstrap.min.js" ></script>
    <script src="assets/DT-Tables/js/dataTables.responsive.min.js" ></script>
    <script src="assets/DT-Tables/js/dataTables.buttons.min.js" ></script>
    <script src="assets/DT-Tables/js/buttons.flash.min.js" ></script>
    <script src="assets/DT-Tables/js/jszip.min.js" ></script>
    <script src="assets/DT-Tables/js/pdfmake.min.js" ></script>
    <script src="assets/DT-Tables/js/vfs_fonts.js" ></script>
    <script src="assets/DT-Tables/js/buttons.html5.min.js" ></script>
   
    <script src="assets/DT-Tables/js/buttons.print.min.js" ></script>-->
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/additional/additional.js"></script>
    <script src="js/footable.js"></script>
    <script src="assets/popper.min.js"></script>
    <script src="assets/offcanvas.js"></script>
    <script src="assets/bootstrap/js/bootstrap-formhelpers.js"></script>
    <script src="assets/calender/lib/jquery-ui.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/datepicker.js"></script>



    <script src="js/form.js"></script>

    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="2" style="font-weight:bold;font-size:2pt;font-family:Arial, Helvetica, Open Sans, sans-serif">32x32</text></svg>
    <%    } else {
            response.sendRedirect("login.jsp");
        }
    %>
    <script src="js/app.js"></script>
    <script src="pouchdb-7.0.0.min.js"></script>
    <script src="js/pouch_save.js"></script>
    
    <script>
                                                            jQuery(function ($) {
                                                                $('.table').footable();
                                                            });
    </script>
</body>
</html>