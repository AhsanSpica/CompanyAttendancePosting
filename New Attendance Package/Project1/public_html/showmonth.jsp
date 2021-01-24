<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,View.DBCoding" %>
<%@ page import="java.io.*,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%@ page import="java.text.DateFormat,java.text.DateFormatSymbols"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
     <title>showdatamonth</title>
    <!--<link rel="stylesheet" type="text/css" href= "resources/css/attres.css" media="screen" />-->
       <!--<script type="text/javascript" src="/components/excellentexport/excellentexport.min.js"></script>-->
        <link type="text/css" rel="stylesheet" href="css/newtabledesign.css"/>
        
        <% int pageno=0;
      if((request.getParameter("nextbtn")!=null)||(request.getParameter("prevbtn")!=null)||
      (request.getParameter("firstbtn")!=null))
      { if (request.getParameter("firstbtn")!=null){pageno=0; session.setAttribute("page", pageno);}
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
     // pageno=1;
      session.setAttribute("page",pageno);}   %>


                
    <script>
   

  // var tableToExcel = (function () {
  function tableToExcel(){
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
         var fromfl=   document.getElementById("fromfl").value;
 var tofl= document.getElementById("tofl").value;
var filestring=fromfl+"-TO-"+tofl+"-"+day_value+months[month_value]+".xls";
//alert();
      
//        var uri = 'data:application/vnd.ms-excel;base64,'
//        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:Table><x:Row x:AutoFitHeight="1" ></ss:Row></x:Table><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
//        , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
//        , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
   //     return function (table, name) {
         //  if (!table.nodeType) table = document.getElementById(table)
         //application/vnd.ms-excel
 var blob = new Blob([document.getElementById('table2excel').innerHTML], {type: "application/vnd.ms-excel"}); 
 //var blob = new Blob([s2ab(atob(document.getElementById('table2excel').innerHTML))], {type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"});
        saveAs(blob, filestring);

// var ctx = { worksheet: filestring || 'Worksheet', table: table.innerHTML}
////  var ctx = { worksheet: filestring || 'Worksheet', worksheet: filestring+'2' || 'Worksheet', table: table.rows[0].cells[60].innerHTML, table: table.rows[0].cells[120].innerHTML}
//            document.getElementById("dlink").href = uri + base64(format(template, ctx));

//            document.getElementById("dlink").href = blobUrl;
//            document.getElementById("dlink").download = filestring;
//            document.getElementById("dlink").click();

       // }
    }

        function newexcel() {
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
         var fromfl=   document.getElementById("fromfl").value;
    var tofl= document.getElementById("tofl").value;
    var incheck= document.getElementById("checkedin").value;
    if(incheck==1||incheck=='1'){
    var filestring=fromfl+"-TO-"+tofl+"-"+day_value+months[month_value]+"-Exec"+".xls";
    }
    else{var filestring=fromfl+"-TO-"+tofl+"-"+day_value+months[month_value]+".xls";}
    var aref= document.getElementById("exporter");
   var table=document.getElementById("printableArea");

 // table = get(table);
 // var ctx = {worksheet: filestring || 'Worksheet', table: table.innerHTML};
 // var data = format(template.excel, ctx);
 // var blob = new Blob([table.innerHTML], {type: "application/vnd.ms-excel"});
 // saveAs(blob, filestring);
 // var url = URL.createObjectURL(blob);
 // aref.href = url;
  // aref.download=filestring;
   
  // Return true to allow the link to work
 // return true;

  
    aref.download=filestring;
     return ExcellentExport.excel(this , 'printableArea', filestring);
}
   

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
    
    var iterator=0;
    var f = new Array();
 var e = new Array();
 var t = new Array();


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
   
 

    }
    
    </script>  
    <style type=" text/css">
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
/*table {
    border-collapse: collapse;
    border-spacing: 4.0pt;
    max-width:100%;
    border: 2px solid #ddd;
    position:relative; 
    }*/
/*th{
    border: none;
    text-align: left;
    padding: 8px; 
    width:100px;
    }*/
  /*   td{
    text-align: left;
   
   padding: 8px;
   }*/
  .style23 {
  font:Helvetica  ;
  font-size: 12px;
  
 }
 
    </style>
    </head>
    <body>
    <form name="display" id="display" method="POST" style=" width:auto;" >
    <span valign="left"><img alt="EFU General Insurance"
            src="resources/images/efu-name30.gif" width=305 
            
            height=20></span>
            <img alt="EFU General Insurance " valign="centre" src="head1.jpg" height="90%" width="90%" />
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
    <c:if test="${not empty param.BName}">
   <%  
   String temname= request.getParameter("empid"); 
   if (!temname.equals("PleaseSelect")){
   session.setAttribute("empid", request.getParameter("empid"));
   session.setAttribute("empselect", "selected");
   }
   else {session.setAttribute("empid", "Showing all for today");
    session.setAttribute("empselect", "notselected");
   }
   %>
</c:if>
<c:if test="${empty param.BName}">
<%session.setAttribute("brselected", "notselected");  %>
</c:if>
<c:if test="${empty param.empid}">
<%session.setAttribute("empselect", "notselected");  %>
</c:if>
    <%
    String sysdate ="";
    String headate="";
    Connection con=null;
              Statement state1=null;
              
           try{Class.forName("oracle.jdbc.driver.OracleDriver");
           //  con = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
             con =  
           
        DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
             //  DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
             state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);}catch(Exception ex){}
           String  qu = "Select TRIM(to_char(sysdate))as now_date ,to_char(sysdate,'MON-yyyy') headate from EFU_MAST.BRANCHES br";
            
             ResultSet rs4=null;             
             try{
       rs4= state1.executeQuery(qu);
               
            while(rs4.next()){    
    sysdate=rs4.getString("now_date");
    headate=rs4.getString("headate");
    }  } 
                catch(Exception ex){
                out.println("There is something wrong with date query: " + ex);
                }con.close();
    %>
    <div >
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <c:if test="${not empty param.BName}">
   <% session.setAttribute("BName", request.getParameter("BName"));%>
</c:if>
 <c:if test="${not empty param.execheck}">
   <% session.setAttribute("check", request.getParameter("execheck").toString());%>
</c:if>
<c:if test="${ empty param.execheck}">
<%

session.setAttribute("check", "off");

%>
</c:if>
    <P style=" font:'Arial narrow';font-size:12.5pt;">
    <b >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sysdate%>
       </b></P>
    <p></p>
    <p></p>
    <p></p>
     <c:if test="${not empty param.fromdate}">
   <% session.setAttribute("fromdate", request.getParameter("fromdate"));
                 session.setAttribute("todate", request.getParameter("todate"));
   %>
   <input type="hidden" id="fromfl" name="from" value="<%=session.getAttribute("fromdate").toString()%>"/>  
   <input type="hidden" id="tofl" name="to" value="<%=session.getAttribute("todate").toString()%>"/>

</c:if>
       <center><div id="maindiv" class="style23 " >
 
      <div id="printableArea"   ><TABLE id="table2excel"  style=" width:auto;" class="tbl-content"  border="1">
      <thead>   STATEMENT SHOWING LATE COMMERS IN WORKING DAYS FOR THE MONTHS BETWEEN <%=session.getAttribute("fromdate").toString()%>
      &nbsp;AND&nbsp;&nbsp;<%=session.getAttribute("todate").toString()%> Daily attendance at 9:30 am onward </thead>
                <TR>
                    <TH>Sr.#</TH>
                    <TH colspan="1">EMP ID</TH>
                    <TH colspan="2">Employee Name</TH>
                    <TH colspan="2">Designation</TH>
                    <TH colspan="1">Branch/Unit</TH>
                    <TH colspan="1">Exective Status</TH>
                 <TH colspan="1">Total Lates</TH>
                 <%  
                 String fromdate = session.getAttribute("fromdate").toString();
                 String todate =session.getAttribute("todate").toString();
     String Query2="SELECT to_char(ATTENDANCE_DATE,'dd-mm-yyyy') FROM Employee_attendance "; 
        Query2=Query2+"where to_char(ATTENDANCE_DATE,'yyyy-mm-dd') between '"+fromdate+"' and '"+todate+"'" ;
       Query2=Query2+" GROUP BY ATTENDANCE_DATE ORDER BY ATTENDANCE_DATE DESC";

       ResultSet rs3=null; 
       Connection conner=null;
       try{
       Statement state3;
     //   conner= DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
     conner= 
     
  DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
    //   DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
       state3=conner.createStatement();
       rs3= state3.executeQuery(Query2);}
       catch(Exception ex){
                out.println("There is something wrong with calender dates query: " + ex);
                }
       try{
       while (rs3.next()){
       
       //new editted code for date datatype
        String dateStr = rs3.getString(1).toString();
        try{
        DateFormat formatter = new SimpleDateFormat("dd/MON/yy");
        Date startDate = (Date)formatter.parse(dateStr);
         SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd-MM-yyyy");
     dateStr= AppDateFormat.format(startDate);
    
        }catch(Exception ex){dateStr = rs3.getString(1).toString();}
       %>
       <TH    ><%= dateStr %>   </TH>
       
       <%
    //end of editted code for date datatype
    
    } } catch(Exception ex){
                out.println("There is something wrong with second while: " + ex);
                }  %>  
                </TR><%String brname=""; String selected=session.getAttribute("brselected").toString();
                
                //employee only data
             //   String empselect=session.getAttribute("empselect").toString();
            //    String emp_id =session.getAttribute("empid").toString();
                //end of employee only data
                
                %>
                
                <c:if test="${not empty param.BName}">
   <% brname=session.getAttribute("BName").toString();
   %>
</c:if> 
<input type="hidden" id="checkedin" value="<%=session.getAttribute("check")%>"/>
            <%String q=null;    
              Connection conn;
              Statement state=null; 
                String checked=session.getAttribute("check").toString();
              int pagenumber=Integer.parseInt(session.getAttribute("page").toString());
            String fro = session.getAttribute("fromdate").toString();
                 String top =session.getAttribute("todate").toString();
           DBCoding db5 = new DBCoding();
           db5.connect();
           conn=db5.getConner();
             state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
    q="SELECT distinct EMP_NO,Employee_Name,Designation,Branch_N,exst, COUNT(*) from(";
             q=q+ "SELECT distinct ed.EMP_NO";
             q=q+", TRIM(ed.EMPLOYEE_NAME) Employee_Name, TRIM(ED.DESIG_TITLE) Designation";
             q=q+", TRIM(ed.BRANCH_NAME) Branch_N";
             q=q+" , DECODE(el.EXECUTIVE_STATUS,'Y', 'Executive',null,'Not Executive') as exst";
         //   q=q+", TRIM(DECODE(ea.REASONS,'informed', 'informed',null,'Not-informed')) as inf";
             q=q+",ROWNUM r";
             
             q=q+" FROM Employee_attendance ea ";
             q=q+"JOIN  efu_pis.vw_employee ed on (ea.EMP_NO=ed.emp_no) ";
             
              if(checked.equals("off")) {
             q=q+" left outer join EXECUTIVE_LIST el on ea.EMP_NO=el.EMP_NO ";
              q=q+" where  to_char(ATTENDANCE_DATE,'yyyy-mm-dd') between '"+fro+"' and '"+top+"'";
          if(brname!=""&&!selected.equals("notselected")){
             q=q+"  and TRIM(ed.BRANCH_NAME)='"+brname+"'";}
             
             //end of employee only data
           //   if(emp_id!=""&&!empselect.equals("notselected")){
           //  q=q+"  and TRIM(ed.EMP_NO)='"+emp_id+"'";}
             //end of employee only data
             
          q=q+") ";
           if (pagenumber==0){q=q+" where EMP_NO<=3500 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
          else if (pagenumber==1){q=q+" where EMP_NO<=500 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
            else if (pagenumber==2){q=q+" where EMP_NO between 500 and 1001 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
            else if(pagenumber==3){q=q+" where EMP_NO between 1000 and 1501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
         else if (pagenumber==4){q=q+" where EMP_NO between 1500 and 2001 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==5){q=q+" where EMP_NO between 2000 and 2550 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==6){q=q+" where EMP_NO between 2549 and 3001 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==7){q=q+" where EMP_NO between 3001 and 3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==8){q=q+" where EMP_NO <=500 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
             }
             else if (checked.equals("1")){ q=q+" join EXECUTIVE_LIST el on ea.EMP_NO=el.EMP_NO ";
             
             q=q+" where to_char(ATTENDANCE_DATE,'yyyy-mm-dd') between '"+fro+"' and '"+top+"'";
            //to_char(ADD_MONTHS(sysdate,-5),'mm')
            // q=q+" and rownum<600 GROUP BY ed.EMP_NO,Employee_Name,Designation,Branch_N order by EMP_NO";
            q=q+") ";
            if (pagenumber==1){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
            else if (pagenumber==2){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
            else if(pagenumber==3){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
         else if (pagenumber==4){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==5){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==6){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==7){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           else if (pagenumber==8){q=q+" where EMP_NO<3501 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N,exst order by EMP_NO";}
           
           }
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
                     <TD colspan="1" style="height:3.0pt;"> <%= rs1.getString(5) %> </TD>
                       <TD colspan="1" style="height:3.0pt;"> <%= rs1.getString(6) %> </TD>
    <% 
    ResultSet rs6=null;
    ResultSet rs7=null;
     ResultSet rs9=null;
    String tempemp=rs1.getString(1);
    String from = session.getAttribute("fromdate").toString();
                 String to =session.getAttribute("todate").toString();
                  String q7="select DISTINCT to_char(ea.attendance_date,'yyyy-mm-dd') dater from EMPLOYEE_ATTENDANCE ea where  "; 
        q7=q7+"to_char(ea.ATTENDANCE_DATE,'yyyy-mm-dd') BETWEEN '"+from+"' and '"+to+"'  order by dater desc" ;    

      Connection conner2=null;
       List <String> rangedate = new ArrayList();
     try{
       Statement state7;
    
    //    conner2= DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
       conner2= 
      //  DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
    DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
       state7=conner2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
         rs7=state7.executeQuery(q7);
        
         while (rs7.next())
       {
       rangedate.add(rs7.getString("dater"));
       }
     }
       catch(Exception ex)
       {
                out.println("There is something wrong with emp times query: " + ex);
                }
         String q6="SELECT emp_no"; 
                for(String stringer :rangedate)
                {q6=q6+",max(decode(datenum, '"+ stringer +"',  to_char(EMPLOYEE_IN,'HH:MI'), '--:--')) as date1hours"; 
                }
                q6=q6+" from( select t.*, to_char(t.attendance_date,'yyyy-mm-dd') datenum from employee_attendance t ";
                q6=q6+" where EMP_NO='"+tempemp+"' ) t group by emp_no";
      String q9="SELECT emp_no"; 
                for(String stringer : rangedate)
                {q9=q9+",max(decode(datenum, '"+stringer+"',  TRIM(DECODE(REASONS,'informed', 'informed','not-informed','Not informed','absent','absent',null,'Not informed')), '--:--')) as date1hours"; 
                }
                q9=q9+" from( select t.*, to_char(t.attendance_date,'yyyy-mm-dd') datenum from employee_attendance t ";
                q9=q9+" where EMP_NO='"+tempemp+"' ) t group by emp_no";
     String val7="";
    String temperator1="";
      String color=""; 
         String informstat="";
          String string1 = "09:30:00";
    Date time1 = null;
    Date time2=null;
    Date d=null;
    Calendar calendar1 = Calendar.getInstance();
    Calendar calendar2 = Calendar.getInstance();
     Calendar calendar3 = Calendar.getInstance();
    String string2 = "10:00";
 try{   time1 = new SimpleDateFormat("HH:mm").parse(string1);
 time2 = new SimpleDateFormat("HH:mm").parse(string2);
    calendar1.setTime(time1);
    calendar2.setTime(time2);
    calendar1.add(Calendar.DATE, 1);
    calendar2.add(Calendar.DATE, 1);}
    catch(Exception ex ){
    System.out.println(ex.getMessage());
    }
    int ColumnCount=0;
    int ucount=0;
       try{
       Statement state6;
       Statement state9;
       state9=conner2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
        state6=conner2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
         rs9= state9.executeQuery(q9);
           ResultSetMetaData meta1 = rs9.getMetaData();
          ucount =meta1.getColumnCount();
       rs6= state6.executeQuery(q6);
        ResultSetMetaData meta = rs6.getMetaData();
          ColumnCount =meta.getColumnCount();
       }
       catch(Exception ex){
                out.println("There is something wrong with emp times query: " + ex);
                }

               String responce=null;
              String[] rows=null;
               List <String> diffrow = new ArrayList();
             List <String> empdate = new ArrayList();
             List <String> emptime = new ArrayList();
             List <String> reasonval = new ArrayList();
              List <String> emptimeall = new ArrayList();
       try{
       while (rs9.next())  
       {
       for (int i = 1; i <= ColumnCount; i++) {
       reasonval.add(rs9.getString(i));
       }
       }
       while (rs6.next())
       {for (int i = 2; i <= ColumnCount; i++) {
        temperator1=rs6.getString(i); 
        val7=reasonval.get(i-1);
      if (!temperator1.equals("--:--")){
       try {   
       String someRandomTime = temperator1;
      
     d = new SimpleDateFormat("HH:mm").parse(someRandomTime);
    calendar3.setTime(d);
    calendar3.add(Calendar.DATE, 1);
} catch (Exception e) {
    e.printStackTrace();
}
    Date x = calendar3.getTime();
    if ( x.before(calendar2.getTime()) ) {
    
       if(val7.length()=="informed".length())
    {
    session.setAttribute("color", "green");
    session.setAttribute("informed", "informed");
      color=session.getAttribute("color").toString(); 
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
    {
    session.setAttribute("color", "yellow");
     color=session.getAttribute("color").toString(); 
     session.setAttribute("informed", " ");
      informstat=""; }
    }
    else if (x.after(calendar2.getTime())||x.equals(calendar2.getTime()) )
    {
    if(val7.length()=="informed".length())
    {
    session.setAttribute("color", "green");
    session.setAttribute("informed", "informed");
     color=session.getAttribute("color").toString(); 
    informstat=" (Informed)";
  
    }
      else if(val7.trim().length()=="absent".length())

    {
    session.setAttribute("color", "blue");
    session.setAttribute("informed", "absent");
     color=session.getAttribute("color").toString(); 
    informstat=" (Absent)";
  
    }
    else 
    {
    session.setAttribute("color", "red");
     color=session.getAttribute("color").toString(); 
    session.setAttribute("informed", " ");
     informstat=""; }
    }
    } //end of if check if returned time is null
    else{color="";informstat="";}

  %> <td bgcolor="<%=color%>"><%= temperator1+ informstat%>   </td><%
    }
    }
    //end of all attendance dates for
    } 
    catch(Exception ex){
                out.println("There is something wrong with emp times while: " + ex.getCause() );
                } conner2.close();%>
        
        </TR> <% }//end of parent while
        } //end of parent while try
                catch(Exception exf){
                out.println("There is something wrong with while block: " + exf);
                }%>
            </TABLE></div></div>
            
    <TABLE style="max-width:2000px;">
        <TBODY>
        
        <TR >
          <TD class=magsnet width="100%" align="left" colspan=3>&nbsp;&nbsp; Copyright EFU General Pakistan</TD>
         
             <TD  width="100px" align="right" colspan=2>
              <a name="Back" value="Back" href="attendance1.jsp"> Login </a>
</td>
<TD  width="75px" align="right" colspan="3">
             <a name="Back" value="Back" href="Employeelist.jsp"> Go Back to EmployeeList </a>
</td>

<td width="200px" align="right" colspan="4">
<input id="prevbtn" name="prevbtn" type="submit" width="200px" value="PREV" formaction="showmonth.jsp"/></td>
<td width="200px" align="right" colspan="4">
<input id="nextbtn" name="nextbtn" type="submit" width="200px" VALUE="NEXT" formaction="showmonth.jsp"/></td>
<td width="200px" align="right" colspan="4">
<input id="firstbtn" name="firstbtn" type="submit" width="200px" VALUE="FirstPage" formaction="showmonth.jsp"/></td>

<td width="170" align="right" colspan=5>
<input width="170" class="linkblue" id="print"  type="button" name="Print" value="Print" onClick="printDiv('printableArea')" />
<a id="dlink"  style="display:none;"></a>
<input type="hidden" id="namePage" name="namePage" value="showmonth.jsp" />
<input type="hidden" name="hidpath" id="hidpath" />
</td>


        </TR>
        <tr><td colspan="2" align="left"><span>Select File :&nbsp;&#8659;</span> <input type="file" name="file" size="50" /> 
<input type="hidden" name="yno" id="yno" value="tho phir, . . . kya? han acha?" size="50"/>
<input type="hidden" name="subject" value="Monthly Spreadsheet" size="50"/>
<input type="hidden" name="fileiter" id="fileiter" value="0" size="50"/>
</td><td colspan=4 width="240" align="right">
<a id="exporter" name="exporter" href="#" onclick="newexcel()">Export to Excel</a>

<!--<input width="200" type="button" onclick="tableToExcel('table2excel', 'name')" value="Export to Excel">-->
<!--<input width="200" type="button" onclick="CreateExcelSheet()" value="Export to Excel"/>-->
<!--<input type="button"  onclick="tablesToExcel('table2excel', 'ProductDay1', 'TestBook.xls', 'Excel')" value="Export to Excel"/>-->
 <input type="hidden" id="tableHTML" name="tableHTML" value="" />
   
    <!--<input type="submit" formaction="excel.jsp" onclick="gotoExcel('table2excel', 'tableHTML');" value="Export these results" />-->
<input type="submit" formaction="postclient.jsp" formenctype="multipart/form-data" value="Send Email">
</TD></tr>
          </TBODY></TABLE>
          </center>
        <%  DBCoding db3 = new DBCoding();
                 db3.disconnect();%>
    </div></form>
    </body>
</html>




