package g07_msgboard.model;

import java.util.List;

public class CommentsService {
	private CommentsDAO cdao = new CommentsDAO();
	
	public int recover(int commentId){
		return cdao.recover(commentId);
	}
	public int hide(int commentId){
		return cdao.hide(commentId);
	}
	public int update(int commentId){
		return cdao.update(commentId);
	}
	public int insert(String userName, String comment){
		return cdao.insert(userName, comment);
	}
	public List<CommentsVO> select(){
		return cdao.select();
	}
	public int delete(int commentId){
		return cdao.delete(commentId);
	}
}
