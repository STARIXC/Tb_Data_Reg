<%-- 
    Document   : dataconfig
    Created on : Jul 3, 2019, 8:11:48 AM
    Author     : starixc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TB REG DATABASE CONFIGURATION</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/bootstrap-3/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style2.css">
        <script src="js/jquery.min.js"></script>
        <script src="assets/bootstrap-3/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container">
            <center>
                <div id="loading"></div>
            </center>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class=" panel panel-primary panel-database">
                        <div class="panel-heading ">
                            <div class="row">
                                <div class="col-xs-6">
                                    <h4 class="text-center text-white" >Database Configuration</h4>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <form id="db-form" action="" method="post" role="form" autocomplete="off">
                                        <div class="form-group">
                                            <label> Host Name:</label>
                                            <input type="text" name="hostname" id="hostname"  placeholder="e.g localhost:3306" value="localhost:3306" autofocus class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Database Name:</label>
                                            <input type="text" name="database" id="database"  placeholder="Database Name" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>User:</label>
                                            <input type="text" name="dbuser" id="dbuser" placeholder="Username" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Password:</label>
                                            <input type="password" name="dbpassword" id="dbpassword" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="reset" value="Reset" class="btn btn-info">
                                                    <input type="submit" id="savedb" name="savedb" value="Submit" class="btn btn-primary">
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
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/additional/additional.js"></script>
        <script>
            $(function () {
                $('#savedb').click(function () {

                    $('#loading').html('<img src="images/ajax-loader.gif"> loading...');
                    $('#db-form').validate({
                        rules: {
                            hostname: {
                                required: true
                            },
                            database: {
                                required: true
                            },
                            dbuser: {
                                required: true
                            }
                        },
                        messages: {
                            hostname: "Please enter hostname...",
                            database: "Please enter databse name...",
                            dbuser: "Please enter username..."
                        },
                        submitHandler: function (form) {

                            var hostname, database, user, password;
                            hostname = $("#hostname").val();
                            database = $("#database").val();
                            user = $("#dbuser").val();
                            password = $("#dbpassword").val();

                            var dataString = "hostname=" + hostname +
                                    "&database=" + database +
                                    "&user=" + user +
                                    "&password=" + password;
                            $.ajax({
                                type: 'POST',
                                url: "./databasesave",
                                dataType: 'html',
                                data: dataString,
                                success: function (result)
                                {
                                    setTimeout(function () {
                                        $('#loading').html(result);
                                        window.close();
                                    }, 2000);
                                },
                                error: function () {
                                    alert('Sorry !This didn\'t work . Please Contact the Admin');
                                }
                            });
                            return false;
                        }
                        //
                    });

                });
            });
        </script>
    </body>
</html>
