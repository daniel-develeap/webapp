<%-- 
    Document   : welcome
    Created on : 23 Jul, 2018, 5:39:03 AM
    Author     : aksarav
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>storing</title>
    </head>
<body>
<%
String name=request.getParameter("n1");
String gender=request.getParameter("n2");

try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@10.12.9.222:1521/ORCLCDBXDB.localdomain","SYSTEM","Oradoc_db1");
    PreparedStatement ps=con.prepareStatement("insert into student(sname,gender)values(?,?)");
    ps.setString(1,name);
    ps.setString(2,gender);
    int i=ps.executeUpdate();
    if (i>0){
        out.println("successfully stored");
    }
    else{
        System.out.println("fail");
    }

}catch(Exception e){
    System.out.println(e);
}
%>
</body>
</html>
