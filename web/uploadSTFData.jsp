<%-- 
    Document   : uploadSTFData
    Created on : Aug 30, 2017, 12:30:27 PM
    Author     : GNyabuto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Upload STF Data</title>
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
        
        <form action="UploadSTFData" method="post" enctype="multipart/form-data" class="form-horizontal" >
                       
                        <div class="form-actions" style="overflow-x: scroll;">
                              <h4 style="text-align: center; color:red;font-family: cambria;">Note: Kindly ensure the excel file containing STF raw data has column headers arranged in following order. <br>
                              The excel data MUST have  2 header rows as shown below.</h4>
                            <br>
                        <table border="1" class="table responsive">
                            <tr><td colspan="8"></td><td colspan="13">1st VL information</td><td colspan="5">2nd VL information (if done)</td></tr>
                            <tr><td rowspan="1">#(1)</td><td rowspan="1">Batch #(2)</td><td rowspan="1">Patient_CCC_No(3)</td><td rowspan="1">Testing Lab (4)</td><td rowspan="1">Facility_Name(5)</td><td rowspan="1">County(6)</td><td rowspan="1">Sub-County(7)</td><td>Sex(8)</td><td>Age(9)</td><td>Sample Type(10)</td><td>Collection Date(11)</td><td>Received Status(12)</td><td>Current Regimen(13)</td><td>PMTCT(14)</td><td>ART Initiation Date(15)</td><td>Justification(16)</td><td>Date of Receiving(17)</td><td>Date of Testing(18)</td><td>Date of Dispatch(19)</td><td>Result(20)</td><td>Justification(21)</td><td>Regimen(22)</td><td>Date Collected(23)</td><td>Date Tested(24)</td><td>Result(25)</td></tr>
                        </table>
                           
                        </div>
            
            <input type="file" name="file_name" style="margin-left:45%; margin-top: 5%;" id="upload" value="" class="textbox" required>   
                        <br><br><br><br>



                         
                           <div class="form-actions "  style="margin-left:45%">
                              <button type="submit" class="btn blue uploadbtn">Load Excel.</button>

                           </div>
                        
                        </form>
        </div>
        
    </body>
</html>
