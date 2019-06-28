<%-- 
    Document   : home
    Created on : Jun 7, 2019, 1:04:06 PM
    Author     : starixc
--%>

<%@page import="org.apache.tomcat.util.http.Cookies"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html>
<head><style id="stndz-style"></style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Tb Register Data Entry and Management System</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link href="assets/bootstrap/css/bootstrap-glyphicons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/bootstrap/maps/glyphicons-fontawesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/footable.bootstrap.css">
    <link rel="stylesheet" href="css/select2.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-formhelpers.min.css">
    <link rel="stylesheet" href="assets/calender/lib/jquery-ui.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link href="assets/offcanvas.css" rel="stylesheet">

</head>

<body class="bg-light" onload="">
    <%
        Cookie ck[] = request.getCookies();
        Cookie cks[] = request.getCookies();
        String name = null;
        String id = null;
        for (Cookie c : ck) {
            if (c.getName().equals("name")) {
                name = c.getValue();
            }

        }
        for (Cookie cs : cks) {
            if (cs.getName().equals("ID")) {
                id = cs.getValue();
            }

        }
        if (name != null) {
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
                    <a class="nav-link" href="#">Welcome :<i class="glyphicon glyphicon-user"></i><%=name%> your ID:<%=id%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" title="Help" data-toggle="modal" href="#help">
                        <i class="glyphicon glyphicon-question-sign"></i>
                        Help
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../logout.jsp">
                        <i class="glyphicon glyphicon-lock"></i>
                        Logout
                    </a>
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

                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <h6 class="border-bottom border-gray pb-2 mb-0 mt-2">Enter New Record</h6>
                                    <div class="text-white pl-5 pt-3 bg-primary">
                                        <center>
                                            <div id="loading" class="alert-success"></div>
                                        </center>

                                        <form  id="form_data" autocomplete="off" validate method="POST" >

                                            <div class="row offset-0 p-2">
                                                <input type="hidden"  name ="id" id="id" value="<%=id%>" />
                                                <input type="hidden"  name ="rowid" id="rowid"  />
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
                                                        <select class="form-control" onchange="patafacility()"   name='subcounty' id='subcounty' >

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
                                                        <input type="number" class="form-control" id="ageOnRegistration" name="ageOnRegistration" min="1" max="100">
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
                                                <div class="col-md-8">
                                                    <button type="submit" id='updatebutton' style="margin-left: 0%;display:none;" class="btn-lg btn-info active">
                                                        UPDATE 
                                                    </button>

                                                </div>

                                            </div>

                                        </form>
                                    </div>
                                    <div id="sync-wrapper" class="editorPage">
                                        <strong>Sync Status: </strong><span id="sync-span"></span>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <h6 class="border-bottom border-gray pb-2 mb-0 mt-2">Tb Register Records</h6>

                                    <div class="text-muted pt-3">
                                        <div class="table-responsive toggle-circle-filled">
                                            <div id="showRecords">
                                                 <table id="TableResults" data-paging-container="#paging-ui-container" class="table table-bordered footable footable-1 footable-filtering  footable-paging footable-paging-center breakpoint breakpoint-xs" data-paging="true" data-filtering="true" data-sorting="true" style="display:table">
                                                <thead>
                                                    <tr>
                                                        <th data-visible="true">S/No:</th>
                                                        <th>SubPartner ID</th>
                                                        <th data-breakpoints="xs sm md">Sub County Reg #</th>
                                                        <th data-breakpoints="xs">MFL Code</th>
                                                        <th data-breakpoints="all">Facility Name</th>
                                                        <th data-breakpoints="all">ART Status</th>
                                                        <th data-breakpoints="all">Sex</th>
                                                        <th data-breakpoints="all">Age</th>
                                                        <th data-breakpoints="xs sm md">Registration Date</th>
                                                        <th>Edit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                </tbody>
                                            </table>
                                                <div id="paging-ui-container"></div>
                                            </div>
                                           

                                        </div>

                                    </div>
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
    <script src="pouchdb-7.0.0.min.js"></script>
    <script src="pouchdb.find.min.js"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="assets/DT-Tables/js/jquery-3.3.1.min.js" ></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/bootstrap/js/bootstrap.min.js" ></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/additional/additional.js"></script>
    <script src="js/footable.js"></script>
    <script src="assets/popper.min.js"></script>
    <script src="assets/offcanvas.js"></script>
    <script src="assets/bootstrap/js/bootstrap-formhelpers.js"></script>
    <script src="assets/calender/lib/jquery-ui.min.js"></script>
    <script src="js/form_1.js"></script>
    <script src="js/app.js"></script>
    <script src="js/facility.js"></script>
    <script src="js/datepicker.js"></script>

    <% } else {
            response.sendRedirect("login.jsp");
        }
    %>
<script src="js/app.js"></script>
</body>
</html>