package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Jobs;
import com.entity.User;

public class UserDAO extends HttpServlet {

	private Connection con;
	public UserDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean register(User u) {
		boolean f = false;
		try {
			
			String sql = "insert into user(name, email, qualification, password, role) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getQualification());
			ps.setString(4, u.getPassword());
			ps.setString(5, "User");
			int i = ps.executeUpdate();
			if(i == 1) f = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User userValid(String em, String pw) {
		
		User u = null;
		
		try {
			String sql = "select * from user where email = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pw);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setQualification(rs.getString(5));
				u.setPassword(rs.getString(4));
				u.setRole(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	public boolean updateUser(User u) {
		boolean f = false;
		try {
			
			String sql = "insert into user(name, email, qualification, password, role) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getQualification());
			ps.setString(4, u.getPassword());
			ps.setString(5, "User");
			int i = ps.executeUpdate();
			if(i == 1) f = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}

