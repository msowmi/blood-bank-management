<%-- 
    Document   : register.jsp
    Created on : 08-Dec-2022, 2:12:43 pm
    Author     : Sowmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, java.util.*"%>
<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");
%>
<%
    String username = request.getParameter("uname");
    String password = request.getParameter("pwd");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    
    PreparedStatement ps1, ps2;

    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    ps1 = con.prepareStatement("select * from credentials where username = ?");
    ps2 = con.prepareStatement("select * from credentials where email = ?");

    ps1.setString(1, username);
    ResultSet rs1 = ps1.executeQuery();
    ps2.setString(1, email);
    ResultSet rs2 = ps2.executeQuery();
//    if (rs1.next()) {
//        String redirectURL = "uname.jsp";
//        response.sendRedirect(redirectURL);
//    } //        out.println("<b><i><font color=red>Username already exists</font></i></b>");
//    else if (rs2.next()) {
//        String redirectURL = "mailid.jsp";
//        response.sendRedirect(redirectURL);
//    } //        out.println("<b><i><font color=red>Email ID already exists</font></i></b>");   
    
        //create statement object
        Statement st = con.createStatement();
        int i = st.executeUpdate("INSERT INTO credentials (username, password, email, contact, attempt) " + "VALUES ('" + username + "','" + password + "','" + email + "'," + "'"+ contact +"',"+"3)");

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
        String redirectURL = "index.html";
        response.sendRedirect(redirectURL);
    

%>



