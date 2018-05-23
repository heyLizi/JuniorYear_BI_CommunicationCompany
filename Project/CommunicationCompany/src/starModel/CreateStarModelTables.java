package starModel;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import databaseConnection.MyDatabaseConnection;

/** 
 * @author Lizi 
 * @date 2017年1月31日 下午3:52:35
 */

public class CreateStarModelTables {

	public static String dbName = "star_model_dw";
	
	public static void main(String[] args){
		CreateStarModelTables csmts = new CreateStarModelTables();
		csmts.createTables();
	}
	
	/*
	 * 创建星型模型涉及到的全部表格*/
	public void createTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建顾客维度表*/
			sql = "DROP TABLE IF EXISTS customer_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE customer_dim("
					+ "customer_sk INT NOT NULL AUTO_INCREMENT,"
					+ "customer_id CHAR(10) NOT NULL,"
					+ "customer_mobile CHAR(11) NOT NULL,"
					+ "effective_date DATE NOT NULL,"
					+ "PRIMARY KEY (customer_sk)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);

			/*创建商品维度表*/
			sql = "DROP TABLE IF EXISTS product_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE product_dim("
					+ "product_sk INT NOT NULL AUTO_INCREMENT,"
					+ "product_id CHAR(10) NOT NULL,"
					+ "product_name VARCHAR(50) NOT NULL,"
					+ "product_brand_id CHAR(10) NOT NULL,"
					+ "product_brand_name VARCHAR(20) NOT NULL,"
					+ "product_type TINYINT NOT NULL,"
					+ "product_cost DECIMAL(8,2) NOT NULL,"
					+ "effective_date DATE NOT NULL,"
					+ "PRIMARY KEY (product_sk)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建时间维度表*/
			sql = "DROP TABLE IF EXISTS time_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE time_dim("
					+ "time_sk INT NOT NULL AUTO_INCREMENT,"
					+ "time DATETIME NOT NULL,"
					+ "hour INT(1) NOT NULL,"
					+ "day DATE NOT NULL,"
					+ "day_of_week INT(1) NOT NULL,"
					+ "day_of_month INT(1) NOT NULL,"
					+ "month INT(1) NOT NULL,"
					+ "quarter INT(1) NOT NULL,"
					+ "year INT(4) NOT NULL,"
					+ "effective_date DATE NOT NULL,"
					+ "PRIMARY KEY (time_sk)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建地域维度表*/
			sql = "DROP TABLE IF EXISTS area_dim;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE area_dim("
					+ "area_sk INT NOT NULL AUTO_INCREMENT,"
					+ "area VARCHAR(50) NOT NULL,"
					+ "province VARCHAR(20) NOT NULL,"
					+ "city VARCHAR(20) NOT NULL,"
					+ "district VARCHAR(20) NOT NULL,"
					+ "effective_date DATE NOT NULL,"
					+ "PRIMARY KEY (area_sk)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建网络销售记录事实表（高粒度，包含细节）*/
			sql = "DROP TABLE IF EXISTS sale_fact;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sale_fact("
					+ "customer_sk INT NOT NULL,"
					+ "product_sk INT NOT NULL,"
					+ "time_sk INT NOT NULL,"
					+ "area_sk INT NOT NULL,"
					+ "sale_money DECIMAL(8,2)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建以具体“商品品牌”为商品属性的统计单位的综合数据事实表1（较低粒度，便于分析）*/
			sql = "DROP TABLE IF EXISTS sale_fact_1;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sale_fact_1("
					+ "product_brand_id CHAR(10) NOT NULL,"
					+ "product_brand_name VARCHAR(20) NOT NULL,"
					+ "total_sale_money DECIMAL(10,2)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建以具体“每周第几天”为时间属性的统计单位的综合数据事实表2（较低粒度，便于分析）*/
			sql = "DROP TABLE IF EXISTS sale_fact_2;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sale_fact_2("
					+ "day_of_week INT NOT NULL,"
					+ "total_sale_money DECIMAL(10,2)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建以具体“城市”为地域属性的统计单位的综合数据事实表3（较低粒度，便于分析）*/
			sql = "DROP TABLE IF EXISTS sale_fact_3;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sale_fact_3("
					+ "province VARCHAR(20) NOT NULL,"
					+ "city VARCHAR(20) NOT NULL,"
					+ "total_sale_money DECIMAL(10,2)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*输出成功信息*/
			System.out.println("All tables in star model have been created successfully!");
			
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
