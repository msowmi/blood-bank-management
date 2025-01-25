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
    String fname = request.getParameter("firstname");
    String lname = request.getParameter("lastname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String country = request.getParameter("country");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String blood = request.getParameter("blood");
    String donated = request.getParameter("donated");
    String lastdonated = request.getParameter("lastdonated");
    
    
    
    PreparedStatement ps, ps2;

    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    //create statement object
    Statement st = con.createStatement();
    int j=1;
    if(donated.equals("yes")){
        st.executeUpdate("INSERT INTO details (userid, fname, lname, email, phone, street, city, country, dob, gender, blood, lastdonated, donated) " + "VALUES (" + userid + ",'" + fname + "','" + lname + "'," + "'"+ email +"','"+phone+"','"+street+"','"+city+"','"+country+"','"+dob+"','"+gender+"','"+blood+"','"+lastdonated+"',true)");
    }
    else{
        st.executeUpdate("INSERT INTO details (userid, fname, lname, email, phone, street, city, country, dob, gender, blood, donated) " + "VALUES (" + userid + ",'" + fname + "','" + lname + "'," + "'"+ email +"','"+phone+"','"+street+"','"+city+"','"+country+"','"+dob+"','"+gender+"','"+blood+"',false)");
    }
//    int i = st.executeUpdate("INSERT INTO details (userid, fname, lname, email, phone, street, city, country, dob, gender, blood) " + "VALUES (" + userid + ",'" + fname + "','" + lname + "'," + "'"+ email +"','"+phone+"','"+street+"','"+city+"','"+country+"','"+dob+"','"+gender+"','"+blood+"')");
    ps = con.prepareStatement("update credentials set filled = ? where userid = ?");
  ps.setInt(1, j);
  ps.setString(2, userid);
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