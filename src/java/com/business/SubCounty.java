
package com.business;

/**
 *
 * @author starixc
 */
public class SubCounty {
    private int subcounty_id;
    private int county_id;
    private String subcounty_name;
    private int active;
    
    //constructor

    public SubCounty(int subcounty_id, int county_id, String subcounty_name, int active) {
        this.subcounty_id = subcounty_id;
        this.county_id = county_id;
        this.subcounty_name = subcounty_name;
        this.active = active;
    }
    
    //getters and setters

    public int getSubcounty_id() {
        return subcounty_id;
    }

    public void setSubcounty_id(int subcounty_id) {
        this.subcounty_id = subcounty_id;
    }

    public int getCounty_id() {
        return county_id;
    }

    public void setCounty_id(int county_id) {
        this.county_id = county_id;
    }

    public String getSubcounty_name() {
        return subcounty_name;
    }

    public void setSubcounty_name(String subcounty_name) {
        this.subcounty_name = subcounty_name;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
    
    
}
