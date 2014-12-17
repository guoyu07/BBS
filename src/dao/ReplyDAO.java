package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBHelper;
import entity.Reply;

public class ReplyDAO {

	//获取某一帖子的回复
	public ArrayList<Reply> getReply(int postId){
		Connection conn=null;
		ResultSet rs=null;
		ArrayList<Reply> replys = new ArrayList<Reply>();
		conn=DBHelper.getConnection();
		String sql = "select * from reply where postid=? ordery by time";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, postId);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				Reply reply = new Reply();
				reply.setId(rs.getInt("id"));
				reply.setPostId(rs.getInt("postid"));
				reply.setUserName(rs.getString("username"));
				reply.setTime(rs.getTimestamp("time"));
				replys.add(reply);
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
		return replys;
	}

}
