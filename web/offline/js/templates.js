function patafacility() {
  
    function createIndexes() {
  // Create index on District ID
  db.createIndex({
    index: {
      fields: ['DistrictID','active']
    }
  }).then(function (response) {
   var success="District ID and Active fields indexed !!!";
  console.log(success);
  }).catch(function (err) {
    console.log(err);
  });
    }
   var subc = document.getElementById("subcounty").value;
   console.log(subc);
    var cnt = 0;
    var facilities = "<option value=''>Select Facility</option>";
    //find all documents where DistrictID is equal to the selected option and is active
    db.find({
  selector: {
    _id: {gt: null},
    DistrictID: {$eq: subc},
    active: '1'
  }
}).then(function (doc) {
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
                $('#facility').select2();
      
    }).catch(function (err) {
      console.log(err);
    });

    }
