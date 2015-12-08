package ssm.duck.domain;

public class MessageVO {

	private Integer message_id;
	private int user_from;
	private int user_to;
	private int auth_info;
	
	public Integer getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Integer message_id) {
		this.message_id = message_id;
	}
	public int getUser_from() {
		return user_from;
	}
	public void setUser_from(int user_from) {
		this.user_from = user_from;
	}
	public int getUser_to() {
		return user_to;
	}
	public void setUser_to(int user_to) {
		this.user_to = user_to;
	}
	public int getAuth_info() {
		return auth_info;
	}
	public void setAuth_info(int auth_info) {
		this.auth_info = auth_info;
	}
	
	@Override
	public String toString() {
		return "MessageVO [message_id=" + message_id + ", user_from=" + user_from + ", user_to=" + user_to
				+ ", auth_info=" + auth_info + "]";
	}
}
