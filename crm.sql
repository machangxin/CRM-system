/*
Navicat MySQL Data Transfer

Source Server         : shixun
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2020-06-19 16:15:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crm_customer
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer`;
CREATE TABLE `crm_customer` (
  `customer_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `Customer_name` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  `Customer_tel` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  `Customer_addr` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Customer_state` int(11) DEFAULT NULL COMMENT '状态是否是公海客户客户，0/公海客户,五业务员跟单，1/跟单客户,由业务员负责练习',
  `Customer_user_id` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `Customer_liaison` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of crm_customer
-- ----------------------------
INSERT INTO `crm_customer` VALUES ('0833ac21-4993-438c-a62e-d35226ebc21b', 'adg1', '', '', '1', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '');
INSERT INTO `crm_customer` VALUES ('0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asdas', '', '', '1', '860bd69f-0665-4125-89e2-6137778e69cd1800', '');
INSERT INTO `crm_customer` VALUES ('3e482b38-4311-4f18-874d-a036bb9a4bbf', '阿斯达', '', '', '1', '56a6ec78-94d1-4d9b-a3c3-1dbb85fbc5121179', '阿斯顿');
INSERT INTO `crm_customer` VALUES ('5b063404-d548-4c35-a2a9-1822b0444c12', 'ag222', '', '', '1', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '');
INSERT INTO `crm_customer` VALUES ('642d5668-6d5f-43a5-b22c-1ca2e69b139e', 'mik', '122', '12231', '1', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '123123223');
INSERT INTO `crm_customer` VALUES ('9e8607da-0d0b-4a70-9e41-d5b48023b854', '123', '', '', '1', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '');
INSERT INTO `crm_customer` VALUES ('cfd4198e-ac74-4efe-99ca-64955a09c0a8', '马长鑫', '1711010010', '山东菏泽', '1', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '马长鑫');
INSERT INTO `crm_customer` VALUES ('f333d09d-5e19-442c-8473-2cdcbfb373d4', '啦啦啦', '1234432', '合萼', '1', '911385ca-b64a-4be5-99b2-b47909e4f0731787', '啦啦啦');

-- ----------------------------
-- Table structure for crm_user
-- ----------------------------
DROP TABLE IF EXISTS `crm_user`;
CREATE TABLE `crm_user` (
  `User_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `User_loginname` varchar(17) COLLATE utf8_bin NOT NULL,
  `User_loginpass` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `User_realname` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `User_tel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `User_sex` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `User_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`User_id`,`User_loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of crm_user
-- ----------------------------
INSERT INTO `crm_user` VALUES ('19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'machang', '0894d18f8a7d816349df152149af2f6e', 'machang', '', null, '');
INSERT INTO `crm_user` VALUES ('56a6ec78-94d1-4d9b-a3c3-1dbb85fbc5121179', 'admin', '24a7fb58bc7e1ece1c33d3bfac30d08b', 'admin', '123123', '男', '四川');
INSERT INTO `crm_user` VALUES ('860bd69f-0665-4125-89e2-6137778e69cd1800', 'asdasd', '2d4b1d38991b717fac224adfe6bc69a7', 'asdasd', '', null, '');
INSERT INTO `crm_user` VALUES ('911385ca-b64a-4be5-99b2-b47909e4f0731787', 'linpingzhi', '36fe1ab40883262800159d876d67d32c', '林平之', '171111', '男', '山东');

-- ----------------------------
-- Table structure for crm_visitlog
-- ----------------------------
DROP TABLE IF EXISTS `crm_visitlog`;
CREATE TABLE `crm_visitlog` (
  `Visit_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `Visit_time` datetime DEFAULT NULL,
  `Visit_user_id` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `Visit_customer_id` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `Visit_customer_info` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Visit_payment` int(11) DEFAULT NULL,
  `Visit_money` int(11) DEFAULT NULL,
  `Crm_visit_way_id` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`Visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of crm_visitlog
-- ----------------------------
INSERT INTO `crm_visitlog` VALUES ('03c7efc1-798e-4196-9e1d-9fdf0097748e', '2020-06-18 16:49:30', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '1', '122', null);
INSERT INTO `crm_visitlog` VALUES ('04841cc5-739f-40dc-b2ea-ca3d3cbd0e33', '2020-06-19 16:09:22', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '1', '3333', null);
INSERT INTO `crm_visitlog` VALUES ('075ee8c9-752a-4a35-958e-2d7697df2a33', '2020-06-18 16:48:22', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('094605b0-a133-452b-a933-9dc736109b4b', '2020-06-18 16:46:19', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'd55388a4-6985-4dab-8800-10891f099fd8', 'asdsadad', '1', '213', null);
INSERT INTO `crm_visitlog` VALUES ('0cb009d6-816b-4dab-9de5-2c9e3307753f', '2020-06-18 16:48:52', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('1189c084-d1a5-4b6b-b9e6-8021702ab266', '2020-06-18 16:43:14', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '9e8607da-0d0b-4a70-9e41-d5b48023b854', '', '1', '12', null);
INSERT INTO `crm_visitlog` VALUES ('14cd79ae-8440-42c1-846e-e68f89c786f8', '2020-06-18 16:46:03', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'd55388a4-6985-4dab-8800-10891f099fd8', 'asdasdasdasd', '1', '12', null);
INSERT INTO `crm_visitlog` VALUES ('15d46f84-dfa3-4be8-88e0-6355ab8536c1', '2020-06-18 16:43:17', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '9e8607da-0d0b-4a70-9e41-d5b48023b854', '', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('1691e993-f785-4a77-8a48-d12a5c6a55c1', '2020-06-19 16:06:40', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'cfd4198e-ac74-4efe-99ca-64955a09c0a8', '', '1', '43534', null);
INSERT INTO `crm_visitlog` VALUES ('16df6b69-84e6-4b6d-a7ca-c5515ce0e20f', '2020-06-18 16:44:59', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', '12321', '1', '12', null);
INSERT INTO `crm_visitlog` VALUES ('20346066-403a-48ce-8e05-c3a7742c2c7b', '2020-06-18 16:46:14', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'd55388a4-6985-4dab-8800-10891f099fd8', 'dasdasdasdsadas', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('22478225-6996-47de-8952-62ba3604b019', '2020-06-18 16:48:33', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', '', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('2495040d-d03f-471a-83d1-c8899de55552', '2020-06-18 16:48:50', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('28f4e5f0-4a11-4734-8efc-87eaf718a31f', '2020-06-18 16:47:33', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asdassadasdasdas', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('2996f996-dc27-4b2c-ad6c-06d9e432fb15', '2020-06-19 16:11:00', '56a6ec78-94d1-4d9b-a3c3-1dbb85fbc5121179', '3e482b38-4311-4f18-874d-a036bb9a4bbf', '', '1', '123123', null);
INSERT INTO `crm_visitlog` VALUES ('2c259ed4-6349-43db-beb4-eb58ce34e580', '2020-06-18 16:49:23', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '1', '122', null);
INSERT INTO `crm_visitlog` VALUES ('2eff784d-4602-4535-ab8b-6a62d516b625', '2020-06-18 16:48:47', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('33d72d19-8bd3-4799-a4b0-c9529f541b1a', '2020-06-19 16:08:31', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '1', '434', null);
INSERT INTO `crm_visitlog` VALUES ('3aff91c2-8c4c-4127-b87b-e3b036703ff0', '2020-06-18 16:48:44', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('3cab84cd-f00f-4617-b880-dd56b19714e1', '2020-06-18 16:49:07', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('3cd204b6-928f-4900-a2a5-d84a50cd233d', '2020-06-19 16:09:15', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '1', '32333', null);
INSERT INTO `crm_visitlog` VALUES ('408b23fe-b04d-4fd9-9d79-0eda55a7b484', '2020-06-18 16:50:22', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('40eb475d-eaa8-4edd-8b17-2ce58b5eb1dc', '2020-06-18 16:49:26', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '1', '212', null);
INSERT INTO `crm_visitlog` VALUES ('42d639eb-426e-4031-a1df-1ea4eff1d54e', '2020-06-18 16:49:35', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '1', '222', null);
INSERT INTO `crm_visitlog` VALUES ('46306ceb-1ef8-47b8-a8e4-d363400d6d78', '2020-06-18 16:49:02', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('4675fa07-3789-4038-832f-75733132041a', '2020-06-18 16:43:08', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '9e8607da-0d0b-4a70-9e41-d5b48023b854', '洒洒的时代撒旦', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('47248332-fb42-4dc9-806e-89e51496afc4', '2020-06-18 16:44:47', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'asdasd', '1', '2131', null);
INSERT INTO `crm_visitlog` VALUES ('485a3f8f-1ebc-4aff-a917-e0226b0efd4c', '2020-06-19 16:09:25', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '0', '44444', null);
INSERT INTO `crm_visitlog` VALUES ('49bfe595-ffd9-492b-b35b-632814c86603', '2020-06-19 16:08:34', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '1', '1122', null);
INSERT INTO `crm_visitlog` VALUES ('4efa782a-0db7-4116-bbce-acb52d94ecd0', '2020-06-18 16:46:44', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'adasdasdas', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('503cb440-a997-460b-ae4e-6dfe1fe642bd', '2020-06-18 16:43:20', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '9e8607da-0d0b-4a70-9e41-d5b48023b854', '', '1', '12312', null);
INSERT INTO `crm_visitlog` VALUES ('51d7e697-a45e-4412-8d41-3af0a8676c20', '2020-06-18 16:50:17', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('543a5a13-c4a1-4b9f-8935-96697a7ea625', '2020-06-18 16:39:57', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', 'dsadas', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('566676cf-6a59-4a98-a00b-6e1f140897f5', '2020-06-18 16:36:32', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', '', '1', '3454', null);
INSERT INTO `crm_visitlog` VALUES ('5d7616d4-0641-4499-92f0-9134b7882732', '2020-06-18 16:40:02', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', 'asdas', '1', '12312', null);
INSERT INTO `crm_visitlog` VALUES ('5de68cd5-4630-476f-ac97-501fbf96be52', '2020-06-18 16:48:49', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('61b3de12-9a7d-4684-9213-877d7cc8b880', '2020-06-18 16:46:21', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'd55388a4-6985-4dab-8800-10891f099fd8', 'asdasdasd', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('63febe1b-64fb-4474-9062-1efb24e1786a', '2020-06-18 16:48:24', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('654716b7-f4a2-4b05-b5bc-b5e1085fd4ed', '2020-06-18 16:47:17', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asdasdasd', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('6a1fbe68-6c23-49a4-a142-34c5f78a844e', '2020-06-18 16:48:37', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '1', '1231', null);
INSERT INTO `crm_visitlog` VALUES ('6a279143-6a64-4d51-b48a-381a25144b96', '2020-06-18 16:45:25', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', '123132213', '1', '12321', null);
INSERT INTO `crm_visitlog` VALUES ('6a443934-9943-4367-bc3c-fc247251f49e', '2020-06-18 16:40:06', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', 'asdads', '1', '12312', null);
INSERT INTO `crm_visitlog` VALUES ('6ac682ca-64c5-4e3f-bb3b-4ef6d835c0e9', '2020-06-18 16:45:35', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'sssad', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('6afcfb2b-a10d-494b-ae60-9221e05992e6', '2020-02-25 16:35:54', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', 'asdasd', '1', '123123', null);
INSERT INTO `crm_visitlog` VALUES ('6afcfb2b-a10d-494b-ae60-9221e05992e7', '2020-02-18 16:35:54', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', 'asdasd', '1', '123123', '');
INSERT INTO `crm_visitlog` VALUES ('701a1e2b-81b3-4457-bc82-c262851b364e', '2020-06-18 16:46:42', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asdasdasdasd', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('707774a5-1f13-43f1-b999-1adcdc9fc1ea', '2020-06-18 16:36:27', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', '123', '1', '546', null);
INSERT INTO `crm_visitlog` VALUES ('72ac929f-886a-41d5-ae1a-22707241248b', '2020-06-18 16:50:04', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('74cedde7-d644-453a-8bff-e22ee5e992d4', '2020-06-18 16:48:45', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('75006c05-968e-47f0-85d7-a7f32ae6ed9c', '2020-06-18 16:50:15', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('77418fe7-2ddd-4292-88ac-e804d97f8bdb', '2020-06-18 16:50:33', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '1', '1221', null);
INSERT INTO `crm_visitlog` VALUES ('78c964dc-a47c-4bdc-b30b-1848eeaab639', '2020-06-18 16:49:40', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('7a81c6a4-efb9-49d1-ad7a-8ead776b18c2', '2020-06-18 16:48:39', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('7b1b4c7d-e976-4f46-8376-366db7434100', '2020-06-18 16:44:51', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'asdasd', '1', '1231', null);
INSERT INTO `crm_visitlog` VALUES ('84ab20e4-70e5-48db-ad76-dd9ca21ecb83', '2020-06-18 16:40:14', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', 'asddassad', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('87739901-b230-4426-8bdc-27cdf86bee35', '2020-06-18 16:43:24', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '9e8607da-0d0b-4a70-9e41-d5b48023b854', '阿尔阿斯顿', '1', '12321', null);
INSERT INTO `crm_visitlog` VALUES ('87ecb981-3158-45b2-8183-56e8bb23721e', '2020-06-19 16:08:38', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '1', '1221', null);
INSERT INTO `crm_visitlog` VALUES ('8a8e18a3-a6a8-45e9-b2f2-c201986c352b', '2020-06-18 16:47:42', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asd', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('8d6f3798-ccad-4e39-98a6-8098a38ee52c', '2020-06-18 16:36:35', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', 'qweqew', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('92bc3786-4e68-44ea-9cc0-6491cedd50cd', '2020-06-18 16:49:09', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('98252759-ef7e-41bd-a1e9-8a6ac3ad5850', '2020-06-18 16:45:28', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', '123213321', '1', '21312', null);
INSERT INTO `crm_visitlog` VALUES ('983a5e0c-0ead-47b1-ba2c-c0bfb6359bbe', '2020-06-18 16:50:10', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', '', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('9b8488df-ddda-486d-8e3f-3d45c6b272ff', '2020-06-18 16:48:30', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', '', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('9f23769a-1b9f-4141-ae91-45b2da28cabb', '2020-06-18 16:45:33', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'asdsadsad', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('a0a07a01-a499-4f36-ac2f-f37c7f001d31', '2020-06-18 16:50:20', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '1', '12333', null);
INSERT INTO `crm_visitlog` VALUES ('a5c67a6d-2ef8-4ec8-99d1-b7482715b936', '2020-06-18 16:36:03', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', 'asdasd', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('a600e425-c82f-46a1-8d97-0dba207ac6fd', '2020-06-18 16:42:37', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', ' asdasd', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('a64143ae-e7d7-4715-bcd0-aa811296abfe', '2020-06-19 16:08:49', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '1', '121122', null);
INSERT INTO `crm_visitlog` VALUES ('a6a3c217-5e5d-4c0f-a32f-5c94f05a0028', '2020-06-18 16:50:02', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('a6d0a8ae-a11d-4d10-87f4-6dbc4569a80a', '2020-06-18 16:45:37', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'dssdasadsda', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('a90bd795-90af-4e59-9855-4a3a7d2a2d6e', '2020-06-18 16:48:40', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('a99de341-d2f0-4866-b690-3fd34be88ca2', '2020-06-18 16:42:46', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', '', '1', '12312', null);
INSERT INTO `crm_visitlog` VALUES ('ac4cfd6e-a281-4f2e-b461-46c5744a20f8', '2020-03-17 16:10:51', '56a6ec78-94d1-4d9b-a3c3-1dbb85fbc5121179', '3e482b38-4311-4f18-874d-a036bb9a4bbf', '', '1', '123123', null);
INSERT INTO `crm_visitlog` VALUES ('ad238f60-89ba-4076-847f-f790ae730bd6', '2020-06-18 16:46:06', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'd55388a4-6985-4dab-8800-10891f099fd8', 'asdasdasd', '1', '123', null);
INSERT INTO `crm_visitlog` VALUES ('ad84c3a9-608e-488d-88f5-6fbc97a9d1c5', '2020-06-18 16:44:40', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'sadssa', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('ae1e967d-b48e-43f0-8bcd-b902a4b70dcb', '2020-06-18 16:48:42', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', 'ed459f7a-9b7e-475a-8bb5-f206d5b93473', 'admin', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('ae8dedf4-3740-406a-8e6c-5b59caceecff', '2020-06-18 16:44:37', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'asdsadsad', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('b61352da-d6e2-4bcb-98a3-d2efea876ae8', '2020-08-15 16:10:57', '56a6ec78-94d1-4d9b-a3c3-1dbb85fbc5121179', '3e482b38-4311-4f18-874d-a036bb9a4bbf', '', '1', '123123', null);
INSERT INTO `crm_visitlog` VALUES ('be2c422f-0e89-4f0c-b785-7f2a8700a96f', '2020-07-17 16:43:30', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '9e8607da-0d0b-4a70-9e41-d5b48023b854', '', '1', '123123', null);
INSERT INTO `crm_visitlog` VALUES ('bf57c8ca-db37-431d-9766-1a0044582f4c', '2020-02-12 16:44:44', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', '', '1', '21312', null);
INSERT INTO `crm_visitlog` VALUES ('c06d1ce3-3209-4e6a-8b4c-8468ec029150', '2020-06-18 16:45:31', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', '1wqasd', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('c190ce48-c07e-45f4-b5e0-731328767779', '2020-03-18 16:46:53', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'sadasds', '1', '123213', null);
INSERT INTO `crm_visitlog` VALUES ('c4bb7bc4-3522-45ff-85ba-78c30d2f8ed2', '2020-06-18 16:46:29', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'd55388a4-6985-4dab-8800-10891f099fd8', 'asdasdasda', '1', '2132', null);
INSERT INTO `crm_visitlog` VALUES ('c4e6f357-d7cd-4eec-962a-80e84896cbbc', '2020-06-18 16:50:13', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', '', '1', '1233', null);
INSERT INTO `crm_visitlog` VALUES ('c50fcb0c-4efa-42e8-aa04-ee263769ccbd', '2020-06-18 16:47:13', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asdasdasda', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('c5b38728-b1d5-495f-be57-57e9e19a9766', '2020-04-14 16:49:19', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '1', '2121', null);
INSERT INTO `crm_visitlog` VALUES ('c610eccb-0ad0-47e7-be07-04db0731a746', '2020-06-18 16:35:57', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', 'adad', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('c7c92eff-5845-4c3c-af97-db297a8c2862', '2020-06-18 16:50:06', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('c8267dc9-7968-455f-aab2-cc1a1d7a818d', '2020-06-19 16:06:36', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'cfd4198e-ac74-4efe-99ca-64955a09c0a8', '', '1', '1234', null);
INSERT INTO `crm_visitlog` VALUES ('cc59e124-4a24-4c3e-9935-a028071c6831', '2020-07-17 16:49:16', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '0833ac21-4993-438c-a62e-d35226ebc21b', 'admin111', '1', '2132', null);
INSERT INTO `crm_visitlog` VALUES ('d37f6ddf-03dd-417a-8460-b2ab3cb65fb3', '2020-06-18 16:47:35', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asdassadasdasdas', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('d5585ee8-de49-4991-9478-1c0916b8fb7a', '2020-06-19 14:16:59', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'cfd4198e-ac74-4efe-99ca-64955a09c0a8', '', '1', '1234', null);
INSERT INTO `crm_visitlog` VALUES ('d875dbfb-0683-48b6-a2d5-c06377cb3cbb', '2020-06-18 16:46:49', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'adasdasd', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('de491dca-4cc1-4a59-8bfb-560274b1523a', '2020-08-15 16:46:47', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'adasdasds', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('e3dc9404-82bf-474f-9998-237b286b6e0f', '2020-06-18 16:47:15', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'asdasdasda', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('e4b39118-3c1c-4945-a6fa-e577ab599ff9', '2020-06-19 14:17:21', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'cfd4198e-ac74-4efe-99ca-64955a09c0a8', '', '1', '12333', null);
INSERT INTO `crm_visitlog` VALUES ('e5aef769-7460-4e2f-969f-d5d179a51d43', '2020-06-19 16:08:27', '911385ca-b64a-4be5-99b2-b47909e4f0731787', 'f333d09d-5e19-442c-8473-2cdcbfb373d4', '', '1', '12312', null);
INSERT INTO `crm_visitlog` VALUES ('e6be7d72-bfc8-454a-a177-eef6a874d062', '2020-04-23 16:46:32', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'd55388a4-6985-4dab-8800-10891f099fd8', 'asdasdas', '1', '123212', null);
INSERT INTO `crm_visitlog` VALUES ('e8dcc3a7-bb3e-4840-ab05-945a73e599b9', '2020-03-11 16:45:03', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', '1231231', '1', '213123', null);
INSERT INTO `crm_visitlog` VALUES ('e9aa5611-456f-482d-bbd8-12bc9132bcda', '2020-06-18 16:39:55', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', 'asadsdas', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('ec4b2ae0-eac6-4746-b329-4a8c9a7be26f', '2020-06-18 16:46:46', '860bd69f-0665-4125-89e2-6137778e69cd1800', '0ba45a25-3c76-4181-9b5f-d0cd99db32fc', 'adasdasd', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('f3942e5b-11c9-42cd-a33b-1976f82b1395', '2020-06-18 16:42:38', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', 'b866ee6c-a3bc-4c46-8f76-7005e7c9a21b', ' ', '0', '0', null);
INSERT INTO `crm_visitlog` VALUES ('f5fc8818-17ad-4e5e-a20e-16d886fd769a', '2020-04-18 16:36:17', '19a5db26-3bfd-42a9-b581-f6827deb1c451908', '642d5668-6d5f-43a5-b22c-1ca2e69b139e', '12312', '0', '342', null);
INSERT INTO `crm_visitlog` VALUES ('f7feefa0-7854-4eef-b823-ab0fd8aec886', '2020-05-22 16:44:55', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'adasdasd', '1', '21313', null);
INSERT INTO `crm_visitlog` VALUES ('f8000ee1-a522-4ed1-80ed-4e85bded20ad', '2020-02-19 16:50:26', '3ea753c2-48d0-4b53-87a0-d97e2e6738c41204', '5b063404-d548-4c35-a2a9-1822b0444c12', 'admng222', '1', '12313', null);
INSERT INTO `crm_visitlog` VALUES ('f9cadd99-3fd3-428a-bbff-6513b00e4985', '2020-06-18 16:44:39', '860bd69f-0665-4125-89e2-6137778e69cd1800', 'f9fc83ca-1fe0-4661-bf6e-2e202fc444fa', 'adsssd', '0', '0', null);

-- ----------------------------
-- Table structure for crm_visit_way
-- ----------------------------
DROP TABLE IF EXISTS `crm_visit_way`;
CREATE TABLE `crm_visit_way` (
  `Way_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `Way_name` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`Way_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of crm_visit_way
-- ----------------------------
