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

String a=request.getParameter("T1");
String b=request.getParameter("T2");
String c=request.getParameter("T3");
String d=request.getParameter("T4");
String e=request.getParameter("T5");
String f=request.getParameter("R1");

try{
Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");


PreparedStatement ps2=con.prepareStatement("update CHARITIES set grade=?,ind_limit=?,tot_limit=?,tax_exmp=?,current_status=? where charityID=?");
ps2.setString(1,b);
ps2.setString(2,c);
ps2.setString(3,d);
ps2.setString(4,e);
ps2.setString(5,f);
ps2.setString(6,a);
if(ps2.executeUpdate()>0)
{
%>

<center><font color=blue>
<h2>Charity Tax Examption is Updated Successfully... . <a href="./charities.jsp"><font color=red>Go Back</font></a>
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