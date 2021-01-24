package View;



import java.sql.*;

import java.util.Date;
import java.text.DateFormat;

import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;

import java.util.*;

public class DBCoding {
    public DBCoding() {
        super();
    }
    private int count;

    public void setCount(int count) {
        this.count = count;
    }
    public int getCount(){
        return count;
        }

    private Connection conner ;

    public void setConner(Connection conner) {
        this.conner = conner;
    }

    public Connection getConner() {
        return conner;
    }
// 
    
    public String login(String login,
                        String pass) throws ClassNotFoundException,
                                            SQLException {
        String result = "false";
        String sql = "";
        Statement stm;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection 
                conn2 = 
     // last       //      DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
         DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
          
           //  conn2 = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
            stm = conn2.createStatement();
            sql =
    " select  au.USER_ID,au.USER_PASSWORD,br.BRANCH_ID,br.BRANCH_NM from app_users au " + 
    " join  efu_pis.vw_employee ea on au.USER_ID=ea.EMP_NO " + 
    " JOIN  EFU_MAST.BRANCHES br on ea.BRANCH_ID=br.BRANCH_ID " + 
    " where  trim(au.USER_ID)=' " +
    login + "' ";
            sql = sql + " and TRIM(au.USER_PASSWORD)='" + pass + "'";
            //sql=sql+" and up.MODULE_ID=985";
            ResultSet rst;
            rst = stm.executeQuery(sql);
            int j = 0;
            while (rst.next()) {
                result = "true|" + rst.getString(1) + "|" + rst.getString(3);
            }
            //                if (!rst.next() )
            //                {result="false";
            //                    }
            //                else  {result="true";}

            conn2.close();
        }

        catch (Exception ex) {
            //  result="false";
            result = ex.getMessage();
        }

        return result;
    } 
    
    public int getempcount() throws ClassNotFoundException, SQLException {
        Connection  conn=null;
   int count=0;
    try{ 
        Class.forName("oracle.jdbc.driver.OracleDriver");
  // conn = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");       
    conn  =
    //last // DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis"); 
          DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis");     
       
        Statement stm2;
        stm2 = conn.createStatement();
       
        String sql = "select COUNT(ea.EMP_NO) from efu_pis.vw_employee ea where ea.STATUS=1 or ea.status=3";
        ResultSet rst1;
        rst1 = stm2.executeQuery(sql);
        while(rst1.next()){
         // setCount(Integer.parseInt(rst1.getString(1)));
            count=Integer.parseInt(rst1.getString(1));
            }
      }
    catch(Exception ex){System.out.println(ex.getMessage());}
        
        conn.close();
        return count;
    } 
   // public static void main(String[] args) 
    public String[] getAllEmployee() throws ClassNotFoundException, SQLException {
       
        
        int length= getempcount();
        String [] emplist=new String[length];

       Statement stm;
        try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
  // Connection  conn = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");            
    Connection  conn = 
        //    DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");  
       DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
        stm = conn.createStatement();
                String sql = "select TRIM(ea.EMP_NO) empid,TRIM(ea.BRANCH_NAME) branch,TRIM(ea.DESIG_TITLE) desig";
                sql=sql+",TRIM(ea.EMPLOYEE_NAME) ename, DECODE(el.EXECUTIVE_STATUS,'Y', 'Executive',null,'Not Executive')";
                    sql=sql+" as exst from efu_pis.vw_employee ea left outer join  EXECUTIVE_LIST el on ea.EMP_NO=el.EMP_NO";
                    sql=sql+" where ea.STATUS=1 or ea.status=3  ORDER BY ea.EMPLOYEE_NAME ASC ";  ResultSet rst;
            rst = stm.executeQuery(sql);
        int j=0;
        while (rst.next()) {
            String element= rst.getString("ename").toString()
                                       +","+rst.getString("empid").toString()
                                       +":"+rst.getString("branch").toString()
                                        +"/"+rst.getString("desig").toString()
                 +"+"+rst.getString("exst").toString();      
            emplist[j]=element;
            j++;
            }
            conn.close();
        }
        
        catch(Exception ex){
           emplist[1]=ex.getMessage();     
            }
     // System.out.println(Arrays.toString(emplist));
        
        return emplist;
    }
//    String sql = "select TRIM(ea.EMP_NO) empid,TRIM(ea.BRANCH_NAME) branch,TRIM(ea.DESIG_TITLE) desig";
//    sql=sql+",TRIM(ea.EMPLOYEE_NAME) ename, DECODE(el.EXECUTIVE_STATUS,'Y', 'Executive')";
//        sql=sql+" as exst from efu_pis.vw_employee ea join EXECUTIVE_LIST el on ea.EMP_NO=el.EMP_NO";
//        sql=sql+" where ea.STATUS=1 or ea.status=3  ORDER BY ea.EMPLOYEE_NAME ASC ";
    
    
    public  void connect() throws Exception
    { Connection con;
              //Statement state1=null;
         Class.forName("oracle.jdbc.driver.OracleDriver");
        //     con = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");    
            con = 
               //        DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
         DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
                        // state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    //ResultSet.CONCUR_READ_ONLY);
           setConner(con);
           
        }
    public  void disconnect() throws Exception
    { if(this.conner!=null){ this.conner.close();}
        }
    
    public String insert2(String empid, String time, String date,String inform,String userval)
    // public static void main(String[] args)
    {
        String returner;
        returner = "";
        Connection connection = null;
               boolean rs=false;
               ResultSet res=null;
               String val="1"; 
            String exval="1";
              // String date="30-Jan-17";
    //String time="09:31";
         
                String text=date+" "+time+":00";
              //  String empid="1514";
         
                String Query="";   
                      try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                    //    connection = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
                     connection  = 
                   //        DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
                   DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");  
              Statement statement = connection.createStatement();      
                    Statement state2 =connection.createStatement();
                   String Query2="";
                          Query2=Query2+"Select TRIM(EMP_NO) FROM Employee_attendance where TRIM(Attendance_Date)='"+date+"'";
                    Query2=Query2+" and TRIM(EMP_NO)='"+empid+"'";
                          if ((!empid.isEmpty())&&(!time.isEmpty())&&(!date.isEmpty())){
                   res= state2.executeQuery(Query2); 
                    while (res.next())
                    {
                        val=res.getString(1);
                        }
                              res.close();
                    exval=val;
                          if (exval.equals("1")) //that is if no record found for current date
                          {
                          //    if(!inform.equals("informed")) {
    // Query=Query+"Insert INTO Employee_attendance (EMPLOYEE_IN, EMP_NO, Attendance_Date, CREATED_DATE) VALUES ";
    // Query=Query+"('"+text+"','"+empid+"','"+date+"',to_char(sysdate))  ";  }
                           //   else{
     Query=Query+"Insert INTO Employee_attendance (EMPLOYEE_IN, EMP_NO, Attendance_Date, CREATED_DATE,REASONS) VALUES ";
    Query=Query+"('"+text+"','"+empid+"','"+date+"',to_char(sysdate),'"+inform+"' )  ";  
                  
                    statement.executeUpdate(Query); 
                          
                     returner="Insert Successful for "+empid+" at time : " +time;  
                              Query="";
             Query=Query+"INSERT INTO EMPLOYEE_ATTENDANCE_LOG LCL ( LCL.CREATED_BY,LCL.ACCESS_TIME,LCL.EMP_ID,LCL.CHANGE_TYPE,ATTENDANCE)";
             Query=Query+" VALUES( '"+userval+"',CURRENT_TIMESTAMP,'"+empid+"','INSERT','"+text+"')";     
                              Statement statement2 = connection.createStatement();    
                                             statement2.executeUpdate(Query); 
                         }
                          else {
                             returner="Insert UnSuccessful for "+empid+" at time : " +time+" As entry already exists";  
                              }
                          }
                          else
                          {
                              returner="Insert UnSuccessful for empty inputs"; 
                              }
                          connection.close();
                }
                catch(Exception exp)
                {
                          returner=exp+" not successful";
                }
                    
        return returner;
        }
    
    
    
    
    public String update(String empid, String time, String date, String inform,String userval )
   // public static void main(String[] args)
    {
        String returner="";
            Connection connection = null;
            ResultSet res=null;
            String val="1"; 
            String exval="1";
     //  String date="2017-01-31";
     //       String time="10:10";
            String empin="";
            Date mydate=null;
            String[] newShortMonths = {
                 "JAN", "FEB",
                "MAR", "APR", "MAY",
                "JUN", "JUL", "AUG","SEP","OCT","NOV","DEC"
            };
            DateFormatSymbols  symbols = new DateFormatSymbols( new Locale("en", "US"));
            symbols.setShortMonths(newShortMonths);
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy",symbols);
            SimpleDateFormat format3 = new SimpleDateFormat("dd-MMM-yy");
            try{
       mydate = format1.parse(date);
              
            }
            catch(Exception ex)
            {
                System.out.println(ex);
                }
            String dateString = format2.format(mydate);
            date="";
            date=format3.format(mydate);
                empin=date+" "+time+":00";
                    
                String Query="";   
                      try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                    //    connection = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
                        connection  = 
              //last    //           DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
                   DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
                //    DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");
                  
                    //connection.setAutoCommit(true);
              
                    Statement state2 =connection.createStatement();

                    String Query2="";
                        if ((!empid.isEmpty())&&(!date.isEmpty())){
                          Query2=Query2+"Select TRIM(EMP_NO) FROM Employee_attendance where ";
                    Query2=Query2+" Attendance_Date='"+dateString+"' and TRIM(EMP_NO)='"+empid+"'";
                         
                    res= state2.executeQuery(Query2);
                    while (res.next())
                    {
                        val=res.getString(1);
                        }
                   
                    exval=val;
                                            res.close();
                  
                        if (exval.equals(empid))
                    {
    Query=Query+"Update Employee_attendance  SET EMPLOYEE_IN='"+empin+"',REASONS='"+inform+"' where ";
    Query=Query+" TRIM(EMP_NO)="+empid+" and TRIM(Attendance_Date)= '"+dateString+"'";                  
                        PreparedStatement statement = connection.prepareStatement(Query); 
                        statement.execute();
                    //statement.executeUpdate(); 
                     //   connection.commit();
                     Query="";
                        Query=Query+"INSERT INTO EMPLOYEE_ATTENDANCE_LOG LCL ( LCL.CREATED_BY,LCL.ACCESS_TIME,LCL.EMP_ID,LCL.CHANGE_TYPE,ATTENDANCE )";
                         Query=Query+" VALUES( '"+userval+"',CURRENT_TIMESTAMP,'"+empid+"','UPDATE','"+empin+"')";     
                                         Statement statement2 = connection.createStatement();    
                                                        statement2.executeUpdate(Query); 
                        returner="Update Successful for "+empid+" at time : " +time;
                    }
                                            else {
                                               returner="Update UnSuccessful for "+empid+" at date : " +date+" As entry doesnt exists";  
                                                }
                                        }
                                        else
                                        {
                                            returner="Update UnSuccessful for empty inputs"; 
                                            }
                   
                   
                }
                catch(Exception exp)
                {
                          returner=exp+" not successful";
                }
                      try{
            connection.close();  }catch(Exception ex){
                       System.out.println(ex.getMessage());  
                          }       
       return returner;
        }
   //end of update method
    
   
    public String  purgeall(String date,String userval)
    {
        String returner="";
            Connection connection = null;
    ResultSet res=null;
    String val="1"; 
    String exval="1";
            Date mydate=null;
            String[] newShortMonths = {
                 "JAN", "FEB",
                "MAR", "APR", "MAY",
                "JUN", "JUL", "AUG","SEP","OCT","NOV","DEC"
            };
            DateFormatSymbols  symbols = new DateFormatSymbols( new Locale("en", "US"));
            symbols.setShortMonths(newShortMonths);
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy",symbols);
            try{           
                mydate = format1.parse(date);            
            }
            catch(Exception ex)
            {
                System.out.println(ex);
                }
            String dateString = format2.format(mydate);         
                String Query="";   
                      try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                   //      connection = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
                   connection  = 
                       
               //         DriverManager.getConnection("jdbc:oracle:thin:@adg.efuinsurance.com:1521/adg", "efu_gis", "PRODgis");
                    DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
                  //  connection.setAutoCommit(true);
                    Statement state2 =connection.createStatement();
                    String Query2="";
                        if (!date.isEmpty()){
                    
    Query=Query+"Delete from Employee_attendance where ";
    Query=Query+"TRIM(Attendance_Date)= '"+dateString+"' ";                          
                      
                        PreparedStatement statement = connection.prepareStatement(Query); 
                        statement.execute();
                      //  statement.executeUpdate();
                       // connection.commit();
                   
                       Query="";
                        Query=Query+"INSERT INTO EMPLOYEE_ATTENDANCE_LOG LCL ( LCL.CREATED_BY,LCL.ACCESS_TIME,LCL.EMP_ID,LCL.CHANGE_TYPE,ATTENDANCE)";
                         Query=Query+" VALUES( '"+userval+"',CURRENT_TIMESTAMP,'"+userval+"','DELETE','"+dateString+"')";     
                                         Statement statement2 = connection.createStatement();    
                                                        statement2.executeUpdate(Query); 
                       returner="Delete Successful for all at date : '"+dateString+"'";
                
                    }
                    else
                    {
                        returner="Delete UnSuccessful for empty inputs"; 
                        }     
                }
                catch(Exception exp)
                {
                          returner=exp+" not successful";
                }
            try{
            connection.close();  }catch(Exception ex){
             System.out.println(ex.getMessage());  
                }     
        return returner;
        }
    
    
    public String delete(String empid, String date, String userval)
    {
        String returner="";
            Connection connection = null;
    ResultSet res=null;
    String val="1"; 
    String exval="1";
            Date mydate=null;
            String[] newShortMonths = {
                 "JAN", "FEB",
                "MAR", "APR", "MAY",
                "JUN", "JUL", "AUG","SEP","OCT","NOV","DEC"
            };
            DateFormatSymbols  symbols = new DateFormatSymbols( new Locale("en", "US"));
            symbols.setShortMonths(newShortMonths);
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy",symbols);
            try{           
                mydate = format1.parse(date);            
            }
            catch(Exception ex)
            {
                System.out.println(ex);
                }
            String dateString = format2.format(mydate);         
                String Query="";   
                      try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                   //      connection = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
                   connection  = 
                  //       DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
                  
                   DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
                  //  connection.setAutoCommit(true);
                    Statement state2 =connection.createStatement();
                    String Query2="";
                        if ((!empid.isEmpty())&&(!date.isEmpty())){
                          Query2=Query2+"Select TRIM(EMP_NO) FROM Employee_attendance where TRIM(Attendance_Date)='"+dateString+"'";
                    Query2=Query2+" and TRIM(EMP_NO)='"+empid+"'";
                         
                    res= state2.executeQuery(Query2);
                    while (res.next())
                    {
                        val=res.getString(1);
                        }
                        res.close();
                    exval=val;
                        if (exval.equals(empid))
                    {
    Query=Query+"Delete from Employee_attendance where ";
    Query=Query+"TRIM(Attendance_Date)= '"+dateString+"'and TRIM(EMP_NO)='"+empid+"'";                          
                      
                        PreparedStatement statement = connection.prepareStatement(Query); 
                        statement.execute();
                      //  statement.executeUpdate();
                       // connection.commit();
                   
                       Query="";
                        Query=Query+"INSERT INTO EMPLOYEE_ATTENDANCE_LOG LCL ( LCL.CREATED_BY,LCL.ACCESS_TIME,LCL.EMP_ID,LCL.CHANGE_TYPE,ATTENDANCE)";
                         Query=Query+" VALUES( '"+userval+"',CURRENT_TIMESTAMP,'"+empid+"','DELETE','"+dateString+"')";     
                                         Statement statement2 = connection.createStatement();    
                                                        statement2.executeUpdate(Query); 
                       returner="Delete Successful for "+empid+" at date : '"+dateString+"'";
                    }
                        else {
                           returner="Delete UnSuccessful for "+empid+" at date : " +date+" As entry doesn't exists";  
                            }
                    }
                    else
                    {
                        returner="Delete UnSuccessful for empty inputs"; 
                        }     
                }
                catch(Exception exp)
                {
                          returner=exp+" not successful";
                }
            try{
            connection.close();  }catch(Exception ex){
             System.out.println(ex.getMessage());  
                }     
        return returner;
        }
    //end of delete method
    
    
    public String insert(String empid, String time, String date)
    // public static void main(String[] args)
    {
        String returner="";
            Connection connection = null;
               boolean rs=false;
               ResultSet res=null;
               String val="1"; 
            String exval="1";
              // String date="30-Jan-17";
    //String time="09:31";
         
                String text=date+" "+time+":00";
              //  String empid="1514";
         
                String Query="";   
                      try{  Class.forName("oracle.jdbc.driver.OracleDriver");
                     //   connection = DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test","efu_gis", "test");
                     connection  =
                   //      DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/adg.efuinsurance.com","efu_gis","PRODgis"); 
                 DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
              Statement statement = connection.createStatement();      
                    Statement state2 =connection.createStatement();
                   String Query2="";
                          Query2=Query2+"Select TRIM(EMP_NO) FROM Employee_attendance where TRIM(Attendance_Date)=to_char(sysdate)";
                    Query2=Query2+" and TRIM(EMP_NO)='"+empid+"'";
                          if ((!empid.isEmpty())&&(!time.isEmpty())&&(!date.isEmpty())){
                   res= state2.executeQuery(Query2); 
                    while (res.next())
                    {
                        val=res.getString(1);
                        }
                              res.close();
                    exval=val;
                          if (exval.equals("1"))
                          {
                              
    Query=Query+"Insert INTO Employee_attendance (EMPLOYEE_IN, EMP_NO, Attendance_Date, CREATED_DATE) VALUES ";
    Query=Query+"('"+text+"','"+empid+"',to_char(sysdate),to_char(sysdate))  ";  
                            
                        //  Query=Query+" WHERE NOT EXISTS ";
                  
                    statement.executeUpdate(Query); 
                          
                    returner="Insert Successful for "+empid+" at time : " +time;  
                          }
                          else {
                             returner="Insert UnSuccessful for "+empid+" at time : " +time+" As entry already exists";  
                              }
                          }
                          else
                          {
                              returner="Insert UnSuccessful for empty inputs"; 
                              }
                          connection.close();
                }
                catch(Exception exp)
                {
                          returner=exp+" not successful";
                }
                    
        return returner;
        }
   
}
