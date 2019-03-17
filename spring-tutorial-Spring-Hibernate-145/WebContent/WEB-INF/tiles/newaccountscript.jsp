<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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