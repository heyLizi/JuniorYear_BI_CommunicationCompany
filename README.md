# JuniorYear_BI_CommunicationCompany
2017年 大三学年 BI课程的大作业——通讯公司管理系统，用于商务智能的数据分析

使用Eclipse进行开发，数据库为MySQL5.6。

Project文件夹中是工程文件：源数据库的建表、插入数据在sourceOLTP包中；星型模型的构建、ELT抽取在starModel包中；雪花模型的构建、ETL抽取在snowModel包中。

MySQL Data文件夹中是三个数据库分别的sql文件，可以直接导入到Mysql中查看；Other Data Source文件夹中是除数据库之外的源数据来源文件，包括csv、txt文件等；这些文件均是从源数据库中导出得到，与源数据库中数据一致，只是为了扩展数据来源而产生这些文件。
