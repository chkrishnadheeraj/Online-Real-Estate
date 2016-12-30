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
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String cpass = request.getParameter("confirm password");
    String email = request.getParameter("email");
    String dno = request.getParameter("dno");
    String street = request.getParameter("street");
	String mobile = request.getParameter("contact");
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/Mine");
        java.sql.Statement st=con.createStatement();
        
        if(password.equals(cpass)){int i=st.executeUpdate("insert into APP.REG(Name,Email,Password,DNO,Street,Mobile) values('" +name+ "','"+email+"','"+password+"','"+dno+"','"+street+"','"+mobile+"' )");
        out.println("updated successfully");
        String redirectURL= "places.html";
        response.sendRedirect(redirectURL);
    }
        else  out.println("PASSWORD AND CONFIRM PASSWORD SHOULD SAME");
    }
    catch(Exception e){
        out.println(e);
    }
%>
