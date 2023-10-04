D
<%@include file='head.jsp'%>

<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="style1.css" />
</head>

<body>
<center>
<table>
<tr>

<%@page import='java.sql.*,java.util.*'%>
<%
int ID=1;
String Name=request.getParameter("T1");
String PAN=request.getParameter("T2");
String regno=request.getParameter("R1");
String ctype=request.getParameter("D1");
String Address=request.getParameter("S1");
String Email=request.getParameter("T3");
String Phone=request.getParameter("T4");
String Password1=request.getParameter("T5");
try{
Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");


PreparedStatement ps1=con.prepareStatement("SELECT max(charityID) FROM CHARITIES");
System.out.println("done");
ResultSet rs=ps1.executeQuery();
if(rs.next())
{
ID=rs.getInt(1)+1;
}
System.out.println("ID="+ID);
PreparedStatement ps2=con.prepareStatement("insert into CHARITIES (charityID,ORGNAME,PAN,REGNO,CTYPE,ADDRESS,EMAIL,PHONE,Password) values (?,?,?,?,?,?,?,?,?)");
ps2.setInt(1,ID);
ps2.setString(2,Name);
ps2.setString(3,PAN);
ps2.setString(4,regno);
ps2.setString(5,ctype);
ps2.setString(6,Address);
ps2.setString(7,Email);
ps2.setString(8,Phone);
ps2.setString(9,Password1);

if(ps2.executeUpdate()>0)
{
%>

<center><font color=blue>
<h2>Your Registration ID is <%=ID%>. <a href="./index.html"><font color=red>Try  Login</font></a>
</h2>
</center>
<%
}

}catch(Exception ex){out.println(ex.getMessage());}

%>


</center>
</tr>
</table>
</BODY>
</HTML>