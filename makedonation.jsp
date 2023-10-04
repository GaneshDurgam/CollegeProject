<%@include file='head.jsp'%>

<script language="JavaScript">
<!--
function validate_email()
{
var apos=f.T7.value.indexOf("@");
var dotpos=f.T7.value.lastIndexOf(".");
if (apos<1||dotpos-apos<2) 
  {alert("Invalid e-mailID");
	f.T7.focus();
	return false;
}
else {return true;}
}

function fun3()
{
var pan=f.T2.value;
if(pan=="")
{alert("Invalid PAN");f.T2.focus();}
return false;
}

function fun4()
{
var phone=parseInt(f.T4.value);
if(!phone>0)
{alert("Invalid phone");
f.T4.focus();}
return false;
}


function fun1()
{
	
	var pass1=f.T5.value;
	var pass2=f.T6.value;
	if (pass1==pass2)
	{}
	else
	{
		window.alert("Not valid password");
	}
}
-->
</script>
</head>
<body background="images/2007.jpg">
<center><h1>Make Donation to a Charity</h1></center>
<img src="3GLINES/bar5.gif" width="1000" height="7" />
<form METHOD="POST" ACTION="makedonationres.jsp" name="f">
  <center><p>Please identify and describe yourself:</p></center>
<img src="images/OIP2.jfif" width="300" height="300" align="left" />
<img src="images/OIP.jfif" width="300" height="300" align="right" />



<center>
  <blockquote>
   <table width="500" height="300">
<tr>
        <td ALIGN="left" height="25"><em>Donor ID</em></td>
        <td height="25"><input NAME="T1" SIZE="35"></td>
      </tr>
      <tr>
        <td ALIGN="left" height="25"><em>Charity ID</em></td>
        <td height="25"><input NAME="T2" SIZE="35"></td>
      </tr>
      <tr>
        <td ALIGN="left" height="25"><em>Donor PAN Number</em></td>
        <td height="25"><input NAME="T3" SIZE="30" MAXLENGTH="30" onblur='fun3()'></td>
      </tr>
      <tr>
        <td ALIGN="left" height="25"><em>Amount of Donation </em></td>
        <td height="25"><input NAME="T4" SIZE="30" MAXLENGTH="30" onblur='fun3()'></td>
 </tr>
      <tr>
        <td ALIGN="left" height="25"><em>Date of Donation </em></td>           
  <td height="25"><input NAME="T5" SIZE="30" MAXLENGTH="30" onblur='fun3()'></td>
      </tr>
	
      <tr>
        <td ALIGN="left" height="59">Remarks</td>
        <td height="59"><textarea rows="2" name="T6" cols="29"></textarea></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21">e-mail</td>
        <td height="21"><input NAME="T7" SIZE="35" MAXLENGTH="20" onblur='validate_email()'></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21">Phone</td>
        <td height="21"><input NAME="T8" SIZE="35" MAXLENGTH="10" onblur="fun4()"></td>
      </tr>
    </table>
  </blockquote>
  <input TYPE="submit" VALUE="Submit Form" name="B1" > <input TYPE="RESET" VALUE="Reset Form">
</form>
</center>
</div>
</center>
</tr>
</table>
</BODY>
</HTML>