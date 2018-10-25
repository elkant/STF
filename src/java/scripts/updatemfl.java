/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scripts;

import Data.UploadSTFData;
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

/**
 *
 * @author EKaunda
 */
public class updatemfl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            
            
            dbConnweb conn= new dbConnweb();
          
            
      
            
            String getdata="SELECT id,Facility_Name FROM stf.vl_validation where MFL_Code=''";
            
            conn.rs=conn.st.executeQuery(getdata);
            
            while(conn.rs.next()){
            
                 String Mflcode=getMFLCode(conn,conn.rs.getString("Facility_Name"));
                 
                 if(Mflcode.equals("")){
                 UploadSTFData ud= new UploadSTFData();
                 Mflcode=ud.getMFLCode(conn,conn.rs.getString("Facility_Name"));
                 
                 }
                 
                String id=conn.rs.getString("id");
                System.out.println(conn.rs.getString("Facility_Name")+"__"+Mflcode);
                
             String update="update vl_validation set MFL_Code='"+Mflcode+"' where id='"+id+"' ";
                System.out.println(""+update);
            conn.st3.executeUpdate(update);
            
                                 }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(updatemfl.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(updatemfl.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    
     public String getMFLCode(dbConnweb conn, String facility_name) throws SQLException{
          String mfl_code="";
          
       String getmfl_code = "SELECT Mflcode from facility WHERE Facilityname like ?";
       conn.pst=conn.conne.prepareStatement(getmfl_code);
       conn.pst.setString(1, facility_name);
       conn.rs2 = conn.pst.executeQuery();
       if(conn.rs2.next()){
           mfl_code = conn.rs2.getString(1);
       }
          return mfl_code;
      }
    
}
