<%-- 
    Document   : index.jsp
    Created on : 08-Dec-2022, 12:56:29 pm
    Author     : Sowmi
--%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
    Connection con;
    PreparedStatement ps1, ps2,ps3;
    
    
    public void jspInit()
    {
        try
        {
            //loading the driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            //establish the connection
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
            //create statement object
            ps1 = con.prepareStatement("select count(*) from credentials where username = ? and password=?");
            ps2 = con.prepareStatement("select * from credentials");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
    
        //write jdbc code for authentication
        String user = request.getParameter("uname");
        session.setAttribute("Nam",user);
        String pass = request.getParameter("pwd");
        //set form data as param value
        ps1.setString(1,user);
        ps1.setString(2,pass);
        //excute the query
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
            cnt = rs.getInt(1);
        if(cnt == 0){
         
        ps3 = con.prepareStatement("select attempt from credentials where username='"+user+"'");
        ResultSet rs2 = ps3.executeQuery();
        rs2.next();
        int at = rs2.getInt(1);
        at--;
        String sql = "UPDATE Credentials SET attempt = "+at+" WHERE username ='"+user+"'";
        Statement st = con.createStatement();
        st.executeUpdate(sql);
        
        if(at<=0)
        {
            String redirectURL = "maxattempt.jsp";
            response.sendRedirect(redirectURL);
        }
        else{
            String redirectURL = "invalid.jsp";
            response.sendRedirect(redirectURL);
        }
        
        }

        
        else if(user.equals("admin"))
        {
            String redirectURL = "adminwelcome.jsp";
            response.sendRedirect(redirectURL);
        }
        else
        {
            String redirectURL = "welcome.jsp";
            response.sendRedirect(redirectURL);
        }
%>
<%!
    public void jspDestroy()
    {
        try
        {
            
            ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
