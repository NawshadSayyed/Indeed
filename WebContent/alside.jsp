<%@page import="com.Authenticate.AuthenticateModel"%>
<% 
AuthenticateModel am=(AuthenticateModel)session.getAttribute("AuthenticateModel");
if(am.getUserType().equalsIgnoreCase("Admin"))
{%>
<jsp:include page="./alsideAdmin.jsp"></jsp:include>
<%}else if(am.getUserType().equalsIgnoreCase("Employer"))
{%>
<jsp:include page="./alsideEmployer.jsp"></jsp:include>
<%}
else if(am.getUserType().equalsIgnoreCase("Consultant"))
{%>
<jsp:include page="./alsideConsultant.jsp"></jsp:include>
<%}

%>