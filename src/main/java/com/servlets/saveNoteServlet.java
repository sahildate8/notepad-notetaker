package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class saveNoteServlet
 */
public class saveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try
		{
			
			String title= request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date());
			
		//	System.out.println(note.getId()+" "+ note.getTitle());
			
			// hibernate.save()
					org.hibernate.Session s =  FactoryProvider.getFactory().openSession();
					Transaction tx = s.beginTransaction();
					s.save(note);
					tx.commit();
					
					s.close();
					response.setContentType("text/html");
					PrintWriter pw = response.getWriter();
					pw.println("<h1 Style ='text-align:center;'> Note added successfully</h1>");
					pw.println("<h1 Style ='text-align:center;'><a href='all_notes.jsp'>View all notes</a> </h1>");

					
					
					
			
			
			
			
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
