<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,View.DBCoding" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>Select_Branch</title>
    <link rel="stylesheet" type="text/css" href= "resources/css/attres.css" media="screen" />
   <% try{
  
          if (request.getParameter("empid")==null){
      if (session== null){
         session.setAttribute("URIPACKET", "NULL VALUE FROM REQUEST PAGE");
 session.setAttribute("userid", "NULL VALUE FROM REQUEST PAGE");
   %><jsp:forward page="http://adf.efuinsurance.com:9003/App_IT_Service/login.jsp" />
   <%}}
   else  { 
  if (session== null){ session.setAttribute("session", "True");}
   session.setAttribute("userid", request.getParameter("empid").toString());
       session.setAttribute("URIPACKET", "REQUEST FROM PAGE");}
  
   }catch(Exception ex)
       {out.println("the empiod check block  "+ex.getMessage());}
   %>
   
   
   <style type="text/css">
   table {
    border-collapse: collapse;
    border-spacing: 0;
    
    position:relative;   }
th{
    border: none;
    text-align: left;
    padding: 8px;
    }
    td{
    text-align: left;
    
    padding: 100px;
   }
  .style23 {
  font:Helvetica  ;
  font-size: 12px;
  width:auto;
 }
 select{text-align:center;
margin-left:auto;
margin-right:auto;}
  DIV.select{
  column-width: 400px;
  position:relative;
 left:25%;
 top:76%;
 }
 .btncontainer{max-width: 500px; }
 .button{
  alignment-adjust: central;
  max-width: 222px; 
  max-height: 200px; 
 }
   </style>
  
   <style type="text/css">
.form-style-1 {
    margin:10px auto;
    max-width: 400px;
     background: #495C70;
    padding: 20px 12px 10px 20px;
    font: 13px "Lucida Sans Unicode", "Lucida Grande", sans-serif;
}
.form-style-1 li {
    padding: 0;
    display: block;
    list-style: none;
    margin: 10px 0 0 0;
}
.form-style-1 label{
    margin:0 0 3px 0;
    padding:0px;
    display:block;
    font-weight: bold;
}
.form-style-1 input[type=text], 
.form-style-1 input[type=date],
.form-style-1 input[type=datetime],
.form-style-1 input[type=number],
.form-style-1 input[type=search],
.form-style-1 input[type=time],
.form-style-1 input[type=url],
.form-style-1 input[type=email],
textarea, 
select{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    border:1px solid #BEBEBE;
    padding: 7px;
    margin:0px;
    -webkit-transition: all 0.30s ease-in-out;
    -moz-transition: all 0.30s ease-in-out;
    -ms-transition: all 0.30s ease-in-out;
    -o-transition: all 0.30s ease-in-out;
    outline: none;  
}
.form-style-1 input[type=text]:focus, 
.form-style-1 input[type=date]:focus,
.form-style-1 input[type=datetime]:focus,
.form-style-1 input[type=number]:focus,
.form-style-1 input[type=search]:focus,
.form-style-1 input[type=time]:focus,
.form-style-1 input[type=url]:focus,
.form-style-1 input[type=email]:focus,
.form-style-1 textarea:focus, 
.form-style-1 select:focus{
    -moz-box-shadow: 0 0 8px #88D5E9;
    -webkit-box-shadow: 0 0 8px #88D5E9;
    box-shadow: 0 0 8px #88D5E9;
    border: 1px solid #88D5E9;
}
.form-style-1 .field-divided{
    width: 49%;
}

.form-style-1 .field-long{
    width: 100%;
}
.form-style-1 .field-select{
    width: 100%;
}
.form-style-1 .field-textarea{
    height: 100px;
}
.form-style-1 input[type=submit], .form-style-1 input[type=button]{
    background: #4B99AD;
    padding: 8px 15px 8px 15px;
    border: none;
    color: #fff;
}
.form-style-1 input[type=submit]:hover, .form-style-1 input[type=button]:hover{
    background: #4691A4;
    box-shadow:none;
    -moz-box-shadow:none;
    -webkit-box-shadow:none;
}

.form-style-1 .required{
    color:red;
}

   </style>
   
    <%session.setAttribute("session", "True");
    
   
    %>
    <script>
    function newPage(num) {
var url=new Array();
url[0]="attendance.jsp";
url[1]="showdatanow.jsp";
url[2]="showmonth.jsp";
 if(num==0){document.getElementById("formname").action = "attendance.jsp";
        document.forms["formname"].submit();}
else if(num==1){document.getElementById("formname").action = "showdatanow.jsp";
        document.forms["formname"].submit();}
else if(num==2){document.getElementById("formname").action = "showmonth.jsp";
        document.forms["formname"].submit();}
else if(num==3){document.getElementById("formname").action = "monthwise.jsp";
        document.forms["formname"].submit();}
//window.location=url[num];
}
    function returnpage()
    {
    window.location = '/zone.jsp';
    }
    var u = ["Tharani","furqan"];
 var p = ["7896","8765"];
 

        function checkcred()
        {var user = document.getElementById("user");
        var pass=document.getElementById("pass");
        //alert("user "+user.value+"pass "+pass.value);
        var userstr=user.value;
        var passstr=pass.value;
        var tempuser="";
        var tempass="";
       
       
//       $.ajax({
//      type: 'POST',
//      url: 'liason.jsp',
//      data: {pass:pass, logid:user, t:"login"},
//      success: function(code) {
//   
//   
//        var datar = code.split("|");  
//     var truer=datar[1];
//      if (logid=="3213"){truer="true";}
//         if(truer!="true"){ 
//          $('#msgdisp').append('<ul>');
//     
//     
//         document.getElementById('msgdisp').style.display = 'block';
//         document.getElementById('msgdisp').style.color = "red";
//       document.getElementById('msgdisp').innerHTML=thrownError+":   Login not Successfull." ;
//
//  setTimeout(function () {
//                $("#msgdisp").hide(); $("#msgdisp").html('');
//            }, 5 * 1000);}
//         else { 
//            logid=datar[2];
//            brcode=datar[3];
//                $("#msgdisp").html("Login Successful");
//                window.location.href="compl_main.jsp?empid="+logid+"&brcode="+brcode;
//  
//
//         }
//      },
//      error: function(xhr, ajaxOptions, thrownError) {
//             document.getElementById('msgdisp').style.display = 'block';
//
//        document.getElementById('msgdisp').style.color = "red";
//       document.getElementById('msgdisp').innerHTML=thrownError+":    Login not Successfull." ;
//
//  setTimeout(function () {
//                $("#msgdisp").hide(); $("#msgdisp").html('');
//            }, 5 * 1000);
//    
//      }
//      });
        for(var i=0; i<=u.length-1; i++)
       {
       tempuser=u[i];
        tempass=p[i]; 
       if((user.value==="Tharani"&&pass.value==="7896")||(user.value==="furqan"&&pass.value==="8765")
       ||(user.value==="tharani"&&pass.value==="7896")||(user.value==="Furqan"&&pass.value==="8765")
       ){
       
    //  alert("Hello! user name:"+u[i]+"  Password :"+p[i] +"at"+i);
       //document.getElementsById("submit").style.visibility="visible";
       document.getElementById('submit').style.display='block';
       document.getElementById('shownow').style.display = 'block';
        document.getElementById('showmonth').style.display = 'block';
          document.getElementById('monthwise').style.display = 'block';
           document.getElementById('selmon').style.display = 'block';
          
           
           document.getElementById('loglbl').style.display='block';
       document.getElementById('authlbl').style.display = 'block';
        document.getElementById('logsel').style.display = 'block';
          document.getElementById('logmon').style.display = 'block';
           document.getElementById('lblemp').style.display = 'block';
           document.getElementById('empbtn').style.display = 'block';
           
           document.getElementById('brlbl').style.display='block';
       document.getElementById('tolbl').style.display = 'block';
        document.getElementById('curlbl').style.display = 'block';
         
       return true;
       } else {
      //  alert("user name:"+u[i]+"  Password :"+p[i]+"at"+i);
       document.getElementById('submit').style.display='none'; 
       document.getElementById('shownow').style.display = 'none';
        document.getElementById('showmonth').style.display = 'none';
        document.getElementById('monthwise').style.display = 'none';
         document.getElementById('selmon').style.display = 'none';
        
         
          document.getElementById('loglbl').style.display='none';
       document.getElementById('authlbl').style.display = 'none';
        document.getElementById('logsel').style.display = 'none';
          document.getElementById('logmon').style.display = 'none';
           document.getElementById('lblemp').style.display = 'none';
           document.getElementById('empbtn').style.display = 'none';
           
           document.getElementById('brlbl').style.display='none';
       document.getElementById('tolbl').style.display = 'none';
        document.getElementById('curlbl').style.display = 'none';
       return false;}
       }
        }
//         else if (userstr!=u[i]||passstr!=p[i])
//       {  alert('creds dont checkout');
//       return false;
//       }
        function disdrop(){ document.getElementById('BName').style.display = 'block';}
        function display()
        {document.getElementById('submit').style.display = 'none';
       document.getElementById('shownow').style.display = 'none';
        document.getElementById('showmonth').style.display = 'none';
        document.getElementById('monthwise').style.display = 'none';
         document.getElementById('selmon').style.display = 'none';
        
         
            document.getElementById('loglbl').style.display='none';
       document.getElementById('authlbl').style.display = 'none';
        document.getElementById('logsel').style.display = 'none';
          document.getElementById('logmon').style.display = 'none';
           document.getElementById('lblemp').style.display = 'none';
           document.getElementById('empbtn').style.display = 'none';
           
           document.getElementById('brlbl').style.display='none';
       document.getElementById('tolbl').style.display = 'none';
        document.getElementById('curlbl').style.display = 'none';
        }
</script>
    </head>
    
    <body style="overflow-x:hidden;" >
    
    <form method="post" name="formname" id="formname">
   
    <span valign="left">
    <img alt="EFU General Insurance" src="resources/images/efu-name30.gif" width=305 height=20/>
    </span>
            <img alt="EFU General Insurance "  src="head1.jpg" height="48%" width="100%" />
  
     <center> 


   <%
    Connection connection = null;
    ArrayList<String> list1 = new ArrayList<String>();
    ResultSet resultset;
    String Query="";
    String date="";
      if (request.getParameter("zonebt")!=null)  {
    session.setAttribute("session", "True");  
    if (!request.getParameter("zonelist").equals("PleaseSelect"))
         { 
         String zoneid= request.getParameter("zonelist");
         if (zoneid.equals("Head_Office")){zoneid="1";}
         else if(zoneid.equals("South_Zone")){zoneid="2";} 
         else if (zoneid.equals("North_Zone")){zoneid="3";} 
         else if (zoneid.equals("All_Zones")){zoneid="0";} 
         
         try{  Class.forName("oracle.jdbc.driver.OracleDriver");
            //connection = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
            connection = 
           //   DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");      
           DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");     
            //connection =  DriverManager.getConnection("jdbc:oracle:thin:@dg.efuinsurance.com:1521/dg","efu_gis","PRODgis");  
            
           Statement statement = connection.createStatement();      
             Query=Query+"SELECT TRIM(ed.BRANCH_NM) Branch_Name";
             Query=Query+" FROM EFU_MAST.BRANCHES ed ";
             Query=Query+"where";
             if(!zoneid.equals("1")){
             Query=Query+" oracle_start is not null and ";}
             Query=Query+" to_char(close_date,'YYYYMMDD')";
             Query=Query+">= to_char(sysdate,'YYYYMMDD')";
             if (!zoneid.equals("0")){
             Query=Query+" and ZONE_ID="+zoneid;}
             resultset = 
                statement.executeQuery(Query);
    
    
    while (resultset.next()){
    list1.add(resultset.getString(1));   
    }   
    }
    catch(Exception exp)
    {
    out.println("There is something wrong: " + exp);}}}
 %>
 

  <input type="hidden" id="userid" name="userid" value="<%=session.getAttribute("userid")%>"/>
   <input type="hidden" id="requestemp" name="requestemp" value="<%=session.getAttribute("URIPACKET")%>"/>
 <ul class="form-style-1">
 <li> <label>Select Zone : </label>
<select color="green" name="zonelist" id="zonelist"  >
    <option value= "PleaseSelect" selected="selected" >PleaseSelect</option>
    <option color="blue" value= "Head_Office" >Head_Office</option>
<option color="blue" value= "South_Zone" >South_Zone</option>
   <option color="blue" value= "North_Zone" >North_Zone</option>
   <option color="blue" value= "All_Zones" >All_Zones</option>
</select>
 </li><li><input type="submit"  id="zonebt" name="zonebt" value="Get Branches" onclick=" document.getElementById("formname").action = "attendance1.jsp";"/>

 </li>
    <li>
        <label>   Select Branch :</label>
<select name="BName" id="BName" color="green"  style="column-width:400px;">
    <option selected="selected" value= "PleaseSelect" >PleaseSelect</option>
    <%
        for(String list:list1)  
    { %>
    <option color="blue" value= "<%=list %>" ><%=list %></option>

   <% }
    %>
</select>
    </li>
    <!--<li><label name="loglbl" id="loglbl">Login </label><input id="user" name="user" type="text" placeholder="Username" />
    &nbsp;<input id="pass" name="pass" type="password" placeholder="Password" /></li>-->
    <!--<li>
        <label name="authlbl" id="authlbl">Authenticate <span class="required">*</span></label>
         <input type="button" id="credb" name="credb" value="Authenticate" onclick="checkcred()"/>
    </li>-->
   
    <!--<li>
        <label name="logsel" id="logsel">Select Month <span class="required">*</span></label>
        <input id="selmon" value="2017-01"  name="selmon" min="2006-01" max="2020-01" type="month"/> 
    </li>-->
    <!--<li><label name="logmon" id="logmon">View Month-Wise </label>
        <input id="monthwise" name="monthwise" type="submit" onclick="newPage(3)" value="Show Month-wise"/>
    </li>-->
    <li><label name="lblemp" id="lblemp">Fill Employee-Wise </label>
      <input id="empbtn" name="empbtn" type="submit" formaction="Employeelist.jsp" value="Employeelist.JSP"/>
    </li>
    <li><label name="brlbl" id="brlbl">Fill Branch-Wise </label>
       <input id="submit" type="submit" onclick="newPage(0)" value="Fill Branch-Wise"  name="submit" />
    </li>
    <!--<li><label name="tolbl" id="tolbl">View Today </label>
      <input  id="shownow" name="shownow" type="submit" onclick="newPage(1)" value="Show Daily" />
    </li>-->
    <!--<li><label name="curlbl" id="curlbl">View Current Month </label>
      <input id="showmonth"  name="showmonth" onclick="newPage(2)"  type="submit" value="Show Monthly" /> 
    </li>-->
</ul>
                 
<input type="hidden" id="hidden" name="hidden" >

                
            </center>
    
      
    </form>
    </body>
</html>

 