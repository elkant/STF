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
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Emmanuel E
 */
public class exportdata extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String insert="";
          String myresponse="";
          String cccnumber=null;
String user=null;        
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
         sendmail sm=new sendmail();
        cccnumber=null;
        PrintWriter out = response.getWriter();
        String txtresponse="Error occured during data export at the server."; 
        dbConnweb conn= new dbConnweb();
        
         String facilityname=null;
        String startdate=null;
        String enddate=null;
        
        try {
        
        String id="";      
       
    
        
        
String year=null;
String month=null;

String sampletype=null;
String patientcontacted=null;
String adherencemonths=null;
String secondsampledate=null;
String noteligible=null;
String noteligibleother=null;
String secondsampleresults=null;
String actiontaken=null;
String firstregimen=null;
String secondregimen=null;
String thirdregimen=null;
String otheroutcomes=null;
String comments=null;
String timestamp=null;
String secondregdate=null;
String collectiondate=null;

 String dbname="outcomes";       

        
id=request.getParameter("id");      
         
year=request.getParameter("year");
month=request.getParameter("month");
cccnumber=request.getParameter("cccnumber");
sampletype=request.getParameter("sampletype");
patientcontacted=request.getParameter("patientcontacted");
adherencemonths=request.getParameter("adherencemonths");
secondsampledate=request.getParameter("secondsampledate");
noteligible=request.getParameter("noteligible");
noteligibleother=request.getParameter("noteligibleother");
secondsampleresults=request.getParameter("secondsampleresults");
actiontaken=request.getParameter("actiontaken");
firstregimen=request.getParameter("firstregimen");
secondregimen=request.getParameter("secondregimen");
thirdregimen=request.getParameter("thirdregimen");
otheroutcomes=request.getParameter("otheroutcomes");
comments=request.getParameter("comments");
secondregdate=request.getParameter("secondregdate");
collectiondate=request.getParameter("datecollected");
if(request.getParameter("db")!=null){
dbname=request.getParameter("db");
}
         
         
timestamp=request.getParameter("timestamp");
user=request.getParameter("user");
String usermail=""; 
 if(user.contains("@") && (user.contains(".com") || user.contains(".org")  )){usermail=","+user;}
 
         
          
          //set maxconnection


           
            conn.st.executeUpdate("SET GLOBAL max_allowed_packet = 209715200");
            conn.rs = conn.st.executeQuery("SHOW VARIABLES LIKE 'max_allowed_packet' ");
            
            if (conn.rs.next()) {
                System.out.println("Max_allowed_connection_" + conn.rs.getString(2));

            }            
                  
           //String checkexisting="select id from outcomes where id  like '"+id+"' and user='"+user+"'"; 
           String checkexisting="select id from outcomes where id='"+id+"' "; 
           //users should maintain the same date range
            
            /* TODO output your page here. You may use following sample code. */
         
   conn.rs=conn.st.executeQuery(checkexisting);
   
   if(conn.rs.next()){
       System.out.println(" Data for "+cccnumber+" already added ");
   
   //do update code here
   
   
   
// viral_load_mothers_perc,eid_done_perc,pmtct_hiv_pos_perc,access_viralload_perc,linkage_perc,hiv_pos_yield_perc,Testing_uptake_perc,outpatient_hiv_pos_perc,inpatient_hiv_pos_perc,outpatient_uptake_perc,inpatient_uptake_perc,viral_load_mothers_cmts,eid_done_cmts,pmtct_hiv_pos_cmts,access_viralload_cmts,linkage_cmts,hiv_pos_yield_cmts,Testing_uptake_cmts,outpatient_hiv_pos_cmts,inpatient_hiv_pos_cmts,outpatient_uptake_cmts,inpatient_uptake_cmts,    
// viral_load_mothers_perc,eid_done_perc,pmtct_hiv_pos_perc,access_viralload_perc,linkage_perc,hiv_pos_yield_perc,Testing_uptake_perc,outpatient_hiv_pos_perc,inpatient_hiv_pos_perc,outpatient_uptake_perc,inpatient_uptake_perc,viral_load_mothers_cmts,eid_done_cmts,pmtct_hiv_pos_cmts,access_viralload_cmts,linkage_cmts,hiv_pos_yield_cmts,Testing_uptake_cmts,outpatient_hiv_pos_cmts,inpatient_hiv_pos_cmts,outpatient_uptake_cmts,inpatient_uptake_cmts,    
       
          insert=" update "+dbname+" set cccno=?,suppressed=?,sampletype=?,patientcontacted=?,adherencemonths=?,secondsampledate=?,reasonineligible=?,otherreasonineligible=?,secondsampleres=?,actiontaken=?,firstreg=?,secondreg=?,comments=?,yearmonth=?,user=?,secondregdate=?,thirdregimen=?,otheroutcomes=?,collectiondate=? where id=? ";
                      conn.pst1=conn.conne.prepareStatement(insert);   
//facilityname.startdate.enddate.hiv_pos_target_child.hiv_pos_target_adult.hiv_pos_target_total.hiv_pos_child.hiv_pos_adult.hiv_pos_total.new_care_child.new_care_adult.new_care_total.new_art_target_child.new_art_target_adult.new_art_target_total.started_art_child.started_art_adult.started_art_total.viral_load_target_child.viral_load_target_adult.viral_load_target_total.viral_load_done_child.viral_load_done_adult.viral_load_done_total.ipt_target_child.ipt_target_adult.ipt_target_total.ipt_child.ipt_adult.ipt_total.testing_target_child.testing_target_adult.testing_target_total.test_child.test_adult.test_total.pmtct_hiv_pos_target.pmtct_hiv_pos.eid_target.eid_done.viral_load_mothers_target.viral_load_mothers_done.user.hiv_pos_yield_perc_child.hiv_pos_yield_perc_adult.hiv_pos_yield_perc_all.hiv_pos_care_perc_child.hiv_pos_care_perc_adult.hiv_pos_care_perc_all.started_art_perc_child.started_art_perc_adult.started_art_perc_all.viral_test_perc_child.viral_test_perc_adult.viral_test_perc_all.ipt_done_perc_child.ipt_done_perc_adult.ipt_done_perc_all.tested_perc_child.tested_perc_adult.tested_perc_all.hiv_pos_yield_cmts.hiv_pos_care_cmts.started_art_cmts.viral_test_cmts.ipt_done_cmts.tested_cmts.viral_load_mothers_perc.eid_done_perc.pmtct_hiv_pos_perc.viral_load_mothers_cmts.eid_done_cmts.pmtct_hiv_pos_cmts
                          
                      
                      
                        conn.pst1.setString(1,cccnumber);
                        conn.pst1.setString(2,"");
                        conn.pst1.setString(3,sampletype);                        
                        conn.pst1.setString(4,patientcontacted);
                        conn.pst1.setString(5,adherencemonths);
                        conn.pst1.setString(6,secondsampledate);
                        conn.pst1.setString(7,noteligible);
                        conn.pst1.setString(8,noteligibleother);
                        conn.pst1.setString(9,secondsampleresults);
                        conn.pst1.setString(10,actiontaken);
                        conn.pst1.setString(11,firstregimen);
                        conn.pst1.setString(12,secondregimen);
                        conn.pst1.setString(13,comments);
                        conn.pst1.setString(14,year+"_"+month);
                        conn.pst1.setString(15,user);
                        conn.pst1.setString(16,secondregdate);
                        conn.pst1.setString(17,thirdregimen);                        
                        conn.pst1.setString(18,otheroutcomes);
                        conn.pst1.setString(19,collectiondate);
                        conn.pst1.setString(20,id);
                   
                        
                        
                        if(conn.pst1.executeUpdate()==1)
                        {    
                            txtresponse="<font color='green'> Data for <b> "+cccnumber+" </b> updated succesfully for year "+year+" and month  "+month+" </font>";
                            // sm.Sendemail("STF IMPORT","Hi ,  \nThis is to notify you that data for "+cccnumber+" has been updated succesfully by user "+user+" for year "+year+" and month "+month+". \n \nPlease  do not reply to this mail. It is system generated ", "Updated STF Data for  "+cccnumber+" & year "+year+" , month "+month,"EKaunda@fhi360.org,CKomen@fhi360.org"+usermail);
                             
                        }
                        else 
                        {
                        txtresponse="<font color='green'>Data for <b>"+facilityname+"</b></font><font color='red'> NOT updated </font><font color='green'> for dates "+startdate+" to "+enddate+". This is because data for a similar date already exists. </font>";
                        }
   
   
                     myresponse= " update "+dbname+" set cccno='"+cccnumber+"',suppressed='',sampletype='"+sampletype+"',patientcontacted='"+patientcontacted+"',adherencemonths='"+adherencemonths+"',secondsampledate='"+secondsampledate+"',reasonineligible='"+noteligible+"',otherreasonineligible='"+noteligibleother+"',secondsampleres='"+secondsampleresults+"',actiontaken='"+actiontaken+"',firstreg='"+firstregimen+"',secondreg='"+secondregimen+"',comments='"+comments+"',yearmonth='"+year+"_"+month+"',secondregdate='"+secondregdate+"', thirdregimen='"+thirdregimen+"', otheroutcomes='"+otheroutcomes+"', collectiondate='"+collectiondate+"' where id='"+id+"'";
                      System.out.println(myresponse);
                        
   
   }
   else 
   {
   //do insert code here
   
      myresponse="insert into "+dbname+" "
  + "( id,cccno,suppressed,sampletype,patientcontacted,adherencemonths,secondsampledate,reasonineligible,otherreasonineligible,secondsampleres,actiontaken,firstreg,secondreg,comments,yearmonth,user,secondregdate ,thirdregimen,otheroutcomes,collectiondate) "
+ " values ('"+id+"','"+cccnumber+"','','"+sampletype+"','"+patientcontacted+"','"+adherencemonths+"','"+secondsampledate+"','"+noteligible+"','"+noteligibleother+"',"
  + "'"+secondsampleresults+"','"+actiontaken+"','"+firstregimen+"','"+secondregimen+"','"+comments+"','"+year+"_"+month+"','"+user+"','"+secondregdate+"','"+thirdregimen+"','"+otheroutcomes+"','"+collectiondate+"')";
      System.out.println(myresponse);                   
            
         
       
          insert="insert into "+dbname+" ( id,cccno,suppressed,sampletype,patientcontacted,adherencemonths,secondsampledate,reasonineligible,otherreasonineligible,secondsampleres,actiontaken,firstreg,secondreg,comments,yearmonth,user ,secondregdate,thirdregimen,otheroutcomes,collectiondate) "
                 + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                      conn.pst1=conn.conne.prepareStatement(insert);    
                          
                        conn.pst1.setString(1,id);
                        conn.pst1.setString(2,cccnumber);
                        conn.pst1.setString(3,"");
                        conn.pst1.setString(4,sampletype);
                        conn.pst1.setString(5,patientcontacted);
                        conn.pst1.setString(6,adherencemonths);
                        conn.pst1.setString(7,secondsampledate);
                        conn.pst1.setString(8,noteligible);
                        conn.pst1.setString(9,noteligibleother);
                        conn.pst1.setString(10,secondsampleresults);
                        conn.pst1.setString(11,actiontaken);
                        conn.pst1.setString(12,firstregimen);
                        conn.pst1.setString(13,secondregimen);
                        conn.pst1.setString(14,comments);
                        conn.pst1.setString(15,year+"_"+month);
                        conn.pst1.setString(16,user);
                        conn.pst1.setString(17,secondregdate);
                        conn.pst1.setString(18,thirdregimen);
                        conn.pst1.setString(19,otheroutcomes);
                        conn.pst1.setString(20,collectiondate);
            
                     
                        
                        
                        if(conn.pst1.executeUpdate()==1){
                            
                            txtresponse="<font color='green'> Data for "+cccnumber+" added succesfully for year "+year+" and month "+month+" </font>";
                           
                            //add team leaders variable at this point 
                            //sm.Sendemail("STF IMPORT"," Hi, \nThis is to notify you that new data for patient whose CCC number is "+cccnumber+" has been added succesfully by   user "+user+" for Year "+year+" and month "+month+". \n \n Please do not reply to this mail. It is system generated ", "STF data export for "+cccnumber+" & Year "+year+" , Month "+month,"EKaunda@fhi360.org,CKomen@fhi360.org"+usermail);
                                                        } 
                        else {
                            
                          txtresponse="<font color='green'>Data for "+cccnumber+" </font><font color='red'>  NOT inserted </font><font color='green'> succesfully for year "+year+" and month "+month+". This could be a duplicate error. </font>";
                            
                             }
       
       
   }
           
   
         if(conn.st!=null){conn.st.close();}  
         if(conn.rs!=null){conn.rs.close();}  
         if(conn.pst1!=null){conn.pst1.close();}  
         if(conn.conne!=null){conn.conne.close();}  
        
   
        } catch (SQLException ex) {
            Logger.getLogger(exportdata.class.getName()).log(Level.SEVERE, null, ex);
             txtresponse="<font color='red'>Data for "+cccnumber+" NOT inserted succesfully for dates "+startdate+" to "+enddate+".  "+ex+" </font>";
        //send an email at this point of the exception
            
            try {
                sm.Sendemail("STF IMPORT",ex.toString()+ "___ \n Username: "+user+" Facility name: \n "+facilityname+" \n "+myresponse, "MYSQL IMPORTING ERROR ","EKaunda@fhi360.org");
                } catch (MessagingException ex1) {
                Logger.getLogger(exportdata.class.getName()).log(Level.SEVERE, null, ex1);
            }
            
        }
        
        
      out.println(txtresponse);   
        
        
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
