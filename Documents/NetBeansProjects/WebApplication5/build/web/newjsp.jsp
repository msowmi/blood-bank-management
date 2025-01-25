<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>

<%@page import="java.util.*"%>

<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>

<%@page import="au.com.bytecode.opencsv.CSVWriter"%>


<%
    String username = (String) session.getAttribute("Nam");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    Statement st = con.createStatement();
    ResultSet resultset = st.executeQuery("select userid from credentials where username = '" + username + "'");
    resultset.next();
    String myid = resultset.getString(1); 
    
%>
<html>
    <head></head>
    <body>
        <form action="ItemRecommender"method="POST">
            <input type="hidden" name="name" value="<%= myid%>">
            <button type="submit">submit</button>
        </form>
    </body>
</html>