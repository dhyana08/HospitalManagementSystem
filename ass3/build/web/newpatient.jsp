<%-- 
    Document   : newpatient
    Created on : 05-Oct-2023, 10:25:08 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="get" action="insertdb.jsp">
            Patient Name:<input type="text" name="pname" id="1">
            <br>
            <br>
            Address:<input type="text" name="add">
            <br>
            <br>
            DOB:<input type="date" name="dob">
            <br>
            <br>
            Martial Status:
            <br>
            Single<input type="radio" value="single" name="marry" >
            Married<input type="radio" value="married" name="marry" >
            <br>
            <br>
            Contact<input type="number" name="cont">
            <br>
            <br>
            RegisteredDate<input type="date" value=<%=java.time.LocalDate.now() %> readonly name="date">
            <br>
            <br>
            LastVisitedDate<input type="date" name="last" readonly name="date">
            <br>
            <br>
            <input type="submit" value="Submit">
            
        </form>
    </body>
    
</html>
