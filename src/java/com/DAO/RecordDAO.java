package com.DAO;

import com.business.Record;
import com.database.dbConn;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

/**
 *
 * @author starixc
 */
public class RecordDAO {

    private DataSource dataSource;

    public RecordDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Record> list() throws SQLException, ClassNotFoundException {

        List<Record> records = new ArrayList<Record>();
        try {
            //create query
            String sql = "SELECT * FROM tibu_tb_raw";
            //initiate database connection
            dbConn conn = new dbConn();
            //execute query 
            conn.rs = conn.st.executeQuery(sql);
String data="";
            while (conn.rs.next()) {
                Record record = new Record();
                data+="<tr>"
                        + "<td>"+conn.rs.getString("SubPartnerID")+"</td>"
                        + "<td>"+conn.rs.getString("SubPartnerID")+"</td>"
                        + "<td>"+conn.rs.getString("SubPartnerID")+"</td>";
                record.setID(conn.rs.getString("id"));
                record.setSubPartnerID(conn.rs.getString("SubPartnerID"));
                record.setRegistrationDate(conn.rs.getString("registrationdate"));
                record.setHivStatus(conn.rs.getString("hivstatus"));
                record.setMflcode(conn.rs.getString("mflcode"));
                record.setSubPartnerNom(conn.rs.getString("SubPartnerNom"));
                record.setSupportType(conn.rs.getString("supporttype"));
                records.add(record);
            }
            conn.rs.close();
            conn.st.close();
            

        } catch (Exception e) {
        }
return records;
    }

}
