package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			JobDAO jd = new JobDAO(DBConnect.getConnect());
			boolean f = jd.deleteJob(id);
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Deleted Successfully");
				resp.sendRedirect("view_jobs.jsp");
			}else {
				session.setAttribute("succMsg", "Something went wrong");
				resp.sendRedirect("view_jobs.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
