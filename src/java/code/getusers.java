/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

import database.dbConnweb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Emmanuel E
 */
public class getusers extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
        try {
            
            dbConnweb conn= new dbConnweb();
            
              // conn.st.executeUpdate("SET GLOBAL max_allowed_packet = 209715200"); 
               
           Calendar cal = Calendar.getInstance(); 
           int year=cal.get(Calendar.YEAR);
           int month=cal.get(Calendar.MONTH)+1;
           //if month is october, get targets for the next year
           if(month>=10){year=year+1;}
            int ordinalDay = cal.get(Calendar.DAY_OF_YEAR);
    int weekDay = cal.get(Calendar.DAY_OF_WEEK) - 1; // Sunday = 0
    int numberOfWeeks = (ordinalDay - weekDay + 10) / 7;
            JSONArray jarr=new JSONArray();
            //String getfacils="SELECT id,facility,year,hiv_pos_target_child,hiv_pos_target_adult,hiv_pos_target_total,new_art_target_child,new_art_target_adult,new_art_target_total,viral_load_target_child,viral_load_target_adult,viral_load_target_total,ipt_target_child,ipt_target_adult,ipt_target_total,testing_target_child,testing_target_adult,testing_target_total,pmtct_hiv_pos_target,eid_target,viral_load_mothers_target,timestamp FROM  targets where year ='"+year+"'order by id";
           
            //currently i am not validating targets that are being fetched 
            
            String getcns="SELECT * FROM users where active='1' and usertype='user' order by fname";
            
            conn.rs=conn.st.executeQuery(getcns);
            while (conn.rs.next()){
//id										
              //  System.out.println(" loop "+conn.rs.getString("fname"));
                 JSONObject jobj= new JSONObject();
            jobj.put("active",conn.rs.getString("active"));
            jobj.put("userid",conn.rs.getString("userid"));
            jobj.put("fname",conn.rs.getString("fname"));
            jobj.put("lname",conn.rs.getString("lname"));
            jobj.put("fullname",conn.rs.getString("fname")+" "+conn.rs.getString("lname"));
            jobj.put("mail_user",conn.rs.getString("mail_user"));
            jobj.put("mflcode",conn.rs.getString("mflcode"));
            jobj.put("facility",conn.rs.getString("facility"));
            jobj.put("mail_supervisor",conn.rs.getString("mail_supervisor"));
            jobj.put("mail_sto",conn.rs.getString("mail_sto"));
            jobj.put("usertype",conn.rs.getString("usertype"));



            jarr.put(jobj);
            
          
            }
            
              if(conn.rs!=null){conn.rs.close();}
              if(conn.st!=null){conn.st.close();}
              if(conn.conne!=null){conn.conne.close();}
            
            
          // System.out.println("otput"+jarr); 
            
            try (PrintWriter out = response.getWriter()) {
                
                
                out.println(jarr);
            }
        }   catch (SQLException ex) {
            Logger.getLogger(showfacils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
