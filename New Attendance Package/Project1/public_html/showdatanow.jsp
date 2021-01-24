<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,View.DBCoding" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
     <title>showdatatoday</title>
    <link rel="stylesheet" type="text/css" href= "resources/css/attres.css" media="screen" />
        <link type="text/css" rel="stylesheet" href="css/newtabledesign.css"/>
        <script>
    function EmailExcel () {
       
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
    if (bname=="Showing all for today"){bname="All";}
    var filestring=bname+day_value+months[month_value]+year_value+".xls";
    document.getElementById("hidpath").value=filestring ;          

         document.getElementById('display').action = "email.jsp";
         document.forms["display"].submit();
     }
     
     
     
    var tableToExcel = (function () {
        var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:Column x:height=”80″/><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
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
  if (bname=="Showing all for today"){bname="All";}
    var filestring=bname+day_value+months[month_value]+year_value;
          
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
    function verifytime()
    { 
    if (iterator<1){
    alert("All input fields are empty");
    return false;
    }
    return true;
    }
    var iterator=0;
    var f = new Array();
 var e = new Array();
 var t = new Array();

function polycheck(evt)
{
var currentChar = parseInt(String.fromCharCode(e.keyCode), 1);
var charCode = (evt.which) ? evt.which : event.keyCode

    if(charCode != 58)
    {if (charCode > 31 && (charCode < 48 || charCode > 57))
       { return false;}
       }
       if(!isNaN(currentChar)){
        var nextValue = $("#txthour").val() + currentChar;

        if(parseInt(nextValue, 1) < 9) return false;
    }
return true;
}
    function alerter(time)
    {
    
    iterator=+1;
    var signal="";
    var empid= time.id.substring(4,8);
   
    var i=0;
    for(i=0; i<=e.length; i++){
    if(e[i]==empid)
    {signal="red";
    t[i]=time.value;
    }
    }if(signal==""){
    e.push(empid);
    if(!time.value==null){
    t.push(time.value);} }
    
  var timeValue = time.value;
   
 // alert("the Time Stamp : "+t+"  The Corresponding Emp ID : "+e);

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

  .style23 {
  font:Helvetica  ;
  font-size: 12px;
  
 }
 
    </style>
    </head>
    <body>
    <form name="display" id="display" >
    <span valign="left"><img alt="EFU General Insurance"
            src="resources/images/efu-name30.gif" width=305 
            
            height=20/></span>
            <img alt="EFU General Insurance " valign="centre" src="head1.jpg" height="90%" width="90%" />
    <%
    String sysdate ="";
    Connection con=null;
              Statement state1=null;
              
           try{Class.forName("oracle.jdbc.driver.OracleDriver");
            //con = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");  
            con =  
          //    DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");      
         DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
              //   DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis");  
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
   <%  
   String temname= request.getParameter("BName"); 
   if (!temname.equals("PleaseSelect")){
   session.setAttribute("BName", request.getParameter("BName"));
   session.setAttribute("brselected", "selected");
   }
   else {session.setAttribute("BName", "Showing all for today");
    session.setAttribute("brselected", "notselected");
   }
   %>
</c:if>
<c:if test="${empty param.BName}">
<%session.setAttribute("brselected", "notselected");  %>
</c:if>
 <c:if test="${not empty param.execheck}">
   <% session.setAttribute("check", request.getParameter("execheck").toString());%>
</c:if>
<c:if test="${ empty param.execheck}">
<%session.setAttribute("check", "off");

%>
</c:if>
<c:if test="${empty param.BName}"><% session.setAttribute("BName","Showing all for today");%></c:if>
    <P style=" font:'Arial narrow';font-size:12.5pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Branch Name :&nbsp;
    <b  style=" font:Helvetica;color:Red;" ><%=session.getAttribute("BName").toString()%></b>
    <b >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sysdate%>
    <input type="hidden" name="dateheader" id="dateheader" value="<%=sysdate%>"/>
    <input type="hidden" name="branchheader" id="branchheader" value="<%=session.getAttribute("BName").toString()%>"/>
     </b></P>
    <p></p>
    <p></p>
    <p></p>
    <p></p></div>
    <center><div id="maindiv" class="style23" >
      <div id="printableArea"><TABLE id="table2excel" class="tbl-content"  border="1">
                <TR>
                    <TH>Sr.#</TH>
                    <TH colspan="1">EMP ID</TH>
                    <TH colspan="2">Employee Name</TH>
                    <TH colspan="2">Designation</TH>
                    <TH colspan="1">Branch/Unit</TH>
                    
                    
                    <TH colspan="1"><%=sysdate%></TH>
                   <TH colspan="1">Executive Status</TH>
                </TR>
            <%
            String q=null;    
              Connection conn=null;
              Statement state=null;   
              String brname="";
              String checked=session.getAttribute("check").toString();
              String selected=session.getAttribute("brselected").toString();
  %>  <c:if test="${not empty param.BName}">
   <% brname=session.getAttribute("BName").toString();
   %>
</c:if>
    <%  
    if (brname.equals("M.D's Secretariat")){brname="M.D''s Secretariat";}
           try{//Class.forName("oracle.jdbc.driver.OracleDriver");
           int count=0;
           DBCoding db11=new DBCoding();
           db11.connect();
           
            conn =db11.getConner(); 
            //DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
             state = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);}catch(Exception ex){}
             q = "SELECT Distinct ea.EMP_NO,  TRIM(ed.EMPLOYEE_NAME) Employee_Name";
             q=q+", TRIM(ED.DESIG_TITLE) Designation, TRIM(ED.BRANCH_NAME) Branch_Name, to_char(EMPLOYEE_IN,'hh:mi:ss') ei";
             q=q+" , DECODE(el.EXECUTIVE_STATUS,'Y', 'Executive',null,'Not Executive') as exst, TRIM(DECODE(ea.REASONS,'informed', 'informed','not-informed','Not informed','absent','absent',null,'Not informed')) as inf";
             q=q+" FROM Employee_attendance  ea JOIN efu_pis.vw_employee ed on (ea.emp_no=ed.emp_no) ";
            if(checked.equals("off")) {
             q=q+" left outer join EXECUTIVE_LIST el on ea.EMP_NO=el.EMP_NO ";}
             else if (checked.equals("1")){ q=q+" join EXECUTIVE_LIST el on ea.EMP_NO=el.EMP_NO ";}
             q=q+" where  to_char(ATTENDANCE_DATE)=to_char(sysdate)";
             if(brname!=""&&!selected.equals("notselected")){
             q=q+"  and TRIM(ed.BRANCH_NAME)='"+brname+"'";}
             q=q+" order by EMP_NO";
             ResultSet rs1=null;             
             try{
       rs1= state.executeQuery(q);
                } 
                catch(Exception ex){
                out.println("There is something wrong with first query: " + ex);
                }
                String val1="";
                String val2="";
                String val3="";
                String val4="";
                String val5="";
                 String val6="";
                  String val7="";
         String color=""; 
         String informstat="";
          try{
         // while (count<100){
          while(rs1.next()){
          val1=rs1.getString(1);
          val2=rs1.getString(2);
          val3=rs1.getString(3);
          val4=rs1.getString(4);
          val5=rs1.getString(5);
          val6=rs1.getString(6);
          val7=rs1.getString(7);
          try {
    String string1 = "09:30:00";
    Date time1 = new SimpleDateFormat("HH:mm:ss").parse(string1);
    Calendar calendar1 = Calendar.getInstance();
    calendar1.setTime(time1);

    String string2 = "10:00:00";
    Date time2 = new SimpleDateFormat("HH:mm:ss").parse(string2);
    Calendar calendar2 = Calendar.getInstance();
    calendar2.setTime(time2);
    calendar2.add(Calendar.DATE, 1);

    String someRandomTime = val5;
    Date d = new SimpleDateFormat("HH:mm:ss").parse(someRandomTime);
    Calendar calendar3 = Calendar.getInstance();
    calendar3.setTime(d);
    calendar3.add(Calendar.DATE, 1);

    Date x = calendar3.getTime();
    if (x.after(calendar1.getTime()) && x.before(calendar2.getTime()) ) {
       if(val7.length()==8)
    {
    session.setAttribute("color", "green");
    session.setAttribute("informed", "informed");
      color=session.getAttribute("color").toString(); 
     informstat=" (informed)";
    }
     else if(val7.trim().length()=="absent".length())   
   //update for this not deployed onto server yet dated 6th dec 2017
    {
    session.setAttribute("color", "blue");
    session.setAttribute("informed", "absent");
     color=session.getAttribute("color").toString(); 
    informstat=" (Absent)";
  
    }
    else 
    {session.setAttribute("color", "yellow");
      color=session.getAttribute("color").toString(); 
     session.setAttribute("informed", " ");
      informstat="";
    }
    }
    else if (x.after(calendar2.getTime())||x.equals(calendar2.getTime()) )
    {
    
    if(val7.length()==8)
    {
    session.setAttribute("color", "green");
      color=session.getAttribute("color").toString(); 
    session.setAttribute("informed", "informed");
    informstat=" (informed)";
    }
     else if(val7.trim().length()=="absent".length())

    {
    session.setAttribute("color", "blue");
    session.setAttribute("informed", "absent");
     color=session.getAttribute("color").toString(); 
    informstat=" (Absent)";
  
    }
    else 
    {session.setAttribute("color", "red");
      color=session.getAttribute("color").toString(); 
    session.setAttribute("informed", " ");
     informstat="";
    }
    }  
//    else 
//    {
//    session.setAttribute("color", "white");
//    }
   // color=session.getAttribute("color").toString();  
} catch (Exception e) {
    e.printStackTrace();
}
          %> <TR> 
                  <TD> <%=rs1.getRow()%> </TD>
                    <TD colspan="1" style="height:3.0pt;"> <%= val1 %> </TD>
                    <TD colspan="2" style="height:3.0pt;"> <%= val2 %> </TD>
                    <TD colspan="2" style="height:3.0pt;"> <%= val3 %> </TD>
                    <TD colspan="1" style="height:3.0pt;"> <%= val4 %> </TD>
                   <TD bgcolor="<%=color%>" colspan="1" style="height:3.0pt; "> <%= val5+informstat %> </TD>
    <TD colspan="1" style="height:3.0pt;"> <%= val6 %> </TD>
        </TR> <% } } 
                catch(Exception exf){
                out.println("There is something wrong with while block: " + exf);
                }
                conn.close();
                val1="";
          val2="";
          val3="";
          val4="";
          val5="";
                %>
            </TABLE></div>
            
    <TABLE style="max-width:99.0%;">
        <TBODY>
        
        <TR >
          <TD class=magsnet width="61%" align="left" colspan=4>&nbsp;&nbsp; Copyright EFU General Pakistan</TD>
          <TD height=15 colspan="1">&nbsp;</TD>
             <TD  width="75px" align="right" colspan="3">
             <a name="Back" value="Back" href="attendance1.jsp"> Go Back to login </a>
</td>
<TD  width="75px" align="right" colspan="3">
             <a name="Back" value="Back" href="Employeelist.jsp"> Go Back to EmployeeList </a>
</td>
<td width="50px" align="right" colspan="8">
<input class="linkblue" id="print"  type="button" name="Print" value="Print" onClick="printDiv('printableArea')" />
<a id="dlink" style="display:none;" ></a>
<input type="hidden" name="namePage" value="showdatanow.jsp" />
<input type="hidden" name="hidpath" id="hidpath" />
<input type="button" onclick="tableToExcel('table2excel', 'name', 'myfile.xls')" value="Export to Excel">

<!--<input type="button" onclick="EmailExcel()" value="Send Email">-->

</TD>
        </TR>
        
          </TBODY></TABLE>
          </div></center>
    </form>
    </body><%DBCoding db3 = new DBCoding();
                 db3.disconnect();
                 %>
</html>



