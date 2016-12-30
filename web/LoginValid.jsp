<%-- 
    Document   : LoginValid
    Created on : 27 Oct, 2016, 6:37:20 PM
    Author     : MY LAPTOP
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String name = request.getParameter("usrname");
    String password = request.getParameter("pass");
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/Mine");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from REG where NAME='"+name+"'");
        if(!rs.next()){
            out.println("sorry cant process signup first");
        }
        else{
               if(password.equals(rs.getString(2))){
                out.println("user credentials are correct");
                String redirectURL = "places.html";
                response.sendRedirect(redirectURL);
            }
               else{
                  out.println("incorect password");
               }
        }
    }
    catch(Exception e){
        out.println(e);
    }
%>
