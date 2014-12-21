package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBHelper;
import entity.User;

public class UserDAO {
	public void userLogin(User user){
		Connection conn=null;
		conn=DBHelper.getConnection();
		String sql = "insert users(name,password,email,phone) values(?,?,?,?)";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			System.out.println(1111111111);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getPhone());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
