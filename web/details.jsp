<%-- 
    Document   : details
    Created on : 1 Nov, 2016, 7:11:25 PM
    Author     : MY LAPTOP
--%>

<%-- 
    Document   : register
    Created on : 27 Oct, 2016, 6:46:52 PM
    Author     : MY LAPTOP
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String holdername = request.getParameter("holdername");
    String propertyarea = request.getParameter("propertyarea");
    String cost= request.getParameter("cost");
    String dno = request.getParameter("dno");
    String street = request.getParameter("street");
    String landmark = request.getParameter("landmark");
     String city = request.getParameter("city");
     String zipcode = request.getParameter("zipcode");
	String mobile = request.getParameter("mobile");
        String email= request.getParameter("email");
        
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/Mine");
        java.sql.Statement st=con.createStatement();
        
         int i=st.executeUpdate("insert into APP.details(holdername,propertyarea,cost,dno,street,landmark,city,zipcode,mobile,email) values('"+holdername+"','"+propertyarea+"','"+cost+"','"+dno+"','"+street+"','"+landmark+"','"+city+"','"+zipcode+"','"+mobile+"','"+email+"')");
        out.println("thank you for updating the details ");
        
        
    
      
    }
    catch(Exception e){
        out.println(e);
    }
%>
