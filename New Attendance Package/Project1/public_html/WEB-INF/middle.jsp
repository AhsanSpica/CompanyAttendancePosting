<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.sql.*,java.util.ArrayList, View.DBCoding " %>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>middle</title>
  </head>
  <body>
  
  <%
    String tag ="";
   tag= request.getParameter("t");
   
 
     ArrayList lister = new ArrayList();
      DBCoding db1=new DBCoding();
   //  String hotelResult[]= new String[10];
   String name="";
  
   int j=0;
   String query="";
  String  repenter=" ";

if (tag.equals("login"))
   {
   String login = request.getParameter("logid");
    String pass2 = request.getParameter("pass");
   String truer="false";
  
  truer=db1.login(login, pass2);
  out.println("|"+truer+"|");
  
   } 
  
  
  
  %>
  
  
  </body>
</html>