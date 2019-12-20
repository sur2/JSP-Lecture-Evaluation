package user;

public class UserDTO {
	String userID;
	String userPassWord;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassWord() {
		return userPassWord;
	}

	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}

	@Override
	public String toString() {
		return "UserDTO [userID=" + userID + ", userPassWord=" + userPassWord + "]";
	}

}
