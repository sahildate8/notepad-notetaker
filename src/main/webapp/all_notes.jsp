<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import ="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes: Note Taker</title>
<%@ include file = "all_js_css.jsp" %>

</head>
<body>
<div class = "container - fluid"> 

	<%@ include file = "navbar.jsp" %>
	<br>
	<h1 class = "text-uppercase">All Notes:</h1>
	
	<div class = "row">
	
	<div class = "col-12">
	
		<%
		Session s =FactoryProvider.getFactory().openSession();
		Query query = s.createQuery("from Note");
		query.list();
		List<Note> list = query.list();
		
		for(Note note : list)
		{
			out.println(note.getId()+":"+note.getTitle()+"<br>");
		
		%>
		
		<div class="card mt-3" >
  <img class="card-img-top" style = "max-width :100px" src="img/pencil.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">
    <%= note.getTitle()%></h5>
    <p class="card-text">
    <%= note.getContent() %>
    </p>
    <a href="DeleteServlet1?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
   	<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
    
  </div>
</div>
		
		
	<% 
		}
		s.close();
	
	
	%>
	
	</div>
	
	</div>
	

	</div>

</body>
</html>