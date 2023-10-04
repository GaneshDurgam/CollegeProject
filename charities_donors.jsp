<%@include file='head.jsp'%>
<%@include file='donorhead.jsp'%>

<html>
<head>

<body >
<!--background="images\88.jpg"-->
<%@page import='java.sql.*,java.util.*'%>

<%!
int mid=1;
Vector filenames=new Vector();
%>
<%
Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");


try{


PreparedStatement ps=con.prepareStatement("select * from Charities where current_status=1");
ResultSet rs=ps.executeQuery();
%>


<center>
<table border="4" width="1102"  height="20%" bgcolor="E8E8E8"  bordercolor="gray">
  <tr>
    <td width="12%"><b>ID</b></td>
    <td width="47%"><b>Org Name</b></td>
    <td width="5%"><b>PAN</b></td>
	<td width="28%"><b>Registration No</b></td>
    <td width="17%"><b>Charity Type</b></td>
    <td width="21%"><b>Address</b></td>
<td width="12%"><b>Email</b></td>
    <td width="17%"><b>Phone</b></td>
<td width="12%"><b>Grade</b></td>
    <td width="12%"><b>Indivisual Limit(PA)</b></td>
    <td width="12%"><b>Total Limit(PA)</b></td>
    <td width="12%"><b>Tax Exemption(%)</b></td>
    <td width="12%"><b>Status</b></td>
  </tr>
<%
while(rs.next())
{
String cid=rs.getString(1);
String cname=rs.getString(2);
String pan=rs.getString(3);
String regno=rs.getString(4);
String ctype=rs.getString(5);
String address=rs.getString(6);
String email=rs.getString(7);
String phone=rs.getString(8);
String grade=rs.getString(10);
String ind_limit=rs.getString(11);
String total_limit=rs.getString(12);
String tax_exmp=rs.getString(13);
String cstatus=rs.getString(14);
%>

  <tr>
 <td width="12%"><%=cid%></td>
 <td width="12%"><%=cname%></td>
 <td width="12%"><%=pan%></td>
 <td width="12%"><%=regno%></td>
 <td width="12%"><%=ctype%></td>
 <td width="12%"><%=address%></td>
 <td width="12%"><%=email%></td>
 <td width="12%"><%=phone%></td>
 <td width="12%"><%if(grade!=null){%><%=grade%><%}%></td>
 <td width="12%"><%if(ind_limit!=null){%><%=ind_limit%><%}%></td>
 <td width="12%"><%if(total_limit!=null){%><%=total_limit%><%}%></td>
 <td width="12%"><%if(tax_exmp!=null){%><%=tax_exmp%><%}%></td>
 <td width="12%"><%if(cstatus!=null){%><%=cstatus%><%}%></td>
   <!-- <td width="47%"><a href='itcharityedit.jsp?cid=<%=cid%>&cname=<%=cname%>'>Edit</a></td>-->
  </tr>
  <%
  }
  }catch(Exception ex){out.println(ex.getMessage());}%>
</table></center>




</div>

</BODY>
</HTML>