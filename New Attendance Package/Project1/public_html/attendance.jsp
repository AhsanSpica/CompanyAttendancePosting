<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList,View.DBCoding" %>
<%@ page import="java.io.*,java.util.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="HandheldFriendly" content="true">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
     <title>attendance</title>
    <link rel="stylesheet" type="text/css" href= "resources/css/attres.css" media="screen" />
       
       <% int pageno=0;
     
      if((request.getParameter("nextbtn")!=null)||(request.getParameter("prevbtn")!=null)||
      (request.getParameter("firstbtn")!=null))
      { if (request.getParameter("firstbtn")!=null){pageno=1; session.setAttribute("page", pageno);}
      if(request.getParameter("nextbtn")!=null)
      {pageno=Integer.parseInt(session.getAttribute("page").toString());
      pageno=pageno+1;
      
      session.setAttribute("page", pageno);
      if(pageno>3){
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
    function returnpage()
    {
    window.location = '/attendance1.jsp';
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
               DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
           //   DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");      
         //   DriverManager.getConnection("jdbc:oracle:thin:@dm01-scan.efuinsurance.com:1521/efuprd","efu_gis","PRODgis");  
            //con   =  DriverManager.getConnection("jdbc:oracle:thin:@dg.efuinsurance.com:1521/dg","efu_gis","PRODgis");  
           //DBCoding db = new DBCoding();
          // db.connect();
          // con= db.getConner();
             state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);}
        catch(Exception ex){
         out.println("There is something wrong with the first class call: " + ex);
        }
           String  qu = "Select TRIM(to_char(sysdate)) as now_date from EFU_MAST.BRANCHES br";
            
             ResultSet rs4=null;             
             try{
       rs4= state1.executeQuery(qu);
                } 
                catch(Exception ex){
                out.println("There is something wrong with date query: " + ex);
                }
                
            while(rs4.next()){    
    sysdate=rs4.getString(1);} con.close();
    %>
    <div >
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <c:if test="${not empty param.BName}">
   <% session.setAttribute("BName", request.getParameter("BName"));%>
</c:if>
    <P style=" font:'Arial narrow';font-size:12.5pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Branch Name :&nbsp;
    <b  style=" font:Helvetica;color:Red;" ><%=session.getAttribute("BName").toString()%></b>
    <b >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sysdate%>
    <!--do not remove dateheader it is being used by insert.jsp-->
    <input type="hidden" name="dateheader" id="dateheader" value="<%=sysdate%>"/>
    <input type="hidden" name="branchheader" id="branchheader" value="<%=session.getAttribute("BName").toString()%>"/>
     </b></P>
    <p></p>
    <p></p>
    <p></p>
    <p></p></div>
    <center><div id="maindiv" class="style23" >
      <TABLE  border="1">
                <TR>
                    <TH>Sr.#</TH>
                    <TH colspan="1">EMP ID</TH>
                    <TH colspan="2">Employee Name</TH>
                    <TH colspan="2">Designation</TH>
                    <TH colspan="1">HO Unit/Branch</TH>
                    <TH colspan="1">Time</TH>
                    <TH colspan="1">Total Lates</TH>
                    <TH colspan="1">Month Late dates List</TH>
                </TR>
            <%String q=null;    
              Connection conn;
              Statement state=null;   
              String brname="";
int pagenumber=Integer.parseInt(session.getAttribute("page").toString());
  %>
    <% brname=session.getAttribute("BName").toString();
    if (brname.equals("M.D's Secretariat")){brname="M.D''s Secretariat";}
           try{
           //Class.forName("oracle.jdbc.driver.OracleDriver");
           int count=0;
           DBCoding db = new DBCoding();
           db.connect();
           
           conn= db.getConner();
           // conn = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
            
             state = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);}
        catch(Exception ex){
          out.println("There is something wrong with the second class call: " + ex);
        }
             q = "SELECT distinct EMP_NO,Employee_Name,Branch_N,Designation from (SELECT ed.EMP_NO, TRIM(ed.EMPLOYEE_NAME) Employee_Name";
             q=q+", TRIM(ED.BRANCH_NAME) Branch_N, TRIM(ED.DESIG_TITLE) Designation";
             q=q+",ROWNUM r FROM efu_pis.vw_employee ed ";
             
            // q=q+" left JOIN Employee_attendance ea  on ed.emp_no=ea.emp_no";
             q=q+" where";
             q=q+" TRIM(ed.BRANCH_NAME)='"+brname+"' group by ed.EMP_NO, TRIM(ed.EMPLOYEE_NAME), TRIM(ED.BRANCH_NAME), TRIM(ED.DESIG_TITLE), ROWNUM)";
             if (pagenumber==1){q=q+" where r<=50 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N order by EMP_NO";}
            else if (pagenumber==2){q=q+" where r between 50 and 100 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N order by EMP_NO";}
            else if(pagenumber==3){q=q+" where r between 99 and 160 GROUP BY EMP_NO,Employee_Name,Designation,Branch_N order by EMP_NO";}
          
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
          %> <TR> 
                  <TD> <%=rs1.getRow()%> </TD>
                    <TD colspan="1" style="height:3.0pt;"> <%= rs1.getString(1) %> </TD>
                    <TD colspan="2" style="height:3.0pt;"> <%= rs1.getString(2) %> </TD>
                    <TD colspan="2" style="height:3.0pt;"> <%= rs1.getString(4) %> </TD>
                    <TD colspan="1" style="height:3.0pt;"> <%= rs1.getString(3) %> </TD>
                    <TD colspan="1" style="height:3.0pt;width:40.0pt;">
<input type="text" name="time<%=rs1.getString(1)%>" id="time<%=rs1.getString(1)%>" 
onkeypress="return polycheck(event)" maxlength="5" minlength="5"  />  </TD>
                         
        <TD colspan="1" style="height:3.0pt;"> 
        <%String q9="SELECT count(EMP_NO) as cnt FROM Employee_attendance "; 
        q9=q9+"where to_char(ATTENDANCE_DATE,'yyyy')=to_char(sysdate,'yyyy') and EMP_NO='" ;
       q9=q9+rs1.getString(1)+"'";
     // GROUP BY EMPLOYEE_IN ORDER BY EMPLOYEE_IN DESC
       ResultSet rs9=null; 
        Connection  conn9=null;
       try{
       Statement state9;
        DBCoding db2 = new DBCoding();
          
       //Connection conn9= db2.getConner();
      //conn9=DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
      //conn9= DriverManager.getConnection("jdbc:oracle:thin:@dm01-scan.efuinsurance.com:1521/efuprd","efu_gis","PRODgis");
      conn9 =  
          DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
       // DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");      
   //   DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
       state9=conn9.createStatement();
       rs9= state9.executeQuery(q9);}
       catch(Exception ex){
                out.println("There is something wrong with second query: " + ex);
                }
       try{
       while (rs9.next()){
   %><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= rs9.getString(1) %> </p><%
    } } catch(Exception ex){
                out.println("There is something wrong with second while: " + ex);
                } conn9.close();%>
        
       </TD>
                    <td style="height:3.0pt;">
    <%  
    String Query="SELECT EMPLOYEE_IN FROM Employee_attendance "; 
        Query=Query+"where to_char(ATTENDANCE_DATE,'yyyy')=to_char(sysdate,'yyyy') and EMP_NO='" ;
       Query=Query+rs1.getString(1)+"' GROUP BY EMPLOYEE_IN ORDER BY EMPLOYEE_IN DESC";
       ArrayList<String> list2 = new ArrayList<String>();
       ResultSet rs2=null; 
       Connection conner=null;
       try{
       Statement state2;
       // DBCoding db3 = new DBCoding();
        //conner=db3.getConner();
       //conner=DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
       //conner= DriverManager.getConnection("jdbc:oracle:thin:@dm01-scan.efuinsurance.com:1521/efuprd","efu_gis","PRODgis");
       conner=  
            DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
        // DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");      
      // DriverManager.getConnection("jdbc:oracle:thin:@dg.efuinsurance.com:1521/dg","efu_gis","PRODgis");  
       state2=conner.createStatement();
       rs2= state2.executeQuery(Query);}
       catch(Exception ex){
                out.println("There is something wrong with employee_in time query: " + ex);
                }
       try{
       while (rs2.next()){
    list2.add(rs2.getString(1).toString());
    } } catch(Exception ex){
                out.println("There is something wrong with employee_in time while: " + ex);
                }conner.close();
    %>
    <select name="datedropdown">
     <%  for( String list:list2)  
       { %>
       <option><%=list%></option>
       <% } 
         %>
      </select>
        </td>
        </TR> <% } } 
                catch(Exception exf){
                out.println("There is something wrong with while block: " + exf);
                } 
                %>
            </TABLE>
            
    <TABLE style="max-width:99.0%;">
        <TBODY>
        
        <TR>
          <TD class=magsnet width="61%" align="left" colspan=4>&nbsp;&nbsp; Copyright EFU General Pakistan</TD>
          <TD height=15>&nbsp;</TD>
          <TD  width="70px" align="right" colspan="2">
           <a name="Back" value="Back" href="attendance1.jsp"> Go Back </a>
<!--<input type="submit" name="Back" value="Back" class="linkblue" formaction="attendance1.jsp"/>-->
</td>

<td width="200px" align="right" colspan="4">
<input id="prevbtn" name="prevbtn" type="submit" width="200px" value="PREV" formaction="attendance.jsp"/></td>
<td width="200px" align="right" colspan="4">
<input id="nextbtn" name="nextbtn" type="submit" width="200px" VALUE="NEXT" formaction="attendance.jsp"/></td>
<td width="200px" align="right" colspan="4">
<input id="firstbtn" name="firstbtn" type="submit" width="200px" VALUE="FirstPage" formaction="attendance.jsp"/></td>


<td width="100px" align="right" colspan="2"><input type="submit" name="stamp" id="stamp" value="Save Time" /></td>
<td width="50px" align="right" colspan="2">
<input class="linkblue" id="print"  type="button" name="Print" value="Print" onClick="window.print()" />

</TD> 
        </TR>
        
          </TBODY></TABLE>
          </div></center>
    </form>
    </body><%DBCoding db3 = new DBCoding();
                 db3.disconnect();%>
</html>



