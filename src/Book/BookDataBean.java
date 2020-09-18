package Book;

import java.sql.Timestamp;

public class BookDataBean {
	
	private int num;
	private String name;
	private String writer;
	private String publisher;
	private String publication;
	private String content;
	private int money;
	private Timestamp reg_date;
	private String image;
	private String booktype;
	private String mngpw;
	
	
	
	public String getBooktype() {
		return booktype;
	}
	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublication() {
		return publication;
	}
	public void setPublication(String publication) {
		this.publication = publication;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMngpw() {
		return mngpw;
	}
	public void setMngpw(String mngpw) {
		this.mngpw = mngpw;
	}

}
