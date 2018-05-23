package snowModel;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import databaseConnection.MyDatabaseConnection;

/** 
 * @author Lizi 
 * @date 2017年1月31日 下午3:52:58
 */

public class CreateSnowModelTables {

	public static String dbName = "snow_model_dw";
	
	public static void main(String[] args){
		CreateSnowModelTables csmts = new CreateSnowModelTables();
		csmts.createTables();
	}

	/*
	 * 创建雪花模型涉及到的全部表格*/
	public void createTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建客户维度表*/
			sql = "DROP TABLE IF EXISTS client_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE client_dim("
					+ "client_id CHAR(10) NOT NULL,"
					+ "client_name VARCHAR(20) NOT NULL,"
					+ "PRIMARY KEY (client_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建地域维度表*/
			sql = "DROP TABLE IF EXISTS area_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE area_dim("
					+ "area_id CHAR(10) NOT NULL,"
					+ "area_name VARCHAR(20) NOT NULL,"
					+ "province VARCHAR(10) NOT NULL,"
					+ "city VARCHAR(10),"
					+ "PRIMARY KEY (area_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建手机卡维度表*/
			sql = "DROP TABLE IF EXISTS card_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE card_dim("
					+ "card_sk INT NOT NULL AUTO_INCREMENT,"
					+ "card_num CHAR(11) NOT NULL,"
					+ "card_client_id CHAR(10) NOT NULL,"
					+ "card_area_id CHAR(10) NOT NULL,"
					+ "PRIMARY KEY (card_sk)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);

			/*创建业务/套餐维度表*/
			sql = "DROP TABLE IF EXISTS sp_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sp_dim("
					+ "sp_sk INT NOT NULL AUTO_INCREMENT,"
					+ "sp_id CHAR(10) NOT NULL,"
					+ "sp_type TINYINT NOT NULL,"
					+ "sp_cost INT UNSIGNED NOT NULL,"
					+ "PRIMARY KEY (sp_sk)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建时间维度表*/
			sql = "DROP TABLE IF EXISTS time_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE time_dim("
					+ "time_sk INT NOT NULL AUTO_INCREMENT,"
					+ "time DATETIME NOT NULL,"
					+ "day DATE NOT NULL,"
					+ "month INT(1) NOT NULL,"
					+ "quarter INT(1) NOT NULL,"
					+ "year INT(4) NOT NULL,"
					+ "PRIMARY KEY (time_sk)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建手机卡业务/套餐账单事实表*/
			sql = "DROP TABLE IF EXISTS bill_sp_fact;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_sp_fact("
					+ "card_sk INT NOT NULL,"
					+ "sp_sk INT NOT NULL,"
					+ "time_sk INT NOT NULL,"
					+ "bill_money DECIMAL(8,2)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建以具体“业务/套餐月消费额”为业务/套餐属性的统计单位的综合数据事实表1（较低粒度，便于分析）*/
			sql = "DROP TABLE IF EXISTS bill_sp_fact_1;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_sp_fact_1("
					+ "sp_cost INT NOT NULL,"
					+ "total_bill_money DECIMAL(10,2)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建以具体“月份”为时间属性的统计单位的综合数据事实表2（较低粒度，便于分析）*/
			sql = "DROP TABLE IF EXISTS bill_sp_fact_2;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_sp_fact_2("
					+ "month INT NOT NULL,"
					+ "total_bill_money DECIMAL(10,2)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*输出成功信息*/
			System.out.println("All tables in snow model have been created successfully!");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			stmt.close();
			con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
