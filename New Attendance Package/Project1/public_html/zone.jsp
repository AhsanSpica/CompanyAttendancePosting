<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,view.DBCoding" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
   <title>Select_Zone</title>
    <link rel="stylesheet" type="text/css" href= "resources/css/attres.css" media="screen" />
   
    <style>
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
 DIV.select{
  column-width: 400px;
  position: relative;
  left: 25%;
  top: 75%;
 }
 .button{
  alignment-adjust: central;
  max-width: 222px; 
  max-height: 200px; 
 }
   </style>
    <script>
    function postforward(){
    document.forms["formname"].submit();
        document.getElementById("form_id").action = "attendance.jsp";
    }
    function abc()
    {   //var bname=document.getElementById("BName");
      //  var strUser = bname.options[e.selectedIndex].value;
        document.forms["formname"].submit();
        document.getElementById("form_id").action = "zone.jsp";
      //  alert("Hi the branch name : "+strUser); 
        }
    </script>
    
    </head>
    <body style="overflow-x:hidden;">
    <form name="formname" id="formname" action="attendance1.jsp" method="POST" >
    <span valign="left">
    <img alt="EFU General Insurance" src="resources/images/efu-name30.gif" width=305 height=20/>
    </span>
            <img alt="EFU General Insurance "  src="head1.jpg" height="100%" width="100%" />
     <center> <div class="select">
<select color="green" name="zonelist" id="zonelist" onchange="abc()" >
    <option value= "PleaseSelect" selected="selected" >PleaseSelect</option>
    <option color="blue" value= "Head_Office" >Head_Office</option>
<option color="blue" value= "South_Zone" >South_Zone</option>
   <option color="blue" value= "North_Zone" >North_Zone</option>
   <option color="blue" value= "All_Zones" >All_Zones</option>
</select></div></center>
    
   
    </form>
    </body>
</html>