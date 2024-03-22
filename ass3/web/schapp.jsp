<%-- 
    Document   : schapp
    Created on : 05-Oct-2023, 11:39:13 am
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
        <form action="newpatient.jsp">
        <input type="submit" value="New Patient">
        </form>
        <br>
        <form action="submitappointment.jsp">
            Patient ID:<input type="text" name="pid" id="1">
            <br>
            <br>
           Doctor Name:
            <%

            //String user = request.getParameter("uname");
	    //String pass = request.getParameter("pwd");
            //response.setContentType("text/html");

	    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ass3","root","dhyana");
            Statement st=con.createStatement();
            String q="select DoctorName from doctor";
            
            ResultSet rs = st.executeQuery(q);
            
            out.println("<select name=''>");
            while(rs.next())
            {
            String fname = rs.getString("DoctorName"); 
            %>
            <option value="<%=fname%>"><%=fname %></option>
            <%
            }
            out.println("</select>");
            %>
        
            <br>    
            <br>
            Appointment Date:<input type="date" name="app">
            <br>
            <br>
            Payment Done:
            <br>
            Paid<input type="radio" value="paid" name="payment"><br>
            Pending<input type="radio" value="pending" name="payment" onclick="pending()">
            	<div id='input-cont'>
        
                </div>
            <br>
            <br>
            Status:<input type="text" readonly>
            <br>
            <input type="submit" value="submit">
          </form>
            
    </body>
    <script type="text/javascript">
        {
            if(<%=request.getAttribute("pid")%>!=null)
            document.getElementById("1").value="<%=request.getAttribute("pid")%>";
        }
        const container = document.getElementById('input-cont');
        function pending()
        {
            let input = document.createElement('input');
            input.placeholder = 'Enter charges';
            container.appendChild(input);
        }
     </script>
</html>
