<%@ page import="java.sql.*"%>

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
form{
  position: absolute;
  top: 45%;
  left: 50%;
  width: 600px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;

}
.button{background-color:royalblue;}
</style>
</head>
<body>
<center>
<div class="nav">
<a href="index.jsp">Give Feedback</a>
<a href="login.jsp">Admin login</a>
</div>
<br>

<form>
<input type="text" name="un" placeholder="enter userrname" required>
<br><br>
<input type="password"name="pw" placeholder="enter password" required>
<br><br>
<input type="submit" value="Login" name="btn" class = "button"/>
<br><br>


<%
if(request.getParameter("btn") != null)
{
String un = request.getParameter("un");
String pw = request.getParameter("pw");

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/feedback_20july23";
Connection con = DriverManager.getConnection(url ,"root" , "abc123");
String sql = "select*from user where un = ? and pw = ?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
session.setAttribute("un",un);
response.sendRedirect("home.jsp");
}
else
{
out.println("invalid login");
}
con.close();
}
catch(SQLException e)
{
out.println("sql issue" + e);
}

}

%>
</form>
</center>

</body>

</html>