/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

import code.sendmail;
import database.dbConnweb;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import scripts.OSValidator;
@MultipartConfig(fileSizeThreshold=1024*1024*20, 	// 20 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100) 
/**
 *
 * @author GNyabuto
 */
public class UploadStfData_v0 extends HttpServlet {
    
 HttpSession session;
 String id,rec_no,Batch_No, Patient_CCC_No,Testing_Lab, Facility_Name,MFL_Code,County,Sub_County,Sex,Age,SampleType,Collection_Date,Received_Status,Current_Regimen,PMTCT,ART_Initiation_Date,Justification,Date_of_Receiving,Date_of_Testing,Date_of_Dispatch,Result
,systemID
,dob
,regimen_line
,YearMonth;
   
  String full_path="";
  String fileName="";
  int checker_dist,checker_hf;
  File file_source;
  int added,updated;
  private static final long serialVersionUID = 205242440643911308L;
  private static final String UPLOAD_DIR = "uploads";
  String nextpage="";
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException{
           response.setContentType("text/html;charset=UTF-8");
           dbConnweb conn = new dbConnweb();
           added=updated=0;
           nextpage="upload.jsp";
         
           DateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
         
         String sentmail="No";
         String monthname="";
            if(request.getParameter("sentemail")!=null){
          sentmail=request.getParameter("sentemail");
            }
         
         if(request.getParameter("month")!=null){
          monthname=request.getParameter("month");
         }
         
       
        System.out.println(" sent email ni "+sentmail); 
         
         String applicationPath = request.getServletContext().getRealPath("");
         String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
         session=request.getSession();
          File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) 
        {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
        
        for (Part part : request.getParts()) {
            
            
            
              if(getFileName(part).contains(".xls"))
           {
        
            fileName = getFileName(part);
            part.write(uploadFilePath + File.separator + fileName);
            System.out.println("file name is  :  "+fileName);
         
           }
            
            
            
            
            
         
        }
        if(!fileName.endsWith(".xlsx")){
            session.setAttribute("upload_success", "<font color=\"red\">Failed to load the excel file. Please choose a .xlsx excel file .</font>"); 
            System.out.println("Failed to load the excel file. Please choose a .xlsx excel file ");
        }
        else {
            
            
          full_path=fileSaveDir.getAbsolutePath()+"\\"+fileName;
          
          if(OSValidator.isUnix()){ full_path=fileSaveDir.getAbsolutePath()+"/"+fileName;  }
 
 System.out.println("the saved file directory is  :  "+full_path);
// GET DATA FROM THE EXCEL AND AND OUTPUT IT ON THE CONSOLE..................................
 
  FileInputStream fileInputStream = new FileInputStream(full_path);
        XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
        XSSFSheet worksheet = workbook.getSheetAt(0);
        Iterator rowIterator = worksheet.iterator();

        int i=1,y=0;
        while(rowIterator.hasNext()){
              try {
                  id=rec_no=Batch_No= Patient_CCC_No=Testing_Lab= Facility_Name=MFL_Code=
                          County=Sub_County=Sex=Age=SampleType=Collection_Date=Received_Status=
                          Current_Regimen=PMTCT=ART_Initiation_Date=Justification=
                          Date_of_Receiving=Date_of_Testing=Date_of_Dispatch=YearMonth=Result="";
                  
                  XSSFRow rowi = worksheet.getRow(i);
                  if( rowi==null){
                      
                      break;
                  }
                  


                  
                  
                  
//        0_______________________systemID__________________________
XSSFCell cellsystemID = rowi.getCell((short) 0);


if(cellsystemID.getCellType()==0)
{
    //numeric
    systemID =""+(int)cellsystemID.getNumericCellValue();
}

else if(cellsystemID.getCellType()==1)
{
    systemID =cellsystemID.getStringCellValue();
}




//        1_______________________Batch_No__________________________
XSSFCell cellBatch_No = rowi.getCell((short) 1);
System.out.println("___i is__"+i);
if(cellBatch_No.getCellType()==0){
    //numeric
    Batch_No =""+(int)cellBatch_No.getNumericCellValue();
}
else if(cellBatch_No.getCellType()==1){
    Batch_No =cellBatch_No.getStringCellValue();
}




//        2_______________________Patient_CCC_No__________________________
XSSFCell cellPatient_CCC_No = rowi.getCell((short) 2);

if(cellPatient_CCC_No.getCellType()==0)
{
    //numeric
    Patient_CCC_No =""+cellPatient_CCC_No.getRawValue();
    System.out.println(rec_no+" Patient ccc no int : "+Patient_CCC_No);
    
}
else if(cellPatient_CCC_No.getCellType()==1)
{
    Patient_CCC_No =cellPatient_CCC_No.getStringCellValue();
    
     System.out.println(rec_no+" Patient ccc no string : "+Patient_CCC_No);
}




//        3_______________________Testing_Lab__________________________
XSSFCell cellTesting_Lab = rowi.getCell((short) 3);
//System.out.println("___i is__"+i);
if(cellTesting_Lab.getCellType()==0){
    //numeric
    Testing_Lab =""+(int)cellTesting_Lab.getNumericCellValue();
}
else if(cellTesting_Lab.getCellType()==1){
    Testing_Lab =cellTesting_Lab.getStringCellValue();
}

//        4_______________________County__________________________
XSSFCell cellCounty = rowi.getCell((short) 4);
//System.out.println("___i is__"+i);
if(cellCounty.getCellType()==0){
    //numeric
    County =""+(int)cellCounty.getNumericCellValue();
}
else if(cellCounty.getCellType()==1){
    County =cellCounty.getStringCellValue();
}




//        5_______________________Sub_County__________________________
XSSFCell cellSub_County = rowi.getCell((short) 5);
//System.out.println("___i is__"+i);
if(cellSub_County.getCellType()==0){
    //numeric
    Sub_County =""+(int)cellSub_County.getNumericCellValue();
}
else if(cellSub_County.getCellType()==1){
    Sub_County =cellSub_County.getStringCellValue();
}


//        7_______________________Facility_Name__________________________
XSSFCell cellFacility_Name = rowi.getCell((short) 7);
//System.out.println("___i is__"+i);
if(cellFacility_Name.getCellType()==0){
    //numeric
    Facility_Name =""+(int)cellFacility_Name.getNumericCellValue();
}
else if(cellFacility_Name.getCellType()==1){
    Facility_Name =cellFacility_Name.getStringCellValue();
}



//        8_______________________MFLCode__________________________
XSSFCell cellMflCode = rowi.getCell((short) 8);

if(cellMflCode.getCellType()==0){
    //numeric
    MFL_Code =""+(int)cellMflCode.getNumericCellValue();
}
else if(cellMflCode.getCellType()==1){
    MFL_Code =cellMflCode.getStringCellValue();
}

//        9_______________________Sex__________________________
XSSFCell cellSex = rowi.getCell((short) 9);
///System.out.println("___i is__"+i);
if(cellSex.getCellType()==0){
    //numeric
    Sex =""+(int)cellSex.getNumericCellValue();
}
else if(cellSex.getCellType()==1){
    Sex =cellSex.getStringCellValue();
}

//        10_______________________DOB__________________________
XSSFCell cellDob = rowi.getCell((short) 10);
//System.out.println("___i is__"+i);
                  switch (cellDob.getCellType()) {
                      case 0:
                          //numeric
                          Date da= DateUtil.getJavaDate((double)cellDob.getNumericCellValue());
                          dob =""+targetFormat.format(da);
                          
                          System.out.println("Tarehe ni Num "+dob);
                          break;
                      case 1:
                          dob =cellDob.getStringCellValue();
                          if(!dob.equals("")){
                              System.out.println("Tarehe ni String "+cellDob.getStringCellValue());
                              dob =cellDob.getStringCellValue();
                          }  break;
                      default:
                          
                          System.out.println("Tarehe ni date "+cellDob.getDateCellValue());
                          if(cellDob.getDateCellValue()!=null){
                          dob =targetFormat.format(cellDob.getDateCellValue());
                          }
                          
                          break;
                  }


//11_______________________Age__________________________
XSSFCell cellAge = rowi.getCell((short) 11);
//System.out.println("___i is__"+i);
if(cellAge.getCellType()==0){
    //numeric
    Age =""+(int)cellAge.getNumericCellValue();
}
else if(cellAge.getCellType()==1){
    Age =cellAge.getStringCellValue();
}



//12_______________________Sample Type__________________________
XSSFCell cellsampletype = rowi.getCell((short) 12);

if(cellsampletype.getCellType()==0){
    //numeric
    SampleType =""+(int)cellsampletype.getNumericCellValue();
}
else if(cellsampletype.getCellType()==1){
    SampleType =cellsampletype.getStringCellValue();
}






//        13_______________________Collection_Date__________________________
XSSFCell cellCollection_Date = rowi.getCell((short) 13);
                  switch (cellCollection_Date.getCellType()) {
                      case 1:
                          //numeric
                          Collection_Date =cellCollection_Date.getStringCellValue();
                          break;
                      case 0:
                          Date da= DateUtil.getJavaDate((double)cellCollection_Date.getNumericCellValue());
                          Collection_Date =""+targetFormat.format(da);
                          break;
                      default:
                          Collection_Date =targetFormat.format(cellCollection_Date.getDateCellValue());
                          break;
                  }
                  

//        14_______________________Justification__________________________
XSSFCell cellJustification = rowi.getCell((short) 14);
//System.out.println("___i is__"+i);
if(cellJustification.getCellType()==0){
    //numeric
    Justification =""+(int)cellJustification.getNumericCellValue();
}
else if(cellJustification.getCellType()==1){
    Justification =cellJustification.getStringCellValue();
}




//        15_______________________Date_of_Receiving__________________________
XSSFCell cellDate_of_Receiving = rowi.getCell((short) 15);

                  switch (cellDate_of_Receiving.getCellType()) {
                      case 1:
                          Date_of_Receiving =cellDate_of_Receiving.getStringCellValue();
                          break;

                      case 0:
                          Date da= DateUtil.getJavaDate((double)cellDate_of_Receiving.getNumericCellValue());
                          Date_of_Receiving =""+targetFormat.format(da);
                          break;
                      default:
                          Date_of_Receiving =targetFormat.format(cellDate_of_Receiving.getDateCellValue());
                          break;
                  }



//        16_______________________Date_of_Testing__________________________
XSSFCell cellDate_of_Testing = rowi.getCell((short) 16);

                  switch (cellDate_of_Testing.getCellType()) {
                      case 1:
                          Date_of_Testing =cellDate_of_Testing.getStringCellValue();
                          break;

                      case 0:
                          // ART_Initiation_Date =""+cellART_Initiation_Date.getNumericCellValue();
                          Date da= DateUtil.getJavaDate((double)cellDate_of_Testing.getNumericCellValue());
                          Date_of_Testing =""+targetFormat.format(da);
                          break;
                      default:
                          Date_of_Testing =targetFormat.format(cellDate_of_Testing.getDateCellValue());
                          break;
                  }



//        17_______________________Date_of_Dispatch__________________________
XSSFCell cellDate_of_Dispatch = rowi.getCell((short) 17);
//            cellDate_of_Dispatch.setCellType(Cell.CELL_TYPE_STRING);
                  switch (cellDate_of_Dispatch.getCellType()) {
                      case 1:
                          Date_of_Dispatch =cellDate_of_Dispatch.getStringCellValue();
                          break;
                      case 0:
                          Date da= DateUtil.getJavaDate((double)cellDate_of_Dispatch.getNumericCellValue());
                          Date_of_Dispatch =""+targetFormat.format(da);
                          break;
                      default:
                          //Date_of_Dispatch =""+cellDate_of_Dispatch.getDateCellValue();
                          Date_of_Dispatch =targetFormat.format(cellDate_of_Dispatch.getDateCellValue());
                          //Date_of_Dispatch=""+ConvertDate(cellDate_of_Dispatch.getDateCellValue());   
                          break;
                  }

 
 
//Date original_date = cellDate_of_Dispatch.getDateCellValue();
if(Date_of_Dispatch!=null){
   // Date_of_Dispatch =targetFormat.format(original_date); 
    
    if(!Date_of_Dispatch.equals("")){
        //get yearmonth 2017-04-29
        
        System.out.println(" Dispatch Date: "+Date_of_Dispatch);
        String [] dates = Date_of_Dispatch.split("-");
        YearMonth = dates[0]+""+dates[1];
        System.out.println("YearMonth : "+YearMonth);
    }
}


//        18_______________________ART_Initiation_Date__________________________
XSSFCell cellART_Initiation_Date = rowi.getCell((short) 18);

 if(cellART_Initiation_Date.getCellType()==1){
    ART_Initiation_Date =cellART_Initiation_Date.getStringCellValue();
}
 else if(cellART_Initiation_Date.getCellType()==0){
   // ART_Initiation_Date =""+cellART_Initiation_Date.getNumericCellValue();
      Date da= DateUtil.getJavaDate((double)cellART_Initiation_Date.getNumericCellValue());
                          ART_Initiation_Date =""+targetFormat.format(da);
    
    
}
 
  else if(cellART_Initiation_Date.getCellType()==3){
    ART_Initiation_Date =cellART_Initiation_Date.getStringCellValue();
}
 else {
     System.out.println("Data type ni:"+cellART_Initiation_Date.getCellType());
 ART_Initiation_Date =targetFormat.format(cellART_Initiation_Date.getDateCellValue());
 }



//        19_______________________Received_Status__________________________
XSSFCell cellReceived_Status = rowi.getCell((short) 19);

if(cellReceived_Status.getCellType()==0){
    //numeric
    Received_Status=""+(int)cellReceived_Status.getNumericCellValue();
}
else if(cellReceived_Status.getCellType()==1){
    Received_Status=cellReceived_Status.getStringCellValue();
}



//        20_______________________Current_Regimen__________________________
XSSFCell cellCurrent_Regimen = rowi.getCell((short) 20);

if(cellCurrent_Regimen.getCellType()==0){
    //numeric
    Current_Regimen =""+(int)cellCurrent_Regimen.getNumericCellValue();
}

else if(cellCurrent_Regimen.getCellType()==1){
    Current_Regimen =cellCurrent_Regimen.getStringCellValue();
}


//        21_______________________Regimen Line__________________________
XSSFCell cellRegimen_line = rowi.getCell((short) 21);

if(cellRegimen_line.getCellType()==0){
    //numeric
    regimen_line =""+(int)cellRegimen_line.getNumericCellValue();
}

else if(cellRegimen_line.getCellType()==1){
    regimen_line =cellRegimen_line.getStringCellValue();
}


//        22_______________________PMTCT__________________________
XSSFCell cellPMTCT = rowi.getCell((short) 22);

if(cellPMTCT.getCellType()==0){
    //numeric
    PMTCT =""+(int)cellPMTCT.getNumericCellValue();
}
else if(cellPMTCT.getCellType()==1){
    PMTCT =cellPMTCT.getStringCellValue();
}




//        23_______________________Result__________________________
XSSFCell cellResult = rowi.getCell((short) 23);

if(cellResult.getCellType()==0){
    //numeric
    Result =""+(int)cellResult.getNumericCellValue();
}
else if(cellResult.getCellType()==1){
    Result =cellResult.getStringCellValue();
}






id=MFL_Code+"_"+Date_of_Dispatch.replace("-", "") +"_"+Patient_CCC_No;

String checker = "SELECT id FROM vl_validation WHERE systemID=? " ;
conn.pst=conn.conne.prepareStatement(checker);
conn.pst.setString(1, systemID);
//conn.pst.setString(2, Date_of_Dispatch);

conn.rs=conn.pst.executeQuery();
if(conn.rs.next()){
    id=conn.rs.getString(1);
    
    //update the record
    String updater = "UPDATE vl_validation SET id=?,Batch_No=?, Patient_CCC_No=?,Testing_Lab=?, "
            + "Facility_Name=?,MFL_Code=?,County=?,Sub_County=?,Sex=?,Age=?,SampleType=?,Collection_Date=?,"
            + "Received_Status=?,Current_Regimen=?,PMTCT=?,ART_Initiation_Date=?,Justification=?,"
            + "Date_of_Receiving=?,Date_of_Testing=?,Date_of_Dispatch=?,Result=?,regimen_line=?,"
            + "dob=?,YearMonth=? WHERE systemID=?";
    
    conn.pst1=conn.conne.prepareStatement(updater);
    conn.pst1.setString(1, id);
    conn.pst1.setString(2, Batch_No);
    conn.pst1.setString(3, Patient_CCC_No);
    conn.pst1.setString(4, Testing_Lab);
    conn.pst1.setString(5, Facility_Name);
    conn.pst1.setString(6, MFL_Code);
    conn.pst1.setString(7, County);
    conn.pst1.setString(8, Sub_County);
    conn.pst1.setString(9, Sex);
    conn.pst1.setString(10, Age);
    conn.pst1.setString(11, SampleType);
    conn.pst1.setString(12, Collection_Date);
    conn.pst1.setString(13, Received_Status);
    conn.pst1.setString(14, Current_Regimen);
    conn.pst1.setString(15, PMTCT);
    conn.pst1.setString(16, ART_Initiation_Date);
    conn.pst1.setString(17, Justification);
    conn.pst1.setString(18, Date_of_Receiving);
    conn.pst1.setString(19, Date_of_Testing);
    conn.pst1.setString(20, Date_of_Dispatch);
    conn.pst1.setString(21, Result);
    conn.pst1.setString(22, regimen_line);
    conn.pst1.setString(23, dob);
    conn.pst1.setString(24, YearMonth);
    conn.pst1.setString(25, id);
    
    conn.pst1.executeUpdate();
    updated++;
}
else{
    String inserter = "REPLACE INTO vl_validation (id,systemID,Batch_No, Patient_CCC_No,Testing_Lab,"
            + "Facility_Name,MFL_Code,County,Sub_County,Sex,Age,SampleType,Collection_Date,"
            + "Received_Status,Current_Regimen,PMTCT,ART_Initiation_Date,Justification,"
            + "Date_of_Receiving,Date_of_Testing,Date_of_Dispatch,Result,regimen_line,"
            + "dob,YearMonth) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    conn.pst1 = conn.conne.prepareStatement(inserter);
    
    conn.pst1.setString(1, id);
    conn.pst1.setString(2, systemID);
    conn.pst1.setString(3, Batch_No);
    conn.pst1.setString(4, Patient_CCC_No);
    conn.pst1.setString(5, Testing_Lab);
    conn.pst1.setString(6, Facility_Name);
    conn.pst1.setString(7, MFL_Code);
    conn.pst1.setString(8, County);
    conn.pst1.setString(9, Sub_County);
    conn.pst1.setString(10, Sex);
    conn.pst1.setString(11, Age);
    conn.pst1.setString(12, SampleType);
    conn.pst1.setString(13, Collection_Date);
    conn.pst1.setString(14, Received_Status);
    conn.pst1.setString(15, Current_Regimen);
    conn.pst1.setString(16, PMTCT);
    conn.pst1.setString(17, ART_Initiation_Date);
    conn.pst1.setString(18, Justification);
    conn.pst1.setString(19, Date_of_Receiving);
    conn.pst1.setString(20, Date_of_Testing);
    conn.pst1.setString(21, Date_of_Dispatch);
    conn.pst1.setString(22, Result);
    conn.pst1.setString(23, regimen_line);
    conn.pst1.setString(24, dob);
   
    conn.pst1.setString(25, YearMonth);
    
    System.out.println("query: "+conn.pst1);
    conn.pst1.executeUpdate();
    
    added++;
}

i++;
              
              
             


 //update_expectedrecords
        
        //_________________________Update Expected Records for each user__________________________
        
         String qry = "call update_expectedrecords()";

         
         
         conn.rs = conn.st.executeQuery(qry);
                  
                if (conn.rs.next()) {
                 System.out.println(" Query run successfully: "+qry);
                                     }
              
              } catch (SQLException ex) {
                  Logger.getLogger(UploadSTFData.class.getName()).log(Level.SEVERE, null, ex);
              }
        }
        
        
       
        
        
          if(sentmail.equals("Yes")){
         
//               try {
//                  // sentUploadnotification(conn, monthname);
//               } catch (SQLException ex) {
//                   Logger.getLogger(UploadStfData_v0.class.getName()).log(Level.SEVERE, null, ex);
//               } catch (MessagingException ex) {
//                   Logger.getLogger(UploadStfData_v0.class.getName()).log(Level.SEVERE, null, ex);
//               }
         }
        
        
        
        try {
         if(conn.st!=null){conn.st.close();}  
         if(conn.st1!=null){conn.st1.close();}  
         if(conn.st_6!=null){conn.st_6.close();}  
         if(conn.rs!=null){conn.rs.close();}  
         if(conn.rs1!=null){conn.rs1.close();}  
         if(conn.rs_6!=null){conn.rs_6.close();}  
         if(conn.pst1!=null){conn.pst1.close();}  
         if(conn.conne!=null){conn.conne.close();}  
         
        } catch (SQLException ex) {
                  Logger.getLogger(UploadSTFData.class.getName()).log(Level.SEVERE, null, ex);
              }
        
        String message="<font color=\"green\">"+added+"</font> New records added successfully. <font color=\"blue\">"+updated+"</font> Records updated." ; 
        session.setAttribute("upload_success", message);  
        }

        
        response.sendRedirect(nextpage);
    }

//  


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

  
      private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
      
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return contentDisp;
    }
      public String getMFLCode(dbConnweb conn, String facility_name) throws SQLException 
      {
          String mfl_code="";
          
       String getmfl_code = "SELECT mfl_code from facility_list WHERE facility_name like ?";
       conn.pst=conn.conne.prepareStatement(getmfl_code);
       conn.pst.setString(1, facility_name);
       conn.rs2 = conn.pst.executeQuery();
       if(conn.rs2.next()){
           mfl_code = conn.rs2.getString(1);
       }
          return mfl_code;
      }
      
      
      public Date ConvertDate(Date date){

          
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String format = formatter.format(date);
System.out.println(format);
          
   
    return date;
  }
      
      
      public void sentUploadnotification(dbConnweb conn, String monthname) throws SQLException, MessagingException{
      
          System.out.println(" Mailing option called saaa hiiiii");
          
          sendmail sm=new sendmail();
          
     String qry="select mail_user from users where active=1"; 
     
     conn.rs=conn.st.executeQuery(qry);
     
       String usermail="Ekaunda@fhi360.org,"; 
      //
     
     while(conn.rs.next())
       
    {
        if(conn.rs.getString("mail_user").contains("@") && (conn.rs.getString("mail_user").contains(".com") || conn.rs.getString("mail_user").contains(".org"))){
        
    
    usermail+=conn.rs.getString("mail_user")+",";  
        }
        
        System.out.println("Usermail "+usermail);
    }  
    
    sm.Sendemail("STF Data For Month "+monthname+" Has been Uploaded","Hi ,  \n This is to notify you that New STFs data for the month of "+monthname+" has been uploaded. \n \n . Please Access the STF system using this link https://hsdsacluster2.fhi360.org:8443/thestf/. \n \nDo not reply to this mail, It is system generated. ", "STF Data For Month "+monthname+" Has been Uploaded",""+usermail);
        
          
      
      }
      
      
}
