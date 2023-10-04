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
String a=request.getParameter("T1");
String b=request.getParameter("T2");
String c=request.getParameter("T3");
String d=request.getParameter("T4");
String e=request.getParameter("T5");
String f=request.getParameter("T6");
String g=request.getParameter("T7");
String h=request.getParameter("T8");
try{
Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");


PreparedStatement ps1=con.prepareStatement("SELECT max(DonationID) FROM Donations");
System.out.println("done");
ResultSet rs=ps1.executeQuery();
if(rs.next())
{
ID=rs.getInt(1)+1;
}
PreparedStatement ps2=con.prepareStatement("insert into donations (donationid,donorid,charityID,dPAN,amount,ddate,remarks,EMAIL,PHONE) values (?,?,?,?,?,?,?,?,?)");
ps2.setInt(1,ID);
ps2.setString(2,a);
ps2.setString(3,b);
ps2.setString(4,c);
ps2.setString(5,d);
ps2.setString(6,e);
ps2.setString(7,f);
ps2.setString(8,g);
ps2.setString(9,h);

if(ps2.executeUpdate()>0)
{
%>

<center><font color=blue>
<h2>Your Donation Reference no is <%=ID%>. <a href="donorhome.jsp"><font color=red>Home</font></a>
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