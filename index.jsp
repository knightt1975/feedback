<%@ page import="java.sql.*"%>
<html> 
<head>
<title>FeedBack System</title>
<style>
*{font-size:35px;}
.nav{background-color:black;}
.nav a{
color:white;
text-decoration:none;
margin:10%;
}
textarea{resize:none;}
body{background-color:steelblue;}
form{
  position: absolute;
  top: 55%;
  left: 50%;
  width: 800px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}
.button{background-color:royalblue;}
.rating {
  display: inline-block;
}

.rating input {
  display: none;
}

.rating label {
  float: right;
  font-size: 90px;
  color: ;
  cursor: pointer;
}

.rating label:before {
  content: '\2605'; 
}

.rating input:checked ~ label {
  color: yellow; 
}
label{
display:inline-block;
text-align:right !important;
color:white;
}

</style>
<script>
function check()
{
let name = document.getElementById("name");
let email = document.getElementById("email");
let fb = document.getElementById("fb");
if(name.value=="")
{
alert("name should not be empty");
name.focus();
return false;
}

if(name.value.trim().length==0)
{
alert("name cannot be only sapces");
name.focus();
name.value="";
return false;
}

if(!name.value.match(/^[A-z]+$/))
{
alert("name should contain alphabets");
name.focus();
name.value="";
return false;
}

if(email.value=="")
{
alert("email should not be empty");
email.focus();

return false;
}

if(email.value.trim().length==0)
{
alert("email cannot be only sapces");
email.focus();
email.value="";
return false;
}



if(fb.value=="")
{
alert("fb should not be empty");
fb.focus();
return false;
}

if(fb.value.trim().length==0)
{
alert("fb cannot be only sapces");
fb.focus();
fb.value="";
return false;
}

if(!fb.value.match(/^[A-z ]+$/))
{
alert("fb should contain alphabets");
fb.focus();
fb.value="";
return false;
}
else

if(fb.value.trim().length<3 || (fb.value.trim().length>50))
{
alert("fb should contain atleast three characters and max 50 char");
fb.focus();
fb.value="";
return false;
}


}
</script>
</head>
<body>
<center>
<div class="nav">
<a href="index.jsp">Give FeedBack</a>
<a href="login.jsp">Admin Login</a>
</div>

<form onsubmit="return check()">
<input type="text" name="na" placeholder="enter name" id="name" />
<br><br>
<input type="email" name="em" placeholder="enter email" id="email"/>
<br><br>
<textarea name="txt" placeholder="enter feedback" rows=3 cols=30 id="fb"></textarea>
<br><br>
Rate Us
<br>
<div class="rating">
  <input type="radio" id="star5" name="rating" value="5" />
  <label for="star5"></label>
  <input type="radio" id="star4" name="rating" value="4" />
  <label for="star4"></label>
  <input type="radio" id="star3" name="rating" value="3" />
  <label for="star3"></label>
  <input type="radio" id="star2" name="rating" value="2" />
  <label for="star2"></label>
  <input type="radio" id="star1" name="rating" value="1" />
  <label for="star1"></label>
</div>
<br><br>
<input type="submit" name="btn" class="button"/>
<br>
<%
if(request.getParameter("btn") != null)
{
String name = request.getParameter("na");
String email = request.getParameter("em");
String fb = request.getParameter("txt");
int rating = Integer.parseInt(request.getParameter("rating"));
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/feedback_20july23";
Connection con = DriverManager.getConnection(url,"root","abc123");
String sql = "insert into feedback values(?,?,?,?)";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1,name);
pst.setString(2,email);
pst.setString(3,fb);
pst.setInt(4,rating);
pst.executeUpdate();
out.println("thank you for your feedback");
con.close();
}
catch(SQLException e)
{
out.println("sql issue "+e);
}}
%>
</form>
</center>
</body>
</html>