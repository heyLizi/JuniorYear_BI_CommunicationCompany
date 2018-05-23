package snowModel;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import databaseConnection.MyDatabaseConnection;

/** 
 * @author Lizi 
 * @date 2017年2月1日 下午8:45:20
 */

public class DataETL {

	public static String dbName = "snow_model_dw";
	
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

			/*客户维度的数据来源于mysql中的另一个数据库communication_company，
			 *该数据库顾客表中的字段client_id, client_name对应的值即为加载到顾客维度表中的数据，
			 *不需要额外补充其他字段的值*/
			sql = "INSERT INTO client_dim " +
				  "SELECT DISTINCT " +
				  "client_id, client_name " +
				  "FROM communication_company.client " + 
				  "WHERE client_id NOT IN " +
				  "(SELECT client_id FROM client_dim);" ;
			stmt.executeUpdate(sql);
			
			/*地域维度的数据来源是txt文件，由于转换的部分在文本文件中读取——转换更加方便，所以不再创建中间表，将转换完成的数据直接加载到数据库中
			 *需要额外补充两个字段（ province, city）的值*/
			BufferedReader bf =  new BufferedReader(new FileReader (new File("G://MySQL-Data//city.txt")));
			String wholeLine = bf.readLine();
			String id = "", name = "", province = "";
			while (wholeLine != null) {
				id = wholeLine.split("\t")[0];
				name = wholeLine.split("\t")[1];
				province = name.substring(0, 3);
				if (province.endsWith("市")) { //直辖市,市名作为省名和市名
					sql = "INSERT INTO area_dim(area_id, area_name, province, city) VALUES " +
						  "('" + id + "', '" + name + "', '" + province + "', '" + province + "');";
				}
				else{   //非直辖市区域，省份名作为省名，城市名作为市名
					sql = "INSERT INTO area_dim(area_id, area_name, province, city) VALUES " +
						  "('" + id + "', '" + name + "', '" + province + "', '" + name.substring(3,6) + "');";
				}
				//System.out.println(sql);
				stmt.executeUpdate(sql);
				wholeLine = bf.readLine();
			}
			bf.close();
			
			/*手机维度的数据来源于mysql中的另一个数据库communication_company，需要额外补充一个字段（card_sk）的值*/
			sql = "INSERT INTO card_dim " + 
			      "SELECT DISTINCT " +
				  "NULL, card_num, card_client_id, card_city_id " +
			      "FROM communication_company.card " +
				  "WHERE card_num NOT IN " +
			      "(SELECT card_num FROM card_dim);";
			stmt.executeUpdate(sql);
	
			/*业务/套餐维度的数据来源是txt文件，所以创建业务/套餐维度的中间表，用来做中间代理用*/
			sql = "DROP TABLE IF EXISTS sp_stg;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sp_stg("
					+ "sp_id CHAR(10) NOT NULL PRIMARY KEY,"
					+ "sp_type TINYINT NOT NULL," 
					+ "sp_cost INT UNSIGNED NOT NULL"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*将sp.txt中的数据加载到业务/套餐维度中间表中*/
			sql = "TRUNCATE sp_stg;" ;
			stmt.executeUpdate(sql);
			sql = "LOAD DATA INFILE 'G:/MySQL-Data/sp.txt' " +
				  "INTO TABLE sp_stg " +
				  "FIELDS TERMINATED BY '\t' " +
				  "LINES TERMINATED BY '\r\n' " +
				  "(sp_id, sp_type, sp_cost);";
			stmt.executeUpdate(sql);
			
			/*将业务/套餐维度中间表中的数据加载到业务/套餐维度表中，需要额外补充一个字段（sp_sk）的值*/
			sql = "INSERT INTO sp_dim " + 
			      "SELECT " +
				  "NULL, sp_id, sp_type, sp_cost " +
			      "FROM sp_stg;";
			stmt.executeUpdate(sql);
			
			/*删除业务/套餐维度中间表，避免冗余*/
			sql = "DROP TABLE sp_stg;";
			stmt.executeUpdate(sql);
			
			/*时间维度的数据来源于mysql中的另一个数据库communication_company，
			 *该数据库手机卡业务/套餐账单表bill_card_sp中的字段bill_time对应的值即为加载到时间维度表中的数据，
			 *需要额外补充六个字段（time_sk, day, month, quarter, year）的值*/
			sql = "INSERT INTO time_dim " +
				  "SELECT DISTINCT " +
				  "NULL, bill_time, DATE (bill_time), MONTH(bill_time), QUARTER (bill_time), YEAR (bill_time) " +
				  "FROM communication_company.bill_cardsp " +
				  "WHERE bill_time NOT IN " + 
				  "(SELECT bill_time FROM time_dim);";
			stmt.executeUpdate(sql);
			
			/*手机卡业务/套餐账单事实表的数据来源于其他维度数据表和mysql中的另一个数据库communication_company，不需要额外补充字段的值*/
			sql = "INSERT INTO bill_sp_fact " +
				  "SELECT " +
				  "card_sk, sp_sk, time_sk, bill_fee " +
				  "FROM " +
				  "communication_company.bill_cardsp ccbc, card_dim cd, sp_dim spd, time_dim td " +
				  "WHERE " + 
				  "ccbc.bcsp_card_num = cd.card_num AND " +
				  "ccbc.bcsp_sp_id = spd.sp_id AND " +
				  "ccbc.bill_time = td.time AND " +
				  "ccbc.bill_time <= '2017-01-31 23:59:59'; ";
			stmt.executeUpdate(sql);
		
			/*综合数据事实表1的数据来源于手机卡业务/套餐账单事实表和业务/套餐表，不需要额外补充字段的值*/
			sql = "INSERT INTO bill_sp_fact_1 " +
				  "SELECT sp_cost, sum(bill_money) " +
				  "FROM sp_dim, bill_sp_fact " +
				  "WHERE sp_dim.sp_sk = bill_sp_fact.sp_sk " + 
				  "GROUP BY(sp_cost); ";
			stmt.executeUpdate(sql);
			
			/*综合数据事实表2的数据来源于手机卡业务/套餐账单事实表和时间维度表，不需要额外补充字段的值*/
			sql = "INSERT INTO bill_sp_fact_2 " +
				  "SELECT month, sum(bill_money) " +
				  "FROM time_dim, bill_sp_fact " +
				  "WHERE time_dim.time_sk = bill_sp_fact.time_sk " + 
				  "GROUP BY(month); ";
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
