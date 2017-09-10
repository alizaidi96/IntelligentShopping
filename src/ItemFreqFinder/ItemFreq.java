package ItemFreqFinder;

import java.sql.ResultSet;
import java.util.ArrayList;
import AHC.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.DatabaseConnection;

public class ItemFreq {

    public static ArrayList<String> id = new ArrayList<>();
    public static ArrayList<String> finalfreq = new ArrayList<>();
    
    public static void main(String args[]) {
    	ItemFreq();
	}

    public static void ItemFreq() {
        try {
            id = new ArrayList<>();
            DatabaseConnection db = new DatabaseConnection();
    		db.dbconnection();
//            String query = "SELECT DISTINCT username from transaction";
//            ResultSet rx = db.getResultSet(query);
//            while (rx.next()) {
//                String user = rx.getString(1);
                try {
                    String sql = "select * from transaction";
                    String pids = "";
                    int i = 0;
                    ResultSet rs = db.getResultSet(sql);
                    while (rs.next()) {
                        try {
                            if (i == 0) {
                                i = 1;
                                pids = rs.getString("totalpid").replaceAll(",", " ");
                            } else {
                                pids = pids + "\n" +  rs.getString("totalpid").replaceAll(",", " ");
                            }
                        } catch (Exception e) {
                            System.out.print(e);
                        }
                    }

                    ItemFreq fre = new ItemFreq();
                    fre.id.add(pids);
                    rs.close();

                } catch (Exception e) {
                    System.out.print(e);
                }
//            }
            if(id.size()>0){
            EditFile file = new EditFile();
            file.writer(id);
            AHC ahc = new AHC();
            int freq = finalfreq.size();
            System.out.println("Final output : " + finalfreq.get(freq - 1));
            String Finalfrequent = finalfreq.get(freq - 1).replaceAll("\\[|\\]", "").replaceAll(" ", "");
            System.out.println(Finalfrequent);

            String query = "select * from frequentitems";
            ResultSet rs = db.getResultSet(query);
            if (rs.next()) {
                query = "Update frequentitems set pids = '" + Finalfrequent + "'";
                db.getUpdate(query);
            } else {
                query = "insert into frequentitems values('" + Finalfrequent + "')";
                db.getUpdate(query);
            }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemFreq.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
