package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;


@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String un = req.getParameter("uname");
		String em = req.getParameter("em");
		String pwd = req.getParameter("pwd");
		String qlf = req.getParameter("quali");
		
		User u = new User(un, em, pwd, qlf, "User");
		
		UserDAO ud = new UserDAO(DBConnect.getConnect());
		HttpSession session = req.getSession();
		boolean f = ud.updateUser(u);
		if(f) {
			session.setAttribute("msg", "Updated Succesfully");
			resp.sendRedirect("view_jobs.jsp");
		}else {
			session.setAttribute("msg", "Failed");
			resp.sendRedirect("view_jobs.jsp");
		}
	}
	
}
