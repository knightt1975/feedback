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
form{
  position: absolute;
  top: 35%;
  left: 50%;
  width: 600px;
  height: 250px;
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
<div class = "nav">
<a href = "home.jsp">View</a>
<a href = "logout.jsp">Logout</a>
</div>
<script>
  function confirmLogout() {
    return confirm("Are you sure you want to logout?");
  }
</script>

<%
String un = (String)session.getAttribute("un");
if(un == null)
{
response.sendRedirect("index.jsp");
}
%>
<br>
<form>
<input type = "submit" value = "Logout" name = "btn" onclick="return confirmLogout()" class = "button"/>
</form>
<%
if(request.getParameter("btn") !=null)
{
session.invalidate();
response.sendRedirect("index.jsp");
}
%>
</center>
</body>
</html>