/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scripts;

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
public class updatestatus extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            dbConnweb conn= new dbConnweb();
            
            String mywhere=" isupdated=0 ";
           numberofupdates(mywhere, conn);
            
          //  out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(updatestatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(updatestatus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  
    @Override
    public String getServletInfo() 
    {
        return "Short description";
    }

    
    public void numberofupdates( String where, dbConnweb conn) throws SQLException{
        //get the number of updates
    
         String getdata="select id,Patient_CCC_No as cccno,Date_of_Dispatch as dod  from vl_validation where "+where;
            
           
            
            
            conn.rs=conn.st.executeQuery(getdata);
           
            while(conn.rs.next())
            {
                
            String cccno=conn.rs.getString("cccno");
            String id=conn.rs.getString("id");
            String dod=conn.rs.getString("dod");
            String dodcopy=conn.rs.getString("dod");
            dod=dod.replace("-","_");//2017_04
            String yearmonthofdispatch=dod.substring(0,7);
             //get presence of the specific ccno
                String selectno="select count(cccno) as updates from outcomes where id='"+cccno+"_"+yearmonthofdispatch+"' ";
                conn.rs1=conn.st1.executeQuery(selectno);
                System.out.println(""+selectno);
                int count=0;
                
                if (conn.rs1.next())
                {
                    
                count =conn.rs1.getInt("updates");
                if(count>0){
                String update=" update vl_validation set isupdated='"+count+"' where Patient_CCC_No='"+cccno+"' and Date_of_Dispatch='"+dodcopy+"' ";
                    System.out.println(""+update);
                conn.st2.executeUpdate(update);
                }
                }
            
            }
            
            
        
    
    }
    
}
