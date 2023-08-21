<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file = "all_js_css.jsp" %>

</head>
<body>
<div
class = "container - fluid"> 

	<%@ include file = "navbar.jsp" %>
	<h1>Edit your Note</h1>
	<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			
			Session s = FactoryProvider.getFactory().openSession();
			
			Note note = s.get(Note.class,noteId);
			
			
			
			
	%>
		<form action ="UpdateServlet" method = "post">
		
		<input value = "<%= note.getId() %>"  name ="noteId" type = "hidden"/>
 
  <div class="form-group">
    <label for="title">Note Title</label>
   
    <input
    name = "title"
    type="text" class="form-control" 
    id="title" 
    aria-describedby="emailHelp" 
    placeholder="Enter here"
    value ="<%= note.getTitle() %>"
    >
    
  </div>
 
  
  <div class="form-group">
    <label for="exampleInputPassword1">Note Content</label>
	<textarea
	name = "content"
	 id="content"
	  placeholder="Enter your content here"
	  class = "form-control">
	  style ="height:300px;"<%= note.getContent() %>
	 
	  
	  </textarea>
  </div>
 

  <button type="submit" class="btn btn-primary">Save your Note</button>
</form>
	
	
</div>

</body>
</html>