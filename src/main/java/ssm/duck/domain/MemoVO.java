package ssm.duck.domain;

import java.util.Date;

public class MemoVO {
	private Integer memo_id;
	private String memo_name;
	private Date reg_date;
	private Date update_date;
	private int memo_count;
	private String memo_group;
	
	public Integer getMemo_id() {
		return memo_id;
	}
	public void setMemo_id(Integer memo_id) {
		this.memo_id = memo_id;
	}
	public String getMemo_name() {
		return memo_name;
	}
	public void setMemo_name(String memo_name) {
		this.memo_name = memo_name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public int getMemo_count() {
		return memo_count;
	}
	public void setMemo_count(int memo_count) {
		this.memo_count = memo_count;
	}
	public String getMemo_group() {
		return memo_group;
	}
	public void setMemo_group(String memo_group) {
		this.memo_group = memo_group;
	}
	
	@Override
	public String toString() {
		return "MemoVO [memo_id=" + memo_id + ", memo_name=" + memo_name + ", reg_date=" + reg_date + ", update_date="
				+ update_date + ", memo_count=" + memo_count + ", memo_group=" + memo_group + "]";
	}
}
