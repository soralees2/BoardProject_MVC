package kh.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private Date red_date;
	
	public MemberDTO() {}
	
	public MemberDTO(String id, String pw, String name, String phone, String email, String zipcode, String address1,
			String address2, Date red_date) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.red_date = red_date;
	}

}
