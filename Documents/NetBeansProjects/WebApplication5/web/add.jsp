<%-- 
    Document   : add
    Created on : 16-Dec-2022, 5:13:29 pm
    Author     : Sowmi
--%>




<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="au.com.bytecode.opencsv.CSVWriter"%>
<%@page import="java.io.*"%>
<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");
%>
<%
    String username = (String) session.getAttribute("Nam");
    String state = request.getParameter("state");
    String district = request.getParameter("district");
    String city = request.getParameter("city");
    String bname = request.getParameter("bname");
    String hname = request.getParameter("hname");
    String phone = request.getParameter("phone");
    String time = request.getParameter("time");
    String cat = request.getParameter("cat");
    String email = request.getParameter("email");
   
    
    
    
    PreparedStatement ps, ps2;

    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    //create statement object
    Statement st1 = con.createStatement();
    ResultSet resultset = st1.executeQuery("select userid from credentials where username = '" + username + "'");
    resultset.next();
    String myid = resultset.getString(1); 
    Statement st = con.createStatement();
    int j=1;
    int i = st.executeUpdate("INSERT INTO bloodbank (state, district, city, bname, hname, category, contact, email,userid,time) " + "VALUES ('" + state + "','" + district + "','" + city + "','"+bname+"','"+hname+"','"+cat+"','"+phone+"','"+email+"',"+myid+",'"+time+"')");
//    
//       try {
//            String csv = "C:/Users/Sowmi/Documents/NetBeansProjects/WebApplication5/test3.csv";
//      CSVWriter writer = new CSVWriter(new FileWriter(csv, true));
//      String d=""+bname+">"+city+">"+district+">"+state+">"+hname+">"+phone+">"+time+">"+cat+">"+email;
//      String [] record = d.split(">");
//
//      writer.writeNext(record);
//     out.println("hi");
//      writer.close();
//             
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }

        //    out.println("Data is successfully inserted!");
        String redirectURL = "welcome.jsp";
        response.sendRedirect(redirectURL);
    

%>