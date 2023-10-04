<%@include file='head.jsp'%>
<%@include file='itdhead.jsp'%>
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
int charityid=Integer.parseInt(request.getParameter("cid"));

PreparedStatement ps=con.prepareStatement("select * from Charities where charityid="+charityid);
ResultSet rs=ps.executeQuery();
%>


<table>
<tr><td>
<td>
<center>
<table border="0" width="500"  height="20%" bgcolor="E8E8E8"  bordercolor="gray">
  <tr>
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
<td width="12%"><b>ID</b></td> <td width="12%"><%=cid%></td></tr><tr>
    <td width="4%"><b>Org Name</b></td><td width="12%"><%=cname%></td></tr><tr>
<td width="5%"><b>PAN</b></td> <td width="12%"><%=pan%></td></tr><tr>
<td width="8%"><b>Registration No</b></td> <td width="12%"><%=regno%></td></tr><tr>
  <td width="17%"><b>Charity Type</b></td><td width="12%"><%=ctype%></td></tr><tr>
  <td width="1%"><b>Address</b></td> <td width="12%"><%=address%></td></tr><tr>
<td width="12%"><b>Email</b></td> <td width="12%"><%=email%></td></tr><tr>
  <td width="7%"><b>Phone</b></td><td width="12%"><%=phone%></td></tr>
</table></td>
<td>

<center><h1>Charity Registration</h1></center>
<form METHOD="POST" ACTION="itcharityeditres.jsp" name="f">
  <center><p>Please identify and describe yourself:</p></center>




  <blockquote>
   <table width="500" height="300">

      <tr>
        <td ALIGN="left" height="25"><em>Charity ID</em></td>
        <td height="25"><input NAME="T1" SIZE="35" value=<%=cid%> readonly></td>
      </tr>
 <tr>
        <td ALIGN="left" height="25"><em>Grade</em></td>
        <td height="25"><input NAME="T2" SIZE="35"></td>
      </tr>
      <tr>
        <td ALIGN="left" height="25"><em>Indisual Limit(PA)</em></td>
        <td height="25"><input NAME="T3" SIZE="30" MAXLENGTH="30" onblur='fun3()'></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21"><em>Total Limit(PA)</em></td>
        <td height="21"><input NAME="T4" SIZE="30" MAXLENGTH="30" onblur='fun44()'></td>

      </tr>
	<tr>
        <td ALIGN="left" height="21"><em>Tax Exemption(%)</em></td>
        <td height="21"><input NAME="T5" SIZE="30" MAXLENGTH="30" onblur='fun44()'></td>

      </tr>
<tr>
        <td ALIGN="left" height="21"><em>Status</em></td>
        <td height="21"><input type="radio" value="1" NAME="R1" SIZE="30" MAXLENGTH="30">Active
        <input Type="radio" value="0" NAME="R1" SIZE="30" MAXLENGTH="30">NotActive</td>

      </tr>
      
    </table>
  </blockquote>
  <input TYPE="submit" VALUE="Submit Form" name="B1" > <input TYPE="RESET" VALUE="Reset Form">
</form>
</div>
</center>
</tr>
</table>

</td></tr></table>
  <%
  }
  }catch(Exception ex){out.println(ex.getMessage());}%>





</div>

</BODY>
</HTML>