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

@WebServlet("/Login")

public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("email");
			String pw = req.getParameter("password");
			User u = new User();
			
			HttpSession session = req.getSession();
			if("admin@gmail.com".equals(em) && "admin@12".equals(pw)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}else {
				UserDAO ud = new UserDAO(DBConnect.getConnect());
				User user = ud.userValid(em, pw); 
				if(user != null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("home.jsp");
				}else {
					session.setAttribute("succMsg", "Invalid Credentials..");
					resp.sendRedirect("login.jsp");
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
