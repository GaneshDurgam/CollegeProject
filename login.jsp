<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="style1.css" />
</head>

<body>

<%@include file='head.jsp'%>
<%@page import='java.sql.*,java.util.*'%>
<%
String sid=request.getParameter("T1");
String psw=request.getParameter("T2");
String utype=request.getParameter("T3");

if(sid.equals("itd") && psw.equals("itd"))
{
session.setAttribute("SName","expert");

%>
<jsp:forward page='itdhome.jsp'/>

<%
}
else if(utype.equals("Donor"))
{

try{
Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");


PreparedStatement ps1=con.prepareStatement("select donorID,Password from donors where donorID=? and Password=?");
ps1.setString(1,sid);
ps1.setString(2,psw);

ResultSet rs=ps1.executeQuery();
if(rs.next())
{
%>
<jsp:forward page='donorhome.jsp'/>
<%
}
else
{ 
%>
<jsp:forward page="LoginError.jsp"/>
<%
}
}catch(Exception ex){

System.out.println(ex.getMessage());}
%>
<jsp:forward page="LoginError.jsp"/>
<%
}else if(utype.equals("Charity"))
{
try{


Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");



PreparedStatement ps1=con.prepareStatement("select charityid,Password from charities where charityID=? and Password=?");
ps1.setString(1,sid);
ps1.setString(2,psw);

ResultSet rs=ps1.executeQuery();
if(rs.next())
{
%>
<jsp:forward page='charityhome.jsp'/>
<%
}
else
{ 
%>
<jsp:forward page="LoginError.jsp"/>
<%
}
}catch(Exception ex){

System.out.println(ex.getMessage());}
%>
<jsp:forward page="LoginError.jsp"/>
<%
}
%>


</div>
</center>
</tr>
</table>
</BODY>
</HTML>