$().ready(function () {
    $.validator.addMethod("#hivTestDate", function (value, element) {
        var startdatevalue = $("#dateOfRegistration").val();
        return Date.parse(startdatevalue) <= Date.parse(value);
    }, "HIV Test Date should be greater than or Equal to Registration Date.");
    $('#form_data').validate({
        rules: {
            serialNumber: 'required',
            dateOfRegistration: 'required',
            subCountyRegNo: 'required',
            county: 'required',
            subcounty: 'required',
            facility: 'required',
            sex: 'required',
            ageOnRegistration: 'required',
            xray: 'required',
            hivtestDate: {
                required: true
            },
            hivStatus: 'required',
            dateTreatmentStarted: {
                required: true
            },
            art: 'required',
            artdate: {
                required: true
            },
            sputumSmear: 'required',
            generalExpert: 'required',
            withinFacility: 'required',
            hivModality: 'required'

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
            hivTestDate: {
                required: "Please select the Registration Date",
                hivTestDate: true
            },
            hivStatus: "Please Choose the patient's HIV Status  (Pos,Neg,ND) ",
            dateTreatmentStarted:{
                required:"please Choose the date Treatment Started"
            },
            art:"Please Choose the ART Status (Y/N)",
            artdate:{
                required:"please enter the Art Date"
            },
            sputumSmear:"Please Enter Sputum Smear Examination 0th Month Result (Pos,Neg,ND)",
            generalExpert:"Please Select the General Expert From the Drop Down List",
            withinFacility:"Please Choose if the client tested for HIV within the facility? Y/N ",
            hivModality:" Please Select the HIV Test Modality (Use the availed dropdown)"
            
        }


    });
});

