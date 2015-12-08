package ssm.duck.domain;

public class FriendVO {
	private Integer friend_id;
	private int friend_from;
	private int friend_to;
	
	public Integer getFriend_id() {
		return friend_id;
	}
	public void setFriend_id(Integer friend_id) {
		this.friend_id = friend_id;
	}
	public int getFriend_from() {
		return friend_from;
	}
	public void setFriend_from(int friend_from) {
		this.friend_from = friend_from;
	}
	public int getFriend_to() {
		return friend_to;
	}
	public void setFriend_to(int friend_to) {
		this.friend_to = friend_to;
	}
	
	@Override
	public String toString() {
		return "FriendVO [friend_id=" + friend_id + ", friend_from=" + friend_from + ", friend_to=" + friend_to + "]";
	}
}
