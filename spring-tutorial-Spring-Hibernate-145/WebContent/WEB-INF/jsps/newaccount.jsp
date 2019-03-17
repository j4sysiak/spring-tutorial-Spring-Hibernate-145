<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css"  />
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/script/jquery.js"></script>
  
  <script type="text/javascript">
  
   function onLoad(){
	   $("#password").keyup(checkPasswordMatch);
	   $("#confirmpass").keyup(checkPasswordMatch);
	   
	   $("#details").submit(canSubmit);
   }
   
   function canSubmit(){
	   var password = $("#password").val();
	   var confirmpass = $("#confirmpass").val();  
	   
	   if(password != confirmpass){
		   alert("<fmt:message key='UnmachedPasswords.user.passwords' />")
		   return false;
	   } else {
		   return true;
	   }
   }
  
   function checkPasswordMatch(){
	   var password = $("#password").val();
	   var confirmpass = $("#confirmpass").val();  
	   
  if(password.length > 3 || confirmpass.length > 3){
		     
	    
	   
	   if(password == confirmpass){
		   $("#matchpass").text("<fmt:message key='MachedPasswords.user.passwords' />");
		   $("#matchpass").addClass("valid");
		   $("#matchpass").removeClass("error");
		    
	   } else {
		   $("#matchpass").text("<fmt:message key='UnmachedPasswords.user.passwords' />");
		   $("#matchpass").addClass("error");
		   $("#matchpass").removeClass("valid");
	   }
   }
	   
	   //alert(password + ": " + confirmpass);
   }
   
   $(document).ready(onLoad);
  
  </script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Account</title>
</head>
<body>

 

<h2>Create New Account</h2>
 
  <sf:form id="details" method="post" action="${pageContext.request.contextPath}/createaccount" commandName="user">
  
  <table class="formtable">
  <tr><td class ="label" >Username: </td><td><sf:input class="control"  path="username" name="username" type="text" /><br/><div class="error"><sf:errors path="username"></sf:errors></div></td></tr>
  <tr><td class ="label" >Email: </td><td><sf:input class="control"  path="email"    name="email"    type="text" /><br/><div class="error"><sf:errors path="email">   </sf:errors></div></td></tr>
  <tr><td class ="label" >Password: </td><td><sf:input id="password" class="control"  path="password" name="password" type="password" /><br/><div class="error"><sf:errors path="password"></sf:errors></div></td></tr>
  <tr><td class ="label" >Confirm Password: </td><td><input id="confirmpass" class="control"  name="confirmpass" type="password" /><div id="matchpass"></div></td></tr>
  <tr><td class ="label" > </td><td><input  class="control" value="Create account" type="submit" /><br/></td></tr>
  </table>
  
  </sf:form>
   
</body>
</html>
















































































