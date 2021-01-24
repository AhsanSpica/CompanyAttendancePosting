<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,View.DBCoding" %>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat,java.text.DateFormat,java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
     <title>insert</title>
     <% 
String date ="";
    String temperator="";
    DBCoding db = new DBCoding();
   //  String[] idArray;
  //  String[] vArray;
    String success=" Status for time entry : ";
    String key="";
    String vCode="";
    boolean match=false;
     int i=1;
     int j=0;
     Date dater=null;
 String id="";
    String value="";
   date= request.getParameter("dateheader");
    Enumeration keys = request.getParameterNames();
    while (keys.hasMoreElements() )
    {
     key = (String)keys.nextElement();
     vCode = key.substring(0,4); 
  if (vCode.equals("time"))
  {
  match=true;
 // value=request.getParameter(""+"");
    value = request.getParameter(key);
   
    SimpleDateFormat df = new SimpleDateFormat("hh:mm");
  df.setLenient(false);
  
    if(!value.equals(null)&&!value.isEmpty()){ 
   
  //if (df.parse(value).equals(true))
  if(key.length()==8){
   id= key.substring(4,8);}
   else if(key.length()==7){
   id= key.substring(4,7);}
   try
  
   { 
   //if(dater==df.parse(value))
   // {
     dater=df.parse(value);
    int sHours = Integer.parseInt(value.split(":")[0]);
        int sMinutes = Integer.parseInt(value.split(":")[1]);
  
  if (sHours<13){
  
  if(sHours==9){
  if(sMinutes>30&&sMinutes<61){
   
   temperator= db.insert(id, value, date);  
   success+=i+" "+temperator;
   i++;}else{
    success+=i+" "+"Entered an incorrect time value above 00-60 for id "+id;
   }
    } else if (sHours>9||sHours==4||sHours==3||sHours==2||sHours==1)
    { if(sMinutes>=0&&sMinutes<61){
  
   temperator= db.insert(id, value, date);  
   success+=i+" "+temperator;
   i++;}else{
    success+=i+" "+"Entered an incorrect time value above 00-60 for id "+id;
   }
    }
    else if (sHours<9&&sHours!=4&&sHours!=3&&sHours!=2&&sHours!=1) {
    success+=i+" "+"Entered a time before 9 am for id "+id;
   }
    }else{
    success+=i+" "+"Please enter time in 12 hr Format for id "+id;
   }
  
// } 
// else{
// success+=i+" "+"Entered a time not matching time format";}
 } 
  catch(Exception ex){
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('Incorrect Time Parse Error :  "+ex+" for id : '"+id+");");
   out.println("location='attendance.jsp';");
   out.println("</script>");    
    }
  } 
   } }
    out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+success.toString()+"');");
   out.println("location='attendance.jsp';");
   out.println("</script>");
    %>   
    </head>
    <body>
      <%--<c:out value="${sessionScope.id}"/>
    <c:out value="${sessionScope.time}"/>--%>
  <!--'All insertion successful'-->
   <!-- success.toString()-->
  <!-- else{ success+=i+" "+"You entered empty values";}-->
    </body>
</html>