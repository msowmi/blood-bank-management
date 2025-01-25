<%-- 
    Document   : search
    Created on : 10-Dec-2022, 12:24:05 pm
    Author     : Sowmi
--%>



<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, java.util.*"%>
<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");
%>
<%
    
    String userid = request.getParameter("userid");
    String fname = request.getParameter("firstname");
    String lname = request.getParameter("lastname");
    String phone = request.getParameter("phone");
    String city = request.getParameter("city");
    String country = request.getParameter("country");
    String blood = request.getParameter("blood");
    String hospital = request.getParameter("hospital");
    
    
    
    PreparedStatement ps, ps2;

    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    //create statement object
    Statement st = con.createStatement();
    int j=1;
    int i = st.executeUpdate("INSERT INTO search (userid, fname, lname, phone, city, country, blood, hospital) " + "VALUES (" + userid + ",'" + fname + "','" + lname + "','"+phone+"','"+city+"','"+country+"','"+blood+"','"+hospital+"')");
    
      
        try {

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        //    out.println("Data is successfully inserted!");
        String redirectURL = "welcome.jsp";
        response.sendRedirect(redirectURL);
    

%>