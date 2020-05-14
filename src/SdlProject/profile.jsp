<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    String un = (String) session.getAttribute("uname");
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://192.168.2.4:3306/";
String database = "complaintportal";
String userid = "root";
String password = "admin";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en">
<head>
<title>CSS Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/navi.css">
<link rel="stylesheet" href="css/scrollstyle.css">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: #252636;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 20%;
  
  background: #313348;
  padding: 20px;
  margin-left: 25px;
  margin-top: 20px;
  color: white;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 75%;
  margin-left: 25px;
  margin-top: 20px;
  background-color: #313348;
  height: 670px; /* only for demonstration, should be removed */
  color: white;
  overflow: auto;
}

/* Clear floats after the columns */
section:after {
  content: "";
  display: table;
  clear: both;

}


/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  width:40px;
  height:40px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 10px;
}
.button2 {background-color: #f44336;} /* Red */ 

.sidbutton {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  width: 100%;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
}
</style>
</head>
<body>
<div class="navbar">
  <a href="index.html"><i class="fa fa-fw fa-home"></i> Home</a> 
  <a href="#"><i class="fa fa-fw fa-envelope"></i> Contact</a>
  <a class="active" href="home.html"><i class="fa fa-fw fa-user"></i>Profile</a>
  <a  href="index.html" style="float: right;"><i class="fa fa-sign-out"></i>Logout</a>
</div>

<section>
  <nav>
      <center><i class="fa fa-user-circle-o" style="font-size:100px;color:#FE9800"></i></center>
      <p><%=un%></p>
      <p>Email</p>
      <p>No. Of Comaplaints</p>
      <a href="addpost.html" class="sidbutton">Reg. Complaint</a><br><br>
      <a href="mycomplaints.jsp" class="sidbutton">My Complaints</a>
  </nav>
  
  <article>

    <h2>All Complaints</h2>
    <br>
      <div class="w3-container">
          <table class="w3-table w3-bordered">
            <tr>
              <th>id</th>
              <th>Title</th>
              <th>Department</th>
              <th>Faculty</th>
              <th>Description</th>
            </tr>
            <%
                try{
                connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                statement=connection.createStatement();
                String sql ="select * from post";
                resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
                %>
            <tr>
                <td><%=resultSet.getString("uid") %></td>
                <td><%=resultSet.getString("title") %></td>
                <td><%=resultSet.getString("deptName") %></td>
                <td><%=resultSet.getString("facultyName") %></td>
                <td><%=resultSet.getString("description") %></td>
            </tr>
            <%
            }
            connection.close();
            } catch (Exception e) {
            e.printStackTrace();
            }
            %>
            
          </table>
        </div>
  </article>
</section>

</body>
</html>
