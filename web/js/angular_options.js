/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.

/* swap open/close side menu icons */
$('[data-toggle=collapse]').click(function(){
  	// toggle icon
  	$(this).find("i").toggleClass("glyphicon-chevron-right glyphicon-chevron-down");
});


//Load the years drop down 

var d = new Date();
var curryear = d.getFullYear();


 var yearsarray=[];
 
var appl = angular.module("stfapp",[]);

appl.controller('stfcont', function($scope) {  
    
   //add the last three years to the years drop down 
   for(var a=curryear-2;a<=curryear;a++){    
    yearsarray.push(a);    
   } 
 $scope.miaka = yearsarray;
 
 var _yesno=["Yes","No"];
 
 var _yesnona=["Yes","No","NA"];
 
  var mns=[{id:'01',val:'January'},{id:'02',val:'February'},{id:'03',val:'March'},{id:'04',val:'April'},{id:'05',val:'May'},{id:'06',val:'June'},{id:'07',val:'July'},{id:'08',val:'August'},{id:'09',val:'September'},{id:'10',val:'October'},{id:'11',val:'November'},{id:'12',val:'December'}];
  var a_sessions=[{id:'0',val:'Zero'},{id:'1',val:'One'},{id:'2',val:'Two'},{id:'3',val:'Three'}];
  var sample_type=[{id:'1',val:'Frozen Plasma'},{id:'2',val:'Venous Blood  (EDTA )'},{id:'3',val:'DBS Capillary ( infants)'},{id:'4',val:'DBS Venous'},{id:'5',val:'PPT'}];
  
   var vl=[{id:'unsup',val:'>1000'},{id:'sup',val:'<1000'},{id:'rej',val:'Sample Rejected'},{id:'ldl',val:'LDL'}];
   var at=[{id:'Change to 2nd line',val:'Change to 2nd line'},{id:'Change to 3rd line',val:'Change to 3rd line'},{id:'Retain Regimen',val:'Retain Regimen'},{id:'Others',val:'Others (Specify)'}];
   var nw=[{id:'1',val:'Died'},{id:'2',val:'LTFU'},{id:'3',val:'Defaulter'},{id:'4',val:'Transfer Out'},{id:'5',val:'Other'}];
   var fo=[{id:'1',val:'Active'},{id:'2',val:'Resuppressed at VL confirmatory'},{id:'3',val:'Unsuppressed at 3 month VL post switch'},{id:'4',val:'Defaulter'},{id:'5',val:'LTFU'},{id:'6',val:'Patient Died'},{id:'7',val:'Ressuppressed after Regimen Switch'}];
       
    
   
 $scope.yesno=_yesno;
 $scope.months=mns;
 $scope.yesnona=_yesnona;
 $scope.adherencesessions=a_sessions;
 $scope.s_type=sample_type;
 $scope.viral=vl;
 $scope.actiontaken=at;
 $scope.ns=nw;
 $scope.finalo=fo;
 
});



appl.directive("stfVersion", function() {
  return {
    template : ` <h5 title="updated 22nd Mar 2021" style="text-align: center;color:blue;">STF Logs version 5.0.2. <label id='totalcccnos'>.</label></h5>`
  };
});


// Directive to show refresh, Data export button and Options for excel reports

        appl.directive("stfHeaderDirective", function() {
  return {
    template : `<div class="btn-group btn-group-justified">
               <a href="#" id='refreshpage' class="btn btn-success col-sm-3">
               <i class="glyphicon glyphicon-refresh"></i>
                <br> Refresh
                </a>
                        
        <a  class="btn btn-success col-sm-3" id="exportdataanchor1" style="display:none;" title="Add Widget" data-toggle="modal" href="#addWidgetModal">
        
         <i class="glyphicon glyphicon-cloud-upload"></i>
         <br/>Export Data 
         <span id="unexportedno" style="color:yellow;">(0 records )</span>
         <input type="hidden"  name ="unexported" id="unexported"  />
         </a>
                
         <a class="btn btn-success col-sm-3" title="Excel report"  href="report.html">
         <i class="glyphicon glyphicon-stats"></i>
         <br> Excel Report
         </a> 
         </div>`
  };
});




    



