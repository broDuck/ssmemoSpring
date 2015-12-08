package ssm.duck.domain;

public class SearchCriteria extends Criteria {

	private String keyword;
	private String searchType;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return super.toString() + "SearchCriteria [keyword=" + keyword + "]";
	}
	
}
