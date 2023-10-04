<%@include file='head.jsp'%>

<script language="JavaScript">
<!--
function validate_email()
{
var apos=f.T3.value.indexOf("@");
var dotpos=f.T3.value.lastIndexOf(".");
if (apos<1||dotpos-apos<2) 
  {alert("Invalid e-mailID");
	f.T3.focus();
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
<center><h1>Donor Registration</h1></center>
<img src="3GLINES/bar5.gif" width="1000" height="7" />
<form METHOD="POST" ACTION="reg_dres.jsp" name="f">
  <center><p>Please identify and describe yourself:</p></center>
<img src="images/OIP2.jfif" width="300" height="300" align="left" />
<img src="images/OIP.jfif" width="300" height="300" align="right" />



<center>
  <blockquote>
   <table width="500" height="300">

      <tr>
        <td ALIGN="left" height="25"><em>Name</em></td>
        <td height="25"><input NAME="T1" SIZE="35"></td>
      </tr>
      <tr>
        <td ALIGN="left" height="25"><em>PAN Number</em></td>
        <td height="25"><input NAME="T2" SIZE="30" MAXLENGTH="30" onblur='fun3()'></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21"><em>Gender</em></td>
        <td height="21"><input TYPE="RADIO" NAME="R1" VALUE="Male" CHECKED> Male
          <input TYPE="RADIO" NAME="R1" VALUE="Female"> Female</td>
      </tr>
      <tr>
        <td ALIGN="left" height="25"><em>Donar Type</em></td>
        <td height="25"><select NAME="D1">
            <option SELECTED>Individual
            <option>Organization
                   </select></td>
      </tr>
	<!--<tr>
        <td ALIGN="left" height="25"><em></em></td>
        <td height="25"><select NAME="D2" size="1">
            <option SELECT>PG
            <option>Professor
            <option>Student
            <option>degree
          </select></td>
      </tr>-->
      <tr>
        <td ALIGN="left" height="59">Address</td>
        <td height="59"><textarea rows="2" name="S1" cols="29"></textarea></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21">e-mail</td>
        <td height="21"><input NAME="T3" SIZE="35" MAXLENGTH="20" onblur='validate_email()'></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21">Phone</td>
        <td height="21"><input NAME="T4" SIZE="35" MAXLENGTH="10" onblur="fun4()"></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21">Password</td>
        <td height="21"><input NAME="T5" SIZE="35" MAXLENGTH="6" type="password"></td>
      </tr>
      <tr>
        <td ALIGN="left" height="21">Confirm Password</td>
        <td height="21"><input NAME="T6" SIZE="35" MAXLENGTH="6" type="password" onblur='fun1()'></td>
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