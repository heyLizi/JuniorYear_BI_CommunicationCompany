package starModel;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import databaseConnection.MyDatabaseConnection;

/** 
 * @author Lizi 
 * @date 2017年1月31日 下午8:20:37
 */

public class DataETL {

	public static String dbName = "star_model_dw";
	
	public static void main(String[] args){
		DataETL detl = new DataETL();
		detl.LoadData();
	}
	
	/*
	 * 创建星型模型涉及到的全部表格*/
	public void LoadData(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 

			/*顾客维度的数据来源于mysql中的另一个数据库communication_company，
			 *该数据库顾客表中的字段customer_id, customer_mobile对应的值即为加载到顾客维度表中的数据，
			 *需要额外补充两个字段（customer_sk, effective_date）的值*/
			sql = "INSERT INTO customer_dim " +
				  "SELECT DISTINCT " +
				  "NULL, customer_id, customer_mobile, '2017-01-30' " +
				  "FROM communication_company.customer " + 
				  "WHERE customer_id NOT IN " +
				  "(SELECT customer_id FROM customer_dim);" ;
			stmt.executeUpdate(sql);

			/*商品维度的数据来源是csv文件，所以创建商品维度的中间表，用来做中间代理用*/
			sql = "DROP TABLE IF EXISTS product_stg;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE product_stg("
					+ "product_id CHAR(10) NOT NULL PRIMARY KEY,"
					+ "product_name VARCHAR(50) NOT NULL,"
					+ "product_brand_id CHAR(10) NOT NULL,"
					+ "product_brand_name VARCHAR(20) NOT NULL,"
					+ "product_type TINYINT NOT NULL,"
					+ "product_cost DECIMAL(8,2) NOT NULL"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*将product.csv中的数据加载到商品维度中间表中*/
			sql = "TRUNCATE product_stg;" ;
			stmt.executeUpdate(sql);
			sql = "LOAD DATA INFILE 'G:\\MySQL-Data\\product.csv' " +
				  "INTO TABLE product_stg " +
				  "FIELDS TERMINATED BY ',' " +
				  "OPTIONALLY ENCLOSED BY '\"' " +
				  "LINES TERMINATED BY '\r\n' " +
				  "(product_id, product_name, product_brand_id, product_brand_name, product_type, product_cost);";
			stmt.executeUpdate(sql);
			
			/*将商品维度中间表中的数据加载到商品维度表中，需要额外补充两个字段（product_sk, effective_date）的值*/
			sql = "INSERT INTO product_dim " + 
			      "SELECT " +
				  "NULL, product_id, product_name, product_brand_id, product_brand_name, product_type, product_cost, '2017-01-30' " +
			      "FROM product_stg;";
			stmt.executeUpdate(sql);
			
			/*删除商品维度中间表，避免冗余*/
			sql = "DROP TABLE product_stg;";
			stmt.executeUpdate(sql);
			
			/*时间维度的数据来源于mysql中的另一个数据库communication_company，
			 *该数据库网络销售记录表sale中的字段sale_time对应的值即为加载到时间维度表中的数据，
			 *需要额外补充九个字段（time_sk, hour, day, day_of_week, day_of_month, month, quarter, year, effective_date）的值*/
			sql = "INSERT INTO time_dim " +
				  "SELECT DISTINCT " +
				  "NULL, sale_time, HOUR (sale_time), DATE (sale_time), DAYOFWEEK(sale_time), DAYOFMONTH(sale_time), " +
				  "MONTH(sale_time), QUARTER (sale_time), YEAR (sale_time), '2017-01-30' " +
				  "FROM communication_company.sale " + 
				  "WHERE sale_time NOT IN " +
				  "(SELECT time FROM time_dim);" ;
			stmt.executeUpdate(sql);
			
			/*地域维度的数据来源是txt文件，由于转换的部分在文本文件中读取——转换更加方便，所以不再创建中间表，将转换完成的数据直接加载到数据库中
			 *需要额外补充五个字段（area_sk, province, city, district, effective_date）的值*/
			BufferedReader bf =  new BufferedReader(new FileReader (new File("G://MySQL-Data//address.txt")));
			String province = "", wholeAddress = bf.readLine();
			while (wholeAddress != null) {
				province = wholeAddress.substring(0, 3);
				if (province.endsWith("市")) { //直辖市,市名作为省名和市名，区县名作为区县名
					sql = "INSERT INTO area_dim(area_sk, area, province, city, district, effective_date) VALUES " +
						  "(NULL, '"+ wholeAddress + "', '" + province + "', '" + province + "', '" 
						   + wholeAddress.substring(3,6) + "', '2017-01-30');";
				}
				else{   //非直辖市区域，省份名作为省名，城市名作为市名，区县名作为区县名
					sql = "INSERT INTO area_dim(area_sk, area, province, city, district, effective_date) VALUES " +
						  "(NULL, '"+ wholeAddress + "', '" + province + "', '" + wholeAddress.substring(3,6) + "', '"
							+ wholeAddress.substring(6,9) + "', '2017-01-30');";
				}
				stmt.executeUpdate(sql);
				wholeAddress = bf.readLine();
			}
			bf.close();
			
			/*网络销售记录事实表的数据来源于其他维度数据表和mysql中的另一个数据库communication_company，不需要额外补充字段的值*/
			sql = "INSERT INTO sale_fact " +
				  "SELECT " +
				  "customer_sk, product_sk, time_sk, area_sk, sale_money " +
				  "FROM " +
				  "communication_company.sale ccs, customer_dim cd, product_dim pd, time_dim td, area_dim ad " +
				  "WHERE " + 
				  "ccs.sale_customer_id = cd.customer_id AND " +
				  "ccs.sale_product_id = pd.product_id AND " +
				  "ccs.sale_time = td.time AND " +
				  "ccs.sale_receiver_address = ad.area AND " +
				  "ccs.sale_time <= '2017-01-30 23:59:59'; ";
			stmt.executeUpdate(sql);
			
			/*综合数据事实表1的数据来源于网络销售记录事实表和商品维度表，不需要额外补充字段的值*/
			sql = "INSERT INTO sale_fact_1 " +
				  "SELECT product_brand_id, product_brand_name, sum(sale_money) " +
				  "FROM product_dim, sale_fact " +
				  "WHERE product_dim.product_sk = sale_fact.product_sk " + 
				  "GROUP BY(product_brand_id); ";
			stmt.executeUpdate(sql);
			
			/*综合数据事实表2的数据来源于网络销售记录事实表和时间维度表，不需要额外补充字段的值*/
			sql = "INSERT INTO sale_fact_2 " +
				  "SELECT day_of_week, sum(sale_money) " +
				  "FROM time_dim, sale_fact " +
				  "WHERE time_dim.time_sk = sale_fact.time_sk " + 
				  "GROUP BY(day_of_week); ";
			stmt.executeUpdate(sql);
			
			/*综合数据事实表3的数据来源于网络销售记录事实表和地域维度表，不需要额外补充字段的值*/
			sql = "INSERT INTO sale_fact_3 " +
				  "SELECT province, city, sum(sale_money) " +
				  "FROM area_dim, sale_fact " +
				  "WHERE area_dim.area_sk = sale_fact.area_sk " + 
				  "GROUP BY(city); ";
			stmt.executeUpdate(sql);
		
			/*输出成功信息*/
			System.out.println("Load Datas into star model successfully!");
			
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
