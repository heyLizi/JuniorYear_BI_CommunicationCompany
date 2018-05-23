package databaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;

/** 
 * @author Lizi 
 * @date 2017年1月23日 上午12:12:04
 */

public class MyDatabaseConnection {
	
	public static Connection getMySQLConnection(String dbName) throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序   
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,"root","");	//连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登录用户名和密码
			System.out.println("Connection to database "+dbName+" succeed!");
			return connect;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
