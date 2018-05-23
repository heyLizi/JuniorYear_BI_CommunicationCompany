package sourceOLTP;

import java.sql.Connection;


import java.sql.SQLException;
import java.sql.Statement;

import databaseConnection.MyDatabaseConnection;

/** 
 * @author Lizi 
 * @DATE 2017年1月23日 上午12:24:37
 */

public class CreateTables {

	public static String dbName = "communication_company";
	
	public static void main(String[] args){
		CreateTables cts = new CreateTables();
		cts.createHumanResourceSystemTables();
		cts.createBusinessSystemTables();
		cts.createSaleSystemTables();
		cts.createProjectSystemTables();
		cts.createServiceSystemTables();
		cts.createFinanceSystemTables();
	}
	
	/*
	 * 创建人事管理系统的数据库表
	 */
	public void createHumanResourceSystemTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建部门表*/
			sql = "DROP TABLE IF EXISTS department;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE department("
					+ "department_id CHAR(10) NOT NULL,"
					+ "department_name VARCHAR(50) NOT NULL,"
					+ "PRIMARY KEY (department_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建员工表*/
			sql = "DROP TABLE IF EXISTS employee;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE employee("
					+ "employee_id CHAR(10) NOT NULL,"
					+ "employee_name VARCHAR(20) NOT NULL,"
					+ "employee_dep_id CHAR(10) NOT NULL,"
					+ "employee_position VARCHAR(20) NOT NULL,"
					+ "employee_contact VARCHAR(20) NOT NULL,"
					+ "employee_salary DECIMAL(8,2) NOT NULL DEFAULT 0,"
					+ "PRIMARY KEY (employee_id),"
					+ "KEY fk_edi (employee_dep_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);

			/*为员工表添加外键约束*/
			sql = "ALTER TABLE `employee` ADD CONSTRAINT `fk_edi` FOREIGN KEY (`employee_dep_id`) REFERENCES `department` (`department_id`);";
			stmt.executeUpdate(sql);
			
			/*输出成功信息*/
			System.out.println("All tables in human resource system have been created successfully!");
			
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
	
	
	/*
	 * 创建业务管理系统的数据库表
	 */
	public void createBusinessSystemTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建客户表*/
			sql = "DROP TABLE IF EXISTS client;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE client("
					+ "client_id CHAR(10) NOT NULL,"
					+ "client_name VARCHAR(20) NOT NULL,"
					+ "client_id_num CHAR(18) NOT NULL,"
					+ "PRIMARY KEY (client_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建手机所属地表*/
			sql = "DROP TABLE IF EXISTS city;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE city("
					+ "city_id CHAR(10) NOT NULL,"
					+ "city_name VARCHAR(20) NOT NULL,"
					+ "PRIMARY KEY (city_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建业务/套餐表*/
			sql = "DROP TABLE IF EXISTS sp;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sp("
					+ "sp_id CHAR(10) NOT NULL,"
					+ "sp_type TINYINT NOT NULL,"
					+ "sp_cost INT UNSIGNED NOT NULL,"
					+ "sp_info VARCHAR(200) NOT NULL,"
					+ "PRIMARY KEY (sp_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建手机卡表*/
			sql = "DROP TABLE IF EXISTS card;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE card("
					+ "card_num CHAR(11) NOT NULL,"
					+ "card_client_id CHAR(10) NOT NULL,"
					+ "card_city_id CHAR(10) NOT NULL,"
					+ "card_balance DECIMAL(10,2) NOT NULL DEFAULT 0,"
					+ "PRIMARY KEY (card_num),"
					+ "KEY fk_cci_1 (card_client_id),"
					+ "KEY fk_cci_2 (card_city_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);

			/*为手机卡表添加外键约束*/
			sql = "ALTER TABLE `card` ADD CONSTRAINT `fk_cci_1` FOREIGN KEY (`card_client_id`) REFERENCES `client` (`client_id`);";
			stmt.executeUpdate(sql);
			sql = "ALTER TABLE `card` ADD CONSTRAINT `fk_cci_2` FOREIGN KEY (`card_city_id`) REFERENCES `city` (`city_id`);";
			stmt.executeUpdate(sql);
			
			/*创建手机卡当前订购业务/套餐记录表*/
			sql = "DROP TABLE IF EXISTS current_sp;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE current_sp("
					+ "current_sp_log_id CHAR(20) NOT NULL,"
					+ "current_card_num CHAR(11) NOT NULL,"
					+ "current_sp_id CHAR(10) NOT NULL,"
					+ "PRIMARY KEY (current_sp_log_id),"
					+ "KEY fk_ccn (current_card_num),"
					+ "KEY fk_csi (current_sp_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为手机卡当前订购业务/套餐记录表添加外键约束*/
			sql = "ALTER TABLE `current_sp` ADD CONSTRAINT `fk_ccn` FOREIGN KEY (`current_card_num`) REFERENCES `card` (`card_num`);";
			stmt.executeUpdate(sql);
			sql = "ALTER TABLE `current_sp` ADD CONSTRAINT `fk_csi` FOREIGN KEY (`current_sp_id`) REFERENCES `sp` (`sp_id`);";
			stmt.executeUpdate(sql);

			/*创建话费充值记录表*/
			sql = "DROP TABLE IF EXISTS recharge;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE recharge("
					+ "recharge_log_id CHAR(20) NOT NULL,"
					+ "recharge_card_num CHAR(11) NOT NULL,"
					+ "recharge_money DECIMAL(10,2) NOT NULL,"
					+ "recharge_time DATETIME NOT NULL,"
					+ "PRIMARY KEY (recharge_log_id),"
					+ "KEY fk_rcn (recharge_card_num)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为话费充值记录表添加外键约束*/
			sql = "ALTER TABLE `recharge` ADD CONSTRAINT `fk_rcn` FOREIGN KEY (`recharge_card_num`) REFERENCES `card` (`card_num`);";
			stmt.executeUpdate(sql);
			
			/*创建业务/套餐操作记录表*/
			sql = "DROP TABLE IF EXISTS hansp;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE hansp("
					+ "hansp_log_id CHAR(20) NOT NULL,"
					+ "han_card_num CHAR(11) NOT NULL,"
					+ "han_type TINYINT NOT NULL,"
					+ "han_sp_id CHAR(10) NOT NULL,"
					+ "han_time DATETIME NOT NULL,"
					+ "han_effect_date DATE NOT NULL,"
					+ "PRIMARY KEY (hansp_log_id),"
					+ "KEY fk_hcn (han_card_num),"
					+ "KEY fk_hspi (han_sp_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
	
			/*为业务/套餐操作记录表添加外键约束*/
			sql = "ALTER TABLE `hansp` ADD CONSTRAINT `fk_hcn` FOREIGN KEY (`han_card_num`) REFERENCES `card` (`card_num`);";
			stmt.executeUpdate(sql);
			sql = "ALTER TABLE `hansp` ADD CONSTRAINT `fk_hspi` FOREIGN KEY (`han_sp_id`) REFERENCES `sp` (`sp_id`);";
			stmt.executeUpdate(sql);
			
			/*输出成功信息*/
			System.out.println("All tables in business system have been created successfully!");
			
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
	
	
	/*
	 * 创建网络销售系统的数据库表
	 */
	public void createSaleSystemTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建顾客表*/
			sql = "DROP TABLE IF EXISTS customer;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE customer("
					+ "customer_id CHAR(10) NOT NULL,"
					+ "customer_mobile CHAR(11) NOT NULL,"
					+ "PRIMARY KEY (customer_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建商品品牌表*/
			sql = "DROP TABLE IF EXISTS brand;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE brand("
					+ "brand_id CHAR(10) NOT NULL,"
					+ "brand_name VARCHAR(20) NOT NULL,"
					+ "PRIMARY KEY (brand_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);

			/*创建商品表*/
			sql = "DROP TABLE IF EXISTS product;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE product("
					+ "product_id CHAR(10) NOT NULL,"
					+ "product_name VARCHAR(50) NOT NULL,"
					+ "product_brand CHAR(10) NOT NULL,"
					+ "product_type TINYINT NOT NULL,"
					+ "product_cost DECIMAL(8,2) NOT NULL,"
					+ "product_stock_num INT UNSIGNED NOT NULL,"
					+ "PRIMARY KEY (product_id),"
					+ "KEY fk_pb (product_brand)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为商品表添加外键约束*/
			sql = "ALTER TABLE `product` ADD CONSTRAINT `fk_pb` FOREIGN KEY (`product_brand`) REFERENCES `brand` (`brand_id`);";
			stmt.executeUpdate(sql);
			
			/*创建网络销售记录表*/
			sql = "DROP TABLE IF EXISTS sale;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE sale("
					+ "sale_log_id CHAR(20) NOT NULL,"
					+ "sale_customer_id CHAR(10) NOT NULL,"
					+ "sale_product_id CHAR(10) NOT NULL,"
					+ "sale_type TINYINT NOT NULL,"
					+ "sale_time DATETIME NOT NULL,"
					+ "sale_money DECIMAL(8,2) NOT NULL,"
					+ "sale_receiver_address VARCHAR(100) NOT NULL,"
					+ "sale_receiver_mobile CHAR(11) NOT NULL,"
					+ "PRIMARY KEY (sale_log_id),"
					+ "KEY fk_sci (sale_customer_id),"
					+ "KEY fk_spi (sale_product_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为网络销售记录表添加外键约束*/
			sql = "ALTER TABLE `sale` ADD CONSTRAINT `fk_sci` FOREIGN KEY (`sale_customer_id`) REFERENCES `customer` (`customer_id`);";
			stmt.executeUpdate(sql);
			sql = "ALTER TABLE `sale` ADD CONSTRAINT `fk_spi` FOREIGN KEY (`sale_product_id`) REFERENCES `product` (`product_id`);";
			stmt.executeUpdate(sql);

			/*输出成功信息*/
			System.out.println("All tables in sale system have been created successfully!");
			
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
	
	
	/*
	 * 创建工程管理系统的数据库表
	 */
	public void createProjectSystemTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建工程方案表*/
			sql = "DROP TABLE IF EXISTS project_plan;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE project_plan("
					+ "project_plan_id CHAR(10) NOT NULL,"
					+ "project_plan_name VARCHAR(50) NOT NULL,"
					+ "project_plan_state TINYINT NOT NULL DEFAULT 1,"
					+ "project_plan_info VARCHAR(500),"
					+ "project_plan_begin_date DATE,"
					+ "project_plan_end_date DATE,"
					+ "project_plan_fee DECIMAL(10,2),"
					+ "PRIMARY KEY (project_plan_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建工程表*/
			sql = "DROP TABLE IF EXISTS project;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE project("
					+ "project_id CHAR(10) NOT NULL,"
					+ "project_plan_id CHAR(10) NOT NULL,"
					+ "project_name VARCHAR(50) NOT NULL,"
					+ "project_state TINYINT NOT NULL DEFAULT 1,"
					+ "project_info VARCHAR(500),"
					+ "project_company VARCHAR(50),"
					+ "project_begin_date DATE,"
					+ "project_end_date DATE,"
					+ "project_fee DECIMAL(10,2),"
					+ "PRIMARY KEY (project_id),"
					+ "KEY fk_ppi (project_plan_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为工程表添加外键约束*/
			sql = "ALTER TABLE `project` ADD CONSTRAINT `fk_ppi` FOREIGN KEY (`project_plan_id`) REFERENCES `project_plan` (`project_plan_id`);";
			stmt.executeUpdate(sql);

			/*输出成功信息*/
			System.out.println("All tables in project system have been created successfully!");
			
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
	
	
	/*
	 * 创建客户服务系统的数据库表
	 */
	public void createServiceSystemTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建服务记录表*/
			sql = "DROP TABLE IF EXISTS service;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE service("
					+ "service_log_id CHAR(20) NOT NULL,"
					+ "service_client_id CHAR(10) NOT NULL,"
					+ "service_employee_id CHAR(10) NOT NULL,"
					+ "service_time DATETIME NOT NULL,"
					+ "service_comment TINYINT NOT NULL DEFAULT 1,"
					+ "PRIMARY KEY (service_log_id),"
					+ "KEY fk_scli (service_client_id),"
					+ "KEY fk_sei (service_employee_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为服务记录表添加外键约束*/
			sql = "ALTER TABLE `service` ADD CONSTRAINT `fk_scli` FOREIGN KEY (`service_client_id`) REFERENCES `client` (`client_id`);";
			stmt.executeUpdate(sql);
			sql = "ALTER TABLE `service` ADD CONSTRAINT `fk_sei` FOREIGN KEY (`service_employee_id`) REFERENCES `employee` (`employee_id`);";
			stmt.executeUpdate(sql);
			
			/*创建咨询记录表*/
			sql = "DROP TABLE IF EXISTS ask;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE ask("
					+ "ask_log_id CHAR(20) NOT NULL,"
					+ "ask_time DATETIME NOT NULL,"
					+ "ask_type TINYINT NOT NULL,"
					+ "ask_info VARCHAR(200),"
					+ "PRIMARY KEY (ask_log_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建投诉记录表*/
			sql = "DROP TABLE IF EXISTS complain;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE complain("
					+ "complain_log_id CHAR(20) NOT NULL,"
					+ "complain_time DATETIME NOT NULL,"
					+ "complain_type TINYINT NOT NULL,"
					+ "complain_info VARCHAR(200),"
					+ "PRIMARY KEY (complain_log_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*输出成功信息*/
			System.out.println("All tables in service system have been created successfully!");
			
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
	
	
	/*
	 * 创建财务管理系统的数据库表
	 */
	public void createFinanceSystemTables(){

		Connection con = null;
		Statement stmt = null; 
		String sql = null;
		
		try {
			/*获得连接*/
			con = MyDatabaseConnection.getMySQLConnection(dbName);
			stmt = con.createStatement(); 
			
			/*创建公司资产表*/
			sql = "DROP TABLE IF EXISTS property;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE property("
					+ "property_id CHAR(10) NOT NULL,"
					+ "property_name VARCHAR(20) NOT NULL,"
					+ "property_money DECIMAL(10,2) NOT NULL,"
					+ "PRIMARY KEY (property_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*创建部门收支账单表*/
			sql = "DROP TABLE IF EXISTS bill_dep;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_dep("
					+ "bill_dep_id CHAR(20) NOT NULL,"
					+ "bd_department_id CHAR(10) NOT NULL,"
					+ "bill_type TINYINT NOT NULL,"
					+ "bill_time DATETIME NOT NULL,"
					+ "bill_fee DECIMAL(10,2) NOT NULL,"
					+ "bill_info VARCHAR(200),"
					+ "PRIMARY KEY (bill_dep_id),"
					+ "KEY fk_bdi (bd_department_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);

			/*为部门收支账单表添加外键约束*/
			sql = "ALTER TABLE `bill_dep` ADD CONSTRAINT `fk_bdi` FOREIGN KEY (`bd_department_id`) REFERENCES `department` (`department_id`);";
			stmt.executeUpdate(sql);
			
			/*创建员工工资单表*/
			sql = "DROP TABLE IF EXISTS bill_salary;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_salary("
					+ "bill_salary_id CHAR(20) NOT NULL,"
					+ "bs_employee_id CHAR(10) NOT NULL,"
					+ "bill_time DATETIME NOT NULL,"
					+ "bill_fee DECIMAL(10,2) NOT NULL,"
					+ "bill_info VARCHAR(200),"
					+ "PRIMARY KEY (bill_salary_id),"
					+ "KEY fk_bei (bs_employee_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为员工工资单表添加外键约束*/
			sql = "ALTER TABLE `bill_salary` ADD CONSTRAINT `fk_bei` FOREIGN KEY (`bs_employee_id`) REFERENCES `employee` (`employee_id`);";
			stmt.executeUpdate(sql);
			
			/*创建工程收支账单表*/
			sql = "DROP TABLE IF EXISTS bill_pro;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_pro("
					+ "bill_pro_id CHAR(20) NOT NULL,"
					+ "bp_project_id CHAR(10) NOT NULL,"
					+ "bill_type TINYINT NOT NULL,"
					+ "bill_time DATETIME NOT NULL,"
					+ "bill_fee DECIMAL(10,2) NOT NULL,"
					+ "bill_info VARCHAR(200),"
					+ "PRIMARY KEY (bill_pro_id),"
					+ "KEY bk_bpi (bp_project_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为工程收支账单表添加外键约束*/
			sql = "ALTER TABLE `bill_pro` ADD CONSTRAINT `fk_bpi` FOREIGN KEY (`bp_project_id`) REFERENCES `project` (`project_id`);";
			stmt.executeUpdate(sql);
			
			/*创建手机卡业务/套餐账单表*/
			sql = "DROP TABLE IF EXISTS bill_cardsp;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_cardsp("
					+ "bill_cardsp_id CHAR(20) NOT NULL,"
					+ "bcsp_card_num CHAR(11) NOT NULL,"
					+ "bcsp_sp_id CHAR(10) NOT NULL,"
					+ "bill_time DATETIME NOT NULL,"
					+ "bill_fee DECIMAL(10,2) NOT NULL,"
					+ "bill_info VARCHAR(200),"
					+ "PRIMARY KEY (bill_cardsp_id),"
					+ "KEY fk_bccn (bcsp_card_num),"
					+ "KEY fk_bcsi (bcsp_sp_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为手机卡业务/套餐账单表添加外键约束*/
			sql = "ALTER TABLE `bill_cardsp` ADD CONSTRAINT `fk_bccn` FOREIGN KEY (`bcsp_card_num`) REFERENCES `card` (`card_num`);";
			stmt.executeUpdate(sql);
			sql = "ALTER TABLE `bill_cardsp` ADD CONSTRAINT `fk_bcsi` FOREIGN KEY (`bcsp_sp_id`) REFERENCES `sp` (`sp_id`);";
			stmt.executeUpdate(sql);
			
			/*创建网络销售账单表*/
			sql = "DROP TABLE IF EXISTS bill_sale;";
			stmt.executeUpdate(sql);
			sql =  "CREATE TABLE bill_sale("
					+ "bill_sale_id CHAR(20) NOT NULL,"
					+ "bs_customer_id CHAR(10) NOT NULL,"
					+ "bs_product_id CHAR(10) NOT NULL,"
					+ "bill_time DATETIME NOT NULL,"
					+ "bill_fee DECIMAL(10,2) NOT NULL,"
					+ "bill_info VARCHAR(200),"
					+ "PRIMARY KEY (bill_sale_id),"
					+ "KEY fk_bsci (bs_customer_id),"
					+ "KEY fk_bspi (bs_product_id)"
					+ ")ENGINE = InnoDB DEFAULT CHARSET=utf8;";
			stmt.executeUpdate(sql);
			
			/*为网络销售账单表添加外键约束*/
			sql = "ALTER TABLE `bill_sale` ADD CONSTRAINT `fk_bsci` FOREIGN KEY (`bs_customer_id`) REFERENCES `customer` (`customer_id`);";
			stmt.executeUpdate(sql);
			sql = "ALTER TABLE `bill_sale` ADD CONSTRAINT `fk_bspi` FOREIGN KEY (`bs_product_id`) REFERENCES `product` (`product_id`);";
			stmt.executeUpdate(sql);
			
			/*输出成功信息*/
			System.out.println("All tables in finance system have been created successfully!");
			
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