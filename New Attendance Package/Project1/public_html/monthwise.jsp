<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,View.DBCoding" %>
<%@ page import="java.io.*,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="now" value="<%=new java.util.Date()%>" />



<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
     <title>showmonthwise</title>
    <link rel="stylesheet" type="text/css" href= "resources/css/attres.css" media="screen" />
        <script src="resources/js/jquery.table2excel.js"></script>

      <% int pageno=0;
      if((request.getParameter("nextbtn")!=null)||(request.getParameter("prevbtn")!=null)||
      (request.getParameter("firstbtn")!=null))
      { if (request.getParameter("firstbtn")!=null){pageno=1; session.setAttribute("page", pageno);}
      if(request.getParameter("nextbtn")!=null)
      {pageno=Integer.parseInt(session.getAttribute("page").toString());
      pageno=pageno+1;
      
      session.setAttribute("page", pageno);
      if(pageno>8){
      pageno=1;
      session.setAttribute("page", pageno);}
      }if(request.getParameter("prevbtn")!=null)
      {pageno=Integer.parseInt(session.getAttribute("page").toString());
      if(pageno>1){
      pageno=pageno-1;
      session.setAttribute("page", pageno);}
      }
      }else{
      pageno=1;
      session.setAttribute("page",pageno);}   %>



                
    <script>
    
   var tableToExcel = (function () {
        var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:Table><x:Row x:AutoFitHeight="1" ></ss:Row></x:Table><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
        return function (table, name, filename) {
            if (!table.nodeType) table = document.getElementById(table)
            var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }
var months = new Array(12);
months[0] = "January";
months[1] = "February";
months[2] = "March";
months[3] = "April";
months[4] = "May";
months[5] = "June";
months[6] = "July";
months[7] = "August";
months[8] = "September";
months[9] = "October";
months[10] = "November";
months[11] = "December";

var current_date = new Date();
month_value = current_date.getMonth();
day_value = current_date.getDate();
year_value = current_date.getFullYear();
var bname=document.getElementById("branchheader").value;
var filestring=bname+months[month_value]+year_value;
var filestring="To-MD"+months[month_value]+year_value;
            document.getElementById("dlink").href = uri + base64(format(template, ctx));
            document.getElementById("dlink").download = filestring;
            document.getElementById("dlink").click();

        }
    })()

    function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
    function returnpage()
    {
    window.location = '/attendance1.jsp';
    }
    

    
    </script>  
    <style>
.msgbox{
margin:0;
width:508px;
border:hidden ;
 }  
.section {
	clear: both;
	padding: 0px;
	margin: 0px;}
/*  GROUPING  */
.group:before,
.group:after { content:""; display:table; }
.group:after { clear:both;}
.group { zoom:1; /* For IE 6/7 */ }  
table {
    border-collapse: collapse;
    border-spacing: 4.0pt;
    max-width:100%;
    border: 2px solid #ddd;
    position:relative; 
    }
th{
    border: none;
    text-align: left;
    padding: 8px;
    }
    td{
    text-align: left;
    
    padding: 8px;
   }
  .style23 {
  font:Helvetica  ;
  font-size: 12px;
  
 }
 
    </style>
    </head>
    <body>
    <form name="display" id="display" action="insert.jsp" method="POST" >
    <span valign="left"><img alt="EFU General Insurance"
            src="resources/images/efu-name30.gif" width=305 
            
            height=20></span>
            <img alt="EFU General Insurance " valign="centre" src="head1.jpg" height="90%" width="90%" />
    <%
    String sysdate ="";
    Connection con=null;
              Statement state1=null;
              
           try{Class.forName("oracle.jdbc.driver.OracleDriver");
            //con = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");   
            con =  
           //   DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");      
            DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
            
            
             state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);}catch(Exception ex){}
           String  qu = "Select TRIM(to_char(sysdate)) as now_date from EFU_MAST.BRANCHES br";
            
             ResultSet rs4=null;             
             try{
       rs4= state1.executeQuery(qu);
                } 
                catch(Exception ex){
                out.println("There is something wrong with date query: " + ex);
                }
            while(rs4.next()){    
    sysdate=rs4.getString(1);}con.close();
    %>
    <div >
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <c:if test="${not empty param.BName}">
   <% session.setAttribute("BName", request.getParameter("BName"));%>
</c:if>
    <P style=" font:'Arial narrow';font-size:12.5pt;">
    <b>&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("BName")%></b><b >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("selmon").toString()%>
       </b><b >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sysdate%>
       </b></P>
    <p></p>
    <p></p>
    <p></p>
       <center><div id="maindiv" class="style23" >
      <div id="printableArea"><TABLE id="table2excel" border="1">
                <TR>
                    <TH>Sr.#</TH>
                    <TH colspan="1">EMP ID</TH>
                    <TH colspan="2">Employee Name</TH>
                    <TH colspan="2">Designation</TH>
                    <TH colspan="1">Branch/Unit</TH>
                 <%  String brname="";
                 session.setAttribute("BName", request.getParameter("BName"));
                  brname=session.getAttribute("BName").toString();
                 String tempmonth=request.getParameter("selmon").toString();
                 String monthinput=tempmonth.substring(5,7);
                 if (brname.equals("M.D's Secretariat")){brname="M.D''s Secretariat";}
                 String Query2="SELECT to_char(ea.ATTENDANCE_DATE,'dd-mm-yyyy') FROM Employee_attendance ea "; 
       Query2=Query2+"JOIN  efu_pis.vw_employee ed on (ea.emp_no=ed.emp_no) ";
        Query2=Query2+"where to_char(ea.ATTENDANCE_DATE,'yyyy-mm')='"+tempmonth+"' and ";
        Query2=Query2+"TRIM(ed.BRANCH_NAME)='"+brname+"'GROUP BY";
       Query2=Query2+" ea.ATTENDANCE_DATE ORDER BY ea.ATTENDANCE_DATE DESC ";
      
       ResultSet rs3=null; 
       try{
       Statement state3;
       //Connection conner= DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
       Connection conner=
     //    DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");      
       DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
       state3=conner.createStatement();
       rs3= state3.executeQuery(Query2);}
       catch(Exception ex){
                out.println("There is something wrong with second query: " + ex);
                }
      
       try{
       while (rs3.next()){
       
       %>
       <TH><%= rs3.getString(1) %>   </TH>
       <%
    
    } } catch(Exception ex){
                out.println("There is something wrong with second while: " + ex);
                }%>  
                </TR>
            <%String q=null;    
              Connection conn;
              Statement state=null;   
          String brname2=session.getAttribute("BName").toString();
 String tempmonth2=request.getParameter("selmon").toString();
                 String monthinput2=tempmonth2.substring(5,7);
           try{//Class.forName("oracle.jdbc.driver.OracleDriver");
           int count=0;
           if (brname2.equals("M.D's Secretariat")){brname2="M.D''s Secretariat";}
            DBCoding db9= new DBCoding();
            //conn = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
             db9.connect();
             conn=db9.getConner();
             state = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);}catch(Exception ex){}
             q = " SELECT Distinct ea.EMP_NO , TRIM(ed.EMPLOYEE_NAME) Employee_Name";
             q=q+",  TRIM(ED.DESIG_TITLE) Designation, TRIM(ED.BRANCH_NAME) Branch_Name";
             q=q+" FROM Employee_attendance  ea JOIN  efu_pis.vw_employee ed on (ea.emp_no=ed.emp_no)";
             q=q+" where to_char(ATTENDANCE_DATE,'yyyy-mm')='"+tempmonth2+"' and ";
            q=q+" TRIM(ED.BRANCH_NAME)='"+brname2+"'";
            q=q+" GROUP BY ea.EMP_NO,Employee_Name,DESIG_TITLE,BRANCH_NAME order by EMP_NO";
             ResultSet rs1=null;             
             try{
       rs1= state.executeQuery(q);
                } 
                catch(Exception ex){
                out.println("There is something wrong with first query: " + ex);
                }
          try{
          int temp;
         // while (count<100){
          while(rs1.next()){
          %>
          <TR> 
                  <TD> <%=rs1.getRow()%> </TD>
                    <TD colspan="1" style="height:3.0pt;"> <%= rs1.getString(1) %> </TD>
                    <TD colspan="2" style="height:3.0pt;"> <%= rs1.getString(2) %> </TD>
                    <TD colspan="2" style="height:3.0pt;"> <%= rs1.getString(3) %> </TD>
                    <TD colspan="1" style="height:3.0pt;"> <%= rs1.getString(4) %> </TD>
    <%  int i=0;
    ResultSet rs9=null;
    String tempemp=rs1.getString(1);
     String brname3=session.getAttribute("BName").toString();
     String tempmonth3=request.getParameter("selmon").toString();
                 String monthinput3=tempmonth2.substring(5,7);
                 if (brname3.equals("M.D's Secretariat")){brname3="M.D''s Secretariat";}
    String Query="SELECT to_char(ATTENDANCE_DATE) ad, to_char(EMPLOYEE_IN,'HH:MI:SS') ei FROM Employee_attendance "; 
        Query=Query+"where to_char(ATTENDANCE_DATE,'yyyy-mm')='"+tempmonth3+"' and EMP_NO='" ;
       Query=Query+tempemp+"' GROUP BY ATTENDANCE_DATE, EMPLOYEE_IN ORDER BY ATTENDANCE_DATE DESC";
     String q9="SELECT to_char(ea.ATTENDANCE_DATE) ad FROM Employee_attendance ea "; 
       q9=q9+"JOIN  efu_pis.vw_employee ed on (ea.emp_no=ed.emp_no) ";
        q9=q9+"where to_char(ea.ATTENDANCE_DATE,'yyyy-mm')='"+tempmonth3+"' and ";
        q9=q9+" TRIM(ED.BRANCH_NAME)='"+brname3+"'";
       q9=q9+" GROUP BY ea.ATTENDANCE_DATE ORDER BY ea.ATTENDANCE_DATE DESC";
       ResultSet rs6=null; 
    String temperator1="";
    String temperator2="";
    int m=0; int size= 0;
   Connection conner=null;
       try{
       Statement state6;
       Statement state9;
        //conner= DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
        conner=  DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
       state6=conner.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
       state9=conner.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
       rs9=state9.executeQuery(q9);
         
       rs6= state6.executeQuery(Query);}
       catch(Exception ex){
                out.println("There is something wrong with third query: " + ex);
                }
                int h=1;
       try{
       while (rs6.next()){
       while (rs9.next()){
       temperator1=rs9.getString("ad");
       temperator2=rs6.getString("ad");
          // for( m=0;m<strlist.size()-1;m++)
     // {
       // temperator1=strlist.get(m);
      if ( temperator1.equals(temperator2)){%>
       <td><%= rs6.getString(2) %>   </td>
       <%} else {%>
       <td> &nbsp;- -&nbsp; </td>
       <%}
      // } 
    
    }
    }
//    }
    } 
    catch(Exception ex){
                out.println("There is something wrong with second while: " + ex);
                }conner.close();
                %>
        
        </TR> <% } } 
                catch(Exception exf){
                out.println("There is something wrong with while block: " + exf);
                }%>
            </TABLE></div></div>
            
    <TABLE style="max-width:99.0%;">
        <TBODY>
        
        <TR>
          <TD class=magsnet width="61%" align="left" colspan=3>&nbsp;&nbsp; Copyright EFU General Pakistan</TD>
         
             <TD  width="170px" align="right" colspan=2>
              <a name="Back" value="Back" href="attendance1.jsp"> Go Back </a>
<!--<input width="170" type="submit" name="Back" value="Back" class="linkblue" formaction="attendance1.jsp"/>-->
</td>


<td width="170" align="right" colspan=2>
<input width="170" class="linkblue" id="print"  type="button" name="Print" value="Print" onClick="printDiv('printableArea')" />
<a id="dlink"  style="display:none;"></a></td>
<td colspan=3 width="200" align="right">
<input width="200" type="button" onclick="tableToExcel('table2excel', 'name', 'myfile.xls')" value="Export to Excel">
</TD>
        </TR>
        
          </TBODY></TABLE>
          </center>
    </div></form>
    </body><%DBCoding db3 = new DBCoding();
                 db3.disconnect();%>
</html>



