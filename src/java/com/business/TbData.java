/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business;

/**
 *
 * @author starixc
 */
public class TbData {

    private String ID;
    private String SubPartnerID;
    private String RegistrationDate;
    private String quarter;
    private String year;
    private String Sex;
    private String Age;
    private String TreatmentDate;
    private String hivStatus;
    private String hivTestDate;
    private String artStatus;
    private String artDate;
    private String treatmentOutcome;
    private String mflcode;
    private String agebracket;
    private String SubPartnerNom;
    private String SupportType;
    private String tbtype;
    private String patienttype;
    private String Smear0;
    private String Smear2_3;
    private String Smear5;
    private String Smear6_8;
    private String genExpert;
    private String WithinFaciity;
    private String Initial_modality;
    private String OutcomeDate;

  
   

    public TbData(String ID, String SubPartnerID, String RegistrationDate, String Sex, String Age, String TreatmentDate, String hivStatus, String hivTestDate, String artStatus, String artDate, String mflcode, String SubPartnerNom, String SupportType, String Smear0, String genExpert, String WithinFaciity, String Initial_modality) {
        this.ID = ID;
        this.SubPartnerID = SubPartnerID;
        this.RegistrationDate = RegistrationDate;
        this.Sex = Sex;
        this.Age = Age;
        this.TreatmentDate = TreatmentDate;
        this.hivStatus = hivStatus;
        this.hivTestDate = hivTestDate;
        this.artStatus = artStatus;
        this.artDate = artDate;
        this.mflcode = mflcode;
        this.SubPartnerNom = SubPartnerNom;
        this.SupportType = SupportType;
        this.Smear0 = Smear0;
        this.genExpert = genExpert;
        this.WithinFaciity = WithinFaciity;
        this.Initial_modality = Initial_modality;
    }

    public TbData(String ID) {
        this.ID= ID;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getSubPartnerID() {
        return SubPartnerID;
    }

    public void setSubPartnerID(String SubPartnerID) {
        this.SubPartnerID = SubPartnerID;
    }

    public String getRegistrationDate() {
        return RegistrationDate;
    }

    public void setRegistrationDate(String RegistrationDate) {
        this.RegistrationDate = RegistrationDate;
    }

    public String getQuarter() {
        return quarter;
    }

    public String getTreatmentOutcome() {
        return treatmentOutcome;
    }

    public void setTreatmentOutcome(String treatmentOutcome) {
        this.treatmentOutcome = treatmentOutcome;
    }

    public String getOutcomeDate() {
        return OutcomeDate;
    }

    public void setOutcomeDate(String OutcomeDate) {
        this.OutcomeDate = OutcomeDate;
    }

    public void setQuarter(String quarter) {
        this.quarter = quarter;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    public String getAgebracket() {
        return agebracket;
    }

    public void setAgebracket(String agebracket) {
        this.agebracket = agebracket;
    }

    public String getAge() {
        return Age;
    }

    public void setAge(String Age) {
        this.Age = Age;
    }

    public String getTreatmentDate() {
        return TreatmentDate;
    }

    public void setTreatmentDate(String TreatmentDate) {
        this.TreatmentDate = TreatmentDate;
    }

    public String getHivStatus() {
        return hivStatus;
    }

    public void setHivStatus(String hivStatus) {
        this.hivStatus = hivStatus;
    }

    public String getHivTestDate() {
        return hivTestDate;
    }

    public void setHivTestDate(String hivTestDate) {
        this.hivTestDate = hivTestDate;
    }

    public String getArtStatus() {
        return artStatus;
    }

    public void setArtStatus(String artStatus) {
        this.artStatus = artStatus;
    }

    public String getArtDate() {
        return artDate;
    }

    public void setArtDate(String artDate) {
        this.artDate = artDate;
    }

    public String getMflcode() {
        return mflcode;
    }

    public void setMflcode(String mflcode) {
        this.mflcode = mflcode;
    }

    public String getSubPartnerNom() {
        return SubPartnerNom;
    }

    public void setSubPartnerNom(String SubPartnerNom) {
        this.SubPartnerNom = SubPartnerNom;
    }

    public String getSupportType() {
        return SupportType;
    }

    public void setSupportType(String SupportType) {
        this.SupportType = SupportType;
    }

    public String getTbtype() {
        return tbtype;
    }

    public void setTbtype(String tbtype) {
        this.tbtype = tbtype;
    }

    public String getPatienttype() {
        return patienttype;
    }

    public void setPatienttype(String patienttype) {
        this.patienttype = patienttype;
    }

    public String getSmear0() {
        return Smear0;
    }

    public void setSmear0(String Smear0) {
        this.Smear0 = Smear0;
    }

    public String getSmear2_3() {
        return Smear2_3;
    }

    public void setSmear2_3(String Smear2_3) {
        this.Smear2_3 = Smear2_3;
    }

    public String getSmear5() {
        return Smear5;
    }

    public void setSmear5(String Smear5) {
        this.Smear5 = Smear5;
    }

    public String getSmear6_8() {
        return Smear6_8;
    }

    public void setSmear6_8(String Smear6_8) {
        this.Smear6_8 = Smear6_8;
    }

    public String getGenExpert() {
        return genExpert;
    }

    public void setGenExpert(String genExpert) {
        this.genExpert = genExpert;
    }

    public String getWithinFaciity() {
        return WithinFaciity;
    }

    public void setWithinFaciity(String WithinFaciity) {
        this.WithinFaciity = WithinFaciity;
    }

    public String getInitial_modality() {
        return Initial_modality;
    }

    public void setInitial_modality(String Initial_modality) {
        this.Initial_modality = Initial_modality;
    }

  

}
