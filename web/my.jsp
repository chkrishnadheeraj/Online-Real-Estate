<%-- 
    Document   : Dheeraj
    Created on : 1 Nov, 2016, 11:28:14 PM
    Author     : MY LAPTOP
--%>

<%@page import="org.apache.derby.jdbc.*" %>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
    </HEAD>

    <BODY>
        <H1>Database Lookup</H1>
        <FORM ACTION="self.jsp" METHOD="POST">
            Please enter the ID of the publisher you want to find:
            <BR>
            <INPUT TYPE="TEXT" NAME="id">
            <BR>
            <INPUT TYPE="SUBMIT" value="Submit">
        </FORM>


        <H1>Fetching Data From a Database</H1>

        <% 
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/Mine","","");
        Statement st=con.createStatement();
        

            String id = request.getParameter("id");  

            ResultSet resultset = st.executeQuery("select * from APP.DETAILS where id = '" + id + "'"); 

            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. " +
                "Please <A HREF='tryAgain.html'>try again</A>.");
            } else {
        %>

        <TABLE BORDER="1">
            <TR>
               <TH>ID</TH>
               <TH>Name</TH>
               <TH>City</TH>
               <TH>State</TH>
               <TH>Country</TH>
           </TR>
           <TR>
               <TD> <%= resultset.getString(1) %> </TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>
               <TD> <%= resultset.getString(4) %> </TD>
               <TD> <%= resultset.getString(5) %> </TD>
           </TR>
       </TABLE>
       <BR>
       <% 
           } 
       %>
    </BODY>
</HTML>
