        //create variables from the form
                var user_id = $('#id').val();
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
                
                var id= SubCountyRegNo + "_" + mflcode;
        
        
        //This is a document to save all tables 
            var tb_registerdb = new PouchDB('tb_raw_data');
            var remoteCouch = false;
            var receiveddata;

            //add facility details here
            function addrecord(id,SubPartnerID,RegistrationDate,Sex,Age,TreatmentDate,hivStatus,hivTestDate,artStatus,artDate,mflcode,SubPartnerNom,SupportType,Smear0,genExpert,WithinFaciity,Initial_modality,Xray,serialNumber,user_id) {
                receiveddata = {
                    _id: id,
                    SubPartnerID: SubPartnerID,
                    RegDate: RegistrationDate,
                    Sex: Sex,
                    Age:Age,
                    TreatmentDate: TreatmentDate,
                    HIVStatus:hivStatus,
                    HIVTestDate: hivTestDate,
                    ArtStatus:artStatus,
                    ArtDate:artDate,
                    mflcode:mflcode,
                    SubPartnerNo:SubPartnerNom,
                    SupportType:SupportType,
                    Smear0:Smear0,
                    GenExpert:genExpert,
                    WithinFacility:WithinFaciity,
                    HIVModality:Initial_modality,
                    Xray:Xray,
                    serialNumber:serialNumber,
                    user_id:user_id
                };
                tb_registerdb.put(receiveddata, function callback(err, result) {
                    if (!err) {
                        console.log('Record added succesfully');
                    }
                });
            }
            