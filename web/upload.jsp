<%-- 
    Document   : uploadSTFData
    Created on : Mar 22, 2021, 12:30:27 PM
    Author     : EKaunda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Upload STF Data </title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
                  <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
                  <link href="css/jquery.dataTables.min.css" rel="stylesheet">
		<link href="css/bootstrap.css" rel="stylesheet">
                <link href="css/bootstrap-datepicker.min.css" rel="stylesheet">
                    <link rel="stylesheet" href="css/select2.min.css">
                    <link rel="shortcut icon" href="images/logo.png">
                  
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
                
                <style>
                input:focus {
                    border-color: red;
                }
                .upload-content{
                    margin-top: 100px;
                    margin-left: 70px;
                    margin-right: 70px;
                    border-radius: 25px;
                    background: #F8F8F8;
                    padding: 20px;
                }
                
                .uploadbtn {
                    background-color: plum;
                }
                </style>
                
	</head>
    <body>
        <div class="upload-content">
        
        <form action="UploadStfData_v0" method="POST" enctype="multipart/form-data" class="form-horizontal" >
                       
                        <div class="form-actions" style="overflow-x: scroll;">
                              <h4 style="text-align: center; color:red;font-family: cambria;">Note: Kindly ensure the excel file containing STF raw data has column headers arranged in following order. <br>
                              The All the dates must be in format YYYY-mm-dd and File  should be of type xlsx</h4>
                            <br>
                        <table border="1" class="table responsive">
               
                            <tr>
                              <td>Row 1: [A] System ID</td><td>[B] Batch</td><td>[C] Patient CCC No</td><td>[D] Lab Tested In</td><td>[E] County</td><td>[F] Sub-County</td><td>[G] Partner</td><td>[H] Facilty</td><td>[I] Facility Code</td><td>[J] Gender</td><td>[K] DOB</td><td>[L] Age</td><td>[M] Sample Type</td><td>[N] Date Collected</td><td>[O] Justification</td><td>[P] Date Received</td><td>[Q] Date Tested</td><td>[R] Date Dispatched</td><td>[S] ART Initiation Date</td><td>[T] Received Status</td><td>[U] Regimen</td><td>[V] Regimen Line</td><td>[W] PMTCT</td><td>[X] Result</td>  
                            </tr>
                        </table>
                           
                        </div>
            
            
            <table class="table-responsive table">
            
                
                <tr>
                <td>
                 <label class="controls" >Select File &nbsp;&nbsp; </label>
                
              
                    
                </td><td>
                    <div class="controls"  >
            <input type="file" name="file_name"   accept=".xlsx" id="upload" value="" class="input-group-lg" required>   
                        
                        </div></td><td>
                         
                        
                       
                             <label class="controls" >Month  &nbsp;&nbsp;</label></td><td> <div class="controls"  >
                             
                             <select required="true" class="select2-search--dropdown"  name='month' id='month'> 
                                 <option value=''>Select Month</option>
                                 <option value='January'>January</option>
                                 <option value='February'>February</option>
                                 <option value='March'>March</option>
                                 <option value='April'>April</option>
                                 <option value='May'>May</option>
                                 <option value='June'>June</option>
                                 <option value='July'>July</option>
                                 <option value='August'>August</option>
                                 <option value='September'>September</option>
                                 <option value='October'>October</option>
                                 <option value='November'>November</option>
                                 <option value='December'>December</option>
                                 
                             </select>
                         </div>
                        
</td><td>
                        
                          
                          <div class="form-actions controls"  >
                             <label>Sent Email &nbsp;&nbsp; </label>
                          </div></td><td><div class="form-actions controls">
                             <select class="select2-search--dropdown"   name='sentemail' id='sentemail'> <option value='Yes'>Yes</option><option value='No'>No</option> </select>
                         </div>
                          
                          </td></tr> 
                
                <tr><td colspan="6"> <br/></td></tr>
                <tr><td colspan="6">
                         
                           <div class="form-actions "  >
                              <button type="submit" class="btn blue uploadbtn">Load Excel.</button>

                           </div>
                
                </td>
                </tr>
                          
                        </table>  
                        
                        </form>
        </div>
        
    </body>
</html>
