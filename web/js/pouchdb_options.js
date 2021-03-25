/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//all Pouch db documnets will be runing in this step


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
                         url:'validateAccess?kc='+enteredcode,                            
                    type:'get',  
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
  
 // A function for saving the access rights for pouch db
  
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

//receive the user information

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
   
   var usern=$("#username").val();   
   var hosp=$("#facilityname").val();
   var supmail=$("#supervisormail").val();
   if(usern===''){$("#uservalidation").html("Enter Username");   }
   else if(hosp==='' || hosp==='refresh'){$("#uservalidation").html("Enter facility supporting");  }
   else 
   {
       
    adduser(usern,hosp,supmail); 
   showuser('aphiaplus',usern,hosp,supmail); 
   $("#totalcccnos").html("<br><img src='images/ajax_loader.gif'>");
   setTimeout(delayedrefresh,4000);  
   }
   
  }  
    
    var activeuser='';
    
   function showuser(aphiaplus,updateduser,updatedfacil,supervisormail){


	var counties=["Baringo","Kajiado","Laikipia","Nakuru","Narok","Samburu","Turkana"];
        
	userdb.get("aphiaplus").then(function (doc) {
            //
            if(updateduser!==''){
doc.username=updateduser;  
doc.facility=updatedfacil;  
doc.supervisormail=supervisormail;  

return userdb.put(doc); 
            }         
            if(doc.username!==''){
                
activeuser=doc.username;
                
 $("#username").val(activeuser);
 $("#username").select2();
 
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
      


var vldb = new PouchDB('vldata_v2');
var remoteCouch = false;
var receivedvldata;

//{,"cccno":"15311003199","":"Narok North","datecollected":"2015-11-09","mflcode":"15311"}

function addvldata(cccno,datecollected,mflcode,facility_name,county,subcounty,isupdated,sampletype,regimen,regimenline,datereceived) 
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
sampletype:sampletype,
regimen:regimen,
regimenline:regimenline,
dateresultsreceived:datereceived,
completed: false
  };
  vldb.put(receivedvldata, function callback(err, result) {
    if (!err) {
      //console.log('targets added succesfully');
    }
  });
}

function updatevldata(cccno,datecollected,mflcode,facility_name,county,subcounty,isupdated,sampletype,regimen,regimenline,datereceived){
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

doc.sampletype=sampletype;
doc.regimen=regimen;
doc.regimenline=regimenline;
doc.dateresultsreceived=datereceived;

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





//=========================Save data into local puch db documents========================

 
//This is a document to save all tables 
var outcomedatadb = new PouchDB('outcomedata',{auto_compaction: true});
var remoteCouch = false;
var outcomedata;

//receive the artist, song title and lyrics text
function insertautcomedata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate,cur_reg_startdate,vir_clinic_startdate,insupportgrp,supportgrp_enrol_date,repeatconf_notswitched_explained,postswitch_adherencesessions,postswitch_sample_col_date,postswitch_sampletype,postswitch_results_rec_date,postswitch_vl_results,not_suppressed_explained,actiontaken_other,repeatconf_notswitched_other_explained,repeatconf_results_rec_date,lasttca) {
   

outcomedatadb.upsert(id, function (doc) {

  
        doc.datecollected=datecollected;//datecollected is date of dipatch and is not exported
	doc.year=year;
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
doc.comments=comments;
doc.secondregdate=secondregdate;
doc.thirdregimen=thirdregimen;
doc.otheroutcomes=otheroutcomes;
doc.lasttca=lasttca;
doc.timestamp=tarehe();
doc.user=user;
doc.syncstatus=syncstatus; 
doc.cur_reg_startdate=cur_reg_startdate;
doc.vir_clinic_startdate=vir_clinic_startdate;
doc.insupportgrp=insupportgrp;
doc.supportgrp_enrol_date=supportgrp_enrol_date;
doc.repeatconf_notswitched_explained=repeatconf_notswitched_explained;
doc.postswitch_adherencesessions=postswitch_adherencesessions;
doc.postswitch_sample_col_date=postswitch_sample_col_date;
doc.postswitch_sampletype=postswitch_sampletype;
doc.postswitch_results_rec_date=postswitch_results_rec_date;
doc.postswitch_vl_results=postswitch_vl_results;
doc.not_suppressed_explained=not_suppressed_explained;
doc.actiontaken_other=actiontaken_other;
doc.repeatconf_notswitched_other_explained=repeatconf_notswitched_other_explained;
doc.repeatconf_results_rec_date=repeatconf_results_rec_date;
      
  return doc;
}).then(function (res) {
  // success, res is {rev: '1-xxx', updated: true, id: 'myDocId'}
  $("#synclog").html("saving outcome data record "+id);
   console.log('nonemr_all data added succesfully'+res);
}).catch(function (err) {
  // error
  console.log(err);  
  alert(''+err);
}); 
}	
var outcomedatadb_longitudinal = new PouchDB('outcomedata_logitudinal',{auto_compaction: true});
var outcomedata_long;

//receive the artist, song title and lyrics text
function insertlongitudinaldata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate,cur_reg_startdate,vir_clinic_startdate,insupportgrp,supportgrp_enrol_date,repeatconf_notswitched_explained,postswitch_adherencesessions,postswitch_sample_col_date,postswitch_sampletype,postswitch_results_rec_date,postswitch_vl_results,not_suppressed_explained,actiontaken_other,repeatconf_notswitched_other_explained,repeatconf_results_rec_date,lasttca) {
   

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
        lasttca:lasttca,
        timestamp:tarehe(),
        user:user,
        syncstatus:syncstatus,        
        cur_reg_startdate:cur_reg_startdate,
vir_clinic_startdate:vir_clinic_startdate,
insupportgrp:insupportgrp,
supportgrp_enrol_date:supportgrp_enrol_date,
repeatconf_notswitched_explained:repeatconf_notswitched_explained,
postswitch_adherencesessions:postswitch_adherencesessions,
postswitch_sample_col_date:postswitch_sample_col_date,
postswitch_sampletype:postswitch_sampletype,
postswitch_results_rec_date:postswitch_results_rec_date,
postswitch_vl_results:postswitch_vl_results,
not_suppressed_explained:not_suppressed_explained,
actiontaken_other:actiontaken_other,
repeatconf_notswitched_other_explained:repeatconf_notswitched_other_explained,
repeatconf_results_rec_date:repeatconf_results_rec_date,
        completed: false
  };
  outcomedatadb_longitudinal.put(outcomedata_long, function callback(err, result) {
    if (!err) {
      console.log('outcome data logitudinal added succesfully');
     
      
    }
    else if (err)  {
        
        console.log(" an error caused an update "+err);
        saveweeklyupdates_logitudinal(id+"_"+tarehe(),datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate,cur_reg_startdate,vir_clinic_startdate,insupportgrp,supportgrp_enrol_date,repeatconf_notswitched_explained,postswitch_adherencesessions,postswitch_sample_col_date,postswitch_sampletype,postswitch_results_rec_date,postswitch_vl_results,not_suppressed_explained,actiontaken_other,repeatconf_notswitched_other_explained,repeatconf_results_rec_date,lasttca);
    }
  });
}	




//===================================================VIEW Entered DATA============================================================
//a function to select a few search data that should appear in a data table
function selectsearchdata()
{
      
    
  outcomedatadb.allDocs({include_docs: true, ascending: true}).then( function(doc) { 
 
     
	   for(b=0;b<doc.total_rows;b++)
           {
             
               var dat={};
               dat=doc.rows[b];
               
                 var myid=dat.doc._id;
             
	     
              var statusicon="<i class='glyphicon glyphicon-cloud-upload' style='color:red;' title='data not exported'></i>*";
              if(dat.doc.syncstatus==="Yes"){
                 statusicon=""; 
                  
               }
	      dbdata+="<tr id='"+dat.doc._id+"'>"
 +"<td>"+dat.doc.cccnumber+"</td>"
+"<td>"
+" <b>Contacted</b>: "+dat.doc.patientcontacted
+"<br/><b>Adherence Sess</b>: "+dat.doc.adherencemonths
+"<br/><b>VL Res</b> :"+dat.doc.secondsampleresults
+"<br/><b>Action taken </b> :"+dat.doc.actiontaken
//+"<br/><b>Reason not Sup</b>:  "+dat.doc.not_suppressed_explained
+"<br/><b>Final Outcome </b> :"+dat.doc.otheroutcomes
        +"</td>"
+"<td><button class='btn-info' onclick='loadsavedweekelydata(\""+dat.doc._id+"\",\"no\")'>Edit "+statusicon+"</button></td>"
+"</tr>";
       
	 
	      	    
                 
            } //end of for loop
                    
	appendtabledata(dbdata);
			
  }).catch(function (err){console.log(err)});
    

    
    
    
    
    
    
    //read data from the db
    
  	  
    
    
}

//call the function that displays the data

function appendtabledata( dbdata ){
    
     $("#searchtablediv").html("<table id='searchtable' class='table table-striped table-bordered'><thead><tr><th style='width:40%;'>CCC Number</th><th style='width:50%;text-align:center;'>Patient Details</th><th style='width:10%;'>Edit</th></tr></thead><tbody>"+dbdata+"</tbody></table>");
         
	   $(document).ready(function() {
                
        
       
          
     
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


function appendvlsearchtabledata( dbdata ){
    
     $("#searchpatientstablediv").html("<table id='searchvlpatientstable' class='table table-striped table-bordered'><thead><tr><th style='width:40%;'>CCC Number</th><th style='width:50%;text-align:center;'>Patient Details</th><th style='width:10%;'>Edit</th></tr></thead><tbody>"+dbdata+"</tbody></table>");
         
	   $(document).ready(function() {
          
     
    var table = $('#searchvlpatientstable').DataTable({"autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  
              "order": [[0,'desc']]});
 
    $('#searchvlpatientstable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );
 
    

            
                                     } ); 
    
                                                          }




function loadVlPatientst(){
    
    var dispatchyear="";
    var dispatchmonth="";
    var vldat=''; 
    var cnt=0;
   
  vldb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 
      
	   //console.log(doc);
	   for(var a=0;a<doc.total_rows;a++){
               cnt++;
              
              
	   var dat={};
	   dat=doc.rows[a];
	     
              //how to reference each column 
             //dat.doc._id             
              
              var mfli=dat.doc.mflcode;
              var dispatchdate=dat.doc.datecollected+"";
            
		  var num=parseInt(a)+1;
                  
              
                      if( parseInt(dat.doc.isupdated)> 0 )
                      {
                          
                      vldat+="<tr><td>"+dat.doc.cccno+"</td> <td> Vl Sample date:<b>"+dat.doc.datecollected+"</b><br/> Updated: <b>Yes</b> </td> <td><button class='btn-success' onclick='loadyearmonthccc(\""+dat.doc.cccno+"\",\""+dat.doc.datecollected+"\")'>Update</button></td></tr>";
                 
                          
                      }
                      else {
	      vldat+="<tr><td>"+dat.doc.cccno+"</td> <td> Vl Sample date:<b>"+dat.doc.datecollected+"</b><br/> Updated: <b>No</b> </td> <td><button class='btn-info' onclick='loadyearmonthccc(\""+dat.doc.cccno+"\",\""+dat.doc.datecollected+"\")'>Update</button></td></tr>";
                                 
          }
          
          if(a===parseInt(doc.total_rows)-1){
              
              appendvlsearchtabledata(vldat);
console.log("should now load");
          }
          
                  }//end of if
                  
     
			
  }).catch(function (err){console.log(err)});
 
     
return vldat;
        
}//


loadVlPatientst();

function saveweeklyupdates(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate,cur_reg_startdate,vir_clinic_startdate,insupportgrp,supportgrp_enrol_date,repeatconf_notswitched_explained,postswitch_adherencesessions,postswitch_sample_col_date,postswitch_sampletype,postswitch_results_rec_date,postswitch_vl_results,not_suppressed_explained,actiontaken_other,repeatconf_notswitched_other_explained,repeatconf_results_rec_date,lasttca) {


 outcomedatadb.get(id).then(function (doc) {
        
 
   if(id!=='null' && id!=='' ){
     
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
doc.lasttca=lasttca;
doc.thirdregimen=thirdregimen;
doc.comments=comments;           
doc.secondregdate=secondregdate;           
            
        doc.timestamp=timestamp;
        doc.user=user;
        doc.syncstatus=syncstatus; 
        
        
doc.cur_reg_startdate=cur_reg_startdate;
doc.vir_clinic_startdate=vir_clinic_startdate;
doc.insupportgrp=insupportgrp;
doc.supportgrp_enrol_date=supportgrp_enrol_date;
doc.repeatconf_notswitched_explained=repeatconf_notswitched_explained;
doc.postswitch_adherencesessions=postswitch_adherencesessions;
doc.postswitch_sample_col_date=postswitch_sample_col_date;
doc.postswitch_sampletype=postswitch_sampletype;
doc.postswitch_results_rec_date=postswitch_results_rec_date;
doc.postswitch_vl_results=postswitch_vl_results;
doc.not_suppressed_explained=not_suppressed_explained;
doc.actiontaken_other=actiontaken_other;
doc.repeatconf_notswitched_other_explained=repeatconf_notswitched_other_explained;
doc.repeatconf_results_rec_date=repeatconf_results_rec_date;
        
   //alert('called');
  // put them back
  return outcomedatadb.put(doc);
   }
});
 
 
} 
   
function saveweeklyupdates_logitudinal(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate,cur_reg_startdate,vir_clinic_startdate,insupportgrp,supportgrp_enrol_date,repeatconf_notswitched_explained,postswitch_adherencesessions,postswitch_sample_col_date,postswitch_sampletype,postswitch_results_rec_date,postswitch_vl_results,not_suppressed_explained,actiontaken_other,repeatconf_notswitched_other_explained,repeatconf_results_rec_date,lasttca) {


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
doc.lasttca=lasttca;
doc.thirdregimen=thirdregimen;
doc.comments=comments;           
doc.secondregdate=secondregdate;           
            
        doc.timestamp=tarehe();
        doc.user=user;
        doc.syncstatus=syncstatus; 
        
doc.cur_reg_startdate=cur_reg_startdate;
doc.vir_clinic_startdate=vir_clinic_startdate;
doc.insupportgrp=insupportgrp;
doc.supportgrp_enrol_date=supportgrp_enrol_date;
doc.repeatconf_notswitched_explained=repeatconf_notswitched_explained;
doc.postswitch_adherencesessions=postswitch_adherencesessions;
doc.postswitch_sample_col_date=postswitch_sample_col_date;
doc.postswitch_sampletype=postswitch_sampletype;
doc.postswitch_results_rec_date=postswitch_results_rec_date;
doc.postswitch_vl_results=postswitch_vl_results;
doc.not_suppressed_explained=not_suppressed_explained;
doc.actiontaken_other=actiontaken_other;
doc.repeatconf_notswitched_other_explained=repeatconf_notswitched_other_explained;
doc.repeatconf_results_rec_date=repeatconf_results_rec_date;


        
   //alert('called');
  // put them back
  return outcomedatadb_longitudinal.put(doc);
   }
});
 
 
} 
    
function loadyearmonthccc(cccno, dispdate){
    
    $("#newdatabutton").click();
    
    $("#cccno").val(cccno);
    $("#year").val(dispdate.substring(0,4));
    $("#month").val(dispdate.substring(5,7));
   
    $("#cccno").trigger("change");
     $("#cccno").select();
    
}  
  
//==================function to import data

// $('#exportbutton').on('click',function() {
    $("#exportbutton").prop("disabled",false);
     $(this).removeClass('btn-lg btn-default').addClass('btn btn-success');
//});

var syncstatusarray=[];
function importdata(){
    
    var returnedresponses=0;
   // $('#exportbutton').on('click',function() {
    $("#exportbutton").prop("disabled",true);
    $("#exportbutton").removeClass('btn-lg btn-success').addClass('btn btn-default');

var recordsunexported=$("#unexported").val();
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
                  
                  var status_forexporting="";
	
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
                         url:'exportv2',                            
                    type:'get', 
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
lasttca:dat.doc.lasttca,
comments:dat.doc.comments,                  
secondregdate:dat.doc.secondregdate, 

cur_reg_startdate:dat.doc.cur_reg_startdate,
vir_clinic_startdate:dat.doc.vir_clinic_startdate,
insupportgrp:dat.doc.insupportgrp,
supportgrp_enrol_date:dat.doc.supportgrp_enrol_date,
repeatconf_notswitched_explained:dat.doc.repeatconf_notswitched_explained,
postswitch_adherencesessions:dat.doc.postswitch_adherencesessions,
postswitch_sample_col_date:dat.doc.postswitch_sample_col_date,
postswitch_sampletype:dat.doc.postswitch_sampletype,
postswitch_results_rec_date:dat.doc.postswitch_results_rec_date,
postswitch_vl_results:dat.doc.postswitch_vl_results,
not_suppressed_explained:dat.doc.not_suppressed_explained,
actiontaken_other:dat.doc.actiontaken_other,
repeatconf_notswitched_other_explained:dat.doc.repeatconf_notswitched_other_explained,
repeatconf_results_rec_date:dat.doc.repeatconf_results_rec_date,


          timestamp:dat.doc.timestamp,
          user:dat.doc.user+""+supv,//added supervisor email
           exportid:uniqid,
      db:'outcomes'},
          dataType: 'html',  
                    success: function(data) {
                       
                       returnedresponses++;
                       
                        $("#exportresponse").append("<b>*"+data+'</b><br/>');
                         
                if(c===parseInt(doc.total_rows)){
                  //$("#exportbutton").show();
                 //$("#exportmsg").hide();
                 //$("#exportresponse").append("<b><font color='orange'>Exporting Completed.</b>");
  
                      }
                      
                      
                        if(parseInt(returnedresponses)===parseInt(recordsunexported)){
                 $("#exportbutton").show();
                 $("#exportmsg").hide();
                 if(returnedresponses<1000){
                 $("#exportresponse").append("<br/>.<br/>.<br/>.<br/><b><font color='green'><b>"+returnedresponses+" records</b> completed successfully. </b>"); 
             setTimeout(delayedrefresh,2000);
            }
             else {
                      $("#exportresponse").append("<b><font color='orange'>Exporting did not complete successfully.</b>"); 
                 
             }
                       
                   }
               
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
        
           
             
            
          	    } //end of for loop
	 
	
		
  }).then(function (){
  
     
  }).catch(function (err){ console.log(err); });
          
 
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
         if(1===1) {skipexporting=0;}
           
             
        
        if(skipexporting===0){
            
           
        
            //url:'http://104.45.29.195:8080/aphiaplus_moi/importweeklydata',
            
             $.ajax({
                         url:'exportv2',                            
                    type:'get', 
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
lasttca:dat.doc.lasttca,
comments:dat.doc.comments,                  
secondregdate:dat.doc.secondregdate,

cur_reg_startdate:dat.doc.cur_reg_startdate,
vir_clinic_startdate:dat.doc.vir_clinic_startdate,
insupportgrp:dat.doc.insupportgrp,
supportgrp_enrol_date:dat.doc.supportgrp_enrol_date,
repeatconf_notswitched_explained:dat.doc.repeatconf_notswitched_explained,
postswitch_adherencesessions:dat.doc.postswitch_adherencesessions,
postswitch_sample_col_date:dat.doc.postswitch_sample_col_date,
postswitch_sampletype:dat.doc.postswitch_sampletype,
postswitch_results_rec_date:dat.doc.postswitch_results_rec_date,
postswitch_vl_results:dat.doc.postswitch_vl_results,
not_suppressed_explained:dat.doc.not_suppressed_explained,
actiontaken_other:dat.doc.actiontaken_other,
repeatconf_notswitched_other_explained:dat.doc.repeatconf_notswitched_other_explained,
repeatconf_results_rec_date:dat.doc.repeatconf_results_rec_date,


          timestamp:dat.doc.timestamp,
          //user:dat.doc.user,
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
                       
            else {
                
          }
                        }
        
                 
                 
                 //if its last loop show
                 
           
                  
             
            
          	    } //end of for loop
	 
	
		
  }).then(function (){
   
     
  }).catch(function (err){ console.log(err); });
          

        
}




function exportalldata(){
    
    var returnedresponses=0;
   // $('#exportbutton').on('click',function() {
    $("#exportbutton2").prop("disabled",true);
    $("#exportbutton2").removeClass('btn-lg btn-success').addClass('btn btn-default');

var recordsunexported=$("#unexported").val();
                //read db files that have not been synced
                
                
                var uniqid=tarehe_masaa();
                
    
  $("#exportbutton2").hide();
  $("#exportmsg2").show();
   $("#exportresponse2").append("<b><font color='orange'>Exporting data.. please wait response.</b><br/>");
  
  outcomedatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 syncstatusarray=[];
      //read where sync is 0
	   var skipexporting=1;
	   for(c=0;c<doc.total_rows;c++){
               $("#exportbutton2").hide();
               $("#exportmsg2").show();
               //a variable to check if all comments are added for percents below 80 percent and not amongest the indicators that can be skipped.
             
            
	   var dat={};
	   dat=doc.rows[c];
	   
              var idyangu=dat.doc._id;
		  var num=parseInt(c)-1;
                  
                  var status_forexporting="";
	
        if(1===1)
                 {
            //now do an export via ajax
            console.log(" Exporting data for "+dat.doc.cccnumber+"*");
            //
          // if(((parseInt(dat.doc.hiv_pos_care_perc_child)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" ) || (parseInt(dat.doc.hiv_pos_care_perc_adult)< 90 && parseInt(dat.doc.hiv_pos_care_perc_all)!==0 && dat.doc.hiv_pos_care_perc_all!=="" )|| (parseInt(dat.doc.hiv_pos_care_perc_all)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" )) && dat.doc.hiv_pos_care_cmts==="" ){missingcommentid="@hiv_pos_care_cmts";skipexporting++; missingcomment+="percentage HIV positive enrolled on care <br/>";}
           if(1===1) {skipexporting=0;}
           
             
        
        if(skipexporting===0){
            
            updatesyncstatus(dat.doc._id);
             var supv=""; 
             if($("#supervisormail").val()!==null && $("#supervisormail").val()!=='')
             {
                 supv=","+$("#supervisormail").val();
             } 
            
        
            
            
             $.ajax({
                         url:'exportv2',                            
                    type:'get', 
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
lasttca:dat.doc.lasttca,
comments:dat.doc.comments,                  
secondregdate:dat.doc.secondregdate, 

cur_reg_startdate:dat.doc.cur_reg_startdate,
vir_clinic_startdate:dat.doc.vir_clinic_startdate,
insupportgrp:dat.doc.insupportgrp,
supportgrp_enrol_date:dat.doc.supportgrp_enrol_date,
repeatconf_notswitched_explained:dat.doc.repeatconf_notswitched_explained,
postswitch_adherencesessions:dat.doc.postswitch_adherencesessions,
postswitch_sample_col_date:dat.doc.postswitch_sample_col_date,
postswitch_sampletype:dat.doc.postswitch_sampletype,
postswitch_results_rec_date:dat.doc.postswitch_results_rec_date,
postswitch_vl_results:dat.doc.postswitch_vl_results,
not_suppressed_explained:dat.doc.not_suppressed_explained,
actiontaken_other:dat.doc.actiontaken_other,
repeatconf_notswitched_other_explained:dat.doc.repeatconf_notswitched_other_explained,
repeatconf_results_rec_date:dat.doc.repeatconf_results_rec_date,


          timestamp:dat.doc.timestamp,
          user:dat.doc.user+""+supv,//added supervisor email
           exportid:uniqid,
      db:'outcomes'},
          dataType: 'html',  
                    success: function(data) {
                       
                       returnedresponses++;
                       
                        $("#exportresponse2").append("<b>*"+data+'</b><br/>');
                         
                if(1===1)
                {
                  //$("#exportbutton").show();
                 //$("#exportmsg").hide();
                 //$("#exportresponse").append("<b><font color='orange'>Exporting Completed.</b>");
  
                      }
                      
                      //if(c===parseInt(doc.total_rows))
                        if(parseInt(returnedresponses)===parseInt(doc.total_rows))
                        {
                 $("#exportbutton2").show();
                 $("#exportmsg2").hide();
                 if(returnedresponses<1000){
                 $("#exportresponse2").append("<br/>.<br/>.<br/>.<br/><b><font color='green'><b>"+returnedresponses+" records</b> completed successfully. </b>"); 
             setTimeout(delayedrefresh,2000);
            }
             else {
                      $("#exportresponse2").append("<b><font color='orange'>Exporting did not complete successfully.</b><br/>"); 
                 
             }
                       
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
                
                
                $("#exportresponse2").append("<br/><b>NOTE:</b><font color='red'> Data for <b>"+dat.doc.facility+"</b> not uploaded due to missing comment(s) on section <b><i>"+missingcomment+"</i></b></font> "+hrf+" <br/>");
            }
                        }
        

            
          	    } //end of for loop
	 
	
		
  }).then(function (){
   
     
  }).catch(function (err){ console.log(err); });
          
 
        
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
        $("#unexported").val(cnt1);
        if(cnt1>0){
            $("#exportdataanchor1").show();
            $("#exportdataanchor2").show();
            
        }
		
  }).catch(function (err){console.log(err)});
          
  //$("#exportbutton").show();
  //$("#exportmsg").hide();	
    
    
    
}//end of function



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




//check if this is the first time trhe user is accessing the suystem the first time

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

//check if the user has been added

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



var userslistdb = new PouchDB('stfusers_v2');
var remoteCouch = false;
var receivedstfusers;


function adduserslist(active,userid,fname,lname,phone,facility,mflcode,mail_user,mail_sto,usertype,mail_supervisor) 
{
   receivedstfusers = {
_id: userid,	
isactive:active,
fname:fname,
lname:lname,
phone:phone,
facility:facility,
mflcode:mflcode,
mail_user:mail_user,
mail_sto:mail_sto,
usertype:usertype,
mail_supervisor: mail_supervisor
  };
  userslistdb.put(receivedstfusers, function callback(err, result) {
    if (!err) {
      //console.log('targets added succesfully');
    }
  });
}

function updateuserslist(active,userid,fname,lname,phone,facility,mflcode,mail_user,mail_sto,usertype,mail_supervisor){
  //console.log(id);
   userslistdb.get(userid).then(function (doc) {
 
   if(userid!=='null' && userid!=='' ){
       

doc.isactive =active;
doc.fname =fname;
doc.lname =lname;
doc.phone =phone;
doc.facility =facility;
doc.mflcode =mflcode;
doc.mail_user =mail_user;
doc.mail_sto =mail_sto;
doc.usertype =usertype;
doc.mail_supervisor = mail_supervisor;
        
  
  return userslistdb.put(doc);
                                         }
});      
        
    
}

function getuserslist(){
    
   
              $.ajax({
                    url:'getusers',                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                   
             
                     for(var i=0;i<data.length;i++){
                         
                     
                        
   adduserslist( data[i].active,data[i].userid,data[i].fname,data[i].lname,data[i].phone,data[i].facility,data[i].mflcode,data[i].mail_user,data[i].mail_sto,data[i].usertype,data[i].mail_supervisor);
   updateuserslist( data[i].active,data[i].userid,data[i].fname,data[i].lname,data[i].phone,data[i].facility,data[i].mflcode,data[i].mail_user,data[i].mail_sto,data[i].usertype,data[i].mail_supervisor);
                        
                      if(i===data.length-2){
                          activateusers();
                          
                      } 
                     }
                       
                   
        
                                           }
                                           
                                              ,
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
        //alert('offline');
	
    }
                        
                         });
    
    
}



function activateusers(){

userslistdb.allDocs({include_docs: true, ascending: true}).then(function (da) {
if(da.total_rows===0){
//getcounsellorslist();
console.log("No loaded list of system users. Please refresh the system.");

                      }
     else {
       
            var users="<option value=''>select  user</option>";
            var a;
            var isselected='';
     for(a=0;a<da.total_rows;a++){
                var dat={}; 
           
	       dat=da.rows[a].doc;
                
            if(dat.mail_user!=='')
            {
                if(1===1)
                
            {
                 //if(dat.isactive===1){
     if(activeuser===dat.mail_user)
                   {
               isselected=' selected ';   
                   }
                                   else 
                                   {
                                   isselected='';       
                                   }
                    
           users+="<option "+isselected+" data-userid='"+dat._id+"' data-mflcode=\""+dat.mflcode+"_"+dat.facility+"\" data-fullname=\""+dat.fname+" "+dat.lname+"\"  data-supervisor=\""+dat.mail_supervisor+"\" data-sto=\""+dat.mail_sto+"\" value='"+dat.mail_user+"'>"+dat.fname+" "+dat.lname+" ["+dat.mail_user+"]</option>"
           
            }
     
           //alert("finished loading");
          $("#username").html(users);
          $('#username').select2();
          $('.select2-container').css('width','100%'); 
          $(".select2-container").width('100%');
  
        
            }
            else {
             //alert("");
             console.log("Skipped user without mail "+dat.fname+" "+dat.lname);
     }
   

     }//end of row

        }
});

}


 
  var user="aphiaplus";
  var myno=0;
  
    
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





function autoexport(){
   //alert("save called");   
   var  kunainternet="";  
   
  
   
      $.ajax({
                         url:'validateAccess',                            
                    type:'get',  
                    dataType: 'html',  
                    success: function(data) {
             
                 //count the number of available records
                 
                 var unexported=0;
                 
                 var cii;
                  outcomedatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 
	   for(cii=0;cii<doc.total_rows;cii++){
              
            
	   var dat={};
	   dat=doc.rows[cii];
	     
	
        if(dat.doc.syncstatus==="No" || dat.doc.syncstatus==="0" || dat.doc.syncstatus==="no")
                        {
			unexported++;
                        console.log("Ni mara ya "+unexported);
                        if(unexported===10){
                         $('#exportdataanchor1').click();
                         $('#exportbutton').click();

break;
                            
                            
                        }
			}
						
						}
						
						}).then(function (){
     
     
          
     
  }).catch(function (err){ console.log(err); });
                 
                 
          
     
                    },
                
               error: function(XMLHttpRequest, textStatus, errorThrown) {
       // alert(errorThrown);

    }
            
            });
       
   
   
  }
