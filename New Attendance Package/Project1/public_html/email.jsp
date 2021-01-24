<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html>
<head>
<title>Send Attachement Email using JSP</title>
<%

 File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   String fileName="";
   ServletContext context = pageContext.getServletContext();
 String filePath ="//data//wls";
  // String filePath ="D:\\Late_Coming_SpreadSheet";
   // context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      //factory.setRepository(new File("c:\\temp"));
factory.setRepository(new File("\\data\\wls"));
      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
             fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath +"\\" +
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
           // out.println("Uploaded Filename: " + filePath + 
         //   fileName + "<br>");
            }
         }
//         out.println("</body>");
//         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }

   String result;
 
  // String to = "ahsan.siddiqui@efuinsurance.com";
String to = "ali.tharani@efuinsurance.com";
  
  // String from = "ahsan.siddiqui@efuinsurance.com";
String from="ali.tharani@efuinsurance.com";
  
 
//String path=fileName.split(".")[0];  //str.split(":")[0]
    String pagename=request.getParameter("namePage");
   // Get system properties object
   Properties properties = System.getProperties();

   // Setup mail server
   properties.setProperty("mail.smtp.host","mail.efuinsurance.com");
 properties.setProperty("mail.user", "ali.tharani");
 properties.setProperty("mail.password", "mati56");
 //properties.setProperty("mail.user", "ahsan.siddiqui");
 //properties.setProperty("mail.password", "123456");
   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(properties);

   try{
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("Excel report attached file");
      // Create the message part 
      BodyPart messageBodyPart = new MimeBodyPart();
      // Fill the message
      messageBodyPart.setText("excel report is attached : "+fileName);
      // Create a multipar message
      Multipart multipart = new MimeMultipart();
      // Set text message part
      multipart.addBodyPart(messageBodyPart);
      // Part two is attachment
      messageBodyPart = new MimeBodyPart();
     
     DataSource source = new FileDataSource(filePath+"\\"+
            fileName.substring(fileName.lastIndexOf("\\")+1));
     // DataSource source = new FileDataSource("C:/Users/ahsan.siddiqui/Downloads/"+filename);
      messageBodyPart.setDataHandler(new DataHandler(source));
      messageBodyPart.setFileName(fileName);
      multipart.addBodyPart(messageBodyPart);

      // Send the complete message parts
      message.setContent(multipart );

      // Send message
      Transport.send(message);
      String title = "Send Email";
      result = "Sent message successfully....";
   }catch (Exception mex) {
     
      result = "Error: unable to send message...."+mex;
      out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+result.toString()+"');");
   out.println("location='showmonth.jsp';");
   out.println("</script>");
   }
     out.println("<script type=\"text/javascript\">");  
   out.println("alert('"+result.toString()+"');");
   out.println("location='showmonth.jsp';");
   out.println("</script>");
%>

</head>
<body>

</body>
</html>