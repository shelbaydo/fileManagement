package entity;
import java.util.List;

/**
 * 
 * @author LILY
 *
 */
public class Page<T> {

	private int pageNum;
	private int pageSize;
	private int totalNum;
	
	
	private int startIndex;
	private int totalPage;
	private List<T> data;
	
	/**
	 * 
	 * @param pageNum 
	 * @param pageSize 
	 * @param totalNum 
	 */
	public Page(int pageNum,int pageSize,int totalNum){
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalNum = totalNum;
		
		
		if(this.pageNum <1)
			this.pageNum =1;
		
		
		//this.totalPage = totalNum%pageSize==0 ? totalNum/pageSize : totalNum/pageSize+1;
		this.totalPage = (totalNum+pageSize-1)/pageSize;
		
		this.startIndex = (pageNum-1)*pageSize;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}	
	
}
