<%-- 
    Document   : submitappointment
    Created on : 06-Oct-2023, 5:49:22 pm
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
        <%
        int pid=Integer.parseInt(request.getParameter("pid"));
        String date=request.getParameter("app");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ass3","root","dhyana");
        PreparedStatement ps=con.prepareStatement("insert into appointment(appDate,pid) values(?,?)");
        ps.setString(1,date);
        ps.setInt(2,pid);
        ps.executeUpdate();
        String q="select appID from appointment where pid=?";
        ps=con.prepareStatement(q);
        ps.setInt(1,pid);
        ResultSet rs=ps.executeQuery();
        rs.next();
        int id=rs.getInt(1);
        out.println("APPOINTMENT ID:"+id);
        String qr="update patient set LastVisitDate=? where pid=?";
        ps=con.prepareStatement(qr);
        ps.setString(1,date);
        ps.setInt(2,pid);
        ps.executeUpdate();
        con.close();
        //RequestDispatcher r=request.getRequestDispatcher("schapp.jsp");
        //r.forward(request,response);
        %>
    </body>
</html>
