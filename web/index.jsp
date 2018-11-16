<%-- 
    Document   : index
    Created on : Mar 17, 2016, 3:17:19 PM
    Author     : Emmanuel E
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<!--<html  manifest="stfv1.appcache">-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>STF</title>
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
                
         <style type='text/css'>
input:focus {
    border-color: red;
    }
    .control-group .select2-container {
  position: relative;
  z-index: 2;
  float: left;
  width: 100%;
  margin-bottom: 0;
  display: table;
  table-layout: fixed;
}



</style>
                
	</head>
	<body>
<!-- header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
        </div>
        <div class="navbar-collapse collapse">
                       

            
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
              
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="#">My Profile</a></li>
                    </ul>
                </li>
          
                
                 <li><a title="Add Widget" id="adduserbutton" data-toggle="modal" href="#userdetails"><i class="glyphicon glyphicon-user"></i><span id="usernamelabel"> Add Username</span></a></li>
                 <li><a title="Add Widget" data-toggle="modal" style="display:none;" id="exportdataanchor2" href="#addWidgetModal"><i class="glyphicon glyphicon-cloud-upload"></i> Export Data</a></li>
                 <li>
                  <a  title="Help" data-toggle="modal" href="#help">
                            <i class="glyphicon glyphicon-question-sign"></i>
                            Help
                        </a></li>
                        <li>
                  <a  title="" id='loginbtn' data-toggle="modal" href="#accesscodemodal"><i class="glyphicon glyphicon-log-in"></i>login</a></li>
                         <li>
                  <a  title="" id='summaryrptbtn' data-toggle="modal" href="#summarybtn"><i class="glyphicon glyphicon-stats"></i>Reporting rate</a></li>
                        <li><a  title=""  data-toggle="modal" href="#datasavedmodal">.</a></li>
                              <li><a href="#" style="display:none;" onclick="closeapp();"><i class="glyphicon glyphicon-lock"></i> Exit</a></li>
            </ul>
        </div>
        
    </div>
    <!-- /container -->
    
</div>
<!-- /Header -->
    
<!-- Main -->
<div class="container-fluid">
    <div class="row">
        
        <!-- /col-3 -->
        <div class="col-sm-12">

            
            
            <h5 title="updated 15th Nov 2018" style="text-align: center;color:blue;">STF version 3.0.0 <label id='totalcccnos'>.</label></h5>

      
      
  

            <div class="row">
                <!-- center left-->
                <div class="col-md-12">
                    

                  

                    <div class="btn-group btn-group-justified">
                        <a href="#" id='refreshpage' class="btn btn-success col-sm-3">
                            <i class="glyphicon glyphicon-refresh"></i>
                            <br> Refresh
                        </a>
                        
                         
                            
                            <a  class="btn btn-success col-sm-3" id="exportdataanchor1" style="display:none;" title="Add Widget" data-toggle="modal" href="#addWidgetModal">
                                <i class="glyphicon glyphicon-cloud-upload"></i>
                                <br/>Export Data 
                                <span id="unexportedno" style="color:yellow;">(0 records )</span>
                            </a>
                            
                        
                        <!--<a href="#" class="btn btn-primary col-sm-3">
                            <i class="glyphicon glyphicon-cog"></i>
                            <br> Settings
                        </a>-->
                     <a class="btn btn-success col-sm-3" title="Excel report" data-toggle="modal" href="#excelreport">
                            <i class="glyphicon glyphicon-stats"></i>
                            <br> Excel Report
                        </a> 
                    </div>

                    <hr>


                   

                    <!--tabs-->
                    <div class="panel">
                        <ul class="nav nav-tabs " id="myTab">
                            <li class="active newdata col-xs-4"><a href="#dataentry" id="newdatabutton" data-toggle="tab">  <i class="glyphicon glyphicon-plus"></i>New Data</a></li>
                            <!--<li class="active editdata" style='display:none;' ><a href="#dataentry" id="newdatabutton" data-toggle="tab">  <i class="glyphicon glyphicon-edit"></i> Edit Data</a></li>-->
                            <li><a href="#reports" style="display:none;" id="reportsbutton" data-toggle="tab"> <i class="glyphicon glyphicon-stats"></i> Report</a></li> 
                            <li class='col-xs-4'><a href="#searchdata" data-toggle="tab"> <i class="glyphicon glyphicon-search"></i> View Data</a></li> 
                            <li class='col-xs-4'><a href="#cleardata" data-toggle="tab"> <i class="glyphicon glyphicon-search"></i> Clear synced data</a></li> 
                           <!-- <li><a href="#export" data-toggle="tab"> <i class="glyphicon glyphicon-cloud-upload"></i> Data Export</a></li>-->
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active well col-md-12" id="dataentry">
                                
                                
                              <!--Data entry code-->
                    <div class="panel panel-default" style='margin:-18px;'>
                       
                        <div class="panel-body" style="width:100%;">
                            <form class="form form-vertical" action="#" method="post" style='margin:-12px;' id="weeklydataform">
                                <table class='table table-hover table-bordered'  style="margin-left:  px;" >
                                <tr><th style="text-align:center"><b>Enter Outcome Data</b></th></tr>
                                
                                <tr>
                                <td><label class="col-xs-6"><font color="red"><b>*</b></font> Dispatch Year </label>
                                    <div class="controls col-xs-6">
                                        <select onchange="getmonth();setvldata();" title="Year when the stfs were dispatched" name="year" id="year" class="form-control col-xs-6" style="" >
                                            <option value='' >Choose year</option>
                                            <%
                                                
                                                Calendar cal= Calendar.getInstance();
                                                int curyear=cal.get(Calendar.YEAR);
                                                
                                            for(int a=2016;a<=curyear;a++){
                                             out.println("<option value='"+a+"'>"+a+"</option>");
                                                %>
                                            
                                            
                                            <%
                                            }
                                            
                                            %>
                                            
                                        </select>
                                     
                                    </div>
                                    </td>
                                    
                                    </tr>
                                    
                                    <tr>
                                    <td>
                                    <!----------------------------->
                                    
                                    <label class="col-xs-6"><font color="red"><b>*</b></font> Dispatch Month </label>
                                    
                                    <div class="controls col-xs-6">
                                       <select onchange='setvldata();' style="" title="Month when the stfs were dispatched"   name="month" id="month" class="form-control col-xs-6" >
                                            <option value=''>Choose  month</option>
                                            <option value="01">January</option>
                                            <option value="02">February</option>
                                            <option value="03">March</option>
                                            <option value="04">April</option>
                                            <option value="05">May</option>
                                            <option value="06">June</option>
                                            <option value="07">July</option>
                                            <option value="08">August</option>
                                            <option value="09">September</option>
                                            <option value="10">October</option>
                                            <option value="11">November</option>
                                            <option value="12">December</option>
                                           
                                        </select>
                                        <input type="hidden"  name ="rowid" id="rowid"  />
                                    </div>
                                    
                                    </td>
                                    
                                </tr>
                                 
                                        

                                <!------INDICATORS----->
                                 <!----------------------------------------------------------------------------------------->
                                                                 
                                <tr>
                                    <td>
                                        <!----------------------------->

                                        <label class="col-xs-12"><font color="red"><b>*</b></font> CCC NO </label>
                                      </td>

                                </tr><tr><td>
                                        <div class="controls col-xs-12">
                                            <select onchange='' style=""   name="cccno" id="cccno" class="form-control col-xs-6" >
                                                <option value=''>Select year and month</option>                                           

                                            </select>
                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                <!----------------------------------------------------------------------------------------->
                                  
                                   
                                          <!----------------------------------------------------------------------------------------->
                                                                 
                                <tr>
                                    <td>
                                        <!----------------------------->

                                        <label class="col-xs-6"><font color="red"><b>*</b></font>Sample type </label>

                                        <div class="controls col-xs-6">
                                            <select onchange='fichua();' style="" required="true"   name="sampletype" id="sampletype" class="form-control col-xs-6" >
                                                <option value=''>Choose  sample type</option>                                           
                                                <option value='Routine ART Monitoring'>Routine ART Monitoring</option>                                           
                                                <option value='Baseline infant'>Baseline infant</option>                                           
                                                <option value='Baseline PMTCT'>Baseline PMTCT</option>                                           
                                                <option value='Baseline at diagnosis'>Baseline at diagnosis</option>                                    
                                                <option value='Clinical failure'>Clinical failure</option>                                    
                                                <option value='Repeat after 3 month'>Repeat after 3 month</option>                                    
                                                <option value='Repeat after 1 month'>Repeat after 1 month</option>                                    



                                            </select>
                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                <!----------------------------------------------------------------------------------------->
                                
                                         
                             
                                
                                    <!----------------------------->
                                    <tr class="ficha"><td>

                                        <label class="col-xs-6">Patient contacted</label>

                                        <div class="controls col-xs-6">
                                            <select  style=""   name="patientcontacted" id="patientcontacted" class="form-control col-xs-6" >
                                                <option value=''>Patient contacted</option>                                           
                                                <option value='Yes'>Yes</option>                                           
                                                <option value='NO'>No</option>                                     

                                            </select>
                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                <!----------------------------------------------------------------------------------------->
                                
                                    <!----------------------------->
                                    <tr class="ficha"><td>

                                        <label class="col-xs-6">Adherence Sessions</label>

                                        <div class="controls col-xs-6">
                                            <select  style=""   name="adherencemonths" id="adherencemonths" class="form-control col-xs-6" >
                                                <option value=''>choose months</option>                                           
                                                <option value='0'>0 (Zero)</option>                                           
                                                <option value='1'>1 (One)</option>                                     
                                                <option value='2'>2 (Two)</option>                                     
                                                <option value='3'>3 (Three)</option>                                     

                                            </select>
                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                <!----------------------------------------------------------------------------------------->
                                
                                    <!----------------------------->
                                    <tr class="ficha"><td>

                                        <label class="col-xs-6">Repeat VL collection date</label>

                                        <div class="controls col-xs-6">
                                            <input type="text"  name ="secondsampledate" id="secondsampledate" data-date-end-date="0d" autocomplete="off" class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                <!----------------------------------------------------------------------------------------->
                                
                                
                                
                                    <!----------------------------->
                            <tr class="ficha"><td>

                                        <label class="col-xs-6">Reasons Repeat VL Not Collected</label>

                                        <div class="controls col-xs-6">
                                            <select onchange='reasonnoteligible();' style=""   name="noteligible" id="noteligible" class="form-control col-xs-6" >
                                                <option value=''>choose reason</option>                                           
                                                <option value='sample was baseline'>sample was baseline</option>                                           
                                                <option value='sample was a repeat, confirmation or failure'>sample was a repeat, confirmation or failure</option>                                           
                                                <option value='Other'>Other</option>                                     

                                            </select>
                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                <!----------------------------------------------------------------------------------------->
                                
                                  <!----------------------------->
                                    <tr class="ficha"><td>
<div id='otherdiv' style='display:none;'>
                                        <label class="col-xs-6"><font color="red"><b>*</b></font>Other Reasons Repeat VL Sample not Collected</label>

                                        <div class="controls col-xs-6">
                                            <input  style=""   name="noteligibleother" id="noteligibleother" class="form-control col-xs-6" >
                                                                                    

                                         
                                            
                                        </div>
</div>
                                    </td>

                                </tr>
                                
                                <!----------------------------------------------------------------------------------------->
                                
                                   <!----------------------------->
                                <tr class="ficha"><td>

                                        <label class="col-xs-6">Results of the Repeat VL</label>

                                        <div class="controls col-xs-6">
                                            <select  style=""   name="secondsampleresults" id="secondsampleresults" class="form-control col-xs-6" >
                                                <option value=''>choose result</option>   
                                                <option value='>1000'> >1000</option>                                           
                                                <option value='<1000'> <1000</option>                                           
                                                <option value='Awaiting results'>Awaiting results</option>                                           
                                                <option value='Sample Rejected'>Sample Rejected</option>                                          
                                                    
                                                  </select>                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                
                                   <!----------------------------->
                               <tr class="ficha"><td>

                                        <label class="col-xs-6">Action taken</label>

                                        <div class="controls col-xs-6">
                                            <select  style="" onchange="ficha1();ficha3();"  name="actiontaken" id="actiontaken" class="form-control col-xs-6" >
                                                <option value=''>choose action</option> 
                                                <option value='Retain Regimen'>Retain Regimen</option>                                           
                                                <option value='Single drug switch'>Single drug switch</option>                                           
                                                <option value='Change to 2nd line'>Change to 2nd line</option>                                           
                                                <option value='Change to 3rd line'>Change to 3rd line</option>                                           
                                                 
                                                
  
                                                  </select>                                            
                                        </div>

                                    </td>
                                </tr>
                                   <!----------------------------->
                                   <!----------------------------->
                                    <tr class="ficha"><td>

                                        <label class="col-xs-6">Other Outcomes</label>

                                        <div class="controls col-xs-6">
                                            <select  style=""   name="otheroutcomes" id="otheroutcomes" class="form-control col-xs-6" >
                                                <option value=''>choose outcome</option>                                           
                                               <option value='Collect new sample'>Collect new sample</option>                                           
                                                <option value='Patient Died'>Patient Died</option>                                           
                                                <option value='LTFU'>LTFU</option>
                                                <option value='Transfer Out'>Transfer Out</option>  
                                            </select>                                            
                                        </div>

                                    </td>
                                </tr>
                                   <!----------------------------->
                                    <tr class="ficha"><td>

                                        <label class="col-xs-6">First Regimen</label>

                                        <div class="controls col-xs-6">
                                            <select  style=""   name="firstregimen" id="firstregimen" class="form-control col-xs-6" >
                                                <option value=''>choose regimen</option>                                           
                                                <option value='ABC/3TC/NVP'>ABC/3TC/NVP</option>                                           
                                                <option value='ABC/3TC/EFV'>ABC/3TC/EFV</option>                                           
                                                <option value='ABC/3TC/LPV'>ABC/3TC/LPV</option>                                           
                                                <option value='ABC/3TC/ATVr'>ABC/3TC/ATVr</option>                                           
                                                <option value='AZT/3TC/NVP'>AZT/3TC/NVP</option>                                           
                                                <option value='AZT/3TC/EFV'>AZT/3TC/EFV</option>                                           
                                                <option value='AZT/3TC/LPVr'>AZT/3TC/LPVr</option>                                           
                                                <option value='AZT/3TC/ATVr'>AZT/3TC/ATVr</option>                                           
                                                <option value='TDF/3TC/NVP'>TDF/3TC/NVP</option>                                           
                                                <option value='TDF/3TC/LPVr'>TDF/3TC/LPVr</option>                                           
                                                <option value='TDF/3TC/ATVr'>TDF/3TC/ATVr</option> 
                                                
  
                                                  </select>                                            
                                        </div>

                                    </td>
                                </tr>
                                   <!----------------------------->
                                    <tr class="ficha ficha1"><td>

                                        <label class="col-xs-6"></font>Second Regimen</label>

                                        <div class="controls col-xs-6">
                                            <select  style=""   name="secondregimen" id="secondregimen" class="form-control col-xs-6" >
                                                <option value=''>choose regimen</option>                                           
                                                <option value='ABC/3TC/NVP'>ABC/3TC/NVP</option>                                           
                                                <option value='ABC/3TC/EFV'>ABC/3TC/EFV</option>                                           
                                                <option value='ABC/3TC/LPV'>ABC/3TC/LPV</option>                                           
                                                <option value='ABC/3TC/ATVr'>ABC/3TC/ATVr</option>                                           
                                                <option value='AZT/3TC/NVP'>AZT/3TC/NVP</option>                                           
                                                <option value='AZT/3TC/EFV'>AZT/3TC/EFV</option>                                           
                                                <option value='AZT/3TC/LPVr'>AZT/3TC/LPVr</option>                                           
                                                <option value='AZT/3TC/ATVr'>AZT/3TC/ATVr</option>                                           
                                                <option value='TDF/3TC/NVP'>TDF/3TC/NVP</option>                                           
                                                <option value='TDF/3TC/LPVr'>TDF/3TC/LPVr</option>                                           
                                                <option value='TDF/3TC/ATVr'>TDF/3TC/ATVr</option> 
                                                <option value='other'>Other Regimens(Specify in Comments)
</option> 
                                                
  
                                                  </select>                                            
                                        </div>

                                    </td>
                                </tr>
                                
                                <tr class="ficha ficha3"><td>

                                        <label class="col-xs-6"></font>Third Regimen</label>

                                        <div class="controls col-xs-6">
                                            <select  style=""   name="thirdregimen" id="thirdregimen" class="form-control col-xs-6" >
                                                
                                               
</option> 
                                                
  
                                                  </select>                                            
                                        </div>

                                    </td>
                                </tr>
                                
                                <tr class="ficha ficha1"><td>

                                        <label class="col-xs-6">Date of second Regimen</label>

                                        <div class="controls col-xs-6">
                                            <input type="text"  name ="secondregdate" id="secondregdate" data-date-end-date="0d" autocomplete="off" class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                            
                                        </div>

                                    </td>

                                </tr>
                                
                                 <!----------------------------->
                                    <tr class="ficha"><td>

                                        <label class="col-xs-6"><font color="red"><b></b></font>comments</label>

                                        <div class="controls col-xs-6">
                                            <textarea style=""   name="comments" id="comments" class="form-control col-xs-6" ></textarea>                                            
                                        </div>

                                    </td>
                                </tr>
                                
                                         </table>
                                <table class="table table-striped table-bordered">
                                       <tr><td colspan="3" class="col-xs-12">               
                                <div class="control-group col-xs-12">
                                        <div class="alert-info">Note: Data is saved at the browser. Please ensure you connect to the internet for exporting to the server</div>
                                   <br/>
                                    <div class="controls">
                                        <button type="submit" id='savebutton' onclick="validateweeklydata();" style="margin-left: 0%;" class="btn-lg btn-success active">
                                            SAVE
                                        </button>
                                        <div class='alert alert-success' id='message' style='display:none;'><button type='button' class='close' data-dismiss='alert'>×</button><span id='actiondone'></span></div>
                                     </div>
                                   
                                    <div class="controls">
                                        <button type="submit" id='updatebutton' onclick="updateweeklydata();" style="margin-left: 0%;display:none;" class="btn-lg btn-info active">
                                            UPDATE
                                        </button>
                                    
                                        
                                    </div>
                                    
                                </div>
                                        </td></tr>
                                        
                                </table>
                            </form>
                        </div>
                        <!--/panel content-->
                    </div>
                    <!--/panel-->

                              
                              <!--Data entry code-->
                            
                            </div>
                            <div class="tab-pane well" id="reports">
                                
                                
                               <!--Dashboard code-->
                            
                               
                               
                               
                                                   <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Dashboard</h4></div>
                        <div class="panel-body">
                            <form id="reportsform">
<table class='table table-striped table-bordered' id="reportstable" >
    
                            </table>
                            </form>
                        </div>
                        <!--/panel-body-->
                    </div>
                    <!--/panel-->

                               
                              
                              <!--Reports entry code-->
                            
                            
                            </div>
                            <div class="tab-pane well" id="export">
                                
                                
                               <!--- Data export---->
                            </div>
                            
                            <div class="tab-pane well" id="searchdata">
                                 <button id="btnDeleteRow" value="cancel">Delete selected Row</button>
                                <div id="searchtablediv">
                                  
                                </div>    
                               <!--- Data export---->
                            </div>
                            <div class="tab-pane well" id="cleardata">
                                 
                                <div >
                                    
                                 <h3>Clear synced CCC numbers</h3>
            <p>To clear the ccc numbers and request for new ones, click the RESET button below  </p>
            <button onclick=" resetcccdb();" id="resetdbbtn1" style="margin-left: 30%;" class="btn-lg btn-info active">
                                            Reset
                                </button> 
                                </div>    
                               <!--- Data export---->
                            </div>
                            
                            
                            </div>
                        </div>

                    </div>
                    <!--/tabs-->

                </div>
                <!--/col-->
               
                <!--/col-span-6-->

            </div>
            <!--/row-->

           


            
        </div>
        <!--/col-span-9-->
    </div>

<!-- /Main -->

<footer class="text-center"> &copy; Afya Nyota Ya Bonde | USAID </footer>

<div class="modal" id="addWidgetModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" id="refr1" aria-hidden="true">×</button>
                <h4 class="modal-title">Data Export</h4>
            </div>
            <div class="modal-body">
                <form id="exportdataform">
                   
              <button class=" btn-lg btn-success" style="text-align: center;" id="exportbutton" onclick="importdata();"> Export Data</button>
              
              
              <button class=" btn-lg btn-info" style="display:none;text-align: center;"  id="exportmsg" > Exporting Data..</button>
              <p id="exportresponse"> </p>
              </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn" id="refr">Close</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>
<!-- /.modal -->








<div class="modal" id="accesscodemodal" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" >
                <button type="button" id="savecodebtn" class="close" data-dismiss="modal" aria-hidden="true">.</button>
                <h4 class="modal-title">Account Details</h4>
                <label style="color:red;" id="useraccountvalidation"></label>
            </div>
            <div class="modal-body">
                <form action="#" class="userform" method="post">
                 <div class="control-group">
                                    <label><font color="red"><b>*</b></font>  Enter STF access code</label>
                                    <div class="controls">
                                        <input type="password" size="14" placeholder=""   required name="accesscode" id="accesscode" class="form-control" >
                                    </div>
                                </div> 
                    
                       
                    
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <label onclick=" updateaccount();"    style="margin-left: 50%;"  class="btn-lg btn-success active">
                                            Login
                                        </label>
                                    </div>
                                </div>   
                    
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">.</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>










<div class="modal" id="datasavedmodal" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" >
                <button type="button"  class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title" id="datasavedmsg"> <font color="green"><b> Data saved successfully!</b></font></h4>
                <label style="color:red;" ></label>
            </div>
            <div class="modal-body">
                <form action="#"  method="post">
                 <div class="control-group">
                                    <label><font color="green"><b> </b></font> </label>
                                    
                                    <div class="controls">
                                       
                                    </div>
                                </div> 
                    
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <label     style="margin-left: 50%;" data-dismiss="modal" class="btn-lg btn-success active">
                                            x
                                        </label>
                                    </div>
                                </div>   
                    
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">close</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>

<!------------------------------------>



<div class="modal" id="userdetails" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" >
                <button type="button" id="saveuserbtn" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">User Details</h4>
                <label style="color:red;" id="uservalidation"></label>
            </div>
            <div class="modal-body">
                <form action="#" class="userform" method="post">
                 <div class="control-group">
                                    <label><font color="red"><b>*</b></font>  Your Email</label>
                                    <div class="controls">
                                        <input type="text" size="14" placeholder="eg MJohn@fhi360.org"   required name="username" id="username" class="form-control" >
                                    </div>
                                </div> 
                    
                       <div class="control-group">
                                    <label> <font color="red"><b>*</b></font>  Facility Supporting</label>
                                    <div class="controls">
                                        <select onclick="showfacilities();"  onchange="" multiple=""  name="facilityname" id="facilityname" class="form-control" >
                                            <option value="refresh">loading facilities..</option>
                                           
                                        </select>
                                    </div>
                                </div>
                    <div class="control-group">
                                    <label><font color="red"><b>*</b></font>  supervisor(s) Email</label>
                                    <div class="controls">
                                        <input title="Enter comma separated list of supervisor/To's/M&E officer's email.They will be notified when you export your data." type="text" size="34" placeholder="eg MJohn@fhi360.org,JNdoe@fhi360"   required name="supervisormail" id="supervisormail" class="form-control" >
                                    </div>
                                </div> 
                    
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <label onclick=" updateuser();" data-dismiss="modal"   style="margin-left: 50%;"  class="btn-lg btn-success active">
                                            SAVE
                                        </label>
                                    </div>
                                </div>   
                    
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Close</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>



<div class="modal" id="excelreport">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button"  class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Generate Excel Report <span id="needsinternet"></span></h4>
            </div>
            <div class="modal-body">
                <form  id="excelreportsfom" method="post">
                                <div class="control-group">
                                    <label><font color="red"><b>*</b></font>Report Start Date</label>
                                    <div class="controls">
                                       <input type="text"  name ="startdaterpt" id="startdaterpt"  class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                    </div>
                                </div> 
                    
                    
                  <div class="control-group">
                                    <label><font color="red"><b>*</b></font>Report End Date</label>
                                    <div class="controls">
                                       <input type="text"  name ="enddaterpt" id="enddaterpt"  class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                    </div>
                                </div> 
                    
                      
                    
                                <div class="control-group" >
                                    <label>County</label>
                                    <div class="controls">
                                        <select  name="rpt_county" id="rpt_county" style="width:100%;" onchange="loadsubcounty();" class="form-control">
                                            <option value="">Select County (optional)</option>
                                             <option value="Baringo">Baringo</option>
                                             <option value="Kajiado">Kajiado</option>
                                             <option value="Laikipia">Laikipia</option>
                                             <option value="Nakuru">Nakuru</option>
                                             <option value="Narok">Narok</option>                                           
                                           
                                        </select>
                                    </div>
                                </div>
                    
                    <div class="control-group" >
                                    <label>Sub-County</label>
                                    <div class="controls">
                                        <select  name="rpt_subcounty" id="rpt_subcounty" style="width:100%;" class="form-control">
                                            <option value="">Select County</option>
                                                                                       
                                           
                                        </select>
                                    </div>
                                </div>
                    
                   <!-- <div class="control-group" >
                                    <label>Facility </label>
                                    <div class="controls">
                                        <select  name="rpt_facility" id="rpt_facility" style="width:100%;" class="form-control">
                                            <option>Select Facility</option>
                                             
                                            
                                           
                                        </select>
                                    </div>
                                </div> -->
                    
                    
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <button onclick=" getreport();" id="excelreportbtn"   style="margin-left: 30%;"  class="btn-lg btn-info active">
                                            Generate
                                        </button>
                                        
                                        <img src='images/ajax_loader.gif' alt='loading' style="display:none; margin-left:30% ;" class='loading'/>
                                        
                                    </div>
                                </div>   
                    
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Close</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>




<div class="modal" id="help">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Help</h4>
            </div>
            <div class="modal-body">
                <p>This  application is created for aiding users in collecting data for the STF. One is expected to update outcome details .</p>
                <h3>Indicators</h3>
                <p>The specific indicators that one should enter data for are;</p>
                <ul>




                </ul>
             <h3>Loading CCC Number</h3>
                 <p> The first time of installing/running the application,CCC numbers are downloaded and saved on the host device (mobile phone or computer browser). This requires internet connectivity. After the download, sites should appear on the facility drop down list.</p>
                 <h3>Data Export</h3>
                <p>Data is saved on your  device and should be shared to a server for analysis </p>
                <p>If there is Any un-exported that has  been saved offline, the user will be reminded to create an export by seeing yellow text showing number of sites whose data has not been exported .</p>
           
            <h3>Reset CCC records</h3>
            <p>To clear existing new ccc numbers and request for new ones, click the RESET button  </p>
            <button onclick=" resetcccdb();" id="resetdbbtn" style="margin-left: 30%;" class="btn-lg btn-info active">
                                            Reset
                                        </button>
            
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Close</a>
               
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>

<div class="modal" id="summarybtn">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Reporting rates (realtime)</h4>
            </div>
            <div class="modal-body">
                <p><b>This  is a summary of the reporting rates for your selected sites.</b></p>
                <table class="table table-hover table-bordered" >
             <tr> <td>STFs Uploaded in the database:
             </td><td><b><p id="uploadedstfs">_</p></b></td></tr>
                
             <tr><td>STFs synced to your device:
             </td><td><b><p id="syncedstfs">_</p></b></td></tr>
                 
             <tr> <td>STFs Updated:</h3>
             </td><td><b><p id="updatedstfs">_</p></b></td></tr>
           
             <tr> <td>STFs Not Updated
             </td><td><b><p id="notupdatedstfs">_</p></b></td></tr>
             
               </table>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Close</a>
               
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>




	<!-- script references -->
        <script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/scripts.js"></script>
                <script src="js/bootstrap-datepicker.min.js"></script>
                <script src="js/select2.min.js"></script>
                 <!--<script src="js/pouchdb-4.0.1.js"></script>-->
                 <script src="js/pouchdb.min.js"></script>
                 
                  <script type="text/javascript" src="js/jquery.fileDownload.js"></script>
                 <script type="text/javascript" src="js/datatables.min.js"></script>
<!--                   <script type="text/javascript" charset="utf-8" src="cordova-1.5.0.js"></script>  -->
                 <script>
                    
                 
    
   var hostname="";
   //var hostname="https://hsdsacluster2.fhi360.org:8443/STF/";
 //var hostname="http://localhost";

     // todayHighlight: true, daysOfWeekDisabled: "0,6",clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
                 </script>

                 <script type="text/javascript">
  $(document).ready(function(){
      
          
                         $('.dates').datepicker({
                             todayHighlight: true, clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
     });
      
  $('facilityname').select2();  
  $('#rowid').val("");  
  
  });   
                 </script>


<script>
   
  var user="aphiaplus";
  var myno=0;
//load data from the cloud server 
//   
//              $.ajax({
//                        // url:hostname+':8080/STF/showfacils',                            
//                         url:'sites.json',                            
//                    type:'post',  
//                    dataType: 'json',  
//                    success: function(data) {
//                        $('#exportbutton').show();
//                        $("#exportresponse").html("");
//                   if(data!=='aphiaplus_undefined'){
//                 //alert(data[0].facility_name);    
//                     for(var i=0;i<data.length;i++){
//                         
//                      
//                         //now add the facilities into a table
//                   if(addfacilities(data[i].mflcode,data[i].county,data[i].subcounty,data[i].facility_name,data[i].longitude,data[i].latitude,data[i].sitetype)===data.length-1){
//                          //if not selected currently
//                          
//                          myno=0;
//                          if($("#facilityname").val()==='' || $("#facilityname").val()==='refresh'){showfacils();
//                          
//                   
//                    }
//                          
//                      }
//                      
//                       updatefacilities(data[i].mflcode,data[i].county,data[i].subcounty,data[i].facility_name,data[i].longitude,data[i].latitude,data[i].sitetype);
//               
//                     }
//                       
//                   }
//        
//                    },
//                    error: function(XMLHttpRequest, textStatus, errorThrown) {
//        //alert('offline');
//	$('#exportbutton').hide();
//       // alert("failed");
//        $("#exportresponse").html("<b><font color='orange'>Connect to internet to export data </b><br/>");
//    }
//                        
//                         });
   
    
    
   
   function getFacilitiesJson(){
       
     
       
        var facilities="<option value=''>Select Facility</option>";
        
              $.ajax({
                         url:'sites.json',                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                        
                        $('#exportbutton').show();
                        $("#exportresponse").html("");
                     for(var i=0;i<data.length;i++){
                         
if((data[i].pmtct===1 || data[i].art===1) && data[i].isactive==='Yes'  ){
    //think of how to get the selected value.
    
                  facilities+="<option value='"+data[i].mflcode+"_"+data[i].facility_name+"'>"+data[i].facility_name+"</option>"; 
           
                     }
              
              
              
             
                        
                     }
                     //alert(facilities);
                      $("#facilityname").html(facilities);
                   $(document).ready(function() {
            //$('#lyricstable').DataTable();
              $('#facilityname').select2(); 
             
                                 } );
                     
                      }
                  
        ,
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
        //alert('offline');
	$('#exportbutton').hide();
       // alert("failed");
        $("#exportresponse").html("<b><font color='orange'>Connect to internet to export data </b><br/>");
    }
        });
   
   }
   
   getFacilitiesJson();
    
      
    
    //PouchDB.debug.enable('*');
    //PouchDB.debug.disable();
    
    var accountdb = new PouchDB('stfaccount_stf');
var remoteCouch = false;
var useraccountdetails;

function addaccount(isauthorized) {
   useraccountdetails = {
        _id: 'aphiaplus', //this is static since we cant have two users using the same phone
	isauthorized:isauthorized,        
        completed: false
  };
  accountdb.put(useraccountdetails, function callback(err, result) {
    if (!err) {
      console.log('account details added succesfully');
    }
    
    setTimeout(delayedrefresh,1500);
  });
}

  function updateaccount(){
   //alert("save called");   
   var enteredcode=$("#accesscode").val();   
   
   if(enteredcode===''){$("#useraccountvalidation").html("Enter access code");   }
   else 
   {
     //run json to determine status  
     
     //if ok is returned , then save account. else .. show error
      $.ajax({
                         url:hostname+'validateAccess?kc='+enteredcode,                            
                    type:'post',  
                    dataType: 'html',  
                    success: function(data) {
             
                 
                 var dta=parseInt(data);
                 
          if(dta===1){
    
    $("#useraccountvalidation").html("");
  
    
    addaccount('ok'); 
    updatetaccesscode('ok');
                        } else {
                            
                         $("#useraccountvalidation").html("Wrong access code!. Try again");   
                          
                        }
     
                    },
                
               error: function(XMLHttpRequest, textStatus, errorThrown) {
       // alert(errorThrown);
$("#useraccountvalidation").html("No internet connection. Connect to internet and try again."); 
    }
            
            });
       
   }
   
  } 
function updatetaccesscode(authentication){


	
	accountdb.get("aphiaplus").then(function (doc) {
            //
            if(authentication!==''){
doc.isauthorized=authentication;
return accountdb.put(doc); //continue from here
            }         
 
});
	}

    
    var userdb = new PouchDB('userdetails_stf');

var userdetails;

//receive the artist, song title and lyrics text
function adduser(username,hosi,supervisormail) {
   userdetails = {
        _id: 'aphiaplus', //this is static since we cant have two users using the same phone
	username:username,
        facility:hosi,
        supervisormail:supervisormail,
        completed: false
  };
  userdb.put(userdetails, function callback(err, result) {
    if (!err) {
      
    }
    console.log('details added succesfully');
      getvldata();
    
   // setTimeout(delayedrefresh,1200);
  });
}	


  function updateuser(){
   //alert("save called");   
   var usern=$("#username").val();   
   var hosp=$("#facilityname").val();
   var supmail=$("#supervisormail").val();
   if(usern===''){$("#uservalidation").html("Enter Username");   }
   else if(hosp==='' || hosp==='refresh'){$("#uservalidation").html("Enter facility supporting");  }
   else 
   {
       
    adduser(usern,hosp,supmail); 
   showuser('aphiaplus',usern,hosp,supmail);   
       
   }
   
  }  
    
   function showuser(aphiaplus,updateduser,updatedfacil,supervisormail){


	var counties=["Baringo","Kajiado","Laikipia","Nakuru","Narok","Samburu","Turkana"];
	userdb.get("aphiaplus").then(function (doc) {
            //
            if(updateduser!==''){
doc.username=updateduser;  
doc.facility=updatedfacil;  
doc.supervisormail=supervisormail;  

return userdb.put(doc); //continue from here
            }         
            if(doc.username!==''){
 $("#username").val(doc.username);
 $("#usernamelabel").html(" Hi "+doc.username+ " ("+doc.facility+")");
  $("#supervisormail").val(doc.supervisormail);
 user=doc.username;
           
            var allsts=doc.facility+"";
            
            var facs=allsts.split(",");
 //$("#facilityname").val(doc.facility);
 var i=0;
 for(i=0;i<facs.length;i++){
 $("#facilityname option[value='"+facs[i]+"']").prop('selected', true);
 }
  $('#facilityname').select2(); 
   }
 
});
	}
     showuser('aphiaplus','','','');//This is for displaying the already selected options
   function loaduser(){
   //alert("save called");   
   var user=$("#username").val();   
   var fcl=$("#facilityname").val();   
   adduser(user,fcl);   
  }  
      
    
//This is a document to save all facilities for offline use 
var db = new PouchDB('facilities_stf');
var remoteCouch = false;
var receiveddata;

//add facility details here
function addfacilities(mflcode,county,subcounty,facility,longitude,latitude,sitetype) {
   receiveddata = {
        _id: mflcode,
	facility:facility,
        county:county,
	subcounty:subcounty,
        latitude:latitude,
        longitude:longitude,
        sitetype:sitetype,
        completed: false
  };
  db.put(receiveddata, function callback(err, result) {
    if (!err) {
      console.log('stl facilities added succesfully');
    }
  });
  myno++;
  return myno;
}	

function updatefacilities(mflcode,county,subcounty,facility,longitude,latitude,sitetype) {
 
 db.get(mflcode).then(function (doc) {
        
  //doc.age = 4;
 
   if(mflcode!=='null' && mflcode!=='' ){
    doc._id=mflcode;
    doc.facility=facility;
        doc.county=county;
	doc.subcounty=subcounty;
        doc.latitude=latitude;
        doc.longitude=longitude;
        doc.sitetype=sitetype;
   //alert('called');
  // put them back
  return db.put(doc);
   }
});
 
 
}


//a function to load facilities data from the 

//comented fro now
function showfacils(){
    
    var cnt=0;
   
    
    var facilities="<option value=''>Select Facility</option>";
    
  db.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 
      cnt++;
	   //console.log(doc);
	   for(a=0;a<doc.total_rows;a++){
	   var dat={};
	   dat=doc.rows[a];
	      //console.log(dat.doc.title);
              //how to reference each column 
              
              //dat.doc._id
		  var num=parseInt(a)+1;
		 facilities+="<option value='"+dat.doc._id+"_"+dat.doc.facility+"'>"+dat.doc.facility+"</option>";
          	    } //end of for loop
	 
           $("#facilityname").html(facilities); 	  
		 
			
			
	    $(document).ready(function() {
            //$('#lyricstable').DataTable();
              $('#facilityname').select2(); 
             
                                 } );
			
  }).catch(function (err){console.log(err)});
 
        

        
}//



//showfacils from local db
//showfacils();

//========================SAVE TARGETS============================
//========================SAVE TARGETS============================

var vldb = new PouchDB('vldata');
var remoteCouch = false;
var receivedvldata;

//{,"cccno":"15311003199","":"Narok North","datecollected":"2015-11-09","mflcode":"15311"}

function addvldata(cccno,datecollected,mflcode,facility_name,county,subcounty,isupdated) 
{
   receivedvldata = {
_id: cccno+"_"+datecollected,	
mflcode:mflcode,
facility_name:facility_name,
county:county,
cccno:cccno,
subcounty:subcounty,
datecollected:datecollected,
isupdated:isupdated,
completed: false
  };
  vldb.put(receivedvldata, function callback(err, result) {
    if (!err) {
      //console.log('targets added succesfully');
    }
  });
}

function updatevldata(cccno,datecollected,mflcode,facility_name,county,subcounty,isupdated){
  //console.log(id);
   vldb.get(cccno+"_"+datecollected).then(function (doc) {
        
  //doc.age = 4;
 
   if(cccno!=='null' && cccno!=='' ){
doc.mflcode=mflcode;
doc.cccno=cccno;
doc.datecollected=datecollected;
doc.facility_name=facility_name;
doc.county=county;
doc.subcounty=subcounty;
//doc.isupdated=isupdated;
        
   //alert('called');
  // put them back
  return vldb.put(doc);
                                         }
});      
        
    
}

function updatevlstatus(cccno,datecollected,isupdated){
  console.log(cccno+","+datecollected+","+isupdated);
   vldb.get(cccno+"_"+datecollected).then(function (doc) {
        
  //doc.age = 4;
 
   if(cccno!=='null' && cccno!=='' ){

doc.isupdated=isupdated;
        
  
  return vldb.put(doc);
                                      }
});      
        
    
}


function getvldata(){
    
     userdb.get("aphiaplus").then(function (doc) {
        
 var vldat="<option value='' value=''>Select cccno</option>";
 
var curfacil=doc.facility+"";

var selectfacils=$("#facilityname").val()+"";

var siteszote=curfacil.split(",");

var hospitalizote="";
var lp=0;
for(lp=0;lp<siteszote.length;lp++){
    
   hospitalizote +="'"+siteszote[lp].split("_")[0]+"'";
   if(siteszote.length>1 && lp<(parseInt(siteszote.length)-1)){ hospitalizote +=",";  }
    
}

//var selectedItems= $('#facilityname option:selected');
console.log(" facility kwa select ni "+hospitalizote);

//call function for displaying update status

reportingRates(hospitalizote);
var facilis=curfacil;
  
if(facilis!==selectfacils && selectfacils!=='' && selectfacils!=='null'){
    
    facilis=selectfacils;
}

    if(curfacil===null || curfacil==='null'){
        
       $('#adduserbutton').click();   
        
    }
    else {
   
              $.ajax({
                    url:hostname+'getvldata?facility='+facilis,                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                   


  for(var i=0;i<data.length;i++){
     //console.log(curfacil+"_vs_"+data[i].mflcode+"="+curfacil.indexOf(data[i].mflcode)); 
      if(facilis.indexOf(data[i].mflcode)>=0)
      {
          var cccupdated="";
               if( parseInt(data[i].updatestatus)> 0 ){ cccupdated="(updated) ";  }
              
                      vldat+="<option title='' data-collectiondate='"+data[i].datecollected+"' value='"+data[i].cccno+"'>"+cccupdated+""+data[i].cccno+"</option>";
                 
                        addvldata(data[i].cccno,data[i].datecollected,data[i].mflcode,data[i].facility_name,data[i].county,data[i].subcounty,data[i].updatestatus);
                        updatevldata(data[i].cccno,data[i].datecollected,data[i].mflcode,data[i].facility_name,data[i].county,data[i].subcounty,data[i].updatestatus);
                       // console.log(" insert cccno "+data[i].cccno);
                        
            }    
        }


//console.log(" selected cccno kwa sasa ni :_"+$("#cccno").val()+"_");

if($("#cccno").val()===''){
   // console.log(" _ "+vldat);
    //if there is no currently selected facility ccc number
//showvldetailed(curfacil);
 $("#cccno").html(vldat); 
 
  $(document).ready(function() {
            //$('#lyricstable').DataTable();
              $('#cccno').select2();
              
                                 } );
}
else {
    
    
    
}
                                    
 }
                        
                         });
                     }//end of else
                         
                         }).catch(function (err){
    console.log(err);
});//end of db
    
    
}

getvldata();


//=========================SAVE WEEKLY DATA========================

 
//This is a document to save all tables 
var outcomedatadb = new PouchDB('outcomedata',{auto_compaction: true});
var remoteCouch = false;
var outcomedata;

//receive the artist, song title and lyrics text
function insertautcomedata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) {
   

         outcomedata = {
        _id: id, //made of startdate_enddate_facilitymfl_frequency //frequency could be _annual or _weekly
        datecollected:datecollected,//datecollected is date of dipatch and is not exported
	year:year,
        month:month,
	cccnumber:cccnumber,      
        sampletype:sampletype,
patientcontacted:patientcontacted,
adherencemonths:adherencemonths,
secondsampledate:secondsampledate,
noteligible:noteligible,
noteligibleother:noteligibleother,
secondsampleresults:secondsampleresults,
actiontaken:actiontaken,
firstregimen:firstregimen,
secondregimen:secondregimen,
comments:comments,
secondregdate:secondregdate,
        thirdregimen:thirdregimen,
        otheroutcomes:otheroutcomes,
        timestamp:tarehe(),
        user:user,
        syncstatus:syncstatus,        
        completed: false
  };
  outcomedatadb.put(outcomedata, function callback(err, result) {
    if (!err) {
      console.log('outcome data added succesfully');
     
      
    }
  });
}	
var outcomedatadb_longitudinal = new PouchDB('outcomedata_logitudinal',{auto_compaction: true});

var outcomedata_long;

//receive the artist, song title and lyrics text
function insertlongitudinaldata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) {
   

        outcomedata_long = {
        _id: id+"_"+tarehe(), //made of startdate_enddate_facilitymfl_frequency //frequency could be _annual or _weekly
        datecollected:datecollected,//datecollected is date of dipatch and is not exported
	year:year,
        month:month,
	cccnumber:cccnumber,      
        sampletype:sampletype,
patientcontacted:patientcontacted,
adherencemonths:adherencemonths,
secondsampledate:secondsampledate,
noteligible:noteligible,
noteligibleother:noteligibleother,
secondsampleresults:secondsampleresults,
actiontaken:actiontaken,
firstregimen:firstregimen,
secondregimen:secondregimen,
comments:comments,
secondregdate:secondregdate,
        thirdregimen:thirdregimen,
        otheroutcomes:otheroutcomes,
        timestamp:tarehe(),
        user:user,
        syncstatus:syncstatus,        
        completed: false
  };
  outcomedatadb_longitudinal.put(outcomedata_long, function callback(err, result) {
    if (!err) {
      console.log('outcome data logitudinal added succesfully');
     
      
    }
    else if (err)  {
        
        console.log(" an error caused an update "+err);
        saveweeklyupdates_logitudinal(id+"_"+tarehe(),datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate);
    }
  });
}	



//prepare form data

//===================================================INSERT WEEKLY DATA===================================

  var year=null;
  

 var month=null;   
 var cccnumber=null;
    
    
var sampletype=null;
var patientcontacted=null;
var adherencemonths=null;

var secondsampledate=null;
var noteligible=null;
var noteligibleother=null;
var secondsampleresults=null;

var actiontaken=null;
var firstregimen=null;
var secondregimen=null;
var thirdregimen=null;
var otheroutcomes=null;

var comments=null;
var secondregdate=null;
   
   
   //added 201605 
    var progressbarstoskip=[];
     var allindicatorsarray=["year","month","cccnno","sampletype","patientcontacted","adherencemonths","secondsampledate","noteligible","noteligibleother","secondsampleresults","actiontaken","firstregimen","secondregimen","thirdregimen","otheroutcomes","comments","secondregdate"];
     var allnontargetindicatorsarray=[];
     var allcommentsarray=[];
     var allprogressbar_hiddentext_array=[];
     var hidetargetsui='yes';
function createdynamicinputs(){
    
    
     $(document).ready(function(){
         
       
   
//         $.getJSON("indicators1.json",function(result){
//             var table="";
//             var row1="";
//             var row2="";
//             var count=1;
//             for(a=0;a< result.length; a++){
//                 
//             var indicatorname=result[a].IndicatorName;    
//             var fullindicator=result[a].FullIndicator;    
//             var indicatorid=result[a].IndicatorID;
//             var label=result[a].Age;
//             var level=result[a].Level;
//             var inputtype=result[a].datainputtype;
//             var minimum=result[a].Min;
//             var maximum=result[a].Max;
//             var onblur="";
//             var onkey_up="autocalculate('"+indicatorid+"');";
//             if(result[a].onblur!==null){
//                 onblur="autocalculate('"+indicatorid+"');"+result[a].onblur;
//             }
//             var onkeypress=result[a].onkeypress;
//             var tdclass=result[a].tdclass;
//             var isrequired=result[a].Required;
//             var isnewrow=result[a].newrow;
//             var readonlyvar=result[a].readonly;
//             var isreadonly="";
//             allindicatorsarray.push(indicatorid);
//             
//             if(indicatorid.indexOf("target")===-1){
//                 
//              allnontargetindicatorsarray.push(indicatorid);   
//             }
//              var tabindex="";
//             if(readonlyvar==="TRUE"){
//                 
//               isreadonly="readonly";
//               tabindex=" tabindex='-1' style='background-color:#b1b1cd;' ";
//             }
//             var colspan=result[a].colspan;
//            
//             if(label==='Total' && tdclass==='col-xs-4' ){  }
//             if(isnewrow===1)
//             {
//                 //dont show targets 
//               if(hidetargetsui==='yes' && readonlyvar==="TRUE"  ){
//                 row1="<tr class='hiderows' style='display:none;'> <td class='col-xs-12' colspan='3'> <div class='control-group'> <label  > <font color='red'> <b> * </b> </font> <span class='badge'> "+count+" </span>     "+indicatorname+"    <span class='badge' title='Indicator' data-toggle='popover' data-trigger='hover' data-content='"+fullindicator+"'>?</span> </label>  </div> </td> </tr>";
//                 count++;
//                 row2+=row1;   
//                   
//               }
//               else {
//                 row1="<tr> <td class='col-xs-12' colspan='3'> <div class='control-group'> <label  > <font color='red'> <b> * </b> </font> <span class='badge'> "+count+" </span>     "+indicatorname+"    <span class='badge' title='Indicator' data-toggle='popover' data-trigger='hover' data-content='"+fullindicator+"'>?</span> </label>  </div> </td> </tr>";
//                 count++;
//                 row2+=row1;
//             }
//             }
//             else{
//                 
//                 row1="";
//             }
//              if(isnewrow===1 && count===2)
//             {
//               if(hidetargetsui==='yes' && readonlyvar==="TRUE"  ){
//                     row2+=" <tr class='hiderows' style='display:none;'> ";   
//               }   
//               else {
//                   
//                     row2+=" <tr> ";   
//                   
//               }
//                 
//        
//              }
//              else  if(isnewrow===1 && count > 2 && count<result.length){
//                  
//                   if(hidetargetsui==='yes' && readonlyvar==="TRUE"  ){
//                       
//                         row2+=" </tr> <tr class='hiderows' style='display:none;'> "; 
//                         
//                       } else {
//                           
//                        row2+=" </tr> <tr> ";      
//                   }
//                  
//               
//                  
//              }
//              
//              
//              row2+="<td class='"+tdclass+"' colspan='"+colspan+"' > <div class='control-group' > <label> "+label+" </label> <div class='controls'> <input onkeypress='return numbers(event);'  "+isreadonly+"  "+tabindex+" onblur=\""+onblur+"\"  onfocus='this.value = this.value;' type='text' min ='"+minimum+"' max='"+maximum+"' maxlength='7' data-"+indicatorid+"='0' data-previous_"+indicatorid+"='0'  name='"+indicatorid+"' id='"+indicatorid+"' class='form-control'> </div> </div> </td> ";
//            //IndicatorID	Age	IndicatorName	Level	datainputtype	Min	Max	onblur	onkeypress	Class	Required
//    
//     
//     //now do an appending
//                 
//             }
//             row2+=" </tr> ";   
//            
//            //alert(row2);
//             $("#dynamicindicators").html(row2);
//            
//         $('[data-toggle="popover"]').popover();   
// 
//    });// ned of input field loading
//    
//    
  
    
        
         
  });   //end of checking if document is ready
    
    
}

createdynamicinputs();


function sumofindicators(sourceindicators,destinationindicator){
    var sourceindicatorsarray=sourceindicators.split("@");
  
   
    var destinationelement=destinationindicator;
    var total=0;
    for(b=0;b<sourceindicatorsarray.length;b++){
        //check if there
        if($("#"+sourceindicatorsarray[b]).val()!==''){
      total=parseInt(total)+parseInt($("#"+sourceindicatorsarray[b]).val()); 
        
            $("#"+destinationelement).val(total);
            }
        if(b===(sourceindicatorsarray.length-1)){
        
            yearlytotal(destinationindicator);    
            
        }                                       
        }
                                              
                                             
    
}



//=========================================set targets================================

//function settargets(facilitymfl){
function setvldata(){

    userdb.get("aphiaplus").then(function (doc) {
        
 
var curfacil=doc.facility+"";


//now get data where facil is as selected

showvldetailed(curfacil);

//console.log(" set vldata called "+curfacil);

                                    
}).catch(function (err){
    console.log(err);
    
});   


}


setvldata();


function showvldetailed(faciliname){
    
    var dispatchyear="";
    var dispatchmonth="";
    
    dispatchyear=$("#year").val().trim();
    dispatchmonth=$("#month").val().trim();
    
    
    var cnt=0;
    var facili=faciliname+"";
    var vldat="<option value=''>Select cccno</option>";
    var vldat1="<option value=''>no cccno for this dispatch year & month</option>";
    

    if(dispatchyear!=='' && dispatchmonth!==''){
    
  vldb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 
      
	   //console.log(doc);
	   for(var a=0;a<doc.total_rows;a++){
               cnt++;
               if(a==0){
                     $("#cccno").html("<option value=''>loading..please wait</option>");
                   $('#cccno').select2();
               }
               
	   var dat={};
	   dat=doc.rows[a];
	      //console.log(dat.doc.title);
              //how to reference each column 
              
              //dat.doc._id
              
              
              var mfli=dat.doc.mflcode;
              var dispatchdate=dat.doc.datecollected+"";
            
		  var num=parseInt(a)+1;
                  if(facili.indexOf(mfli)>=0 && dispatchdate.substring(0,4)===dispatchyear && dispatchdate.substring(5, 7)===dispatchmonth){
                        //console.log("Compare dispatch date "+dispatchdate+" and dispatch year "+dispatchyear+" __vs_ "+dispatchmonth);
                      
                      if( parseInt(dat.doc.isupdated)> 0 )
                      {
                          
                      vldat+="<option title='outcome records updated' data-collectiondate='"+dat.doc.datecollected+"' value='"+dat.doc.cccno+"'>(updated) "+dat.doc.cccno+"</option>";
                 
                          
                      }
                      else {
		 vldat+="<option data-collectiondate='"+dat.doc.datecollected+"' value='"+dat.doc.cccno+"'>"+dat.doc.cccno+"</option>";
                           }
                  }//end of if
                  
                  if(a===doc.total_rows-1){
                      
                   	if(cnt>0){	
           $("#cccno").html(vldat); 	  
       }
       else {
         $("#cccno").html(vldat1);    
           
       }  
                  }
                  
          	    } //end of for loop
	 
	  
	
			
			
	    $(document).ready(function() {
            //$('#lyricstable').DataTable();
              $('#cccno').select2(); 
                                 } );
			
  }).catch(function (err){console.log(err)});
 
 }    

        
}//





function validateweeklydata(){
    
 var datecollected=$("#cccno").find(':selected').attr('data-collectiondate');   
    
year=$("#year").val();
month=$("#month").val();
cccnumber=$("#cccno").val();
sampletype=$("#sampletype").val();
patientcontacted=$("#patientcontacted").val();
adherencemonths=$("#adherencemonths").val();
secondsampledate=$("#secondsampledate").val();
noteligible=$("#noteligible").val();
noteligibleother=$("#noteligibleother").val();
secondsampleresults=$("#secondsampleresults").val();
actiontaken=$("#actiontaken").val();
firstregimen=$("#firstregimen").val();
secondregimen=$("#secondregimen").val();
thirdregimen=$("#thirdregimen").val();
otheroutcomes=$("#otheroutcomes").val();
comments=$("#comments").val().trim();
secondregdate=$("#secondregdate").val();
    
    //receive all the fields from the weekly data from
    var user=$("#username").val(); 
    var timestamp = $.now();
    if(user===''){user='aphiaplus';}
    
    var syncstatus='No';  
    
     var id=null;
          
     if(cccnumber==='')
     {         
  
   alert('Select cccnumber');
   //$("#facilityname select:first").focus();
   
   $("#cccno").css('border-color','red');
    //$("select:first").focus();
     }
     //startdate
     else if (year==='')
     {
         
     alert('Select year');

     $("#year").css('border-color','red');
     }    
   //end date
      else if (month==='')
     {
          $("#month").css('border-color','red'); 
     alert('Select month');
      
     } 
      else if (sampletype==='')
     {
          $("#sampletype").css('border-color','red'); 
     alert('Select sample type');
      
     } 
     
      
    
  
             else if(patientcontacted==='' && $(".ficha").is(':visible')===true)
      {
         
   alert('Specify if patient was contacted');
 $("#patientcontacted").css('border-color','red');    
     
       }
   
          else if(adherencemonths==='' && $(".ficha").is(':visible')===true)
      {
         
   alert('Choose Adherence sessions');
  
    $("#adherencemonths").css('border-color','red'); 
     
       }   
       
       
//          else if($(".ficha").is(':visible')===true && actiontaken===''){
//        
//        //then hide
//        
//        
//        alert('Choose Action taken');
//  
//    $("#actiontaken").css('border-color','red'); 
//        
//    }
            
   else if( actiontaken==='Change to 2nd line' && (secondregimen==='' )){
        
        //then hide
        
        
        alert('Choose second Regimen');
  
    $("#secondregimen").css('border-color','red'); 
        
    }
     
      else if( actiontaken==='Change to 2nd line' && (secondregdate==='')){
        
        //then hide
        
        
        alert('Choose Date of second regimen date');
  
    $("#secondregdate").css('border-color','red'); 
        
    }    
    
     else if( actiontaken==='Change to 3rd line' && (thirdregimen==='' )){
        
        //then hide
        
        
        alert('Choose Third Regimen');
  
    $("#thirdregimen").css('border-color','red'); 
        
    }
     
//# HIV positive[cumulative]

//        else if(noteligible==='Other' && noteligibleother==='')
//      {
//         
//   alert('Enter Reason Not eligible other');
//   $("#noteligibleother").focus();    
//     
//       }
//   
//          else if(secondsampleresults==='')
//      {
//         
//   alert('Enter Second sample results');
// 
//     $("#secondsampleresults").css('border-color','red'); 
//     
//       } 




//      else if(actiontaken==='')
//      {
//         
//   alert('Enter Action taken');
//
//       $("#actiontaken").css('border-color','red'); 
//     
//       }
//   
          
       
       else {
           
            $('#datasavedmodal').click(); 
            $('#datasavedmsg').html("<font  color='green'>Data saved successfully!</font>"); 
           
      id=cccnumber+"_"+year+"_"+month;
      //this should not be cleared
      $("#rowid").val(id);
      
           //save data to the db
            //we are now saving both weekly totals and annual cumulatives on the db
            //add a variable to distinguish the two
            //use _wk
          insertautcomedata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) ;
          insertlongitudinaldata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) ;
         console.log(id+"@"+datecollected+"@"+year+'@'+month+'@'+cccnumber+'@'+sampletype+'@'+patientcontacted+'@'+adherencemonths+'@'+secondsampledate+'@'+noteligible+'@'+noteligibleother+'@'+secondsampleresults+'@'+actiontaken+'@'+firstregimen+'@'+secondregimen+'@'+thirdregimen+'@'+otheroutcomes+'@'+comments+"@"+timestamp+"@"+user+"@"+ syncstatus+"@"+secondregdate) ;
   updatevlstatus(cccnumber,datecollected,'1');
clearweeklyfields();

 
$("#message").show();
$("#actiondone").html("Data Saved Successfully");
//call the function that loads entered data
//$("#message").hide().delay(800).fade(400);


console.log('weekly data entered');

 
setTimeout(delayedrefresh,2000);
 // delayedrefresh
       }
       
    
}




//===========================================EMPTY WEEKLY DATA FIELDS AFTER INSERT============================================================

function clearweeklyfields()
{
   // $("#facilityname").val("");
   //No facility name should have an underscore since its a special key


for(b=0;b<allindicatorsarray.length;b++){
    
  $("#"+allindicatorsarray[b]).val("");  
    
} 



    
}







var dbdata="";

//===================================================VIEW WEEKLY DATA============================================================
//a function to select a few search data that should appear in a data table
function selectsearchdata()
{
    
    
    
    //rread from weekly data db
    

  
    
  outcomedatadb.allDocs({include_docs: true, ascending: true}).then( function(doc) { 
 
     
	   //console.log(doc);
	   for(b=0;b<doc.total_rows;b++)
           {
             
               var dat={};
               dat=doc.rows[b];
               
                 var myid=dat.doc._id;
             
	      //console.log(dat.doc.facility);
              //how to reference each column 
              //alert(dat.doc.startdate);
              //dat.doc._id
              var statusicon="<i class='glyphicon glyphicon-cloud-upload' style='color:red;' title='data not exported'></i>*";
              if(dat.doc.syncstatus==="Yes"){
                 statusicon=""; 
                  
               }
	     
		 //dbdata+="<tr><td> "+dat.doc.startdate+" </td><td>"+dat.doc.syncstatus+"</td><td>"+dat.doc.facility+"</td><td><button class='btn-info' onclick='loadsavedweekelydata(\""+dat.doc._id+"\",\""+dat.doc.facility+"\")'>Edit</button></td></tr>";
		 dbdata+="<tr id='"+dat.doc._id+"'><td> "+dat.doc.timestamp+" </td><td>"+dat.doc.cccnumber+"</td><td><button class='btn-info' onclick='loadsavedweekelydata(\""+dat.doc._id+"\",\"no\")'>Edit "+statusicon+"</button></td></tr>";
          	    
                 
            } //end of for loop
                    
	appendtabledata(dbdata);
			
  }).catch(function (err){console.log(err)});
    

    
    
    
    
    
    
    //read data from the db
    
  	  
    
    
}

//call the function that displays the data

function appendtabledata( dbdata ){
    
     $("#searchtablediv").html("<table id='searchtable' class='table table-striped table-bordered'><thead><tr><th style='width:30%;'>Date  <br/>updated </th><th style='width:50%;'>CCC No.</th><th style='width:20%;'>Edit</th></tr></thead><tbody>"+dbdata+"</tbody></table>");
         
	   $(document).ready(function() {
                
         /* $('#searchtable').DataTable({              
              "autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  "order": [[0,'desc']]                    
          }).makeEditable({sDeleteURL: "js/deleterecords.js"});
          **/
          //new code
          
     
    var table = $('#searchtable').DataTable({"autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  
              "order": [[0,'desc']]});
 
    $('#searchtable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );
 
    $('#btnDeleteRow').click( function () {
        
     var tablerowid=table.$('tr.selected').attr('id');
        
        if(ConfirmDelete()===true){
        
        deletedata(tablerowid);
        
        table.row('.selected').remove().draw( false );
    }
        //call the delete function now
    } );

          
          
          
          
            
                                     } ); 
    
                                                          }

 selectsearchdata();
 
function showfacilities(){
  
  if($("#facilityname").val()==='refresh'){
    //showfacils();   
      
      
  }
   
    
}


function loadsavedweekelydata(id,openreportstab ){
    
  //  alert(id);
 //load from weekly db where id is as selected   
   	
	outcomedatadb.get(id).then(function (doc) {
    var rowid=id;    
    //populate div with respective content
    $("#rowid").val(id);
    $("#year").val(doc.year);
    //$('select#facilityname').find("option[value='"+mflanddates[0]+"_"+facility+"']").prop('selected', true); 
     $("#month").val(doc.month); 
      var fc=$("#facilityname").val();
      
       $("#cccno").html("<option data-collectiondate='"+doc.datecollected+"' value='"+doc.cccnumber+"'>"+doc.cccnumber+"</option>");
                   $('#cccno').select2();
//      $("#cccno").val(doc.cccnumber);     
//       $('#cccno').select2(); 

 $("#sampletype").val(doc.sampletype);
 $("#patientcontacted").val(doc.patientcontacted);
 $("#adherencemonths").val(doc.adherencemonths);
 $("#secondsampledate").val(doc.secondsampledate);
 $("#noteligible").val(doc.noteligible);
 
 if(doc.noteligible==='Other'){
     
  $("#otherdiv").show();   
 }
 
 $("#noteligibleother").val(doc.noteligibleother);
 $("#secondsampleresults").val(doc.secondsampleresults);
 $("#actiontaken").val(doc.actiontaken);
 $("#firstregimen").val(doc.firstregimen);
 $("#secondregimen").val(doc.secondregimen);
 $("#thirdregimen").val(doc.thirdregimen);
 $("#otheroutcomes").val(doc.otheroutcomes);
 $("#comments").val(doc.comments);   
 $("#secondregdate").val(doc.secondregdate);
 //set cccno atthis point so as to allow loading of ccc no's from db
    
     //hide the tabular header of + Enter Data and unhide the edit data 
     
    
     //do the vice versa on saving the edited fields
    
        //$(".editdata").show();
     $("#savebutton").hide();
     $("#updatebutton").show();
     //$("#savenewbutton").show();
      
      
 $('#newdatabutton').html("<i class='glyphicon glyphicon-edit'></i>Edit Data");

  //if this is a request to show the unentered comments
  //open the reports tab and focus on the first unentered comment
    if(openreportstab.indexOf("yes")!==-1){
        
      var contentarray=openreportstab.split("@"); 
      //alert(contentarray[1]);
     
      clickreportstab();
 //     document.getElementById(contentarray[1]).focus();
 $("#"+contentarray[1]).focus();
               }
               else {
                $('#newdatabutton').click();    
                   
               }
selectwidth();
 
 fichua(); 

});

 
 
}

$("#refreshpage" ).click(function() 
{
    window.location.reload();
    clearweeklyfields();
   
});

$("#refr" ).click(function() 
{
    window.location.reload();
   // clearweeklyfields();
});


$("#refr1" ).click(function() 
{
    window.location.reload();
   // clearweeklyfields();
});

function delayedrefresh()
{
      window.location.reload();
    clearweeklyfields();
}
function refreshonly()
{
      window.location.reload();
   
}

function updateweeklydata()
{
 //this id will be used to update the entered data
    
 var datecollected=$("#cccno").find(':selected').attr('data-collectiondate');  
 
   var id=$("#rowid").val();
   year=$("#year").val();
month=$("#month").val();
cccnumber=$("#cccno").val();
sampletype=$("#sampletype").val();
patientcontacted=$("#patientcontacted").val();
adherencemonths=$("#adherencemonths").val();
secondsampledate=$("#secondsampledate").val();
noteligible=$("#noteligible").val();
noteligibleother=$("#noteligibleother").val();
secondsampleresults=$("#secondsampleresults").val();
actiontaken=$("#actiontaken").val();
firstregimen=$("#firstregimen").val();
secondregimen=$("#secondregimen").val();
thirdregimen=$("#thirdregimen").val();
otheroutcomes=$("#otheroutcomes").val();
comments=$("#comments").val().trim();
secondregdate=$("#secondregdate").val();
    
    //receive all the fields from the weekly data from
    var user=$("#username").val(); 
    var timestamp = $.now();
    if(user===''){user='aphiaplus';}
    
    var syncstatus='No';  
    
     
          
     if(cccnumber==='')
     {         
  
   alert('Select cccnumber');
   //$("#facilityname select:first").focus();
   
   $("#cccno").css('border-color','red');
    //$("select:first").focus();
     }
     //startdate
     else if (year==='')
     {
         
     alert('Select year');

     $("#year").css('border-color','red');
     }    
   //end date
      else if (month==='')
     {
          $("#month").css('border-color','red'); 
     alert('Select month');
      
     } 
      else if (sampletype==='')
     {
          $("#sampletype").css('border-color','red'); 
     alert('Select sample type');
      
     }
     
      
   //else if ($(".ficha").is(':visible')===true){ 
  
              else if(patientcontacted==='' && $(".ficha").is(':visible')===true)
      {
         
   alert('Specify if patient was contacted');
 $("#patientcontacted").css('border-color','red');    
     
       }
   
          else if(adherencemonths==='' && $(".ficha").is(':visible')===true)
      {
         
   alert('Choose Adherence Months');
  
    $("#adherencemonths").css('border-color','red'); 
     
       }
       
       else if(noteligible==='Other' && noteligibleother==='' && $(".ficha").is(':visible')===true)
      {
         
   alert('Enter Reason Not eligible other');
   $("#noteligibleother").focus();    
     
       }
   
      

//      else if(actiontaken==='' && $(".ficha").is(':visible')===true)
//      {
//         
//   alert('Enter Action taken');
//
//       $("#actiontaken").css('border-color','red'); 
//     
//       }
      
//       else if($(".ficha").is(':visible')===true && actiontaken===''){
//        
//        //then hide
//        
//        
//        alert('Choose Action taken');
//  
//    $("#actiontaken").css('border-color','red'); 
//        
//    }
            
   else if( actiontaken==='Change to 2nd line' && (secondregimen==='' )){
        
        //then hide
        
        
        alert('Choose second Regimen');
  
    $("#secondregimen").css('border-color','red'); 
        
    }
     
      else if( actiontaken==='Change to 2nd line' && (secondregdate==='')){
        
        //then hide
        
        
        alert('Choose Date of second regimen date');
  
    $("#secondregdate").css('border-color','red'); 
        
    }    
    
     else if( actiontaken==='Change to 3rd line' && (thirdregimen==='' )){
        
        //then hide
        
        
        alert('Choose Third Regimen');
  
    $("#thirdregimen").css('border-color','red'); 
        
    }
      
       
      // }
//# HIV positive[cumulative]

        
   
          
       
       else {
           
             $('#datasavedmodal').click(); 
            $('#datasavedmsg').html("<font  color='green'>Data updated successfully!</font>"); 
    
          saveweeklyupdates(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) ;
          insertlongitudinaldata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) ;
        updatevlstatus(cccnumber,datecollected,'1');

//call refressh code here
clearweeklyfields();
 //selectsearchdata();
$("#message").show();
$("#actiondone").html("Data Updated Successfully");
//call the function that loads entered data

console.log('weekly data updated');

setTimeout(delayedrefresh,1800);
       }
       
    
}
   
function saveweeklyupdates(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) {


 outcomedatadb.get(id).then(function (doc) {
        
  //doc.age = 4;
 //alert(id);
   if(id!=='null' && id!=='' ){
        //doc._id=id;
        doc.year=year;
        doc.datecollected=datecollected;
        doc.month=month;
	doc.cccnumber=cccnumber;
doc.sampletype=sampletype;
doc.patientcontacted=patientcontacted;
doc.adherencemonths=adherencemonths;
doc.secondsampledate=secondsampledate;
doc.noteligible=noteligible;
doc.noteligibleother=noteligibleother;
doc.secondsampleresults=secondsampleresults;
doc.actiontaken=actiontaken;
doc.firstregimen=firstregimen;
doc.secondregimen=secondregimen;
doc.otheroutcomes=otheroutcomes;
doc.thirdregimen=thirdregimen;
doc.comments=comments;           
doc.secondregdate=secondregdate;           
            
        doc.timestamp=timestamp;
        doc.user=user;
        doc.syncstatus=syncstatus; 
   //alert('called');
  // put them back
  return outcomedatadb.put(doc);
   }
});
 
 
} 
   
function saveweeklyupdates_logitudinal(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate) {


 outcomedatadb_longitudinal.get(id).then(function (doc) {
        
  //doc.age = 4;
 //alert(id);
   if(id!=='null' && id!=='' ){
        //doc._id=id;
        doc.year=year;
        doc.datecollected=datecollected;
        doc.month=month;
	doc.cccnumber=cccnumber;
doc.sampletype=sampletype;
doc.patientcontacted=patientcontacted;
doc.adherencemonths=adherencemonths;
doc.secondsampledate=secondsampledate;
doc.noteligible=noteligible;
doc.noteligibleother=noteligibleother;
doc.secondsampleresults=secondsampleresults;
doc.actiontaken=actiontaken;
doc.firstregimen=firstregimen;
doc.secondregimen=secondregimen;
doc.otheroutcomes=otheroutcomes;
doc.thirdregimen=thirdregimen;
doc.comments=comments;           
doc.secondregdate=secondregdate;           
            
        doc.timestamp=tarehe();
        doc.user=user;
        doc.syncstatus=syncstatus; 
   //alert('called');
  // put them back
  return outcomedatadb_longitudinal.put(doc);
   }
});
 
 
} 
    
  
//==================function to import data

// $('#exportbutton').on('click',function() {
    $("#exportbutton").prop("disabled",false);
     $(this).removeClass('btn-lg btn-default').addClass('btn btn-success');
//});

var syncstatusarray=[];
function importdata(){
    
   // $('#exportbutton').on('click',function() {
    $("#exportbutton").prop("disabled",true);
    $("#exportbutton").removeClass('btn-lg btn-success').addClass('btn btn-default');

                //read db files that have not been synced
                
                
                var uniqid=tarehe_masaa();
                
    
  $("#exportbutton").hide();
  $("#exportmsg").show();
   $("#exportresponse").append("<b><font color='orange'>Exporting data.. please wait response.</b><br/>");
  
  outcomedatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 syncstatusarray=[];
      //read where sync is 0
	   var skipexporting=1;
	   for(c=0;c<doc.total_rows;c++){
               $("#exportbutton").hide();
               $("#exportmsg").show();
               //a variable to check if all comments are added for percents below 80 percent and not amongest the indicators that can be skipped.
             
            
	   var dat={};
	   dat=doc.rows[c];
	     // console.log(dat.doc.facility);
              //how to reference each column 
              
              var idyangu=dat.doc._id;
		  var num=parseInt(c)-1;
	
        if(dat.doc.syncstatus==="No" || dat.doc.syncstatus==="0" || dat.doc.syncstatus==="no")
                        {
            //now do an export via ajax
            console.log(" Exporting data for "+dat.doc.cccnumber+"*");
            //
          // if(((parseInt(dat.doc.hiv_pos_care_perc_child)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" ) || (parseInt(dat.doc.hiv_pos_care_perc_adult)< 90 && parseInt(dat.doc.hiv_pos_care_perc_all)!==0 && dat.doc.hiv_pos_care_perc_all!=="" )|| (parseInt(dat.doc.hiv_pos_care_perc_all)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" )) && dat.doc.hiv_pos_care_cmts==="" ){missingcommentid="@hiv_pos_care_cmts";skipexporting++; missingcomment+="percentage HIV positive enrolled on care <br/>";}
           if(1===1) {skipexporting=0;}
           
             
        
        if(skipexporting===0){
            
            updatesyncstatus(dat.doc._id);
             var supv=""; 
             if($("#supervisormail").val()!=null && $("#supervisormail").val()!='')
             {
                 supv=","+$("#supervisormail").val();
             } 
            
        
            
            
             $.ajax({
                         url:hostname+'exportdata',                            
                    type:'post', 
data:{id:dat.doc._id,
    datecollected:dat.doc.datecollected,
year:dat.doc.year,
month:dat.doc.month,
cccnumber:dat.doc.cccnumber,      
           
sampletype:dat.doc.sampletype,
patientcontacted:dat.doc.patientcontacted,
adherencemonths:dat.doc.adherencemonths,
secondsampledate:dat.doc.secondsampledate,
noteligible:dat.doc.noteligible,
noteligibleother:dat.doc.noteligibleother,
secondsampleresults:dat.doc.secondsampleresults,
actiontaken:dat.doc.actiontaken,
firstregimen:dat.doc.firstregimen,
secondregimen:dat.doc.secondregimen,
thirdregimen:dat.doc.thirdregimen,
otheroutcomes:dat.doc.otheroutcomes,
comments:dat.doc.comments,                  
secondregdate:dat.doc.secondregdate,                  
          timestamp:dat.doc.timestamp,
          user:dat.doc.user+""+supv,//added supervisor email
           exportid:uniqid,
      db:'outcomes'},
          dataType: 'html',  
                    success: function(data) {
                       
                       
                       
                        $("#exportresponse").append("<b>*"+data+'</b><br/>');
                         
                if(c===parseInt(doc.total_rows)){
                  //$("#exportbutton").show();
                 //$("#exportmsg").hide();
                 //$("#exportresponse").append("<b><font color='orange'>Exporting Completed.</b>");
  
                      }
                         
                   //doc.syncstatus="Yes"; 
   //alert('called');
  // put them back
                   // return weeklydatadb.put(doc);   
        
                                        }
                        
                         });
            
                        }//end of if skipp exporting === 0
                        //for annual exports, dont sync and dont show alert
                        else if (skipexporting!==0 && idyangu.indexOf("annual")>=0) {
                       //dont show export failure message     
                            
                        }
            else {
                
                
                $("#exportresponse").append("<br/><b>NOTE:</b><font color='red'> Data for <b>"+dat.doc.facility+"</b> not uploaded due to missing comment(s) on section <b><i>"+missingcomment+"</i></b></font> "+hrf+" <br/>");
            }
                        }
        
                 
                 
                 //if its last loop show
                 
           
                  
             
            
          	    } //end of for loop
	 
	
		
  }).then(function (){
     // alert('export complete');
     
           // if(c===parseInt(doc.total_rows)){
                
              // for(var s=0;s<syncstatusarray.length;s++){
//                    
               //  updatesyncstatus(syncstatusarray[s]);
                
          // }
     
  }).catch(function (err){ console.log(err); });
          
  //$("#exportbutton").show();
  //$("#exportmsg").hide();	
   //refresh number of uninmported sites.
   //unsynceddata()
     importdata_logitudinal(uniqid);   
        
}


var syncstatusarray1=[];


function importdata_logitudinal(exportid){
    
   // $('#exportbutton').on('click',function() {
   
   var supv=""; 
             if($("#supervisormail").val()!=null && $("#supervisormail").val()!='')
             {
                 supv=","+$("#supervisormail").val();
             } 
  
  outcomedatadb_longitudinal.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 syncstatusarray1=[];
      //read where sync is 0
	   var skipexporting=1;
	   for(c=0;c<doc.total_rows;c++){
              
               //a variable to check if all comments are added for percents below 80 percent and not amongest the indicators that can be skipped.
             
            
	   var dat={};
	   dat=doc.rows[c];
	     // console.log(dat.doc.facility);
              //how to reference each column 
              
              var idyangu=dat.doc._id;
		  var num=parseInt(c)-1;
	
        if(dat.doc.syncstatus==="No" || dat.doc.syncstatus==="0" || dat.doc.syncstatus==="no")
                        {
            //now do an export via ajax
            console.log(" Exporting longitudinal data for "+dat.doc.cccnumber+"*");
            //
          // if(((parseInt(dat.doc.hiv_pos_care_perc_child)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" ) || (parseInt(dat.doc.hiv_pos_care_perc_adult)< 90 && parseInt(dat.doc.hiv_pos_care_perc_all)!==0 && dat.doc.hiv_pos_care_perc_all!=="" )|| (parseInt(dat.doc.hiv_pos_care_perc_all)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" )) && dat.doc.hiv_pos_care_cmts==="" ){missingcommentid="@hiv_pos_care_cmts";skipexporting++; missingcomment+="percentage HIV positive enrolled on care <br/>";}
           if(1===1) {skipexporting=0;}
           
             
        
        if(skipexporting===0){
            
           
        
            //url:'http://104.45.29.195:8080/aphiaplus_moi/importweeklydata',
            
             $.ajax({
                         url:hostname+'exportdata',                            
                    type:'post', 
data:{id:dat.doc._id,
    datecollected:dat.doc.datecollected,
year:dat.doc.year,
month:dat.doc.month,
cccnumber:dat.doc.cccnumber,      
           
sampletype:dat.doc.sampletype,
patientcontacted:dat.doc.patientcontacted,
adherencemonths:dat.doc.adherencemonths,
secondsampledate:dat.doc.secondsampledate,
noteligible:dat.doc.noteligible,
noteligibleother:dat.doc.noteligibleother,
secondsampleresults:dat.doc.secondsampleresults,
actiontaken:dat.doc.actiontaken,
firstregimen:dat.doc.firstregimen,
secondregimen:dat.doc.secondregimen,
thirdregimen:dat.doc.thirdregimen,
otheroutcomes:dat.doc.otheroutcomes,
comments:dat.doc.comments,                  
secondregdate:dat.doc.secondregdate,                  
          timestamp:dat.doc.timestamp,
          user:dat.doc.user,
          user:dat.doc.user+""+supv,//added supervisor email
           exportid:exportid,
      db:'outcomes_logitudinal'},
          dataType: 'html',  
                    success: function(data) {
                       
                        deletelongitudinaldata(dat.doc._id);
                       
                       // $("#exportresponse").append("<b>*"+data+'</b><br/>');
                         
                if(c===parseInt(doc.total_rows)){
                  //$("#exportbutton").show();
                 //$("#exportmsg").hide();
                 //$("#exportresponse").append("<b><font color='orange'>Exporting Completed.</b>");
  
                      }
                         
                   //doc.syncstatus="Yes"; 
   //alert('called');
  // put them back
                   // return weeklydatadb.put(doc);   
        
                                        }
                        
                         });
            
                        }//end of if skipp exporting === 0
                        //for annual exports, dont sync and dont show alert
//                        else if (skipexporting!==0 && idyangu.indexOf("annual")>=0) {
//                       //dont show export failure message     
//                            
//                        }
            else {
                
                
                //$("#exportresponse").append("<br/><b>NOTE:</b><font color='red'> Data for <b>"+dat.doc.facility+"</b> not uploaded due to missing comment(s) on section <b><i>"+missingcomment+"</i></b></font> "+hrf+" <br/>");
            }
                        }
        
                 
                 
                 //if its last loop show
                 
           
                  
             
            
          	    } //end of for loop
	 
	
		
  }).then(function (){
     // alert('export complete');
     
           // if(c===parseInt(doc.total_rows)){
                
              // for(var s=0;s<syncstatusarray.length;s++){
//                    
               //  updatesyncstatus(syncstatusarray[s]);
                
          // }
     
  }).catch(function (err){ console.log(err); });
          
  //$("#exportbutton").show();
  //$("#exportmsg").hide();	
   //refresh number of uninmported sites.
   //unsynceddata()
        
        
}



function updatesyncstatus(id){
  
outcomedatadb.get(id).then(function (doc1) {
      console.log(id+" sync status updated");
 doc1.syncstatus='Yes';
 return outcomedatadb.put(doc1);
 
});

	
    
}//end of function





function unsynceddata(){
    
    
    outcomedatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 
          
      //read where sync is 0
	  var cnt1=0;
	   for(c=0;c<doc.total_rows;c++){
               
                var dat={};
	   dat=doc.rows[c];
           var cid=dat.doc._id;
               if((dat.doc.syncstatus==="No"||dat.doc.syncstatus==="0"||dat.doc.syncstatus==="no") && cid.indexOf("_annual")===-1 )
                        {
                            
                         cnt1++;   
                            
                        }
               var displaytext=cnt1+" records";
               if(cnt1===1){
                   
                    displaytext=cnt1+" record";
               }
              
          	                    } //end of for loop
	 
	$("#unexportedno").html("<br/>( "+displaytext+" )");
        if(cnt1>0){
            $("#exportdataanchor1").show();
            $("#exportdataanchor2").show();
            
        }
		
  }).catch(function (err){console.log(err)});
          
  //$("#exportbutton").show();
  //$("#exportmsg").hide();	
    
    
    
}//end of function



unsynceddata();


function totalvldata(){
    
    
    vldb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 
          
      //read where sync is 0
	  var cnt1=0;
	   for(c=0;c<doc.total_rows;c++){
               
                var dat={};
	   dat=doc.rows[c];
           var cid=dat.doc._id;
               if(1===1 )
                        {
                            
                         cnt1++;   
                            
                        }
               var displaytext=" ["+cnt1+" stf records]";
               if(cnt1===1){
                   
                    displaytext=" ["+cnt1+" stf record]";
                    
                    
               }
               } //end of for loop
	 
	$("#totalcccnos").html(" "+displaytext+"");
        
        $("#syncedstfs").html(""+cnt1+"");
        
        
        if(cnt1<=0){
            $("#totalcccnos").hide();           
            
        }
        else {
         $("#totalcccnos").show();   
        }
		
  }).catch(function (err){console.log(err)});
          
  //$("#exportbutton").show();
  //$("#exportmsg").hide();	
    
    
    
}//end of function



totalvldata();

function closeapp() 
{
      //navigator.app.exitApp();   // Closes the new window
}


</script>
<script>


//========================================201605 custom percentage calculator======================================


function fillprogressbar(denominator_is_value,numer,denomin,progressbarid,datavalueid,cmts){
    
        //console.log(datavalueid+" "+datavalueid.indexOf("adult"));
       // console.log(" "+cmts);
  //Date : 12th Oct 2016 
  //Change: show a default  of weekly performance for users.
  //however, submit the annual and weekly percentage
  //devide the annual  target with 52
        var applycoloronbar="yes";
        
        for(a=0;a<progressbarstoskip.length;a++){
            
            if(progressbarstoskip[a]===progressbarid){
                
                
                applycoloronbar="no";
            }
        }
     //for weekly performance, we were using input values but for annual we are using data-previous attribute   
    var weeklynumerator=$("#"+numer).val();//since we have weekly values on input field and annual cumulatives as data attributes fields
    var annualdenominator=$("#"+denomin).val();//since we have annual targets as values on input fields and not weekly targets
    
    var weeklydenominator="";//may be a value for a certain indicator or a predetermined target 
    
    var annualnumerator=$("#"+numer).attr("data-"+numer);// numerator for the whole year is the current number enterd plus total for previous year
    //var denominator=$("#"+denomin).val();
     
     if(denominator_is_value!=='yes'){
       //this section was meant to be used in annual performance calculator. for cases where the denom is  a value for another indic e.g no positive/ no tested  
       annualdenominator=$("#"+denomin).attr("data-"+denomin);
       //this denominator should not be devide by weeks/quartes/months 
       weeklydenominator=$("#"+denomin).val();
     }
     else {
         //devide target with number of weeks/quarters/months in a year
         if(annualdenominator!==''){
         
         if(annualdenominator<=52 ){ annualdenominator=52;} //to avoid geting decimal points targets
        weeklydenominator=Math.round(parseInt(annualdenominator)/52);
        
         }
         
          }
    
      if(weeklydenominator!==''&&weeklynumerator!==''){  
    //console.log(denomin+" "+denominator);
    //console.log(numer+" "+numerator);
    var numeratordenominatorvalues=weeklynumerator+"/"+weeklydenominator;
    //var numeratordenominatorvalues=weeklynumerator+"/"+weeklydenominator;
    var weeklyperc="0";
    var annualperc="0";
    //weekly percentage
    if(weeklydenominator==='0'){
        
        weeklyperc=0;
        
                        }
    else if(weeklydenominator===''|| weeklynumerator===''){
        
        weeklyperc=0;
    }
    else {
        
        weeklyperc=Math.round((parseInt(weeklynumerator)/parseInt(weeklydenominator))*100);
       
    }
    
    
    //annual percentage
    
     if(annualdenominator==='0'){
        
        annualperc=0;
        
                        }
    else if(annualdenominator===''|| annualnumerator===''){
        
        annualperc=0;
    }
    else {
        
        annualperc=Math.round((parseInt(annualnumerator)/parseInt(annualdenominator))*100);
        
      
    }
    console.log("Annual Percentage "+annualperc);
    //call save percents
     savepercents(weeklyperc,annualperc,datavalueid);
    //edit graph for display
    //if den and num are not blanks
    if(weeklynumerator!=='' && weeklydenominator!=='')
    {
    $("#"+progressbarid).width(weeklyperc+'%');
    $("#"+datavalueid).html(numeratordenominatorvalues+" = ("+weeklyperc+"%)");
    $("#"+datavalueid+"_in").val(weeklyperc);
    
    if(applycoloronbar==='yes'){
    if(weeklyperc>=90){
     $("#"+progressbarid).removeClass('progress-bar-info progress-bar-danger').addClass('progress-bar-success');
     
     if(datavalueid.indexOf("adult")===-1 && datavalueid.indexOf("child")===-1 ){
     $("#"+cmts).css('border-color','gray');
       }
                }
                   
 else if(weeklyperc < 90 && weeklyperc !==0) {
       $("#"+progressbarid).removeClass('progress-bar-info progress-bar-success').addClass('progress-bar-danger');
       
       if(datavalueid.indexOf("adult")===-1 && datavalueid.indexOf("child")===-1 ){
       $("#"+cmts).css('border-color','red');
                         }
  
                    }
                }
                    
     }
    
    
    }
}//end of function





//===================This function excecutes all percent calculation functions on loading and editin module  
function loadallpercents(){
    for(c=0;c<allindicatorsarray.length;c++){
      
            if(allindicatorsarray[c].indexOf("total")===-1){
                
            //call the functions in the onblur method
           // $("#"+allindicatorsarray[c]).trigger("blur");
            $("#"+allindicatorsarray[c]).blur();
          
                                                            }
        
        
                                            }
    
    
    
    
                        }





//a function to save comments after a user enters them







function isloggedin(){
  
//}
        
accountdb.allDocs({include_docs:true,ascending: true}).then(function (doc) 
{
    
    if(doc.total_rows===0){
        
        $('#loginbtn').click();
    }
    else{
        
        for(a=0;a<doc.total_rows;a++){
	   var dat={};
	   dat=doc.rows[a];
	      //hoping an account can have a maximum of only 
             
		  var validity=dat.doc.isauthorized;
                  if(validity==='0'){
                     $('#accesscodemodal').click(); 
                      
                  }
                  else{
                      
                      isuseradded();
                  }
		
            }
        
    }

 username=doc.username;

});
  
}

isloggedin();



function isuseradded(){
   var cnt=0;
        var username="";
    
     //if(username===''){    
    
//}
        
userdb.allDocs({include_docs:true,ascending: true}).then(function (doc) 
{
    
    if(doc.total_rows===0){
        
        $('#adduserbutton').click()
    }

 username=doc.username;

});
  
}

//isuseradded();



   function numbers(evt){
      
var charCode=(evt.which) ? evt.which : evt.keyCode
 console.log(charCode);
 /*
if(charCode > 31 && (charCode < 48 || charCode>57)){
return false;
}
*/
//43=+  9=TAB 8=BACKSPACE 
 if( charCode===43 ||  charCode===9 ||  charCode===8 || charCode===46 || ( charCode >= 48 && charCode<=57)){
    
 return true;   
}
else {
return false;
}
}

//Codes to prevent default form submission

$(".userform").submit(function(e){
    return false;
});

$("#weeklydataform").submit(function(e){
    return false;
});


$("#exportdataform").submit(function(e){
    return false;
});

$("#reportsform").submit(function(e){
    return false;
});

$("#excelreportsfom").submit(function(e){
    return false;
});

 $('input').css('border-color','#337ab7');


//prevent numbers scrolling

$('form').on('focus', 'input[type=number]', function (e) {
  $(this).on('mousewheel.disableScroll', function (e) {
    e.defaultPrevented;
  })
});
$('form').on('blur', 'input[type=number]', function (e) {
  $(this).off('mousewheel.disableScroll')
});



function selectwidth(){
  
   
      $(".select2-container").width('100%');
    
}

function selectwidth100(){
  
   
      $("#facilityname").width('100%');
    
}

selectwidth100();

 
   
             

</script>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
    
  
    
});


	$('#unexportedno').each(function() {
    var elem = $(this);
    setInterval(function() {
        if (elem.css('visibility') == 'hidden') {
            elem.css('visibility', 'visible');
        } else {
            elem.css('visibility', 'hidden');
        }    
    }, 500);
});




function getreport(){
    
    
    var exelstart=$("#startdaterpt").val();
    var exelend=$("#enddaterpt").val();
    var countyrpt=$("#rpt_county").val();
    var rptsubcounty=$("#rpt_subcounty").val();   
        if (exelstart==='')
     {
         
     alert('Select report begining date');
   $("#startdaterpt").focus();    
     }    
   //end date
      else if (exelend==='')
     {
         
     alert('Select report ending date');
   $("#enddaterpt").focus();    
     } 
     
      else  if(Date.parse(exelstart) > Date.parse(exelend)){
                    alert(" Report Start date cannot be greater than end date.");   
                    $("#enddaterpt").focus();  
                }
                else {
                    //call the report generation page
                 downloadrpt(exelstart,exelend,countyrpt,rptsubcounty) ;  
                    
                }
        
    
}



  function downloadrpt(startdate,enddate,cnty,rptsubcounty){
      
                $('.loading').show();
                $('#excelreportbtn').hide();
               
                //?startdate=" + startdate + "&enddate=" + enddate + "&cbos=" + cbos
             
                var ur=hostname+"RawData?startdate="+startdate+"&enddate="+enddate+"&rpt_county="+cnty+"&rpt_subcounty="+rptsubcounty;
                console.log(ur);
                $.fileDownload(ur).done( function () {
                   // alert("done");
                    $('.loading').hide(); 
                    $('#excelreportbtn').show();
                    $('#excelreportbtn').html("<i class='glyphicon glyphicon-ok'></i> Report Generated"); 
                                                    })
                  .fail(function () {
                      alert('Report generation failed, kindly try again!'); 
                      $('.loading').hide(); 
                      $('#excelreportbtn').show(); 
                                     });
 
                //$('.loading').hide();
            }



  function resetgeneratebutton(){
    
   $("#excelreportbtn").removeClass('btn-lg btn-success active').addClass('btn-lg btn-info active');  
    
}






//confirm delete data


function ConfirmDelete()
    {
      var x = confirm("Are you sure you want to delete data for the selected ccc number data?");
      if (x)
          return true;
      else
        return false;
    }








function deletedata(id){
    
    //a function to delete entered data
console.log("______"+id);
outcomedatadb.get(id).then(function(doc) {
  return outcomedatadb.remove(doc);
}).then(function (result) {
    unsynceddata();
  // handle result
}).catch(function (err) 
{
  console.log(err);
});

  
    
}


function resetcccdb(){
    
    vldb.destroy(function (err, response) {
   if (err) {
      return console.log(err);
   } else {
      console.log ("CCC Database Deleted");
     // $("#resetdbbtn").hide();
      $("#resetdbbtn1").html("Reset successful!");
      $("#resetdbbtn").html("Reset successful!");
      
   }
                                        });
    
    
}

function deletelongitudinaldata(id){
    
    //a function to delete entered data
console.log("______"+id);
outcomedatadb_longitudinal.get(id).then(function(doc) {
  return outcomedatadb_longitudinal.remove(doc);
}).then(function (result) {
    //unsynceddata();
  // handle result
}).catch(function (err) {
  console.log(err);
});

  
    
}

function togglehidding(){
    
  console.log("hidding called"); 
 if($('#hidetargets:checkbox:checked').length > 0){
  //showtargets 

   $(".hiderows").hide();
   hidetargetsui='yes';
 }
 else 
 {
      $(".hiderows").show();
      hidetargetsui='no';
 }
    
}








// a function to autosum




//this fuction should sum and update the current value of the 


function reasonnoteligible(){
    
    
    if($("#noteligible").val()==='Other'){
        
        $("#otherdiv").show();
        
    }
    else {
        
        $("#otherdiv").hide();
    }
    
}

reasonnoteligible();





function getmonth(){
    
    
     $(document).ready(function(){
         
       
   
         $.getJSON("months.json",function(result){
             var monthid="";
             var monthname="";
             var monthno="";
             var curmonth=new Date().getMonth()+1;
             var curyear=new Date().getFullYear();
             var year=$("#year").val();
             var mwezi="<option value=''>Select month</option>";
             if(year!==''){
             for(a=0;a< result.length; a++){
                 
                 if(parseInt(year)===parseInt(curyear)){
                 if(parseInt(result[a].monthid)<= parseInt(curmonth)){
                 
            mwezi+="<option value='"+result[a].monthnumber+"'>"+result[a].monthname+"</option>";
            }
           
             else {
                  mwezi+="<option disabled value='"+result[a].monthnumber+"'>"+result[a].monthname+"</option>";
                 
             }  
                 }
             else {
                mwezi+="<option value='"+result[a].monthnumber+"'>"+result[a].monthname+"</option>";  
                 
             }
                 
        }
        $("#month").html(mwezi);
        
             }
        
         });
         
    });
    
    }

getmonth();

function fichua(){
//"Routine ART Monitoring
////Clinical failure
////Baseline at diagnosis


//Baseline infant
//Baseline PMTCT
//Repeat after 3 month
//Repeat after 1 month
var sampletype=$("#sampletype").val();

console.log(" sample type ni "+sampletype);

    if(sampletype!='Routine ART Monitoring' && sampletype!='Clinical failure' && sampletype!='Repeat after 3 month' && sampletype!='Repeat after 1 month' && sampletype!='Baseline PMTCT'){
        
        //then hide
        
        
        $(".ficha").hide();
        
        
        
    }
    else {
           $(".ficha").show(); 
        
    }
    
    
    if(sampletype==='Baseline infant'){
        
        $('#select_id option[value="Change to 2nd line"]').attr("disabled", "disabled");
        
    }
    else {
        $('#select_id option[value="Change to 2nd line"]').attr("disabled", false);
        
    }
    
  ficha1();  
  ficha3();  
}

fichua();

function ficha1(){
//"Change to 2nd line

var at=$("#actiontaken").val();
    if(at!='Change to 2nd line'){
        
        //then hide
        
        
        $(".ficha1").hide();
        
        
        
    }
    else {
           $(".ficha1").show(); 
        
    }
    
    
}

ficha1();


//toggle the third line options

function ficha3(){
//"Change to 2nd line

var at=$("#actiontaken").val();
    if(at!='Change to 3rd line'){
        
        //then hide
        
        
        $(".ficha3").hide();
        
        
        
    }
    else {
           $(".ficha3").show(); 
        
    }
    
    
}
ficha3();




function getdrugs(){
    
    
     $(document).ready(function(){
         
       
   
         $.getJSON("drugs1.json",function(result){
             var drugid="";
             var drugcode="";
             var drugdetails="";
         
             
             var line1="<option value=''>Select regimen</option>";
             var line2="<option value=''>Select regimen</option>";
             var line3="<option value=''>Select regimen</option>";
             if(year!==''){
             for(a=0;a< result.length; a++){
                 
                  if(result[a].line==='1st line'){
                 
            line1+="<option value='"+result[a].code+"'>"+result[a].id+" ["+result[a].code+"]"+"</option>";
                                                
                                                 }
                 
                 if(result[a].line==='2nd line'){
                 
            line2+="<option value='"+result[a].code+"'>"+result[a].id+" ["+result[a].code+"]"+"</option>";
                                                
                                                 }
                
                 if(result[a].line==='3rd line'){
                 
            line3+="<option value='"+result[a].code+"'>"+result[a].id+" ["+result[a].code+"]"+"</option>";
                                                
                                                 }
             
                 
                                            }
        
        $("#firstregimen").html(line1);
        $("#secondregimen").html(line2);
        $("#thirdregimen").html(line3);
        
             }
        
         });
         
    });
    
    }

getdrugs();


function tarehe(){
    
    
      var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
   
 return date;   
}

function tarehe_masaa(){
    
    
      var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate()+'_'+today.getHours()+'-'+today.getMinutes();
   
 return date;   

}

function loadsubcounty() {
    var cnty=$("#rpt_county").val();
    
   
         $.getJSON("subcounty.json",function(result){
             var subcounty="";
             var county="";
             
         
             
             var subcounty="<option value=''>Select subcounty</option>";
            
             
             for(a=0;a< result.length; a++){
                 
                  if(result[a].County===cnty){
                 
            subcounty+="<option value='"+result[a].SubCounty+"'> "+result[a].SubCounty+" </option>";
                                                
                                              }
                 
             
                 
                                            }
        
       
        $("#rpt_subcounty").html(subcounty);
       
        
             
        
         }); 
    
    
}


function reportingRates( mflcodes){
    
    
    
     $.ajax({
                    url:hostname+"reportingrates?rpt_facils="+mflcodes,                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                   



     console.log(data);
      $("#uploadedstfs").html(data["uploadedstfs"]); 
      $("#updatedstfs").html(data["updatedstfs"]); 
      $("#notupdatedstfs").html(data["notupdatedstfs"]); 
         


//console.log(" uploaded records :_"+data["updatedstfs"]+"_");

                                    
 }
                        
                         });
    
    
}


</script>

<script>
if('serviceWorker' in navigator) 
{
  navigator.serviceWorker
           .register('serviceworker.js')
           .then(function() { console.log("Service Worker Registered"); });
}
</script>

	</body>
</html>
