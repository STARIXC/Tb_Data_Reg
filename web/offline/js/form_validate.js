
const init= function(){
    document.getElementByID('button-cancel').addEventListerner('click',reset);
    document.getElementByID('button-send').addEventListerner('click',send);
}
const reset = function(ev){
    ev.preventDefault();//ensure on click does not submit
   //reset the form to default
    document.getElementById('form_data').reset();
}
const send = function (ev){
    ev.preventDefault();//ensure on click does not submit
    
    let ret = validate();
    
        if (ret){
            //good to go
            form_submit();
        }else{
         // let err = document.querySelector('.error');  
         // let input = err.querySelector('input');
         // err.setAttribute('data-errormsg',`...Missing ${input.placeholder}`);
        }
}
const validate = function (ev){
    //inputs
    
    
    
    
    
    
    
};

constant form_submit = function (){
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
    var dataString = "SubCountyRegNo=" + SubCountyRegNo + "&SubPartnerID=" + subPartnerID + "&RegDate=" + RegDate + "&Sex=" + Sex + "&Age=" + Age + "&TreatmentDate=" + TreatmentDate + "&HIVStatus= " + HIVStatus + "&HIVTestDate=" + HIVTestDate + "&ArtStatus=" + ArtStatus + "&ArtDate=" + ArtDate + "&mflcode=" + mflcode + "&SubPartnerNom=" + SubPartnerNom + "&SupportType=" + SupportType + "&Smear0=" + Smear0 + "&GenExpert=" + GenExpert + "&WithinFacility=" + WithinFacility + "&HIVModality=" + HIVModality + "&SerialNumber=" + serialNumber + "&Xray=" + Xray;
    // alert(dataString);
    $.ajax({
        type: 'POST',
        url: "./savedata",
        data: dataString,
        success: function (result)
        {
            $("#response").html(result);
            $('#form_data')[0].reset();


        }
    });
}
document.addEventListerner('DOMContentLoaded',init);