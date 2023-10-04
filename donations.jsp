<%@include file='head.jsp'%>
<%@include file='itdhead.jsp'%>
<%!
public static void updateBCSig()
{
	try{
             Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");


                                Statement st = con.createStatement();
                                String query = "select donationid,donorid,charityID,dPAN,amount,ddate,remarks,EMAIL,PHONE from donations";
		ResultSet rs = st.executeQuery(query);
		TreeMap<Integer,Block> blockchain=new TreeMap<Integer,Block>();
		


int i=0;
String p="000000";
while (rs.next()) {
int id=rs.getInt(1);
String  a=rs.getString(2);
String  bb=rs.getString(3);
String  c=rs.getString(4);
String  d=rs.getString(5);
String e=rs.getString(6);
String data = id+":"+a+":"+bb+":"+c+":"+d+":"+e;
String sig=data.hashCode()+"";
		Block b=new Block(id,data,p);
		b.setData(data);
		blockchain.put(i,b);
		i++;
                                    }
Block fb=blockchain.get(0);
Block lb=blockchain.get(blockchain.size()-2);
String lbs=(lb.getData()+lb.getSig()).hashCode()+"";
fb.setSig(lbs);
		

for(i=1;i<blockchain.size();i++)
{
Block pb=blockchain.get(i-1);
Block nb=blockchain.get(i);
String pbs=(pb.getData()+pb.getSig()).hashCode()+"";
nb.setSig(pbs);
blockchain.put(i,nb);
}

st.execute("delete from  BlockChain");

		
		for(int ki:blockchain.keySet())
		{
		Block b=blockchain.get(ki);
st.execute("INSERT INTO BlockChain(id,DataName,bSignature) VALUES("+b.getId()+",'"+b.getDataName()+"','"+b.getSig()+"')");
System.out.println(b);
		}
		}catch(Exception ex){System.out.println("BC:"+ex);}
}

%>
<html>
<head>

<body >
<!--background="images\88.jpg"-->
<%@page import='java.sql.*,java.util.*,pack.Block'%>

<%!
int mid=1;
Vector filenames=new Vector();
%>
<%

Class.forName(Beans.DB.DriverClass);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:XE","charity","charity");

updateBCSig();
try{


PreparedStatement ps=con.prepareStatement("select * from donations");
ResultSet rs=ps.executeQuery();
%>


<center>
<table border="4" width="1102"  height="20%" bgcolor="E8E8E8"  bordercolor="gray">
  <tr>
    <td width="12%"><b>ID</b></td>
    <td width="4%"><b>Donar ID</b></td>
    <td width="5%"><b>Charity ID</b></td>
	<td width="2%"><b>Donor PAN</b></td>
    <td width="17%"><b>Amount</b></td>
    <td width="30%"><b>Date of Donation</b></td>
    <td width="21%"><b>Remarks</b></td>
<td width="1%"><b>Email</b></td>
    <td width="7%"><b>Phone</b></td>
  </tr>
<%
while(rs.next())
{
String a=rs.getString(1);
String b=rs.getString(2);
String c=rs.getString(3);
String d=rs.getString(4);
String e=rs.getString(5);
String f=rs.getString(6);
f=f.split(" ")[0];
String g=rs.getString(7);
String h=rs.getString(8);
String i=rs.getString(9	);

%>

  <tr>
 <td width="12%"><%=a%></td>
 <td width="12%"><%=b%></td>
 <td width="12%"><%=c%></td>
 <td width="12%"><%=d%></td>
 <td width="12%"><%=e%></td>
 <td width="12%"><%=f%></td>
 <td width="12%"><%=g%></td>
 <td width="12%"><%=h%></td>
 <td width="12%"><%=i%></td>

  </tr>
  <%
  }
  }catch(Exception ex){out.println(ex.getMessage());}%>
</table></center>




</div>

</BODY>
</HTML>