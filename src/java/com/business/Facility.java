
package com.business;

/**
 *
 * @author starixc
 */
public class Facility {
    
    private int facilityID;
    private String facility_name;
    private int subcounty_id;
    private int mflcode;

    public Facility(int facilityID, String facility_name, int subcounty_id, int mflcode) {
        this.facilityID = facilityID;
        this.facility_name = facility_name;
        this.subcounty_id = subcounty_id;
        this.mflcode = mflcode;
    }

    public int getFacilityID() {
        return facilityID;
    }

    public void setFacilityID(int facilityID) {
        this.facilityID = facilityID;
    }

    public String getFacility_name() {
        return facility_name;
    }

    public void setFacility_name(String facility_name) {
        this.facility_name = facility_name;
    }

    public int getSubcounty_id() {
        return subcounty_id;
    }

    public void setSubcounty_id(int subcounty_id) {
        this.subcounty_id = subcounty_id;
    }

    public int getMflcode() {
        return mflcode;
    }

    public void setMflcode(int mflcode) {
        this.mflcode = mflcode;
    }
    
    
    
}
