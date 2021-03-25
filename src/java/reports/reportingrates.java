/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reports;

import database.dbConnweb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
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
 * @author EKaunda
 */
public class reportingrates extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           //CALL `stf`.`rpt_reportingrates`(" and vl_validation.County like 'Nakuru'  and vl_validation.Sub_County like 'Nakuru East' ");

         String subcounty,county,facilities;
         
          subcounty=county=facilities="";

//CALL `stf`.`rpt_reportingrates`(" and vl_validation.County like 'Nakuru'  and vl_validation.Sub_County like 'Nakuru East' ");

        //subcounty
        if(request.getParameter("rpt_subcounty")!=null)
        {
            subcounty=request.getParameter("rpt_subcounty");
        }
        
        //county
        if(request.getParameter("rpt_county")!=null)
        {
         county=request.getParameter("rpt_county");
        }
        
        //facility
        if(request.getParameter("rpt_facils")!=null)
        {
         facilities=request.getParameter("rpt_facils");
        }
        
        dbConnweb conn = new dbConnweb();
        //========Query 1=================
        
        String orgunits="";
        
        if(!county.equals("")){
        orgunits+=" and vl_validation.County like '"+county+"' ";
                              }
        
        if(!subcounty.equals("")){
            
         orgunits+=" and vl_validation.Sub_County like '"+subcounty+"' ";
        
                                 }
        
         if(!facilities.equals("")){
            
         orgunits+=" and facility.Mflcode in  ("+facilities+") ";
        
                                   }
		
		//========Query two====Facility Details==============
        
        String qry = " call rpt_eac_cascade(\""+orgunits+"\")";

         System.out.println(qry);
        conn.rs = conn.st.executeQuery(qry);
        
         ResultSetMetaData metaData = conn.rs.getMetaData();
        int columnCount = metaData.getColumnCount();
JSONArray ja= new JSONArray();

         metaData = conn.rs.getMetaData();
         columnCount = metaData.getColumnCount();
     
        ArrayList mycolumns = new ArrayList();

        while (conn.rs.next()) {
//header rows
JSONObject jot= new JSONObject();
                
             jot.put("indicator",conn.rs.getString("indicator"));
             jot.put("value", conn.rs.getInt("value"));
                    //mycolumns.add(metaData.getColumnLabel(i));
              ja.put(jot);
               
           
		}
           
          out.println(ja); 
           if(conn.st!=null){conn.st.close();}  
         if(conn.st1!=null){conn.st1.close();}  
         if(conn.st_6!=null){conn.st_6.close();}  
         if(conn.rs!=null){conn.rs.close();}  
         if(conn.rs1!=null){conn.rs1.close();}  
         if(conn.rs_6!=null){conn.rs_6.close();}  
         if(conn.pst1!=null){conn.pst1.close();}  
         if(conn.conne!=null){conn.conne.close();}  
          
           
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reportingrates.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reportingrates.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
