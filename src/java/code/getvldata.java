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
public class getvldata extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            dbConnweb conn= new dbConnweb();
            
            String facil="";
            
            String mywhere="";
            
            
            
            if(request.getParameter("facility")!=null){
            
                if(!request.getParameter("facility").equals("")){
                facil=request.getParameter("facility");
                                                                 }
                
            }
            
            //create a where like where MFL_Code in (1245,256535,7876)  
            if(!facil.equals("")){
            String facilitylist[]=facil.split(",");
            mywhere=" where MFL_Code in (";
            for(int a=0;a<facilitylist.length;a++){
            
            if(a>0){
                //append a come at the begining of each mflcode if this is not the first element
            mywhere+=","+facilitylist[a].split("_")[0];
            }
            else {
            mywhere+=""+facilitylist[a].split("_")[0];
            }
            }
            
             mywhere+=") ";
            
            }
            
              conn.st.executeUpdate("SET GLOBAL max_allowed_packet = 209715200");    
             conn.rs= conn.st.executeQuery("SHOW VARIABLES LIKE 'max_allowed_packet' ");    
            if(conn.rs.next()){
                System.out.println("Max_allowed_connection_"+conn.rs.getString(2));
            
            }
            JSONArray jarr=new JSONArray();
            String getfacils="SELECT Patient_CCC_No as cccno,Facility_Name as facilityname,MFL_Code as Mflcode, Date_of_Dispatch as datecollected,County as  county,Sub_County as subcounty FROM  vl_validation "+mywhere+" order by timestamp desc";
            
            conn.rs=conn.st.executeQuery(getfacils);
            while (conn.rs.next()){
                 JSONObject jobj= new JSONObject();
            jobj.put("cccno",conn.rs.getString("cccno"));
            jobj.put("mflcode",conn.rs.getString("mflcode"));
            jobj.put("county",conn.rs.getString("county"));
            jobj.put("subcounty",conn.rs.getString("subcounty"));
            jobj.put("facility_name",conn.rs.getString("facilityname"));
            jobj.put("datecollected",conn.rs.getString("datecollected"));
            
              //Patient_CCC_No ,Facility_Name ,MFL_Code, Date_Collected,County,Sub_County
            jarr.put(jobj);
                
            
            }
            
            
            if(conn.rs!=null){conn.rs.close();}
            if(conn.st!=null){conn.st.close();}
            if(conn.conne!=null){conn.conne.close();}
          // System.out.println(""+jarr); 
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
