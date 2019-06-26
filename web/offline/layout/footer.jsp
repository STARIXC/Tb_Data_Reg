
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="assets/bootstrap/js/jquery-3.4.1.min.js" ></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/additional/additional.js"></script>
        <script src="assets/bootstrap/js/popper.min.js" ></script>
        <script src="assets/bootstrap/js/bootstrap.min.js" ></script>
        <script src="assets/bootstrap/js/bootstrap-formhelpers.js"></script>
        <script src="assets/calender/lib/jquery-ui.min.js"></script>
        <script src="js/scripts.js"></script>
        
        <script>
            
             $(function () {
                $("#dateOfRegistration").datepicker({
                dateFormat: 'dd M yy',
                        numberOfMonths: 1,
                        onSelect: function (selected) {
                        var dt = new Date(selected);
                        dt.setDate(dt.getDate() + 1);
                        $("#dateTreatmentStarted").datepicker("option", "minDate", dt);
                        }
                });
                $("#dateTreatmentStarted").datepicker({
                dateFormat: 'dd M yy',
                        numberOfMonths: 2,
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
                        yearRange: new Date().getFullYear().toString() + ':' + new Date().getFullYear().toString(),
                        onClose: function (selectedDate) {
                        $("#artdate").datepicker("option", "minDate", selectedDate);
                        }
                });
                $("#artdate").datepicker({
                dateFormat: 'dd M yy',
                        changeMonth: true,
                        yearRange: new Date().getFullYear().toString() + ':' + new Date().getFullYear().toString(),
                        onClose: function (selectedDate) {
                        $("#hivTestDate").datepicker("option", "maxDate", selectedDate);
                        }
                });
                });
                //form validation
                $(document).ready(function() {
                $('#form_data').validate({
                rules: {
                      serialNumber: {
                required: true
                },
                        dateOfRegistration: {
                        required: true
                        },
                        subCountyRegNo: {
                        required: true
                        },
                        county: {
                        required: true
                        },
                        subcounty: {
                        required: true
                        },
                        facility: {
                        required: true
                        },
                        sex: {
                        required: true
                        },
                        ageOnRegistration: {
                        required: true
                        },
                        xray: {
                        required: true
                        },
                        hivStatus: {
                        required: true
                        },
                        hivtestDate: {
                        required: function(element) { return $("#art").val() == 'Neg' ||$("#art").val() == 'Pos'}
                        },
                        
                        dateTreatmentStarted: {
                        required: true
                        },
                        art: {
                        required: true
                        },
                        artdate: {
                        required: function(element) { return $("#art").val() == 'Y'}
                        },
                        sputumSmear: {
                        required: true
                        },
                        generalExpert: {
                        required: true
                        },
                        withinFacility: {
                        required: true
                        },
                        hivModality: {
                        required: true
                        }
                },
                        messages: {
                                serialNumber: "please enter the serial Number",
                                dateOfRegistration: "Please select the Registration Date",
                                subCountyRegNo: "please Enter the Subcounty Registration Number",
                                county: "Please Select the County from the drop down options",
                                subcounty: "Please Select the Sub-County from the drop down options",
                                facility: "Please Select the Facility from the drop down options",
                                sex: "Please Select the Sex/Gender of the Patient from the drop down options",
                                ageOnRegistration: "Please Select Age of Patient at Registration, (if below 12 months, round up to 1 yr)",
                                xray: "Please Choose if Xray was performed (Y/N)",
                                hivTestDate:  "Please select the Registration Date",
                                hivStatus: "Please Choose the patient's HIV Status  (Pos,Neg,ND) ",
                                dateTreatmentStarted:"please Choose the date Treatment Started",
                                art:"Please Choose the ART Status (Y/N)",
                                artdate:"please enter the Art Date",
                                sputumSmear:"Please Enter Sputum Smear Examination 0th Month Result (Pos,Neg,ND)",
                                generalExpert:"Please Select the General Expert From the Drop Down List",
                                withinFacility:"Please Choose if the client tested for HIV within the facility? Y/N ",
                                hivModality:" Please Select the HIV Test Modality (Use the availed dropdown)"
                        },
                        submitHandler: function(form) { // just for demo
                        //DATA PROCESSING...

                $('#save_data').click(function (ev) {
                ev.preventDefault();
                //variables
                var SubCountyRegNo = $('#subCountyRegNo').val();
                var RegDate = $('#dateOfRegistration').val();
                var Sex = $('#sex').val();
                var Age = $('#ageOnRegistration').val();
                var TreatmentDate = $('#dateTreatmentStarted').val();
                var HIVStatus = $('#hivStatus').val();
                var HIVTestDate = $('#hivTestDate').val();
                var ArtStatus = $('#art').val();
                var ArtDate = $('#artdate').val();
                var mflcode = $('#facility_select').data('mfl');
                var SubPartnerNom = $('#facility_select').data('facility');
                var subPartnerID = $('#facility_select').data('subpartnerid');
                var SupportType = "DSD";
                var Smear0 = $('#sputumSmear').val();
                var GenExpert = $('#generalExpert').val();
                var WithinFacility = $('#withinFacility').val();
                var HIVModality = $('#hivModality').val();
                var dataString = "SubCountyRegNo=" + SubCountyRegNo + "&SubPartnerID=" + subPartnerID + "&RegDate=" + RegDate + "&Sex=" + Sex + "&Age=" + Age + "&TreatmentDate=" + TreatmentDate + "&HIVStatus= " + HIVStatus + "&HIVTestDate=" + HIVTestDate + "&ArtStatus=" + ArtStatus + "&ArtDate=" + ArtDate + "&mflcode="  + mflcode + "&SubPartnerNom=" + SubPartnerNom + "&SupportType=" + SupportType + "&Smear0=" + Smear0 + "&GenExpert=" + GenExpert + "&WithinFacility=" + WithinFacility + "&HIVModality=" + HIVModality;
                // alert(dataString);
                $.ajax({
                type: 'POST',
                        url: "Tb_Reg_Data_Collector/savedata",
                        data: dataString,
                        success: function (result)
                        {
                        $("#response").html(result);
                        $('#form_data')[0].reset();
                        
                        
                        }
                });
                });
                        return false;
                        }
                });
               
               
                
       });
        </script>

    </body>
</html>

