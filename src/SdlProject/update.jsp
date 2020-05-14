<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from post where uid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("uid") %>">
<input type="text" name="id" value="<%=resultSet.getString("uid") %>">
<br>
title:<br>
<input type="text" name="title" value="<%=resultSet.getString("title") %>">
<br>
dept:<br>
<input type="text" name="dept" value="<%=resultSet.getString("deptName") %>">
<br>
person:<br>
<input type="text" name="person" value="<%=resultSet.getString("facultyName") %>">
<br>
descr:<br>
<input type="text" name="descr" value="<%=resultSet.getString("description") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>