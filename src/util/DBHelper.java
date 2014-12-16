package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
	
	private static final String driver = "com.mysql.jdbc.Driver";
	
	private static final String url = "jdbc:mysql://127.0.0.1:3306/bbs";
	private static final String username="root";
	private static final String password = "096629";

	private static Connection conn;
	static
	{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//单例模式
	public static Connection getConnection(){
		if(conn==null){
			try {
				conn = DriverManager.getConnection(url,username,password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return conn;
		}
		return conn;
	}
	
	public static void main(String[]args){
		Connection conn = DBHelper.getConnection();
		if(conn!=null)
			System.out.println("OK");
	}
}
