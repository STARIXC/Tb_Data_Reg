//set variable to represent the article form
var recordForm = document.getElementById('form_data');
var BtnReset = document.getElementById('btn_reset');
var BtnSave = document.getElementById('save_data');
var divDisplayData = document.getElementById('datat');
//setup for pouchdb
//Requiring the package  
//var PouchDB = require('PouchDB');  
var LocalDB = new PouchDB('Reg_Data');
//var RenoteDB = false;
var RemoteDB = 'http://127.0.0.1:5984/tbdata';
var documents = [];
LocalDB.changes(
        {
            since: 'now',
            live: true
        })
        .on('change', ShowRecords);
//when user clicks "save " while editing a record

$("#save_data").click(function () {
    $('#loading').html('<img src="images/ajax-loader.gif"> loading...');
    //run saveArticle function, which will run validation, save if validated
    validateForm();
}); //end submit-button click handler
//
$("#updatebutton").click(function () {
    $('#loading').html('<img src="images/ajax-loader.gif"> loading...');
    //run saveArticle function, which will run validation, save if validated
    validateEditForm();
}); //end submit-button click handler
//synch button
$('#button-sync').click(function () {
    sync();
});
// create a new record object and write it to the database, then reset page
function saveRecord() {

    //create variables from the form
    var user_id = $('#id').val();
    var Id = $('#subCountyRegNo').val() + "_" + $('#facility_select').data('mfl');
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
    var Xray = $('#xray').val();
    var serialNumber = $('#serialNumber').val();
    //var SubCountyRegNo=       $('#id').val()
    var record = {
        //createded and updated wihout user input
        _id: Id,
        //these field are updated by the user from the form
        id: Id,
        SubPartnerID: subPartnerID,
        registrationdate: RegDate,
        quarter: null,
        year: null,
        sex: Sex,
        age: Age,
        treatmentdate: TreatmentDate,
        hivstatus: HIVStatus,
        hivtestdate: HIVTestDate,
        artstatus: ArtStatus,
        artdate: ArtDate,
        treatmentoutcome: null,
        outcomedate: null,
        timestamp: new Date().getTime(),
        Mflcode: mflcode,
        SubPartnerNom: SubPartnerNom,
        supporttype: SupportType,
        tbtype: null,
        patienttype: null,
        smear0: Smear0,
        smear2_3: null,
        smear5: null,
        smear6_8: null,
        genexpert: GenExpert,
        tested_within_facility: WithinFacility,
        initial_modality: HIVModality,
        subcounty_regno: SubCountyRegNo,
        serialno: serialNumber,
        xray: Xray,
        user_id: user_id
    };
    console.log("State of record object BEFORE doing db.put: " + JSON.stringify(record));
    LocalDB.put(record, function callback(error, result) {
        if (!error) {
            modeReset();
            result = "record saved";
            console.log("State of record object BEFORE doing db.put: " + JSON.stringify(record));
            // once record is successfully saved, reset the page using our function
            $('#loading').fadeIn().html(result);
            setTimeout(function () {
                $('#loading').fadeOut('slow');
            }, 2000);
        } else {


        }

    });
}

//run all validation functions when called from saverecord
function validateForm() {
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
                required: function (dat) {
                    return $("#hivStatus").val() === 'POS';
                }
            },
            dateTreatmentStarted: {
                required: true
            },
            art: {
                required: true
            },
            artdate: {
                required: function (dat) {
                    return $("#art").val() === "Y";
                }
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
            hivTestDate: "Please select the Registration Date",
            hivStatus: "Please Choose the patient's HIV Status  (Pos,Neg,ND) ",
            dateTreatmentStarted: "please Choose the date Treatment Started",
            art: "Please Choose the ART Status (Y/N)",
            artdate: "please enter the Art Date",
            sputumSmear: "Please Enter Sputum Smear Examination 0th Month Result (Pos,Neg,ND)",
            generalExpert: "Please Select the General Expert From the Drop Down List",
            withinFacility: "Please Choose if the client tested for HIV within the facility? Y/N ",
            hivModality: " Please Select the HIV Test Modality (Use the availed dropdown)"
        },
        submitHandler: function (form) {
            saveRecord();
        }

    });
}

//reset page to start, 
function modeReset() {
//scroll to top of page
//thx to SO: https://stackoverflow.com/questions/4210798/how-to-scroll-to-top-of-page-with-javascript-jquery
    document.body.scrollTop = document.documentElement.scrollTop = 0;
    //reset the form and hash
    recordForm.reset();
} //end modeReset

//show all records in table rows
var dbdata = "";
function ShowRecords() {
    //rread from weekly data db
    LocalDB.allDocs({include_docs: true, ascending: true}).then(function (doc) {
        console.log(doc);
        for (b = 0; b < doc.total_rows; b++) {
            var dat = {};
            dat = doc.rows[b];
            //console.log(dat.doc.facility);
            //how to reference each column 
            //alert(dat.doc.startdate);
            //dat.doc._id

            dbdata += "<tr><td> " + dat.doc.serialno +
                    " </td><td>" + dat.doc.SubPartnerID +
                    "</td><td>" + dat.doc.subcounty_regno +
                    "</td><td>" + dat.doc.Mflcode +
                    "</td><td>" + dat.doc.SubPartnerNom +
                    "</td><td>" + dat.doc.artstatus +
                    "</td><td>" + dat.doc.sex +
                    "</td><td>" + dat.doc.age +
                    "</td><td>" + dat.doc.registrationdate +
                    "</td><td><button class='btn-info' href='#nav-home' data-toggle='tab' onclick='loadSavedRecordData(\"" + dat.doc._id + "\",\"" + dat.doc.Mflcode + "\",\"no\")'>Edit</button></td></tr>";
            // "</td><td class='btn_edit' data-toggle='modal' data-target='#editform'><i class='glyphicon glyphicon-edit'></i></td></tr>";
        } //end of for loop

        appendtabledata(dbdata);
    }).catch(function (err) {
        console.log(err);
    });
    //read data from the db
}
//call the function that displays the data

function appendtabledata(dbdata) {
    $("#showRecords").html(' <table id="TableResults" class="table table-bordered footable footable-1 footable-filtering footable-filtering-right footable-paging footable-paging-center breakpoint breakpoint-xs" data-paging="true" data-filtering="true" data-sorting="true" style="display: table;"><thead><tr><th data-visible="true">S/No:</th><th>SubPartner ID</th><th data-breakpoints="xs sm md">Sub County Reg #</th><th data-breakpoints="xs">MFL Code</th><th data-breakpoints="all">Facility Name</th><th data-breakpoints="all">ART Status</th><th data-breakpoints="all">Sex</th><th data-breakpoints="all">Age</th><th data-breakpoints="xs sm md">Registration Date</th><th>Edit</th></tr></thead><tbody>' + dbdata + '</tbody></table>');
    $(document).ready(function () {
        $('.table').footable();
    });
}

function sync() {
    LocalDB.sync(RemoteDB)
            .on('complete', function () {
                alert('All data has been sync!');
            })
            .on('error', function (err) {
                alert('The sync has failed!');
            });
}


var dbs = new PouchDB('subcounty');
function patasubcounty() {
    var county = document.getElementById("county").value;
    var cnt = 0;
    var subcounty = "<option value=''>Select Sub-County</option>";
   // dbs.allDocs({include_docs: true, descending: true}).then(function (doc) {
   dbs.get(county).then(function (doc) {
        cnt++;
        //console.log(doc);
        for (a = 0; a <
                doc.total_rows; a++) {
            var dat = {};
            dat = doc.rows[a];
            //console.log(dat.doc.title);
            //how to reference each column 

            //dat.doc._id
            var num = parseInt(a) + 1;
            subcounty += "<option value='" + dat.doc.DistrictID + "'>" + dat.doc.DistrictNom + "</option>";
        } //end of for loop
        $("#subcounty").html(subcounty);
        $(document).ready(function () {
            //$('#lyricstable').DataTable();
            $('#subcounty').select2();
        });
    }).catch(function (err) {
       // console.log(err);
    });
}
var db = new PouchDB('facilities');
function patafacility() {
    var subc = document.getElementById("subcounty").value;
    console.log(subc);
    var cnt = 0;
    var facilities = "<option value=''>Select Facility</option>";
/**db.get({
  selector: {DistrictID: {$eq: subc}}
}).then(function (doc) {
   cnt++;
      console.log(doc);
        for (f = 0; f <
                doc.total_rows; f++) {
            var dat = {};
            dat = doc.rows[f];
            
            var num = parseInt(f) + 1;
            facilities += "<option id='facility_select' value='"+ dat.doc.DistrictID +"' data-subpartnerid='"+dat.doc.SubPartnerID+"' data-mfl='"+dat.doc.CentreSanteID +"' data-facility='"+ dat.doc.SubPartnerNom +"' >"+ dat.doc.SubPartnerNom +" </option>";;
        } //end of for loop
       $("#facility").html(facilities.replace("<option value=''>Select facility</option>", ""));
            //var select = document.getElementById('facility');
            // select.size = select.length;
            $('#facility').select2();
}).catch(function (err) {
  console.log(err);
});**/
   db.allDocs({include_docs: true, descending: true,DistrictID:subc}).then(function (doc) {
        //db.get(subc).then(function (doc) {
        cnt++;
      console.log(doc);
        for (f = 0; f <
                doc.total_rows; f++) {
            var dat = {};
            dat = doc.rows[f];
            
            var num = parseInt(f) + 1;
            facilities += "<option id='facility_select' value='"+ dat.doc.DistrictID +"' data-subpartnerid='"+dat.doc.SubPartnerID+"' data-mfl='"+dat.doc.CentreSanteId +"' data-facility='"+ dat.doc.SubPartnerNom +"' >"+ dat.doc.SubPartnerNom +" </option>";;
        } //end of for loop
       $("#facility").html(facilities.replace("<option value=''>Select facility</option>", ""));
            var select = document.getElementById('facility');
            // select.size = select.length;
            $('#facility').select();
      
    }).catch(function (err) {
      console.log(err);
    });
    }

$("#showRecords").on("click", ".btn_edit", function () {
    editRecordPrep($(this).parent());
});



function loadSavedRecordData(id, Mflcode) {
    //load from weekly db where id is as selected   
    LocalDB.get(id).then(function (doc) {
        var rowid = id;
        //populate div with respective content
        $("#rowid").val(id);

        //$('select#facilityname').find("option[value='"+mflanddates[0]+"_"+facility+"']").prop('selected', true); 
        $("#serialNumber").val(doc.serialno);
        $("#dateOfRegistration").val(doc.registrationdate);
        $("#subCountyRegNo").val(doc.subcounty_regno);
        //$("#county").val(doc.hiv_pos_target_adult);
        // $("#subcounty").val(doc.hiv_pos_target_total);
        $('select#facility').find("option[value='" + doc.subPartnerNom + "']").prop('selected', true);
        $('select#sex').find("option[value='" + doc.sex + "']").prop('selected', true);
        $("#ageOnRegistration").val(doc.age);
        $("#xray").val(doc.xray);
        $('select#hivStatus').find("option[value='" + doc.hivstatus + "']").prop('selected', true);
        $("#hivTestDate").val(doc.hivtestdate);
        $("#dateTreatmentStarted").val(doc.treatmentdate);
        $('select#art').find("option[value='" + doc.artstatus + "']").prop('selected', true);
        $("#artdate").val(doc.artdate);
        $('select#sputumSmear').find("option[value='" + doc.smear0 + "']").prop('selected', true);
        $("#generalExpert").val(doc.genexpert);
        $("#withinFacility").val(doc.tested_within_facility);
        $('select#hivModality').find("option[value='" + doc.initial_modality + "']").prop('selected', true);
        //do the vice versa on saving the edited fields

        $("#save_data").hide();
        $("#updatebutton").show();

    });

}

//run all validation functions when called from saverecord
function validateEditForm() {
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
                required: function (dat) {
                    return $("#hivStaus").val() === 'Pos';
                }
            },
            dateTreatmentStarted: {
                required: true
            },
            art: {
                required: true
            },
            artdate: {
                required: function (dat) {
                    return $("#art").val() === "Y";
                }
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
            hivTestDate: "Please select the Registration Date",
            hivStatus: "Please Choose the patient's HIV Status  (Pos,Neg,ND) ",
            dateTreatmentStarted: "please Choose the date Treatment Started",
            art: "Please Choose the ART Status (Y/N)",
            artdate: "please enter the Art Date",
            sputumSmear: "Please Enter Sputum Smear Examination 0th Month Result (Pos,Neg,ND)",
            generalExpert: "Please Select the General Expert From the Drop Down List",
            withinFacility: "Please Choose if the client tested for HIV within the facility? Y/N ",
            hivModality: " Please Select the HIV Test Modality (Use the availed dropdown)"
        },
        submitHandler: function (form) {
            saveEditRecord();
        }

    });
}
function saveEditRecord(id, SubPartnerID, registrationdate, quarter, year, sex, age, treatmentdate, hivstatus, hivtestdate, artstatus, artdate, treatmentoutcome, outcomedate, timestamp, Mflcode, SubPartnerNom, supporttype, tbtype, patienttype, smear0, smear2_3, smear5, smear6_8, genexpert, tested_within_facility, initial_modality, subcounty_regno, serialno, xray, user_id) {

    var id = $("#rowid").val();
    //create variables from the form
    var user_id = $('#id').val();
    var Id = $('#subCountyRegNo').val() + "_" + $('#facility_select').data('mfl');
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
    var Xray = $('#xray').val();
    var serialNumber = $('#serialNumber').val();
    //var SubCountyRegNo=       $('#id').val()

    LocalDB.get(id).then(function (doc) {
    if (id !== 'null' && id !== '') {
    doc._id = id,
            //these field are updated by the user from the form
            doc.id = Id;
            doc.SubPartnerID = subPartnerID;
            doc.registrationdate= RegDate;
            doc.quarter= null;
            doc.year= null;
            doc.sex= Sex;
            doc.age= Age;
            doc.treatmentdate= TreatmentDate;
            doc.hivstatus= HIVStatus;
            doc. hivtestdate= HIVTestDate;
            doc.artstatus= ArtStatus;
            doc.artdate= ArtDate;
            doc.treatmentoutcome= null;
            doc.outcomedate= null;
            doc.timestamp= new Date().getTime();
            doc.Mflcode= mflcode;
            doc.SubPartnerNom= SubPartnerNom;
            doc.supporttype= SupportType;
            doc.tbtype= null;
            doc.patienttype= null;
            doc.smear0= Smear0;
            doc.smear2_3= null;
            doc.smear5= null;
            doc.smear6_8= null;
            doc.genexpert= GenExpert;
            doc.tested_within_facility= WithinFacility;
            doc.initial_modality= HIVModality;
            doc.subcounty_regno= SubCountyRegNo;
            doc.serialno= serialNumber;
            doc.xray= Xray;
            doc.user_id= user_id;

//put the records back
 return LocalDB.put(doc, function callback(error, result) {
        if (!error) {
            modeReset();
            doc = "record Updated";
            console.log("State of record object BEFORE doing db.put: " + JSON.stringify(doc));
            // once record is successfully saved, reset the page using our function
            $('#loading').fadeIn().html(result);
            setTimeout(function () {
                $('#loading').fadeOut('slow');
            }, 2000);
        } else {


        }

    });
    }

    });
}

//patasubcounty();
//patafacility();
ShowRecords();
