package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBHelper;
import entity.User;

public class UserDAO {
	public void addUser(User user){
		Connection conn=null;
		conn=DBHelper.getConnection();
		String sql = "insert users(name,password,email,phone) values(?,?,?,?)";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getPhone());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean loginUser(User user){
		Connection conn=null;
		conn=DBHelper.getConnection();
		boolean flag = false;
		String sql = "select * from users where name=? and password=?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			System.out.println(user.getName()+":"+user.getPassword());
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getPassword());
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				System.out.println("true");
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
