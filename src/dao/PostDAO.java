package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBHelper;
import entity.Post;

public class PostDAO {

	//获取所有帖子信息
	public ArrayList<Post> getAllPosts(){
		Connection conn=null;
		ResultSet rs=null;
		ArrayList<Post> posts = new ArrayList<Post>();
		conn=DBHelper.getConnection();
		if(conn==null){
			System.out.println("fuck");
			return null;
		}
		String sql = "select * from posts";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setUserName(rs.getString("username"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setTime(rs.getTimestamp("time"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//释放数据集对象
			if(rs!=null){
				try {
					rs.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				rs=null;
			}
		}
		return posts;
	}
}
