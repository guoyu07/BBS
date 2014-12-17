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
    //获取某个帖子的信息
	public Post getPostById(int id){
		Connection conn=null;
		ResultSet rs=null;
		Post post=new Post();
		conn=DBHelper.getConnection();
		String sql = "select * from posts where id=?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()){
				post.setId(rs.getInt("id"));
				post.setUserName(rs.getString("username"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setTime(rs.getTimestamp("time"));
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
		return post;
	}
}
