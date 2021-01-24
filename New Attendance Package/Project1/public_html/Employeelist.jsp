<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,View.DBCoding" %>
<%@ page import="java.io.*,java.util.*, java.text.DateFormat,java.text.SimpleDateFormat, java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>--%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>





<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
     <title>attendance</title>
    
    <link rel="stylesheet" type="text/css" href= "resources/css/attres.css" media="screen" />
        <link type="text/css" rel="stylesheet" href="css/tooltip.css"/>
        <link type="text/css" rel="stylesheet" href="css/toggle.css"/>
        <!--<% try{
  
          if (request.getParameter("userid")==null){
      if (session== null){
         session.setAttribute("URIPACKET", "NULL VALUE FROM REQUEST PAGE");
 session.setAttribute("userid", "NULL VALUE FROM REQUEST PAGE");
   %><jsp:forward page="http://online.efuinsurance.com:9003/App_IT_Service/login.jsp" />
   <%}}
   else  { 
  if (session== null){ session.setAttribute("session", "True");}
   session.setAttribute("userid", request.getParameter("userid").toString());
       session.setAttribute("URIPACKET", "REQUEST FROM PAGE");}
  
   }catch(Exception ex)
       {out.println("the empiod check block  "+ex.getMessage());}
   %>-->
  
        <style type="text/css">
.form-style-3{
    max-width: 450px;
    font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
}
.form-style-3 label{
    display:block;
    margin-bottom: 10px;
}
.form-style-3 label > span{
    float: left;
    width: 100px;
    color: #156cef;
    font-weight: bold;
    font-size: 13px;
    text-shadow: 1px 1px 1px #fff;
}
.form-style-3 fieldset{
    border-radius: 10px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    margin: 0px 0px 10px 0px;
    border: 1px solid #FFD2D2;
    padding: 20px;
    background: #4faef7;
    box-shadow: inset 0px 0px 15px #FFE5E5;
    -moz-box-shadow: inset 0px 0px 15px #FFE5E5;
    -webkit-box-shadow: inset 0px 0px 15px #FFE5E5;
}
.form-style-3 fieldset legend{
    color: #156cef;
    border-top: 1px solid #FFD2D2;
    border-left: 1px solid #FFD2D2;
    border-right: 1px solid #FFD2D2;
    border-radius: 5px 5px 0px 0px;
    -webkit-border-radius: 5px 5px 0px 0px;
    -moz-border-radius: 5px 5px 0px 0px;
    background: #4faef7;
    padding: 0px 8px 3px 8px;
    box-shadow: -0px -1px 2px #F1F1F1;
    -moz-box-shadow:-0px -1px 2px #F1F1F1;
    -webkit-box-shadow:-0px -1px 2px #F1F1F1;
    font-weight: normal;
    font-size: 12px;
}
.form-style-3 textarea{
    width:250px;
    height:100px;
}
.form-style-3 input[type=text],
.form-style-3 input[type=date],
.form-style-3 input[type=datetime],
.form-style-3 input[type=number],
.form-style-3 input[type=search],
.form-style-3 input[type=time],
.form-style-3 input[type=url],
.form-style-3 input[type=email],
.form-style-3 textarea{
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border: 1px solid #FFC2DC;
    outline: none;
    color: #156cef;
    padding: 5px 8px 5px 8px;
    box-shadow: inset 1px 1px 4px #FFD5E7;
    -moz-box-shadow: inset 1px 1px 4px #FFD5E7;
    -webkit-box-shadow: inset 1px 1px 4px #FFD5E7;
    background: #FFF4F4;
    width:50%;
}
.form-style-3 select{
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border: 1px solid #FFC2DC;
    outline: none;
    color: #156cef;
    padding: 5px 8px 5px 8px;
    box-shadow: inset 1px 1px 4px #FFD5E7;
    -moz-box-shadow: inset 1px 1px 4px #FFD5E7;
    -webkit-box-shadow: inset 1px 1px 4px #FFD5E7;
    background: #FFF4F4;
    width:75%;
}
.form-style-3  input[type=submit]:disabled,
.form-style-3  input[type=button]
:disabled {
    background: #a09f9f;

}

.form-style-3  input[type=submit],
.form-style-3  input[type=button]{
    background: #FFF4F4;
    border: 1px solid #C94A81;
    padding: 5px 15px 5px 15px;
    color: #156cef;
    box-shadow: inset -1px -1px 3px #FF62A7;
    -moz-box-shadow: inset -1px -1px 3px #FF62A7;
    -webkit-box-shadow: inset -1px -1px 3px #FF62A7;
    border-radius: 3px;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;    
    font-weight: bold;
}
.required{
    color:red;
    font-weight:normal;
}

divTable{
	display: table;
	width: 100%;
}
.divTableRow {
	display: table-row;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}
.divTableCell, .divTableHead {
	border: 1px solid #999999;
	display: table-cell;
	padding: 3px 10px;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group;
}

 
</style>

<!--<script> 
$(function() {
  $('#empin').on('input',function() {
    var opt = $('option[value="'+$(this).val()+'"]');
    
    alert(opt.length ? opt.attr('id') : 'NO OPTION');
  });
});
</script>-->
 <script type="text/javascript">
 // $('#combobox').selectize({create: true,sortField: 'text'});

 // $('combobox').select2();



 function selectionchange()
 { 
 var e = document.getElementById("empin");
 
   // var str = e.options[e.selectedIndex].value;
var str = e.value;
var terminator= str.split(":")[0];
var empid=terminator.split(",")[1];
var splitter=str.split(":")[1];
var brname=splitter.split("/")[0];
var tempdes=str.split("/")[1];
var desig= tempdes.split("+")[0];
var exec= str.split("+")[1];
document.getElementById('outputname').value = str.split(",")[0];
document.getElementById('empid').value =empid;
   document.getElementById('BName').value=brname; 
   document.getElementById('desig').value=desig;
   document.getElementById('exec').value=exec;
 //   alert(str);
 }
  function display()
        {
        
        document.getElementById('lbldel').style.display = 'none';
//        document.getElementById('updatebtn').style.display = 'none';
//        document.getElementById('deletebtn').style.display = 'none';
//        document.getElementById('latedate').style.display = 'none';
        }
    function dekho(evt)
    {  
    var elemid=evt.id;
    var dateto=document.getElementById('todate').value;
    var datefrom=document.getElementById('fromdate').value;
    var empiden=document.getElementById('empid').value;
    if (!dateto==""&&!datefrom=="")
    { 
    if (elemid=="showmon")
    {document.getElementById('empform').action = "showmonth.jsp";
         document.forms['empform'].submit();
    }    
      if (elemid=="showindiv")
    {
    if (empiden!=null||empiden!='')
    {document.getElementById('empform').action = "oneperson.jsp";
         document.forms['empform'].submit();}
    }  
    }
    else if ((dateto==null||dateto=="")||(datefrom==null||datefrom==""))
    {
    alert("Sir, you didn't enter Date paramters. ");
    
    }
    }
    
   function searchSel() {
    var input  = document.getElementById('empin').value;
    var list   = document.getElementById('combobox'); 
   var lovlist= document.getElementById('lovlist');
    var listItems = list.options;
    var lovItem;
    if(input === '')
    {  listItems[0].selected = true;
       return; }
    for(var i=0;i<list.length;i++) {
          var val = list[i].value.toLowerCase();
         if((val.indexOf(input) == 0) ){  list.selectedIndex = i;
         
         
         }    } return;  }  
    //     for(var j=1;j<=val.length;j++)  {
    //      if((val.indexOf(input) == j) ){      
            // lovlist.add(val,i);                   
    //       var opt = document.createElement("option");
 //  opt.value= i;
 //  opt.innerHTML = val; 
 //  lovlist.appendChild(opt);                    
                 
        //  }    }  
         
        
 </script> 
  
    </head>
    <body onload=display()>
   
    <center>
    <div class="form-style-3">
    <form id="empform" name="empform" method="GET">
    <span valign="left">
    <img alt="EFU General Insurance" src="resources/images/efu-name30.gif" width=305 height=20/>
    </span>
            <img alt="EFU General Insurance "  src="head1.jpg" height="48%" width="100%" />
  
   <c:if test="${not empty param.inform}">
   <%
   session.setAttribute("inform", request.getParameter("inform").toString());
   %>
   </c:if>
   <c:if test="${ empty param.inform}"> 
   <%session.setAttribute("inform", "not-informed");%>
   </c:if>
   <%
   int iterator=0;
       if (request.getParameter("timebtn")!=null)  {
     
    String temperator="";
    DBCoding db = new DBCoding();
  
    String success=" Status for time entry : ";
  String inform="";
 String id="";
    String timevalue="";
   
    String userval=request.getParameter("userval").toString();
 String  date= request.getParameter("dateheader");
    String pastdate =request.getParameter("pastdate");
    
 inform =session.getAttribute("inform").toString();
    id = request.getParameter("empid");
   timevalue= request.getParameter("latetime");
  
 
   if(pastdate != null && !pastdate.isEmpty())
   {  SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
  
     SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy");
    Date dol =null;
   try{ dol=format1.parse(pastdate);
   date=format2.format(dol) ;
}
catch ( Exception e) {
            out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+e.getMessage()+"');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");
        }
     }
    
   if(!date.isEmpty()&&!timevalue.isEmpty()&&!id.isEmpty()){
   try{ 
   
   
temperator= db.insert2(id, timevalue, date, inform,userval);  
   success+=" "+temperator;
 } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");    
    }
    iterator=+1;
   session.setAttribute("iterator", iterator);
    out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+success.toString()+"');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");
   }else{ out.println("<script type=\"text/javascript\">");  
   out.println("alert('date or id or time not entered');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");}
   
   }
   //yesterday
   else if (request.getParameter("yestimebtn")!=null)  {
     
    String temperator="";
    DBCoding db = new DBCoding();
  
    String success=" Status for time entry : ";
  String inform="";
 String id="";
    String timevalue="";
   
    String userval=request.getParameter("userval").toString();
 String  date= request.getParameter("yesterdate");
   
    
 inform =session.getAttribute("inform").toString();
    id = request.getParameter("empid");
   timevalue= request.getParameter("latetime");
   
   if(!date.isEmpty()&&!timevalue.isEmpty()&&!id.isEmpty()){
   try{ 
    
temperator= db.insert2(id, timevalue, date, inform,userval);  
   success+=" "+temperator;
 } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");    
    }
    iterator=+1;
   session.setAttribute("iterator", iterator);
    out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+success.toString()+" For Yesterday"+"');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");
   }else{ out.println("<script type=\"text/javascript\">");  
   out.println("alert('date or id or time not entered');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");}
   
   }
   //daybeforeyes 
   else   if (request.getParameter("daybeforetimebtn")!=null)  {
     
    String temperator="";
    DBCoding db = new DBCoding();
  
    String success=" Status for time entry : ";
    String inform="";
    String id="";
    String timevalue="";
   
    String userval=request.getParameter("userval").toString();
    String  date= request.getParameter("daybeforeyes");
   
    
    inform =session.getAttribute("inform").toString();
    id = request.getParameter("empid");
   timevalue= request.getParameter("latetime");
   
   if(!date.isEmpty()&&!timevalue.isEmpty()&&!id.isEmpty()){
   try{ 
    
   temperator= db.insert2(id, timevalue, date, inform,userval);  
   success+=" "+temperator;
   } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");    
    }
    iterator=+1;
   session.setAttribute("iterator", iterator);
    out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+success.toString()+" For Yesterday"+"');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");
   }else{ out.println("<script type=\"text/javascript\">");  
   out.println("alert('date or id or time not entered');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");}
   
   }
   //twodaysbeforeyesterday 
   else if (request.getParameter("twodaybeforetimebtn")!=null)  {
     
    String temperator="";
    DBCoding db = new DBCoding();
  
    String success=" Status for time entry : ";
    String inform="";
    String id="";
    String timevalue="";
   
    String userval=request.getParameter("userval").toString();
    String  date= request.getParameter("twodaysbeforeyes");
   
    
    inform =session.getAttribute("inform").toString();
    id = request.getParameter("empid");
   timevalue= request.getParameter("latetime");
   
   if(!date.isEmpty()&&!timevalue.isEmpty()&&!id.isEmpty()){
   try{ 
    
   temperator= db.insert2(id, timevalue, date, inform,userval);  
   success+=" "+temperator;
   } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");    
    }
    iterator=+1;
   session.setAttribute("iterator", iterator);
    out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+success.toString()+" For Yesterday"+"');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");
   }else{ out.println("<script type=\"text/javascript\">");  
   out.println("alert('date or id or time not entered');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");}
   
   }
       else if (request.getParameter("updatebtn")!=null)  {
        String userval=request.getParameter("userval").toString();
     String  inform =session.getAttribute("inform").toString();
String date ="";
    String temperator="";
    DBCoding db = new DBCoding();
    String success=" Status for time entry : ";
 String id="";
    String timevalue="";
   date= request.getParameter("latedate");
  
    id = request.getParameter("empid");
   timevalue= request.getParameter("latetime");
   if(!date.isEmpty()&&!timevalue.isEmpty()&&!id.isEmpty()){
   try{ 
temperator= db.update(id, timevalue, date,inform,userval);  
   success+=" "+temperator;
 } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");    
    }
    out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+success.toString()+"');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");
  }else{ out.println("<script type=\"text/javascript\">");  
   out.println("alert('date or id or time not entered');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");}
  
  }
     else  if (request.getParameter("deleteall")!=null)  {
    String userval=request.getParameter("userval").toString(); 
String date ="";
    String temperator="";
    DBCoding db = new DBCoding();
    String success=" Status for time entry : ";
 String id="";
    String value="";
   date= request.getParameter("latedate");
   
  
   if(!date.isEmpty()||!id.isEmpty()){
   try{ 
   temperator= db.purgeall(date,userval );  
 
   success+=" "+temperator;
   
 } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");    
    }
    
    out.println("<script type=\"text/javascript\">");  
    out.println(" document.getElementById('lbldel').style.display = 'block';");
     out.println(" document.getElementById('lbldel').value = 'delete successful for "+id+" for date "+date+"';");
    out.println("location='Employeelist.jsp';");
  // out.println("alert('"+success.toString()+"');");
   out.println("</script>");
   }
   else{ out.println("<script type=\"text/javascript\">");  
   out.println("alert('date or id not entered');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");}
   
   }
  else  if (request.getParameter("deletebtn")!=null)  {
    String userval=request.getParameter("userval").toString();
String date ="";
    String temperator="";
    DBCoding db = new DBCoding();
    String success=" Status for time entry : ";
 String id="";
    String value="";
   date= request.getParameter("latedate");
    id = request.getParameter("empid");
  
   if(!date.isEmpty()||!id.isEmpty()){
   try{ 
temperator= db.delete(id, date,userval);  
   success+=" "+temperator;
   
 } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");    
    }
    
    out.println("<script type=\"text/javascript\">");  
    out.println(" document.getElementById('lbldel').style.display = 'block';");
     out.println(" document.getElementById('lbldel').value = 'delete successful for "+id+" for date "+date+"';");
    out.println("location='Employeelist.jsp';");
  // out.println("alert('"+success.toString()+"');");
   out.println("</script>");
   }
   else{ out.println("<script type=\"text/javascript\">");  
   out.println("alert('date or id not entered');");
   out.println("location='Employeelist.jsp';");
   out.println("</script>");}
   
   }
   else if((request.getParameter("deletebtn")==null)&&(request.getParameter("updatebtn")==null)
   &&(request.getParameter("updatebtn")!=null)
   ) {
   if (iterator<1){
   session.setAttribute("iterator", iterator);
   }
   }
    %>  
    <%
    String sysdate ="";
    String yester ="";
    String daybeforeyes ="";
    String twodaysbeforeyes ="";
    Connection con=null;
              Statement state1=null;
              
           try{Class.forName("oracle.jdbc.driver.OracleDriver");
            //con = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
            //con = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
             
            con =    
           //        DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");         
       //     DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
           // DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
           DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
           //DBCoding db = new DBCoding();
          // db.connect();
          // con= db.getConner();
             state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);}
        catch(Exception ex){
         out.println("There is something wrong with the first class call: " + ex);
        }
           String qu =    " Select TRIM(to_char(sysdate)) as now_date, TRIM(to_char(sysdate-1)) as yester, ";
                  qu =qu+ " TRIM(to_char(sysdate-2)) as daybeforeyes,TRIM(to_char(sysdate-3)) as twodaybeforeyes  from dual ";
             ResultSet rs4=null;             
             try{
       rs4= state1.executeQuery(qu);
                } 
                catch(Exception ex){
                out.println("There is something wrong with date query: " + ex);
                }
                
            while(rs4.next())
            {    
    sysdate = rs4.getString(1);
    yester = rs4.getString(2);
    daybeforeyes = rs4.getString(3);
    twodaysbeforeyes = rs4.getString(4);
    
    } con.close();
    %>
   <%
    
    //ArrayList<String> list1 = new ArrayList<String>();
   
         DBCoding db1=new DBCoding();
      //   db1.connect();
         String[] list1=db1.getAllEmployee();
      
 %>

  <input type="hidden" name="dateheader" id="dateheader" value="<%=sysdate%>"/>
   <input type="hidden" name="yesterdate" id="yesterdate" value="<%=yester%>"/>
    <input type="hidden" name="daybeforeyes" id="daybeforeyes" value="<%=daybeforeyes%>"/>
     <input type="hidden" name="twodaysbeforeyes" id="twodaysbeforeyes" value="<%=twodaysbeforeyes%>"/>
     
  <input type="hidden" id="userval" name="userval" value="<%=session.getAttribute("userid")%>"/>
  <input type="hidden" id="requestemp" name="requestemp" value="<%=session.getAttribute("URIPACKET")%>"/>
<fieldset><legend>Employee Details</legend>
<label for="empin"><span> Name Input</span>
<input  type="text" class="input-field" list="combobox" onchange="selectionchange()" placeholder="Enter Name Input" id="empin" name="empin" />
<!--onkeypress="searchSel()"-->
<!--<input onkeypress="searchmidSel()" type="text" class="input-field" placeholder="Enter Middle Name" id="empmidin" name="empmidin" />-->
</label>

<label for="empid"><span>EmpID </span><input type="text" class="input-field" placeholder=" EmpID" id="empid" name="empid" /></label>
<label for="outputname"><span>Name </span><input type="text" class="input-field" id="outputname" name="outputname" /></label>
<label for="BName"><span>Branch Name </span><input type="text" class="input-field" placeholder="Branch Name" id="BName" name="BName" /></label>
<label for="desig"><span>Designation </span><input type="text" class="input-field"  id="desig" name="desig"  /></label>
<label for="exec"><span>Exec Status </span><input type="text" class="input-field"  id="exec" name="exec"  /></label>
<label for="inform"><span>Informed </span>

<select class="input-field"  id="inform" name="inform" style="width:55%;"><option value=""></option>
 <option value="absent">absent</option> <option value="informed">informed</option><option value="not-informed" >not informed</option>
</select>

</label>
<!--<label for="lovlist"><span>Select Employee :</span><select class="chosen" name="lovlist" id="lovlist" color="green" onchange="selectchange()" style="column-width:400px;">
   </select> </label>-->
<div ><datalist  name="combobox" id="combobox"  >
   <!--onchange="selectionchange()"  style="column-width:400px;" color="green" -->
    <option selected="selected" value= "Please Select" name="field4" class="select-field">Please Select</option>
    <%
       for(int i=0; i<list1.length; i++)  
    { %>
    <option color="blue" value= "<%=list1[i] %>" ><%=list1[i] %></option>
 <% }%></datalist> </label></div>
 <label for="latetime"><span>Enter Time </span><input type="time" min="09:00" max="19:00" class="input-field"  id="latetime" name="latetime"  /></label>

<label for="pastdate"><span>Previous Date </span><input type="date" class="input-field"   name="pastdate" id="pastdate" /> </label>

<label><span>&nbsp;</span><input type="submit" name="timebtn" id="timebtn" formaction="Employeelist.jsp" value="Submit today Late" />
</label>

<label><span>&nbsp;</span><input type="submit" name="yestimebtn" id="yestimebtn" formaction="Employeelist.jsp" value="Submit Yesterday" />
</label>

<label><span>&nbsp;</span><input type="submit" name="daybeforetimebtn" id="daybeforetimebtn" formaction="Employeelist.jsp" value="Submit 2 days before today" />
</label>

<label><span>&nbsp;</span><input type="submit"  name="twodaybeforetimebtn" id="twodaybeforetimebtn" formaction="Employeelist.jsp" value="Submit 3 days before today" />
</label>
 <%--<% int iter=   Integer.parseInt(session.getAttribute("iterator").toString());%>
 <% if(iter>0){%>--%>
  Executive Status<input type="checkbox" value="1" id="execheck" name="execheck"
                                                title="Executive Status" alt="off"/>  
                                                
   <input type="submit" onclick="dekho(this)" name="showmon" id="showmon" value="Show All" style="min-width:2%; max-width:42.5%;float:left; margin-left:6%;" />
 
      <div class="tooltip" style="margin-left:4%;min-width:2%; max-width:46%;float:left;">
        <input type="submit" onclick="dekho(this)" name="showindiv" id="showindiv" value="Show Individual"/>
  <span class="tooltiptext"> Select Emp.ID First </span>
    
    </div>
                                 
 <table><tr><td colspan="6"><input type="date" class="input-field"   id="fromdate" name="fromdate"  /></td>
 <td colspan="1"> TO &nbsp;&nbsp;&nbsp;</td><td colspan="6"><input type="date" class="input-field"  id="todate" name="todate"  /></td></tr></table>
 <label><span>&nbsp;</span><input type="submit" name="showday" id="showday" formaction="showdatanow.jsp" value="Show Daily" /></label>
 <%--<% } %>--%>
 <label>Update Delete Entry</label> <!--<input type="checkbox" id="upcheck" name="upcheck" value="1"/>-->
 <input type="submit" name="updatebtn" id="updatebtn" formaction="Employeelist.jsp" value="Update" />
 <input type="submit" name="deletebtn" id="deletebtn" formaction="Employeelist.jsp" value="Delete" />
 

<!--<div class="divTable">
<div class="divTableBody">
<div class="divTableRow">
--><!--<div class="divTableCell"><label onclick="alert('Disable delete button');document.getElementById("deleteall").style.display='block';" >E&nbsp;</label> </div>--><!--

      <div class="page__container">   
        <label class="switch switch_type1" role="switch">
          <input type="checkbox" class="switch__toggle" onClick="EnableSubmit(this)" />
          <span class="switch__label"></span>
        </label>
                 
      </div>
   
<div class="divTableCell"><input class="dltbtn" type="submit" name="deleteall" id="deleteall" formaction="Employeelist.jsp" value="Purge All" /> </div>
</div>
<div class="divTableRow">
--><!--<div class="divTableCell"><label  onclick="alert('Disable delete button');document.getElementById("deleteall").style.display='none';">D&nbsp;</label> </div>--><!--
 <script>
 EnableSubmit = function(val)
{
    var sbmt = document.getElementById("deleteall");

    if (val.checked == true)
    {
        sbmt.disabled = false;
    }
    else
    {
        sbmt.disabled = true;
    }
}       
 </script>

</div>
</div>
</div>-->

<input type="date" class="input-field"  id="latedate" name="latedate"  />
 <a name="Back" value="Back" href="attendance1.jsp"> Go Back to login </a>
<label id="lbldel" name="lbldel" ></label>
</fieldset>
    
     
  
    </form></div></center>
    </body>
</html>