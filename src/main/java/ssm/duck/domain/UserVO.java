package ssm.duck.domain;

import java.util.Date;

public class UserVO {
	private Integer user_id;
	private String user_email;
	private String salt;
	private String user_name;
	private String user_picture;
	private int access_path;
	private String access_token;
	private String access_id;
	private Date reg_date;
	private String user_friend;
	
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_picture() {
		return user_picture;
	}
	public void setUser_picture(String user_picture) {
		this.user_picture = user_picture;
	}
	public int getAccess_path() {
		return access_path;
	}
	public void setAccess_path(int access_path) {
		this.access_path = access_path;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getAccess_id() {
		return access_id;
	}
	public void setAccess_id(String access_id) {
		this.access_id = access_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getUser_friend() {
		return user_friend;
	}
	public void setUser_friend(String user_friend) {
		this.user_friend = user_friend;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_email=" + user_email + ", salt=" + salt + ", user_name="
				+ user_name + ", user_picture=" + user_picture + ", access_path=" + access_path + ", access_token="
				+ access_token + ", access_id=" + access_id + ", reg_date=" + reg_date + ", user_friend=" + user_friend
				+ "]";
	}
}
