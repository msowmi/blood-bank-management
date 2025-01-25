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
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    String username = (String) session.getAttribute("Nam");
    Statement st = con.createStatement(); 
    ResultSet resultset = st.executeQuery("select userid from credentials where username = '" + username + "'");
    resultset.next();
//    String myid = resultset.getString(1); 
//    int mid=Integer.parseInt(myid);
//    
    int mid=resultset.getInt(1);
    
    String iter = request.getParameter("iter");
//    int i=Integer.parseInt(iter);
//    System.out.println("iii="+i);
    String bname = request.getParameter("bname"+iter);
    ResultSet resultset1 = st.executeQuery("select bid from bloodbank where bname = '" + bname + "'");
    resultset1.next();
//    String b = resultset1.getString(1); 
//    int bid=Integer.parseInt(b);
    int bid= resultset1.getInt(1);
    String rate = request.getParameter("rating"+iter);
    
    Statement st1 = con.createStatement();;
    PreparedStatement ps, ps2;
     st1.executeUpdate("INSERT INTO rating VALUES ('" +bname + "','" + rate + "'," + mid + ")");
     try {
            String csv = "C:/Users/Sowmi/Documents/NetBeansProjects/WebApplication5/datasetdwnld.csv";
      CSVWriter writer = new CSVWriter(new FileWriter(csv, true));
      String d=""+mid+">"+bid+">"+rate;
      String [] record = d.split(">");

      writer.writeNext(record);
     
      writer.close();
             
        } catch (Exception ex) {
            ex.printStackTrace();
        }

      

        //    out.println("Data is successfully inserted!");
        String redirectURL = "welcome.jsp";
        response.sendRedirect(redirectURL);
    

%>