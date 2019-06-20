//set variable to represent the article form
var recordForm = document.getElementById('form_data');

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
        _id: new Date().toISOString(),
        //these field are updated by the user from the form
        id: Id,
        SubPartnerID: subPartnerID,
        registrationdate: RegDate,
        quarter:null,
        year:null,
        sex: Sex,
        age: Age,
        treatmentdate: TreatmentDate,
        hivstatus: HIVStatus,
        hivtestdate: HIVTestDate,
        artstatus: ArtStatus,
        artdate: ArtDate,
        treatmentoutcome:null,
        outcomedate:null,
        timestamp:new Date().getTime(),
        Mflcode: mflcode,
        SubPartnerNom: SubPartnerNom,
        supporttype: SupportType,
        tbtype:null,
        patienttype:null,
        smear0: Smear0,
        smear2_3:null,
        smear5:null,
        smear6_8:null,
        genexpert: GenExpert,
        tested_within_facility: WithinFacility,
        initial_modality: HIVModality,
        subcounty_regno:SubCountyRegNo,
        serialno: serialNumber,
        xray: Xray,
        user_id: user_id
    };
    console.log("State of record object BEFORE doing db.put: " + JSON.stringify(record));
    LocalDB.put(record, function callback(error, result) {
        if (!error) {
            alert('¡Record saved!');
            result += "record saved";
            console.log("State of record object BEFORE doing db.put: " + JSON.stringify(record));
            // once record is successfully saved, reset the page using our function
            modeReset();
            $('#loading').html(result);
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
                    return $("#art").val() === 'Neg' || $("#art").val() === 'Pos';
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
                    "</td><td><button class='btn-success' onclick='loadsaveddata(\"" + dat.doc._id + "\",\"" + dat.doc.SubPartnerNom + "\")'><i class='glyphicon glyphicon-edit'></i>Edit</button></td></tr>";

        } //end of for loop

        appendtabledata(dbdata);

    }).catch(function (err) {
        console.log(err);
    });
    //read data from the db
}
//call the function that displays the data

function appendtabledata(dbdata) {
    $("#datat").html(' <table id="TableResults" class="table table-bordered footable footable-1 footable-filtering footable-filtering-right footable-paging footable-paging-center breakpoint breakpoint-xs" data-paging="true" data-filtering="true" data-sorting="true" style="display: table;"><thead><tr><th data-visible="true">S/No:</th><th>SubPartner ID</th><th data-breakpoints="xs sm md">Sub County Reg #</th><th data-breakpoints="xs">MFL Code</th><th data-breakpoints="all">Facility Name</th><th data-breakpoints="all">ART Status</th><th data-breakpoints="all">Sex</th><th data-breakpoints="all">Age</th><th data-breakpoints="xs sm md">Registration Date</th><th>Edit</th></tr></thead><tbody>' + dbdata + '</tbody></table>');

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

var db = new PouchDB('facilities');
function patafacility() {

    var cnt = 0;

    var facilities = "<option value=''>Select Facility</option>";

    db.allDocs({include_docs: true, descending: true}).then(function (doc) {

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
            facilities += "<option value='" + dat.doc._id + "_" + dat.doc.SubPartnerID + "'>" + dat.doc.SubPartnerNom + "</option>";
        } //end of for loop
        $("#facility").html(facilities);
        $(document).ready(function () {
            //$('#lyricstable').DataTable();
            $('#facility').select2();
        });

    }).catch(function (err) {
        console.log(err);
    });
}
var dbs = new PouchDB('subcounty');
function patasubcounty() {

    var cnt = 0;

    var subcounty = "<option value=''>Select Sub-County</option>";

    dbs.allDocs({include_docs: true, descending: true}).then(function (doc) {

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
            subcounty += "<option value='" + dat.doc._id + "_" + dat.doc.DistrictID + "'>" + dat.doc.DistrictNom + "</option>";
        } //end of for loop
        $("#subcounty").html(subcounty);
        $(document).ready(function () {
            //$('#lyricstable').DataTable();
            $('#subcounty').select2();
        });

    }).catch(function (err) {
        console.log(err);
    });
}
patasubcounty();
patafacility();
ShowRecords();
