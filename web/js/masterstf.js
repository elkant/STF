/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


  function getFacilitiesJson(){       
     
     
     //load facilities from json file
       
        var facilities="<option value=''>Select Facility</option>";
        
              $.ajax({
                         url:'json/sites1.json',                            
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
                    url:'getvldata?facility='+facilis,                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                   


  for(var i=0;i<data.length;i++){
     //console.log(curfacil+"_vs_"+data[i].mflcode+"="+curfacil.indexOf(data[i].mflcode)); 
      if(facilis.indexOf(data[i].mflcode)>=0)
      {
          var cccupdated="";
               if( parseInt(data[i].updatestatus)> 0 ){ cccupdated="(updated) ";  }
              
                      vldat+="<option title='' data-sampletype='"+data[i].sampletype+"'  data-regimen='"+data[i].regimen+" ("+data[i].regimenline+" line)' data-collectiondate='"+data[i].datecollected+"' value='"+data[i].cccno+"'>"+cccupdated+""+data[i].cccno+"</option>";
                 
                        addvldata(data[i].cccno,data[i].datecollected,data[i].mflcode,data[i].facility_name,data[i].county,data[i].subcounty,data[i].updatestatus,data[i].sampletype,data[i].regimen,data[i].regimenline,data[i].dateReceived);
                        updatevldata(data[i].cccno,data[i].datecollected,data[i].mflcode,data[i].facility_name,data[i].county,data[i].subcounty,data[i].updatestatus,data[i].sampletype,data[i].regimen,data[i].regimenline,data[i].dateReceived);
                       // console.log(" insert cccno "+data[i].cccno);
                       //,sampletype,regimen,regimenline,datereceived
                       

                        
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
var lasttca=null;

var comments=null;
var secondregdate=null;

var cur_reg_startdate=null;
var vir_clinic_startdate=null;
var insupportgrp=null;
var supportgrp_enrol_date=null;
var repeatconf_notswitched_explained=null;
var postswitch_adherencesessions=null;
var postswitch_sample_col_date=null;
var postswitch_sampletype=null;
var postswitch_results_rec_date=null;
var postswitch_vl_results=null;
var not_suppressed_explained=null;
var actiontaken_other=null;
var repeatconf_notswitched_other_explained=null;
var repeatconf_results_rec_date=null;

var allindicatorsarray=["year","month","cccnno","sampletype","patientcontacted","adherencemonths","secondsampledate","noteligible","noteligibleother","secondsampleresults","actiontaken","firstregimen","secondregimen","thirdregimen","otheroutcomes","comments","secondregdate","cur_reg_startdate","vir_clinic_startdate","insupportgrp","supportgrp_enrol_date","repeatconf_notswitched_explained","postswitch_adherencesessions","postswitch_sample_col_date","postswitch_sampletype","postswitch_results_rec_date","postswitch_vl_results","not_suppressed_explained","actiontaken_other","repeatconf_notswitched_other_explained","repeatconf_results_rec_date","lasttca"];
    




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
               if(a===0){
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
                          
                      vldat+="<option  data-sampletype='"+dat.doc.sampletype+"' data-regimen='"+dat.doc.regimen+" ("+dat.doc.regimenline+" line)' title='outcome records updated' data-collectiondate='"+dat.doc.datecollected+"' value='"+dat.doc.cccno+"'>(updated) "+dat.doc.cccno+"</option>";
                 
                          
                      }
                      else {
		 vldat+="<option data-sampletype='"+dat.doc.sampletype+"' data-regimen='"+dat.doc.regimen+" ("+dat.doc.regimenline+" line)' data-collectiondate='"+dat.doc.datecollected+"' value='"+dat.doc.cccno+"'>"+dat.doc.cccno+"</option>";
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


//this function does validation and 

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
lasttca=$("#lasttca").val();
comments=$("#comments").val().trim();
secondregdate=$("#secondregdate").val();

//_______________added columns____
cur_reg_startdate=$('#cur_reg_startdate').val();
vir_clinic_startdate=$('#vir_clinic_startdate').val();
insupportgrp=$('#insupportgrp').val();
supportgrp_enrol_date=$('#supportgrp_enrol_date').val();
repeatconf_notswitched_explained=$('#repeatconf_notswitched_explained').val();
postswitch_adherencesessions=$('#postswitch_adherencesessions').val();
postswitch_sample_col_date=$('#postswitch_sample_col_date').val();
postswitch_sampletype=$('#postswitch_sampletype').val();
postswitch_results_rec_date=$('#postswitch_results_rec_date').val();
postswitch_vl_results=$('#postswitch_vl_results').val();
not_suppressed_explained=$('#not_suppressed_explained').val();
actiontaken_other=$('#actiontaken_other').val();
repeatconf_notswitched_other_explained=$('#repeatconf_notswitched_other_explained').val();
repeatconf_results_rec_date=$('#repeatconf_results_rec_date').val();



    
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
    
      
    
  
             else if(patientcontacted==='' && $(".ficha").is(':visible')===true)
      {
         
   alert('Specify if patient was contacted');
 $("#patientcontacted").css('border-color','red');    
     
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
     
     
       else if( cur_reg_startdate===''){
        
        alert('Input date started Current Regimen');
  
    $("#cur_reg_startdate").css('border-color','red'); 
        
    }
    
    
       else if( vir_clinic_startdate===''){
        
        alert('Input date started Viremia Clinic');
  
    $("#vir_clinic_startdate").css('border-color','red'); 
        
    }
     
     
     else if( insupportgrp===''){
        
        alert('Specify if client is in a Support group');
  
    $("#insupportgrp").css('border-color','red'); 
        
    }
     
     else if( insupportgrp==='Yes' && supportgrp_enrol_date===''){
        
        alert('Specify the date client was enrolled in Support group');
  
    $("#supportgrp_enrol_date").css('border-color','red'); 
        
    }
     
             else if(adherencemonths==='' && $(".ficha").is(':visible')===true)
      {
         
   alert('Choose Adherence sessions');
  
    $("#adherencemonths").css('border-color','red'); 
     
       }
       
         else if (sampletype==='')
     {
          $("#sampletype").css('border-color','red'); 
     alert('Select sample type');
      
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
              else if(actiontaken==='Others'  && actiontaken_other==='' )
      {
         
   alert('specify other action taken');

       $("#actiontaken_other").css('border-color','red'); 
     
       }
        
                else if(not_suppressed_explained==='' && postswitch_vl_results==='>1000'  )
      {
         
   alert('Please enter an explanation for reason for non-suppression');

       $("#comments").css('border-color','red'); 
     
       }  
       
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
          insertautcomedata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate,cur_reg_startdate,vir_clinic_startdate,insupportgrp,supportgrp_enrol_date,repeatconf_notswitched_explained,postswitch_adherencesessions,postswitch_sample_col_date,postswitch_sampletype,postswitch_results_rec_date,postswitch_vl_results,not_suppressed_explained,actiontaken_other,repeatconf_notswitched_other_explained,repeatconf_results_rec_date,lasttca) ;
          insertlongitudinaldata(id,datecollected,year,month,cccnumber,sampletype,patientcontacted,adherencemonths,secondsampledate,noteligible,noteligibleother,secondsampleresults,actiontaken,firstregimen,secondregimen,thirdregimen,otheroutcomes,comments,timestamp,user, syncstatus,secondregdate,cur_reg_startdate,vir_clinic_startdate,insupportgrp,supportgrp_enrol_date,repeatconf_notswitched_explained,postswitch_adherencesessions,postswitch_sample_col_date,postswitch_sampletype,postswitch_results_rec_date,postswitch_vl_results,not_suppressed_explained,actiontaken_other,repeatconf_notswitched_other_explained,repeatconf_results_rec_date,lasttca) ;
         console.log(id+"@"+datecollected+"@"+year+'@'+month+'@'+cccnumber+'@'+sampletype+'@'+patientcontacted+'@'+adherencemonths+'@'+secondsampledate+'@'+noteligible+'@'+noteligibleother+'@'+secondsampleresults+'@'+actiontaken+'@'+firstregimen+'@'+secondregimen+'@'+thirdregimen+'@'+otheroutcomes+'@'+comments+"@"+timestamp+"@"+user+"@"+ syncstatus+"@"+secondregdate+'@'+cur_reg_startdate+'@'+vir_clinic_startdate+'@'+insupportgrp+'@'+supportgrp_enrol_date+'@'+repeatconf_notswitched_explained+'@'+postswitch_adherencesessions+'@'+postswitch_sample_col_date+'@'+postswitch_sampletype+'@'+postswitch_results_rec_date+'@'+postswitch_vl_results+'@'+not_suppressed_explained+'@'+actiontaken_other+'@'+repeatconf_notswitched_other_explained+'@'+repeatconf_results_rec_date+'@'+lasttca) ;
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
      
       //$("#cccno").html("<option data-collectiondate='"+doc.datecollected+"' value='"+doc.cccnumber+"'>"+doc.cccnumber+"</option>");
                   //$('#cccno').select2();
      $("#cccno").val(doc.cccnumber);     
       $('#cccno').select2(); 

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
 $("#lasttca").val(doc.lasttca);
 $("#comments").val(doc.comments);   
 $("#secondregdate").val(doc.secondregdate);
 
$('#cur_reg_startdate').val(doc.cur_reg_startdate);
$('#vir_clinic_startdate').val(doc.vir_clinic_startdate);
$('#insupportgrp').val(doc.insupportgrp);
$('#supportgrp_enrol_date').val(doc.supportgrp_enrol_date);
$('#repeatconf_notswitched_explained').val(doc.repeatconf_notswitched_explained);
$('#postswitch_adherencesessions').val(doc.postswitch_adherencesessions);
$('#postswitch_sample_col_date').val(doc.postswitch_sample_col_date);
$('#postswitch_sampletype').val(doc.postswitch_sampletype);
$('#postswitch_results_rec_date').val(doc.postswitch_results_rec_date);
$('#postswitch_vl_results').val(doc.postswitch_vl_results);
$('#not_suppressed_explained').val(doc.not_suppressed_explained);
$('#actiontaken_other').val(doc.actiontaken_other);
$('#repeatconf_notswitched_other_explained').val(doc.repeatconf_notswitched_other_explained);
$('#repeatconf_results_rec_date').val(doc.repeatconf_results_rec_date);

 
 
 
 
 
 
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
 
 //call cinditional input field toggling functions
 
loadregimen();
supportgroupdate();
//decideactiontaken();
$("#actiontaken").change();
toggleactiontaken_other();
explainnonswitch();
notsuppressedexplained();

fichapostswitch();
otherreasonfornonswitch();
 
 togglelasttca();
 

});

 
 
}//end of load weekely report









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




//Codes to prevent default form submission

$(".userform").submit(function(e){
    return false;
});

$("#stfdataform").submit(function(e){
    return false;
});


$("#exportdataform").submit(function(e){
    return false;
});
$("#exportdataform2").submit(function(e){
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


//set facility name width to 100%
function selectwidth100(){
  
   
      $("#facilityname").width('100%');
      $("#username").width('100%');
    
}


 
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
    
  
    
});


	$('#unexportedno').each(function() {
    var elem = $(this);
    setInterval(function() {
        if (elem.css('visibility') === 'hidden') {
            elem.css('visibility', 'visible');
        } else {
            elem.css('visibility', 'hidden');
        }    
    }, 500);
});





function ConfirmDelete()
    {
      var x = confirm("Are you sure you want to delete data for the selected ccc number data?");
      if (x)
          return true;
      else
        return false;
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

function reasonnoteligible(){
    
    
    if($("#noteligible").val()==='Other'){
        
        $("#otherdiv").show();
        
    }
    else {
        
        $("#otherdiv").hide();
    }
    
}




function getmonth(){
    
    
     $(document).ready(function(){
         
       
   
         $.getJSON("json/months.json",function(result){
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



function fichua(){

var sampletype=$("#sampletype").val();

console.log(" sample type ni "+sampletype);

    if(sampletype!=='Routine ART Monitoring' && sampletype!=='Clinical failure' && sampletype!=='Repeat after 3 month' && sampletype!=='Repeat after 1 month' && sampletype!=='Baseline PMTCT'){
        
      
        
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


function ficha1(){
//"Change to 2nd line

var at=$("#actiontaken").val();
    if(at!=='Change to 2nd line'){
        
        //then hide
        
        
        $(".ficha1").hide();
        
        
        
    }
    else {
           $(".ficha1").show(); 
        
    }
    
    
}



function ficha3(){
//"Change to 2nd line

var at=$("#actiontaken").val();
    if(at!=='Change to 3rd line'){
        
        //then hide
        
        
        $(".ficha3").hide();
        
        
        
    }
    else {
           $(".ficha3").show(); 
        
    }
    
    
}


function getdrugs(){
    
    
     $(document).ready(function(){
         
       
   
         $.getJSON("json/drugs1.json",function(result){
             var drugid="";
             var drugcode="";
             var drugdetails="";
         
             
             var line1="<option value=''>Select regimen</option>";
             var line2="<option value=''>Select regimen</option>";
             var line3="<option value=''>Select regimen</option>";
             var alllines="<option value=''>Select regimen</option>";
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
             
                  alllines+="<option value='"+result[a].code+"'>"+result[a].id+" ["+result[a].code+"] ("+result[a].line.replace(' line','')+")</option>";
                                            }
        
        $("#firstregimen").html(alllines);
       // $("#firstregimen").html(line1);
        $("#secondregimen").html(line2);
        $("#thirdregimen").html(line3);
        
             }
        
         });
         
    });
    
    }


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

function ldfacility() {
   
       
        var sbc=$("#rpt_subcounty").val();
       
      
        var facilities="";
        
              $.ajax({
                         url:'json/sites1.json',                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                        
                       
                     for(var i=0;i<data.length;i++){
                         
if((data[i].pmtct===1 || data[i].art===1) && data[i].isactive==='Yes' && data[i].subcounty===sbc ){
    //think of how to get the selected value.
    
                  facilities+="<option value='"+data[i].mflcode+"'>"+data[i].facility_name+"</option>"; 
           
                     }
              
              
              
             
                        
                     }
                     //alert(facilities);
                      $("#rpt_facility").html(facilities);
                   $(document).ready(function() {
            //$('#lyricstable').DataTable();
              $('#rpt_facility').select2(); 
             
                                 } );
                     
                      }
                  
       
        });  
   
}




function reportingRates(mflcodes){
    
    mflcodes=mflcodes.trim();
    
    var rn=Math.random();
     $.ajax({
                    url:"reportingrates?rn="+rn+"&rpt_facils="+mflcodes,                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                   
                   var d="<tr><th>Indicator</th><th>Value</th></tr>";

for(var tb=0;tb<data.length;tb++){
    
    d+="<tr><td>"+data[tb].indicator+"</td><td>"+data[tb].value+"</td></tr>";
}

     console.log(data);
      $("#eac").html(d); 
       
         


//console.log(" uploaded records :_"+data["updatedstfs"]+"_");

                                    
 }
                        
                         });
    
    
}



function loadregimen(){
    var regni=$("#cccno").find(':selected').data("regimen");
    var samplet=$("#cccno").find(':selected').data("sampletype");
   //alert(regni);
  $("#artregimen").html('<b>'+regni+'</b>');  
  $("#sampletype").val(samplet);  
   
        if(regni!==''){
            
            $(".fichaartreg").show();
            
        }
        else {
            
            
             $(".fichaartreg").hide();
        }
        
}


function supportgroupdate(){
    
   var spt=$("#insupportgrp").val();
   
   
        if(spt==='No' || spt==='NA' ){
               $(".supportgrp_enrol_date").hide();
           
        }
        else {
            
         $(".supportgrp_enrol_date").show();     
          
        }  
    
    
}

function decideactiontaken()
{
    
   var spt=$("#secondsampleresults").val();
   //alert(regni);

   
        if(spt==='LDL'){
               $("#actiontaken").val("Retain Regimen");
          
            
        } 
        else {
            
            $("#actiontaken").val("");  
            
        }
    
    
}


function toggleactiontaken_other()
{
    
   var actionni=$("#actiontaken").val();
  
   
        if(actionni==='Others'){
               $(".actiontaken_other").show();
          
            
        }
        else{
          
             $(".actiontaken_other").hide();
            
        }
    
    
}



function explainnonswitch(){
    
   var actionni=$("#actiontaken").val();
   var res=$("#secondsampleresults").val();
   
   
   //alert(regni);

   
        if(actionni==='Retain Regimen' && res==='>1000' ){
               $(".repeatconf_notswitched_explained").show();
          
            
        }
        else{
          
             $(".repeatconf_notswitched_explained").hide();
            
        }
    
    
    
}


function notsuppressedexplained(){
    
    var res=$("#postswitch_vl_results").val();
   
   
   //alert(regni);

   
        if(res==='>1000'){
               $(".fichacomments").show();
         }
        else{
             $(".fichacomments").hide();
         }
    
    
}




function otherreasonfornonswitch(){



var res=$("#repeatconf_notswitched_explained").val();
  

        if( res==='Other' ){
               $(".repeatconf_notswitched_other_explained").show();
          
            
        }
        else{
          
             $(".repeatconf_notswitched_other_explained").hide();
            
        }
    
    

}



function fichapostswitch(){
    //
    var spt=$("#secondsampleresults").val();
   //alert(regni);

   
        if(spt==='LDL'){
              
            $(".fichavl2").hide();
            
        }
        else{
          
           
             $(".fichavl2").show();
        }
    
    
}



function togglelasttca(){
    
      //
    var otc=$("#otheroutcomes").val();
   //alert(regni);

   
        if(otc!=='Active'){
              
            $(".lasttca").show();
            
        }
        else{
          
           
             $(".lasttca").hide();
             $("#lasttca").val("");
        }
    
    
}

function appenduserdetails(){
     var mflcode=$("#username").find(':selected').data("mflcode");   
     var supervisor=$("#username").find(':selected').data("supervisor"); 
     
     $("#facilityname").val(mflcode);
     $("#facilityname").select2();
     $("#supervisormail").val(supervisor);
     
 console.log(mflcode);
    
}



function clearsws(){
    
    //caches.delete(/*name*/);
  navigator.serviceWorker.getRegistrations()
  .then(registrations => {
    registrations.forEach(registration => {
      registration.unregister();
    }) ;
  });
  console.log("clearing cache");
  
   window.location.reload();
}

