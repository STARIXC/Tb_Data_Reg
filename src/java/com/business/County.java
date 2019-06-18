
package com.business;

/**
 *
 * @author starixc
 */
public class County {
    private int id;
    private String county_name;
    private int region_id;
    private String burden_category;

    public County(int id, String county_name, int region_id, String burden_category) {
        this.id = id;
        this.county_name = county_name;
        this.region_id = region_id;
        this.burden_category = burden_category;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCounty_name() {
        return county_name;
    }

    public void setCounty_name(String county_name) {
        this.county_name = county_name;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
    }

    public String getBurden_category() {
        return burden_category;
    }

    public void setBurden_category(String burden_category) {
        this.burden_category = burden_category;
    }
    
    
    
}
