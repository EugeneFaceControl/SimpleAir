package model;

public class LoginModel {
	public boolean valid(String username, String password){
		if(username.equals("admin") && password.equals("admin")){
			return true;
		} else {
			return false;
		}
	}
}
