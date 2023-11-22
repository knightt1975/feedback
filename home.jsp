<%@ page import="java.sql.*" %>
<html>
<head>
<title>FeedBack App</title>
<style>
*{font-size:40px;}
.nav{background-color:black;}
.nav a{
color:white;
text-decoration:none;
margin:10%;
}
body{background-color:steelblue;}
</style>
</head>
<body>
<center>
<div class = "nav">
<a href = "home.jsp">View</a>
<a href = "logout.jsp">Logout</a>
</div>
<h1>View</h1>
<table border = "5" style = "width:50%"'>
<tr>
<th>Name</th>
<th>Email</th>
<th>Feedback</th>
<th>Rating</th>
<th>Delete</th>
</tr>

<%
String un = (String)session.getAttribute("un");
if(un == null)
{
response.sendRedirect("index.jsp");
}
%>

<%
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/feedback_20july23";
Connection con = DriverManager.getConnection(url ,"root" , "abc123");
String sql = "select * from feedback ";
PreparedStatement pst = con.prepareStatement(sql);
ResultSet rs = pst.executeQuery();
while(rs.next())
{
%>
<tr style = "text-align:center;">
<td><%= rs.getString(1)%></td>
<td><%= rs.getString(2)%></td>
<td><%= rs.getString(3)%></td>
<td><%= rs.getInt(4)%></td>
<td><a href = "delete.jsp?email=<%= rs.getString(2)%>" onclick="return confirm('are you sure ?')">Delete</td>
</tr>
<% }
con.close();
}
catch(SQLException e)
{
out.println("issue" + e);

}

%>
</table>
</center>
</body>
</html>