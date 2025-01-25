<%-- 
    Document   : update
    Created on : 20-Dec-2022, 6:33:20 pm
    Author     : Sowmi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, java.util.*"%>
<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");
%>
<%
    
    String userid = request.getParameter("userid");
    String reqid = request.getParameter("reqid");
    
    
    
    PreparedStatement ps, ps2, ps3, ps4;

    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    //create statement object
    Statement st = con.createStatement();
    boolean j=true;
//    int i = st.executeUpdate("INSERT INTO details (userid, fname, lname, email, phone, street, city, country, dob, gender, blood) " + "VALUES (" + userid + ",'" + fname + "','" + lname + "'," + "'"+ email +"','"+phone+"','"+street+"','"+city+"','"+country+"','"+dob+"','"+gender+"','"+blood+"')");
    ps = con.prepareStatement("update search set status = ? where reqid = ?");
  ps.setBoolean(1, j);
  ps.setString(2, reqid);
  ps.executeUpdate();

  
    boolean k=true;
//    int i = st.executeUpdate("INSERT INTO details (userid, fname, lname, email, phone, street, city, country, dob, gender, blood) " + "VALUES (" + userid + ",'" + fname + "','" + lname + "'," + "'"+ email +"','"+phone+"','"+street+"','"+city+"','"+country+"','"+dob+"','"+gender+"','"+blood+"')");
    ps3 = con.prepareStatement("update eligible set status = ? where reqid = ?");
  ps3.setBoolean(1, k);
  ps3.setString(2, reqid);
  ps3.executeUpdate();
  
  
   ResultSet rs2 = st.executeQuery("select userid from donor where reqid = '" + reqid+"'");
   rs2.next();
   String myid = rs2.getString(1);

  ps2 = con.prepareStatement("update details set lastdonated = CURRENT_DATE where userid = ?");
 
  ps2.setString(1, myid);
  ps2.executeUpdate();
  
  ps4 = con.prepareStatement("update details set donated=true where userid = ?");
 
  ps4.setString(1, myid);
  ps4.executeUpdate();
  
        //creating user inbox
        try {
//        String QueryString1 = "create table "+ username+"_inbox(sno INT not null, from_address varchar(20),to_address varchar(20),subject varchar(20), content varchar(20), primary key(sno) )";
//    st.executeUpdate(QueryString1); 
//    
//    
//    //creating user sent mail
//    String QueryString2 = "create table "+ username+"_sent(sno INT not null, from_address varchar(20),to_address varchar(20),subject varchar(20), content varchar(20), primary key(sno) )";
//    st.executeUpdate(QueryString2);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        //    out.println("Data is successfully inserted!");
        String redirectURL = "adminwelcome.jsp";
        response.sendRedirect(redirectURL);
    

%>
