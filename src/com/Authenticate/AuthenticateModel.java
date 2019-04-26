package com.Authenticate;

public class AuthenticateModel {
	private int Auth_id;
	private String uname;
	private String upass;
	private String UserType;
	private int Resgis_id;

	public AuthenticateModel() {
	}

	public AuthenticateModel(int auth_id, String uname, String upass, String userType,int Resgis_id) {
		super();
		Auth_id = auth_id;
		this.uname = uname;
		this.upass = upass;
		UserType = userType;
		this.Resgis_id =Resgis_id;
	}

	public int getResgis_id() {
		return Resgis_id;
	}
	public int getAuth_id() {
		return Auth_id;
	}

	public String getUname() {
		return uname;
	}

	public String getUpass() {
		return upass;
	}

	public String getUserType() {
		return UserType;
	}
	
	public void setResgis_id(int Resgis_id) {
		this.Resgis_id = Resgis_id;
	}
	public void setAuth_id(int auth_id) {
		Auth_id = auth_id;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public void setUserType(String userType) {
		UserType = userType;
	}

	@Override
	public String toString() {
		return "AuthenticateModel [Auth_id=" + Auth_id + ", uname=" + uname + ", upass=" + upass + ", UserType="
				+ UserType + ",Resgis_id="+Resgis_id+"]";
	}

}
