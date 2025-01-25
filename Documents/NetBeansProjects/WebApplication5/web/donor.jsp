<%-- 
    Document   : donor
    Created on : 19-Dec-2022, 10:33:05 am
    Author     : Sowmi
--%>

<%-- 
    Document   : details
    Created on : 09-Dec-2022, 3:48:19 pm
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
    String dname = request.getParameter("dname");
    String blood = request.getParameter("blood");
    String hosp = request.getParameter("hosp");
    
  
    
    
    
    PreparedStatement ps, ps3;

    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    //create statement object
    Statement st = con.createStatement();
    int j=1;
    int i = st.executeUpdate("INSERT INTO donor (reqid, userid, username, blood, hospital) " + "VALUES ('" + reqid + "','" + userid + "','" + dname + "'," + "'"+ blood +"','"+hosp+"')");
     boolean k=true;
//    int i = st.executeUpdate("INSERT INTO details (userid, fname, lname, email, phone, street, city, country, dob, gender, blood) " + "VALUES (" + userid + ",'" + fname + "','" + lname + "'," + "'"+ email +"','"+phone+"','"+street+"','"+city+"','"+country+"','"+dob+"','"+gender+"','"+blood+"')");
    ps3 = con.prepareStatement("update eligible set status = ? where reqid = ?");
  ps3.setBoolean(1, k);
  ps3.setString(2, reqid);
  ps3.executeUpdate();
   
  ps = con.prepareStatement("update search set status = ? where reqid = ?");
  ps.setBoolean(1, k);
  ps.setString(2, reqid);
  ps.executeUpdate();
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
        String redirectURL = "welcome.jsp";
        response.sendRedirect(redirectURL);
    

%>
