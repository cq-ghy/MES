/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.40 : Database - mes107
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mes107` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mes107`;

/*Table structure for table `mes_chistory` */

DROP TABLE IF EXISTS `mes_chistory`;

CREATE TABLE `mes_chistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录自增id',
  `chistory_factoryid` int(11) NOT NULL COMMENT 'factory-id关联',
  `chistory_step` varchar(10) NOT NULL DEFAULT '' COMMENT '工序名称',
  `chistory_time` datetime DEFAULT NULL COMMENT '质检结束时间',
  `chistory_goal` varchar(4) NOT NULL COMMENT '质检指标',
  `chistory_result` varchar(4) NOT NULL COMMENT '质检结果',
  `chistory_storageid` int(11) DEFAULT NULL COMMENT '返工或作废出库对象',
  `chistory_remark` varchar(255) DEFAULT '' COMMENT '质检备注',
  `chistory_status` int(1) DEFAULT '1' COMMENT '记录状态，1：可查，0：冻结',
  `chistory_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `chistory_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `chistory_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_chistory` */

/*Table structure for table `mes_factory` */

DROP TABLE IF EXISTS `mes_factory`;

CREATE TABLE `mes_factory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `factory_storageid` int(11) DEFAULT NULL COMMENT '库房id:TODO',
  `factory_productid` int(11) DEFAULT NULL COMMENT '材料id:TODO',
  `factory_orderid` int(11) DEFAULT NULL COMMENT '订单id',
  `factory_preid` int(11) DEFAULT NULL COMMENT '工序id：TODO',
  `factory_prostatus` varchar(5) DEFAULT '' COMMENT '生产状态：待派工，派工中，待质检，质检中，生产结束',
  `factory_remark` varchar(255) DEFAULT '' COMMENT '备注',
  `factory_status` int(1) DEFAULT '1' COMMENT '记录状态，1：可查，0：冻结',
  `factory_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `factory_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `factory_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_factory` */

/*Table structure for table `mes_fhistory` */

DROP TABLE IF EXISTS `mes_fhistory`;

CREATE TABLE `mes_fhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录自增id',
  `fhistory_factoryid` int(11) NOT NULL COMMENT 'factory-id关联',
  `fhistory_step` varchar(10) NOT NULL DEFAULT '' COMMENT '工序名称',
  `fhistory_starttime` datetime NOT NULL COMMENT '开始生产时间',
  `fhistory_endtime` datetime DEFAULT NULL COMMENT '结束生产时间',
  `fhistory_remark` varchar(255) DEFAULT '' COMMENT '生产备注',
  `fhistory_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `fhistory_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `fhistory_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_fhistory` */

/*Table structure for table `mes_order` */

DROP TABLE IF EXISTS `mes_order`;

CREATE TABLE `mes_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` varchar(40) DEFAULT '' COMMENT '订单id',
  `order_clientname` varchar(40) DEFAULT '' COMMENT '客户名称',
  `order_productname` varchar(40) DEFAULT '' COMMENT '零件名称',
  `order_contractid` varchar(40) DEFAULT '' COMMENT '合同编号',
  `order_imgid` varchar(40) DEFAULT '' COMMENT '图号',
  `order_materialname` varchar(40) DEFAULT '' COMMENT '材料名称',
  `order_cometime` datetime DEFAULT NULL COMMENT '来料预期',
  `order_committime` datetime DEFAULT NULL COMMENT '合同交期',
  `order_inventorystatus` int(1) DEFAULT '1' COMMENT '是否库存，1：是，0：否',
  `order_salestatus` char(4) DEFAULT '毛坯交货' COMMENT '交货状态：毛坯交货，粗车交货，成品交货',
  `order_materialsource` char(3) DEFAULT '钢锭' COMMENT '材料来源：钢锭，外协件，外购件',
  `order_hurrystatus` int(1) DEFAULT '1' COMMENT '是否特急，1：是，0：否',
  `order_status` int(3) DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `order_remark` varchar(200) DEFAULT '' COMMENT '备注',
  `order_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `order_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `order_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oid` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_order` */

/*Table structure for table `mes_plan` */

DROP TABLE IF EXISTS `mes_plan`;

CREATE TABLE `mes_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'plan自增id',
  `plan_orderid` varchar(40) DEFAULT '' COMMENT '订单id',
  `plan_productname` varchar(40) DEFAULT '' COMMENT '零件名称',
  `plan_clientname` varchar(40) DEFAULT '' COMMENT '客户名称',
  `plan_contractid` varchar(40) DEFAULT '' COMMENT '合同编号',
  `plan_imgid` varchar(40) DEFAULT '' COMMENT '图号',
  `plan_materialname` varchar(40) DEFAULT '' COMMENT '材料名称',
  `plan_materialdesc` varchar(40) DEFAULT '' COMMENT '材料情况',
  `plan_currentstatus` varchar(3) DEFAULT '' COMMENT '当前环节：库房（原料库，废料库，半成品库，成品库），车间(机加，锻造，热处理)，计划，订单',
  `plan_currentremark` varchar(40) DEFAULT '' COMMENT '当前环节描述',
  `plan_salestatus` varchar(4) DEFAULT '毛坯交货' COMMENT '交货状态：毛坯交货，粗车交货，成品交货',
  `plan_materialsource` varchar(3) DEFAULT '钢锭' COMMENT '钢锭，外协件，外购件',
  `plan_hurrystatus` int(3) DEFAULT '1' COMMENT '是否特急，1：是，0：否',
  `plan_status` int(3) DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `plan_cometime` datetime DEFAULT NULL COMMENT '来料预期',
  `plan_committime` datetime DEFAULT NULL COMMENT '合同交期',
  `plan_workstarttime` datetime DEFAULT NULL COMMENT '生产开始',
  `plan_workendtime` datetime DEFAULT NULL COMMENT '生产结束',
  `plan_inventorystatus` int(1) DEFAULT '1' COMMENT '是否库存，1：是，0：否',
  `plan_remark` varchar(200) DEFAULT '' COMMENT '备注',
  `plan_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `plan_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `plan_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oid` (`plan_orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_plan` */

/*Table structure for table `mes_product` */

DROP TABLE IF EXISTS `mes_product`;

CREATE TABLE `mes_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '材料自增id',
  `p_id` int(11) DEFAULT NULL COMMENT '材料自关联编号',
  `product_id` varchar(255) DEFAULT '' COMMENT '材料自编号',
  `product_orderid` int(11) DEFAULT NULL COMMENT '订单id关联',
  `product_planid` int(11) DEFAULT NULL COMMENT '计划id关联',
  `product_targetweight` float DEFAULT '0' COMMENT '工艺重量',
  `product_realweight` float DEFAULT '0' COMMENT '投料重量',
  `product_leftweight` float DEFAULT '0' COMMENT '剩余重量',
  `product_bakweight` float DEFAULT '0' COMMENT '备份重量用于绑定',
  `product_irontype` varchar(255) DEFAULT '' COMMENT '钢锭类别',
  `product_irontypeweight` float DEFAULT '0' COMMENT '钢锭锭型',
  `product_materialname` varchar(40) DEFAULT '' COMMENT '材料名称',
  `product_imgid` varchar(40) DEFAULT '' COMMENT '材料图号',
  `product_materialsource` varchar(3) DEFAULT '钢材' COMMENT '钢锭，外协件，外购件，废料，余料，半成品',
  `product_status` int(3) DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `product_remark` varchar(200) DEFAULT '' COMMENT '备注',
  `product_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `product_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `product_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_product` */

insert  into `mes_product`(`id`,`p_id`,`product_id`,`product_orderid`,`product_planid`,`product_targetweight`,`product_realweight`,`product_leftweight`,`product_bakweight`,`product_irontype`,`product_irontypeweight`,`product_materialname`,`product_imgid`,`product_materialsource`,`product_status`,`product_remark`,`product_operator`,`product_operate_time`,`product_operate_ip`) values (1,NULL,'3271587591a34646a5b335dec50f73bf',NULL,NULL,1,1,1,1,'q',1,'q','q','钢材',1,'q','user01','2019-06-24 09:24:18','127.0.0.1');

/*Table structure for table `mes_step` */

DROP TABLE IF EXISTS `mes_step`;

CREATE TABLE `mes_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工序自增id',
  `step_name` varchar(10) NOT NULL COMMENT '工序名称',
  `step_remark` varchar(200) DEFAULT '' COMMENT '备注',
  `step_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `step_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `step_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_step` */

insert  into `mes_step`(`id`,`step_name`,`step_remark`,`step_operator`,`step_operate_time`,`step_operate_ip`) values (1,'锻造工序','切割材料','','2019-06-14 15:05:46',''),(2,'热处理工序','处理一下','','2019-06-14 15:26:18',''),(3,'机加工序','机加一下','','2019-06-14 15:27:19',''),(4,'其他工序','','','2019-06-15 09:04:29','');

/*Table structure for table `mes_stock` */

DROP TABLE IF EXISTS `mes_stock`;

CREATE TABLE `mes_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `stock_storageid` int(11) DEFAULT NULL COMMENT '库房id:TODO',
  `stock_productid` int(11) DEFAULT NULL COMMENT '材料id:TODO',
  `stock_orderid` int(11) DEFAULT NULL COMMENT '订单id',
  `stock_ordername` varchar(40) DEFAULT '' COMMENT '产品名称',
  `stock_imgid` varchar(40) DEFAULT '' COMMENT '材料图号',
  `stock_productname` varchar(40) DEFAULT '' COMMENT '材料名称',
  `stock_productsource` char(3) DEFAULT '' COMMENT '材料来源：钢锭，外协件，外购件',
  `stock_storagestatus` int(1) DEFAULT '1' COMMENT '1,待入库，2，已入库，3，已出库',
  `stock_checkremark` varchar(255) DEFAULT '' COMMENT '质检备注',
  `stock_remark` varchar(255) DEFAULT '' COMMENT '备注',
  `stock_parentid` int(11) DEFAULT NULL COMMENT '上一条库存记录id',
  `stock_outobj` varchar(40) DEFAULT '' COMMENT '出库对象',
  `stock_intime` datetime DEFAULT NULL COMMENT '入库时间',
  `stock_outtime` datetime DEFAULT NULL COMMENT '出库时间',
  `stock_status` int(1) DEFAULT '1' COMMENT '记录状态，1：可查，0：冻结',
  `stock_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `stock_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `stock_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_stock` */

insert  into `mes_stock`(`id`,`stock_storageid`,`stock_productid`,`stock_orderid`,`stock_ordername`,`stock_imgid`,`stock_productname`,`stock_productsource`,`stock_storagestatus`,`stock_checkremark`,`stock_remark`,`stock_parentid`,`stock_outobj`,`stock_intime`,`stock_outtime`,`stock_status`,`stock_operator`,`stock_operate_time`,`stock_operate_ip`) values (1,1,1,NULL,'','q','','钢材',2,'ok','',NULL,'','2019-06-24 09:24:39',NULL,1,'','2019-06-24 09:24:18','');

/*Table structure for table `mes_stockrecord` */

DROP TABLE IF EXISTS `mes_stockrecord`;

CREATE TABLE `mes_stockrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存记录自增id',
  `stock_parentid` int(11) DEFAULT NULL COMMENT '库存id关联',
  `stock_order_id` int(11) DEFAULT NULL COMMENT '订单id关联',
  `stock_plan_id` int(11) DEFAULT NULL COMMENT '计划id关联',
  `stock_material_id` int(11) DEFAULT NULL COMMENT 'o2m材料关联',
  `stock_materialo2o_id` int(11) DEFAULT NULL COMMENT 'o2o材料关联',
  `stock_storage_id` int(11) DEFAULT NULL COMMENT '库房id',
  `stock_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '材料自编号',
  `stock_targetweight` float DEFAULT '0' COMMENT '工艺重量',
  `stock_realweight` float DEFAULT '0' COMMENT '投料重量',
  `stock_leftweight` float DEFAULT '0' COMMENT '剩余重量',
  `stock_irontype` varchar(255) DEFAULT '' COMMENT '钢锭类别',
  `stock_irontypeweight` float DEFAULT '0' COMMENT '钢锭锭型',
  `stock_materialname` varchar(40) DEFAULT '' COMMENT '材料名称',
  `stock_imgid` varchar(40) DEFAULT '' COMMENT '材料图号',
  `stock_materialsource` varchar(3) DEFAULT '钢锭' COMMENT '钢锭，外协件，外购件',
  `stock_materialtype` varchar(3) DEFAULT 'o2o' COMMENT 'o2o,o2m',
  `stock_materialtypedesc` varchar(3) DEFAULT '未绑定' COMMENT '未绑定，已绑定，被绑定',
  `stock_status` int(3) DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `stock_inputtime` datetime DEFAULT NULL COMMENT '质检入库时间',
  `stock_outtime` datetime DEFAULT NULL COMMENT '出库时间',
  `stock_type` varchar(3) DEFAULT '待入库' COMMENT '待入库,已入库,已出库',
  `stock_target` varchar(255) DEFAULT '' COMMENT '出库对象',
  `stock_check` varchar(200) DEFAULT '' COMMENT '质检备注',
  `stock_remark` varchar(200) DEFAULT '' COMMENT '备注',
  `stock_operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `stock_operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `stock_operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_stockrecord` */

/*Table structure for table `mes_storage` */

DROP TABLE IF EXISTS `mes_storage`;

CREATE TABLE `mes_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存记录自增id',
  `storage_name` varchar(10) DEFAULT '原料库' COMMENT '库房名称',
  `storage_remark` varchar(200) DEFAULT '' COMMENT '备注',
  `storage_operator` varchar(20) DEFAULT '' COMMENT '操作者',
  `storage_operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `storage_operate_ip` varchar(20) DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mes_storage` */

insert  into `mes_storage`(`id`,`storage_name`,`storage_remark`,`storage_operator`,`storage_operate_time`,`storage_operate_ip`) values (1,'原料库','钢材','user01','2019-02-20 10:32:19','127.0.0.1'),(2,'半成品库','半成品','user01','2019-01-29 07:36:53','127.0.0.1'),(3,'成品库','存储成品','user01','2019-02-20 10:32:28','127.0.0.1'),(4,'废料库','存储废料','user01','2019-01-28 15:20:36','127.0.0.1'),(5,'锻造车间','存储钢材','user01','2019-01-28 15:20:37','127.0.0.1'),(6,'热处理车间','存储半成品','user01','2019-01-28 15:20:37','127.0.0.1'),(7,'机加车间','存储半成品','user01','2019-01-28 15:20:38','127.0.0.1'),(8,'测试库','软件开发测试','user01','2019-02-20 10:32:48','127.0.0.1');

/*Table structure for table `sys_acl` */

DROP TABLE IF EXISTS `sys_acl`;

CREATE TABLE `sys_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '权限码',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限名称',
  `acl_module_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限所在的权限模块id',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '请求的url, 可以填正则表达式',
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '类型，1：菜单，2：按钮，3：其他',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '权限在当前模块下的顺序，由小到大',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_acl` */

insert  into `sys_acl`(`id`,`code`,`name`,`acl_module_id`,`url`,`type`,`status`,`seq`,`remark`,`operator`,`operate_time`,`operate_ip`) values (1,'20171015095130_26','进入产品管理界面',1,'/sys/product/product.page',1,1,1,'','Admin','2017-10-15 09:51:30','0:0:0:0:0:0:0:1'),(2,'20171015095322_14','查询产品列表',1,'/sys/product/page.json',2,1,2,'','Admin','2017-10-15 09:53:22','0:0:0:0:0:0:0:1'),(3,'20171015095350_69','产品上架',1,'/sys/product/online.json',2,1,3,'','Admin','2017-10-15 09:53:51','0:0:0:0:0:0:0:1'),(4,'20171015095420_7','产品下架',1,'/sys/product/offline.json',2,1,4,'','Admin','2017-10-15 10:11:28','0:0:0:0:0:0:0:1'),(5,'20171015212626_63','进入订单页',2,'/order/orderBatch.page',1,1,1,'','Admin','2019-04-09 17:36:26','0:0:0:0:0:0:0:1'),(6,'20171015212657_12','查询订单列表',2,'/order/order.page',2,1,2,'','Admin','2019-04-09 17:36:12','0:0:0:0:0:0:0:1'),(7,'20171015212907_36','进入权限管理页',7,'/sys/aclModule/acl.page',1,1,1,'','Admin','2017-10-15 21:29:07','0:0:0:0:0:0:0:1'),(8,'20171015212938_27','进入角色管理页',8,'/sys/role/role.page',1,1,1,'','Admin','2017-10-16 17:49:38','0:0:0:0:0:0:0:1'),(9,'20171015213009_0','进入用户管理页',9,'/sys/dept/dept.page',1,1,1,'','Admin','2017-10-15 21:30:09','0:0:0:0:0:0:0:1'),(10,'20171016230429_8','进入权限更新记录页面',11,'/sys/log/log.page',1,1,1,'','Admin','2017-10-16 23:04:49','0:0:0:0:0:0:0:1');

/*Table structure for table `sys_acl_module` */

DROP TABLE IF EXISTS `sys_acl_module`;

CREATE TABLE `sys_acl_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限模块id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限模块名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级权限模块id',
  `level` varchar(200) NOT NULL DEFAULT '' COMMENT '权限模块层级',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '权限模块在当前层级下的顺序，由小到大',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次操作时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_acl_module` */

insert  into `sys_acl_module`(`id`,`name`,`parent_id`,`level`,`seq`,`status`,`remark`,`operator`,`operate_time`,`operate_ip`) values (1,'产品管理',0,'0',1,1,'product','Admin','2017-10-14 21:13:15','0:0:0:0:0:0:0:1'),(2,'订单管理',0,'0',2,1,'','Admin','2017-10-14 20:17:11','0:0:0:0:0:0:0:1'),(6,'权限管理',0,'0',4,1,'','Admin','2017-10-15 21:27:37','0:0:0:0:0:0:0:1'),(7,'权限管理',6,'0.6',1,1,'','Admin','2017-10-15 21:27:57','0:0:0:0:0:0:0:1'),(8,'角色管理',6,'0.6',2,1,'','Admin','2017-10-15 21:28:22','0:0:0:0:0:0:0:1'),(9,'用户管理',6,'0.6',2,1,'','Admin','2017-10-15 21:28:36','0:0:0:0:0:0:0:1'),(11,'权限更新记录管理',6,'0.6',4,1,'','Admin','2017-10-16 23:04:07','0:0:0:0:0:0:0:1');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级部门id',
  `level` varchar(200) NOT NULL DEFAULT '' COMMENT '部门层级',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '部门在当前层级下的顺序，由小到大',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次操作时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id`,`name`,`parent_id`,`level`,`seq`,`remark`,`operator`,`operate_time`,`operate_ip`) values (1,'技术部',0,'0',1,'技术部','system','2017-10-11 07:21:40','127.0.0.1'),(12,'客服部',0,'0',4,'','Admin','2017-10-17 00:22:55','0:0:0:0:0:0:0:1');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '权限更新的类型，1：部门，2：用户，3：权限模块，4：权限，5：角色，6：角色用户关系，7：角色权限关系',
  `target_id` int(11) NOT NULL COMMENT '基于type后指定的对象id，比如用户、权限、角色等表的主键',
  `old_value` text COMMENT '旧值',
  `new_value` text COMMENT '新值',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次更新的时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前是否复原过，0：没有，1：复原过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_log` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(20) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '角色的类型，1：管理员角色，2：其他',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：冻结',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次更新的时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`type`,`status`,`remark`,`operator`,`operate_time`,`operate_ip`) values (1,'产品管理员',1,1,'','Admin','2017-10-15 12:42:47','0:0:0:0:0:0:0:1'),(2,'订单管理员',1,1,'','Admin','2017-10-15 12:18:59','0:0:0:0:0:0:0:1'),(4,'权限管理员',1,1,'','Admin','2017-10-15 21:30:36','0:0:0:0:0:0:0:1'),(6,'材料管理员',1,1,'','Admin','2019-04-09 17:40:39','0:0:0:0:0:0:0:1');

/*Table structure for table `sys_role_acl` */

DROP TABLE IF EXISTS `sys_role_acl`;

CREATE TABLE `sys_role_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `acl_id` int(11) NOT NULL COMMENT '权限id',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次更新的时间',
  `operate_ip` varchar(200) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role_acl` */

insert  into `sys_role_acl`(`id`,`role_id`,`acl_id`,`operator`,`operate_time`,`operate_ip`) values (26,2,5,'Admin','2019-04-10 01:31:57','0:0:0:0:0:0:0:1'),(27,2,6,'Admin','2019-04-10 01:31:57','0:0:0:0:0:0:0:1');

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次更新的时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`id`,`role_id`,`user_id`,`operator`,`operate_time`,`operate_ip`) values (26,2,7,'Admin','2019-04-10 01:32:09','0:0:0:0:0:0:0:1');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `telephone` varchar(13) NOT NULL DEFAULT '' COMMENT '手机号',
  `mail` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '加密后的密码',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户所在部门的id',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，0：冻结状态，2：删除',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`telephone`,`mail`,`password`,`dept_id`,`status`,`remark`,`operator`,`operate_time`,`operate_ip`) values (1,'Admin','18612344321','admin@qq.com','25D55AD283AA400AF464C76D713C07AD',1,1,'admin','system','2017-10-13 08:46:16','127.0.0.1'),(7,'tom','1875761124','777@qq.com','25D55AD283AA400AF464C76D713C07AD',1,1,'','Admin','2019-04-10 01:31:42','0:0:0:0:0:0:0:1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
