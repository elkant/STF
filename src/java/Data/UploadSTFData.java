/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import scripts.updatemfl;
@MultipartConfig(fileSizeThreshold=1024*1024*20, 	// 20 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100) 
/**
 *
 * @author GNyabuto
 */
public class UploadSTFData extends HttpServlet {
    HttpSession session;
 String id,rec_no,Batch_No, Patient_CCC_No,Testing_Lab, Facility_Name,MFL_Code,County,Sub_County,Sex,Age,SampleType,Collection_Date,Received_Status,Current_Regimen,PMTCT,ART_Initiation_Date,Justification,Date_of_Receiving,Date_of_Testing,Date_of_Dispatch,Result,Justification2,Regimen2,Date_Collected2,Date_Tested2,Result2,YearMonth;
   
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
         nextpage="uploadSTFData.jsp";
         
         DateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
         
         
         
         
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
            
           fileName = getFileName(part);
            part.write(uploadFilePath + File.separator + fileName);
            System.out.println("file name is  :  "+fileName);
        }
        if(!fileName.endsWith(".xlsx")){
          session.setAttribute("upload_success", "<font color=\"red\">Failed to load the excel file. Please choose a .xlsx excel file .</font>"); 
            System.out.println("Failed to load the excel file. Please choose a .xlsx excel file ");
        }
        else {
          full_path=fileSaveDir.getAbsolutePath()+"\\"+fileName;
 
 System.out.println("the saved file directory is  :  "+full_path);
// GET DATA FROM THE EXCEL AND AND OUTPUT IT ON THE CONSOLE..................................
 
  FileInputStream fileInputStream = new FileInputStream(full_path);
        XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
        XSSFSheet worksheet = workbook.getSheetAt(0);
        Iterator rowIterator = worksheet.iterator();

        int i=2,y=0;
        while(rowIterator.hasNext()){
              try {
                  id=rec_no=Batch_No= Patient_CCC_No=Testing_Lab= Facility_Name=MFL_Code=
                          County=Sub_County=Sex=Age=SampleType=Collection_Date=Received_Status=
                          Current_Regimen=PMTCT=ART_Initiation_Date=Justification=
                          Date_of_Receiving=Date_of_Testing=Date_of_Dispatch=YearMonth=Result=    
                          Justification2=Regimen2=Date_Collected2=Date_Tested2=Result2="";
                  
                  XSSFRow rowi = worksheet.getRow(i);
                  if( rowi==null){
                      
                      break;
                  }
                  
                  
//        0_______________________#__________________________
XSSFCell cellserialno = rowi.getCell((short) 0);
System.out.println("___i is__"+i);
if(cellserialno.getCellType()==0){
    //numeric
    rec_no =""+(int)cellserialno.getNumericCellValue();
}
else if(cellserialno.getCellType()==1){
    rec_no =cellserialno.getStringCellValue();
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
System.out.println("___i is__"+i);
if(cellPatient_CCC_No.getCellType()==0){
    //numeric
    Patient_CCC_No =""+(int)cellPatient_CCC_No.getNumericCellValue();
}
else if(cellPatient_CCC_No.getCellType()==1){
    Patient_CCC_No =cellPatient_CCC_No.getStringCellValue();
}




//        3_______________________Testing_Lab__________________________
XSSFCell cellTesting_Lab = rowi.getCell((short) 3);
System.out.println("___i is__"+i);
if(cellTesting_Lab.getCellType()==0){
    //numeric
    Testing_Lab =""+(int)cellTesting_Lab.getNumericCellValue();
}
else if(cellTesting_Lab.getCellType()==1){
    Testing_Lab =cellTesting_Lab.getStringCellValue();
}




//        4_______________________Facility_Name__________________________
XSSFCell cellFacility_Name = rowi.getCell((short) 4);
System.out.println("___i is__"+i);
if(cellFacility_Name.getCellType()==0){
    //numeric
    Facility_Name =""+(int)cellFacility_Name.getNumericCellValue();
}
else if(cellFacility_Name.getCellType()==1){
    Facility_Name =cellFacility_Name.getStringCellValue();
}

MFL_Code=getMFLCode(conn, Facility_Name);

if(MFL_Code.equals("")){
    
updatemfl uc= new updatemfl();

MFL_Code=uc.getMFLCode(conn, Facility_Name);
    
                       }
//        5_______________________County__________________________
XSSFCell cellCounty = rowi.getCell((short) 5);
System.out.println("___i is__"+i);
if(cellCounty.getCellType()==0){
    //numeric
    County =""+(int)cellCounty.getNumericCellValue();
}
else if(cellCounty.getCellType()==1){
    County =cellCounty.getStringCellValue();
}




//        6_______________________Sub_County__________________________
XSSFCell cellSub_County = rowi.getCell((short) 6);
System.out.println("___i is__"+i);
if(cellSub_County.getCellType()==0){
    //numeric
    Sub_County =""+(int)cellSub_County.getNumericCellValue();
}
else if(cellSub_County.getCellType()==1){
    Sub_County =cellSub_County.getStringCellValue();
}



//        7_______________________Sex__________________________
XSSFCell cellSex = rowi.getCell((short) 7);
System.out.println("___i is__"+i);
if(cellSex.getCellType()==0){
    //numeric
    Sex =""+(int)cellSex.getNumericCellValue();
}
else if(cellSex.getCellType()==1){
    Sex =cellSex.getStringCellValue();
}




//        8_______________________Age__________________________
XSSFCell cellAge = rowi.getCell((short) 8);
System.out.println("___i is__"+i);
if(cellAge.getCellType()==0){
    //numeric
    Age =""+(int)cellAge.getNumericCellValue();
}
else if(cellAge.getCellType()==1){
    Age =cellAge.getStringCellValue();
}




//        9_______________________SampleType__________________________
XSSFCell cellSampleType = rowi.getCell((short) 9);
System.out.println("___i is__"+i);
if(cellSampleType.getCellType()==0){
    //numeric
    SampleType =""+(int)cellSampleType.getNumericCellValue();
}
else if(cellSampleType.getCellType()==1){
    SampleType =cellSampleType.getStringCellValue();
}




//        10_______________________Collection_Date__________________________
XSSFCell cellCollection_Date = rowi.getCell((short) 10);

Date original_dateC = cellCollection_Date.getDateCellValue();
if(original_dateC!=null){
    Collection_Date =targetFormat.format(original_dateC);
}


//        11_______________________Received_Status__________________________
XSSFCell cellReceived_Status = rowi.getCell((short) 11);
System.out.println("___i is__"+i);
if(cellReceived_Status.getCellType()==0){
    //numeric
    Received_Status =""+(int)cellReceived_Status.getNumericCellValue();
}
else if(cellReceived_Status.getCellType()==1){
    Received_Status =cellReceived_Status.getStringCellValue();
}




//        12_______________________Current_Regimen__________________________
XSSFCell cellCurrent_Regimen = rowi.getCell((short) 12);
System.out.println("___i is__"+i);
if(cellCurrent_Regimen.getCellType()==0){
    //numeric
    Current_Regimen =""+(int)cellCurrent_Regimen.getNumericCellValue();
}
else if(cellCurrent_Regimen.getCellType()==1){
    Current_Regimen =cellCurrent_Regimen.getStringCellValue();
}





//        13_______________________PMTCT__________________________
XSSFCell cellPMTCT = rowi.getCell((short) 13);
System.out.println("___i is__"+i);
if(cellPMTCT.getCellType()==0){
    //numeric
    PMTCT =""+(int)cellPMTCT.getNumericCellValue();
}
else if(cellPMTCT.getCellType()==1){
    PMTCT =cellPMTCT.getStringCellValue();
}




//        14_______________________ART_Initiation_Date__________________________
XSSFCell cellART_Initiation_Date = rowi.getCell((short) 14);
Date original_dateART = cellART_Initiation_Date.getDateCellValue();
String art=""+original_dateART;
System.out.println("art date : "+art+" full date : "+original_dateART);
if(original_dateART!=null){
    ART_Initiation_Date =targetFormat.format(original_dateART);
}




//        15_______________________Justification__________________________
XSSFCell cellJustification = rowi.getCell((short) 15);
System.out.println("___i is__"+i);
if(cellJustification.getCellType()==0){
    //numeric
    Justification =""+(int)cellJustification.getNumericCellValue();
}
else if(cellJustification.getCellType()==1){
    Justification =cellJustification.getStringCellValue();
}




//        16_______________________Date_of_Receiving__________________________
XSSFCell cellDate_of_Receiving = rowi.getCell((short) 16);
Date original_dateR = cellDate_of_Receiving.getDateCellValue();
if(original_dateR!=null){
    Date_of_Receiving =targetFormat.format(original_dateR);
}



//        17_______________________Date_of_Testing__________________________
XSSFCell cellDate_of_Testing = rowi.getCell((short) 17);
Date original_dateT = cellDate_of_Testing.getDateCellValue();
if(original_dateT!=null){
    Date_of_Testing =targetFormat.format(original_dateT);
}



//        18_______________________Date_of_Dispatch__________________________
XSSFCell cellDate_of_Dispatch = rowi.getCell((short) 18);
//            cellDate_of_Dispatch.setCellType(Cell.CELL_TYPE_STRING);

Date original_date = cellDate_of_Dispatch.getDateCellValue();
if(original_date!=null){
    Date_of_Dispatch =targetFormat.format(original_date); 
    
    if(!Date_of_Dispatch.equals("")){
        //get yearmonth 2017-04-29
        String [] dates = Date_of_Dispatch.split("-");
        YearMonth = dates[0]+""+dates[1];
        System.out.println("YearMonth : "+YearMonth);
    }
}

//        19_______________________cellResult__________________________
XSSFCell cellResult = rowi.getCell((short) 19);
System.out.println("___i is__"+i);
if(cellResult.getCellType()==0){
    //numeric
    Result =""+(int)cellResult.getNumericCellValue();
}
else if(cellResult.getCellType()==1){
    Result =cellResult.getStringCellValue();
}




//        20_______________________Justification2__________________________
XSSFCell cellJustification2 = rowi.getCell((short) 20);
System.out.println("___i is__"+i);
if(cellJustification2.getCellType()==0){
    //numeric
    Justification2 =""+(int)cellJustification2.getNumericCellValue();
}
else if(cellJustification2.getCellType()==1){
    Justification2 =cellJustification2.getStringCellValue();
}




//        21_______________________Regimen2__________________________
XSSFCell cellRegimen2 = rowi.getCell((short) 21);
System.out.println("___i is__"+i);
if(cellRegimen2.getCellType()==0){
    //numeric
    Regimen2 =""+(int)cellRegimen2.getNumericCellValue();
}
else if(cellRegimen2.getCellType()==1){
    Regimen2 =cellRegimen2.getStringCellValue();
}




//        22_______________________Date_Collected2__________________________
XSSFCell cellDate_Collected2 = rowi.getCell((short) 22);
Date original_dateC2 = cellDate_Collected2.getDateCellValue();
if(original_dateC2!=null){
    Date_Collected2 =targetFormat.format(original_dateC2);
}



//        23_______________________Date_Tested2__________________________
XSSFCell cellDate_Tested2 = rowi.getCell((short) 23);
Date original_dateT2 = cellDate_Tested2.getDateCellValue();
if(original_dateT2!=null){
    Date_Tested2 =targetFormat.format(original_dateT2);
}


//        24_______________________Result2__________________________
XSSFCell cellResult2 = rowi.getCell((short) 24);
System.out.println("___i is__"+i);
if(cellResult2.getCellType()==0){
    //numeric
    Result2 =""+(int)cellResult2.getNumericCellValue();
}
else if(cellResult2.getCellType()==1){
    Result2 =cellResult2.getStringCellValue();
}


id=MFL_Code+"_"+Date_of_Dispatch.replace("-", "") +"_"+Patient_CCC_No;

String checker = "SELECT id FROM vl_validation WHERE Patient_CCC_No=? AND Date_of_Dispatch=?" ;
conn.pst=conn.conne.prepareStatement(checker);
conn.pst.setString(1, Patient_CCC_No);
conn.pst.setString(2, Date_of_Dispatch);

conn.rs=conn.pst.executeQuery();
if(conn.rs.next()){
    id=conn.rs.getString(1);
    
    //update the record
    String updater = "UPDATE vl_validation SET rec_no=?,Batch_No=?, Patient_CCC_No=?,Testing_Lab=?, "
            + "Facility_Name=?,MFL_Code=?,County=?,Sub_County=?,Sex=?,Age=?,SampleType=?,Collection_Date=?,"
            + "Received_Status=?,Current_Regimen=?,PMTCT=?,ART_Initiation_Date=?,Justification=?,"
            + "Date_of_Receiving=?,Date_of_Testing=?,Date_of_Dispatch=?,Result=?,Justification2=?,"
            + "Regimen2=?,Date_Collected2=?,Date_Tested2=?,Result2=?,YearMonth=? WHERE id=?";
    
    conn.pst1=conn.conne.prepareStatement(updater);
    conn.pst1.setString(1, rec_no);
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
    conn.pst1.setString(22, Justification2);
    conn.pst1.setString(23, Regimen2);
    conn.pst1.setString(24, Date_Collected2);
    conn.pst1.setString(25, Date_Tested2);
    conn.pst1.setString(26, Result2);
    conn.pst1.setString(27, YearMonth);
    conn.pst1.setString(28, id);
    
    conn.pst1.executeUpdate();
    updated++;
}
else{
    String inserter = "INSERT INTO vl_validation (id,rec_no,Batch_No, Patient_CCC_No,Testing_Lab,"
            + "Facility_Name,MFL_Code,County,Sub_County,Sex,Age,SampleType,Collection_Date,"
            + "Received_Status,Current_Regimen,PMTCT,ART_Initiation_Date,Justification,"
            + "Date_of_Receiving,Date_of_Testing,Date_of_Dispatch,Result,Justification2,"
            + "Regimen2,Date_Collected2,Date_Tested2,Result2,YearMonth) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    conn.pst1 = conn.conne.prepareStatement(inserter);
    
    conn.pst1.setString(1, id);
    conn.pst1.setString(2, rec_no);
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
    conn.pst1.setString(23, Justification2);
    conn.pst1.setString(24, Regimen2);
    conn.pst1.setString(25, Date_Collected2);
    conn.pst1.setString(26, Date_Tested2);
    conn.pst1.setString(27, Result2);
    conn.pst1.setString(28, YearMonth);
    
    System.out.println("query: "+conn.pst1);
    conn.pst1.executeUpdate();
    
    added++;
}

i++;
              } catch (SQLException ex) {
                  Logger.getLogger(UploadSTFData.class.getName()).log(Level.SEVERE, null, ex);
              }
        }
        
        
        String message="<font color=\"green\">"+added+"</font> New records added successfully. <font color=\"blue\">"+updated+"</font> Records updated." ; 
        session.setAttribute("upload_success", message);  
        }

        
        response.sendRedirect(nextpage);
    }

//  
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(UploadSTFData.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//  
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(UploadSTFData.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

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
      public String getMFLCode(dbConnweb conn, String facility_name) throws SQLException{
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
}
