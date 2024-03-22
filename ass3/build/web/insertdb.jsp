<%-- 
    Document   : insertdb
    Created on : 06-Oct-2023, 5:34:09 pm
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

            String name = request.getParameter("pname");
	    String dob = request.getParameter("dob");
            String add = request.getParameter("add");
            String status = request.getParameter("marry");
            String contact = request.getParameter("cont");
            String date = request.getParameter("date");
            response.setContentType("text/html");

	    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ass3","root","dhyana");
            PreparedStatement ps=con.prepareStatement("insert into patient(name,dob,address,MStatus,Contact,RegisteredDate,LastVisitDate) values(?,?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,dob);
            ps.setString(3,add);
            ps.setString(4,status);
            ps.setString(5,contact);
            ps.setString(6,date);
            ps.setString(7,date);
            ps.executeUpdate();
            
            String q="select pid from patient where Contact=?";
            out.println(contact);
            ps=con.prepareStatement(q);
            ps.setString(1,contact);
            
            ResultSet rs=ps.executeQuery();
            rs.next();
            int pid=rs.getInt(1);
            request.setAttribute("pid",pid);
            RequestDispatcher r = request.getRequestDispatcher("schapp.jsp");
            r.forward(request, response);

            %>
    </body>
</html>
