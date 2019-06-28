<%-- 
    Document   : login
    Created on : Jun 11, 2019, 9:25:31 AM
    Author     : starixc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Employee Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/bootstrap-3/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.min.js"></script>
        <script src="assets/bootstrap-3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/select2.min.css">
        
    </head>
    <body>
        <div class="container">
            <%
                String error = (String) session.getAttribute("error");
                if (error == null) {

                } else {
                    out.println("<center><div class='alert alert-danger' style='width:55%;'>" + error + "</div></center>");
                    session.removeAttribute("error");
                }
            %>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="active" id="login-form-link">Login</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="#" id="register-form-link">Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="../EmployeeServlet" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <input type="text" name="email" required="" placeholder="Employee Email" tabindex="1" class="form-control" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" required="" placeholder="Employee Password" tabindex="2" class="form-control" >
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="login" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="register-form" action="EmployeeServlet" method="post" role="form" style="display: none;">
                                        <div class="form-group">
                                            <label> Employee Name:</label>
                                            <input type="text" name="name" id="name" required="" placeholder="Employee Name" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Employee Email:</label>
                                            <input type="text" name="email" id="email" required="" placeholder="Employee Email" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Employee Password:</label>
                                            <input type="password" name="password" id="password" required="" placeholder="Employee Password" class="form-control" onblur="pataregfacility()">
                                        </div>
                                        <div class="form-group">
                                            <label>Employee Facility:</label>
                                            <select class="form-control" name='department' id='department' >
                                                <option value=''>Select Facility</option>
                                            </select>
                                            <!--  <input type="text" name="department" id="department" required="" placeholder="Employee Department" class="form-control">-->
                                        </div>
                                        <div class="form-group">
                                            <label>Employee Designation:</label>
                                            <input type="text" name="designation" id="designation" required="" placeholder="Employee Designation" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="reset" value="Reset" class="btn btn-info">
                                                    <input type="submit" id="register" name="register" value="Submit" class="btn btn-primary">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script>
            $(function () {

                $('#login-form-link').click(function (e) {
                    $("#login-form").delay(100).fadeIn(100);
                    $("#register-form").fadeOut(100);
                    $('#register-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                $('#register-form-link').click(function (e) {
                    $("#register-form").delay(100).fadeIn(100);
                    $("#login-form").fadeOut(100);
                    $('#login-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });

            });

        </script>
        <script src="js/select2.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
