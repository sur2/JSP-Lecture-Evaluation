package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	private DatabaseUtil() {}
	
	private static class LazyHolder {
		public static final DatabaseUtil INSTANCE = new DatabaseUtil();
	}
	
	public static DatabaseUtil getInstance() {
		return LazyHolder.INSTANCE;
	}

	public Connection getConnection() {

		try {
			String dbURL = "jdbc:mysql://34.69.65.28:3306/jsp_lecture_evaluation?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "19941104";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
