<%-- 
    Document   : search
    Created on : 1 Nov, 2016, 11:23:11 PM
    Author     : MY LAPTOP
--%>
<%-- 

--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String city = request.getParameter("city");
    
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/Mine");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from APP.DETAILS where city='"+city+"'");
        while(rs.next()){
        if(city.equals(rs.getString(7))){
                //out.println("user credentials are correct");
                       out.println(rs.getString(1));
                       out.println(rs.getString(2));
                       out.println(rs.getString(3));
                       out.println(rs.getString(4));
                       out.println(rs.getString(5));
                       out.println(rs.getString(6));
                       out.println(rs.getString(7));
                       out.println(rs.getString(8));
                       
               // String redirectURL = "places.html";
                //response.sendRedirect(redirectURL);
            }
               else{
                  out.println("invalid data");
               }
                  out.println("<br>");
        }
      
    }
    catch(Exception e){
        out.println(e);
    }
%>


