package Member;

import java.sql.Timestamp;

public class MemberDataBean {
	private static MemberDataBean mdb = new MemberDataBean();
	private String id;
	private String passwd;
	private String name;
	private Timestamp reg_date;
	private String address;
	private String tel;
	private String dob;
	private int login = -1;
	private int mng;

	public int getMng() {
		return mng;
	}

	public void setMng(int mng) {
		this.mng = mng;
	}

	public static MemberDataBean getInstance1() {
		return mdb;
	}
	
	public int getLogin() {
		return login;
	}
	public void setLogin(int login) {
		this.login = login;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
