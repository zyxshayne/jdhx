/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : 127.0.0.1:3306
 Source Schema         : wy

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 27/05/2022 18:13:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ay_site
-- ----------------------------
DROP TABLE IF EXISTS `ay_site`;
CREATE TABLE `ay_site`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '站点编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域代码',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点副标题',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点地址',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点LOGO地址',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点关键字',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点描述',
  `icp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点备案',
  `theme` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点主题',
  `statistical` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点统计码',
  `copyright` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版权信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_site_acode`(`acode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_site
-- ----------------------------
INSERT INTO `ay_site` VALUES (1, 'cn', 'PbootCMS', '永久开源免费的PHP企业网站开发建设管理系统', 'www.pbootcms.com', '/static/images/logo.png', 'cms,免费cms,开源cms,企业cms,建站cms', 'PbootCMS是一套全新内核且永久开源免费的PHP企业网站开发建设管理系统，是一套高效、简洁、 强悍的可免费商用的PHP CMS源码，能够满足各类企业网站开发建设的需要。系统采用简单到想哭的模板标签，只要懂HTML就可快速开发企业网站。官方提供了大量网站模板免费下载和使用，将致力于为广大开发者和企业提供最佳的网站开发建设解决方案。', '湘ICP备88888888号', 'default', '', 'Copyright © 2018-2020 PbootCMS All Rights Reserved.');

-- ----------------------------
-- Table structure for wy_admin
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin`;
CREATE TABLE `wy_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1正常-1禁止登陆',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  `last_login_time` int(11) NOT NULL DEFAULT 0,
  `login_num` int(11) NOT NULL DEFAULT 0,
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `phone` bigint(11) NULL DEFAULT 0,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `thumb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_admin
-- ----------------------------
INSERT INTO `wy_admin` VALUES (1, 'admin', 'ec4af810ed34dcecb18c06d46c16ee71', 'HVDvLsdrTIlwqCAQ40cb', 1, 1653364126, 1653364126, 1653550675, 4, '127.0.0.1', 0, 'Admin', NULL, '/themes/admin_themes/lib/vaeyo/img/thumb.png');

-- ----------------------------
-- Table structure for wy_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin_group`;
CREATE TABLE `wy_admin_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `rules` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则\",\"隔开',
  `menus` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_admin_group
-- ----------------------------
INSERT INTO `wy_admin_group` VALUES (1, '系统所有者', 1, '1,2,57,58,59,60,3,19,20,21,22,23,24,25,26,27,28,29,30,31,32,7,8,9,10,11,12,13,14,15,16,17,18,50,51,52,53,54,55,56,4,5,39,40,41,42,43,44,45,46,47,48,49,33,34,35,36,37,38,69,70,71,72,73,74,75,76,77,78,79,80,81,82,6,61,62,63,64,65,66,67,68,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103', '1,2,3,4,5,6,14,15,16,17,7,10,11,12,13,24,22,23,18,19,20,21,24,25,26', '系统所有者，系统自动分配所有可操作权限及菜单。', 0, 1653531351);

-- ----------------------------
-- Table structure for wy_admin_group_access
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin_group_access`;
CREATE TABLE `wy_admin_group_access`  (
  `uid` mediumint(11) UNSIGNED NULL DEFAULT NULL,
  `group_id` mediumint(11) NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分组和管理员的关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_admin_group_access
-- ----------------------------
INSERT INTO `wy_admin_group_access` VALUES (1, 1, 0, 0);

-- ----------------------------
-- Table structure for wy_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin_menu`;
CREATE TABLE `wy_admin_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `src` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `order` int(11) NOT NULL DEFAULT 1 COMMENT '越大越靠前',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_admin_menu
-- ----------------------------
INSERT INTO `wy_admin_menu` VALUES (1, 0, '系统', NULL, NULL, 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (2, 1, '菜单', 'admin/menu/index', NULL, 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (3, 1, '管理', NULL, NULL, 2, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (4, 3, '管理员', 'admin/admin/index', NULL, 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (5, 3, '管理组', 'admin/group/index', NULL, 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (6, 1, '节点', 'admin/rule/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (7, 0, '门户', '', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (10, 7, '分类', 'admin/cate/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (11, 7, '内容', '', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (12, 11, '文章', 'admin/article/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (13, 11, '回收站', 'admin/recycle/index', '', 2, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (14, 1, '路由', 'admin/route/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (15, 1, '配置', '', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (16, 15, '网站信息', 'admin/conf/webConf', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (17, 15, '邮箱配置', 'admin/conf/emailConf', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (18, 0, '插件', '', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (19, 18, '内置钩子', 'admin/hook/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (20, 18, '插件管理', 'admin/plugin/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (22, 7, '轮播', 'admin/slide/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (23, 7, '导航', 'admin/nav/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (24, 15, '短信配置', 'admin/conf/dayuConf', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (25, 7, '公司信息', 'admin/company/index', '', 1, 0, 0);
INSERT INTO `wy_admin_menu` VALUES (26, 7, '站点信息', 'admin/site/index', '', 1, 0, 0);

-- ----------------------------
-- Table structure for wy_admin_rule
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin_rule`;
CREATE TABLE `wy_admin_rule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT 1,
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加规则',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_admin_rule
-- ----------------------------
INSERT INTO `wy_admin_rule` VALUES (1, 0, '', '系统', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (2, 1, '', '配置', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (3, 1, '', '管理', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (4, 0, '', '门户', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (5, 4, '', '内容', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (6, 0, '', '插件', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (7, 1, 'menu/index', '菜单', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (8, 7, 'menu/getMenuList', '菜单列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (9, 7, 'menu/add', '添加菜单', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (10, 9, 'menu/addSubmit', '保存添加的菜单', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (11, 7, 'menu/editSubmit', '保存菜单修改', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (12, 7, 'menu/delete', '删除菜单', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (13, 1, 'rule/index', '节点', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (14, 13, 'rule/getRuleList', '节点列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (15, 13, 'rule/add', '添加节点', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (16, 15, 'rule/addSubmit', '保存添加的节点', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (17, 13, 'rule/editSubmit', '保存节点修改', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (18, 13, 'rule/delete', '节点删除', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (19, 3, 'admin/index', '管理员', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (20, 19, 'admin/getAdminList', '管理员列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (21, 19, 'admin/add', '添加管理员', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (22, 21, 'admin/addSubmit', '保存添加的管理员', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (23, 19, 'admin/edit', '修改管理员', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (24, 23, 'admin/editSubmit', '保存管理员的修改', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (25, 19, 'admin/delete', '管理员删除', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (26, 3, 'group/index', '管理组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (27, 26, 'group/getGroupList', '管理组列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (28, 26, 'group/add', '添加管理组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (29, 28, 'group/addSubmit', '保存添加的管理组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (30, 26, 'group/edit', '管理组修改', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (31, 30, 'group/editSubmit', '保存管理组的修改', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (32, 26, 'group/delete', '管理组删除', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (33, 4, 'cate/index', '分类', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (34, 33, 'cate/getCateList', '分类列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (35, 33, 'cate/add', '添加分类', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (36, 35, 'cate/addSubmit', '保存添加的分类', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (37, 33, 'cate/editSubmit', '保存修改的分类', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (38, 33, 'cate/delete', '删除分类', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (39, 5, 'article/index', '文章', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (40, 39, 'article/getContentList', '文章列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (41, 39, 'article/add', '添加文章', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (42, 41, 'article/addSubmit', '保存添加的文章', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (43, 39, 'article/edit', '编辑文章', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (44, 43, 'article/editSubmit', '保存编辑的文章', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (45, 39, 'article/delete', '删除文章', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (46, 5, 'recycle/index', '回收站', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (47, 46, 'recycle/getRecycleList', '回收列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (48, 46, 'recycle/reduction', '还原', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (49, 46, 'recycle/delete', '彻底删除', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (50, 1, 'route/index', '路由', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (51, 50, 'route/getRouteList', '路由列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (52, 50, 'route/add', '添加路由', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (53, 52, 'route/addSubmit', '保存添加的路由', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (54, 50, 'route/edit', '修改路由', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (55, 54, 'route/editSubmit', '保存修改的路由', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (56, 50, 'route/delete', '删除路由', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (57, 2, 'conf/webConf', '网站信息', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (58, 57, 'conf/webConfSubmit', '保存网站信息', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (59, 2, 'conf/emailConf', '邮箱配置', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (60, 59, 'conf/emailConfSubmit', '保存邮箱配置', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (61, 6, 'hook/index', '钩子管理', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (62, 61, 'hook/getHookList', '钩子列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (63, 6, 'plugin/index', '插件管理', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (64, 63, 'plugin/getPluginList', '插件列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (65, 63, 'plugin/start', '启用插件', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (66, 63, 'plugin/disabled', '禁用插件', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (67, 63, 'plugin/uninstall', '卸载插件', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (68, 63, 'plugin/install', '安装插件', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (69, 4, 'slide/index', '轮播组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (70, 69, 'slide/add', '添加轮播组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (71, 70, 'slide/addSubmit', '保存添加的轮播组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (72, 69, 'slide/edit', '修改轮播组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (73, 72, 'slide/editSubmit', '保存修改的轮播组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (74, 69, 'slide/delete', '删除轮播组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (75, 69, 'slide/getSlideList', '轮播组列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (76, 4, 'slide/slideInfo', '轮播', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (77, 76, 'slide/getSlideInfoList', '轮播列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (78, 76, 'slide/addSlideInfo', '添加轮播', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (79, 78, 'slide/addSlideInfoSubmit', '保存添加的轮播', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (80, 76, 'slide/editSlideInfo', '编辑轮播', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (81, 80, 'slide/editSlideInfoSubmit', '保存编辑的轮播', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (82, 76, 'slide/deleteSlideInfo', '删除轮播', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (83, 4, '', '导航', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (84, 83, 'nav/index', '导航组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (85, 84, 'nav/getNavList', '导航组列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (86, 84, 'nav/add', '添加导航组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (87, 86, 'nav/addSubmit', '保存添加的导航组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (88, 84, 'nav/edit', '修改导航组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (89, 88, 'nav/editSubmit', '保存修改的导航组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (90, 84, 'nav/delete', '删除导航组', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (91, 83, 'nav/navInfo', '管理导航', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (92, 91, 'nav/getNavInfoList', '导航列表', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (93, 91, 'nav/addNavInfo', '添加导航', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (94, 93, 'nav/addNavInfoSubmit', '保存添加的导航', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (95, 91, 'nav/editNavInfoSubmit', '保存修改的导航', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (96, 91, 'nav/deleteNavInfo', '删除导航', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (97, 63, 'plugin/setConfig', '配置插件', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (98, 2, 'conf/dayuConf', '短信配置', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (99, 98, 'conf/dayuConfSubmit', '保存短信配置', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (100, 4, 'company/index', '编辑公司信息', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (101, 4, 'company/edit', '提交公司信息', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (102, 4, 'site/edit', '站点信息编辑', 1, '', 0, 0);
INSERT INTO `wy_admin_rule` VALUES (103, 4, 'site/index', '站点信息', 1, '', 0, 0);

-- ----------------------------
-- Table structure for wy_article
-- ----------------------------
DROP TABLE IF EXISTS `wy_article`;
CREATE TABLE `wy_article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `keywords` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1正常-1下架',
  `thumb` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `read` int(11) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `article_cate_id` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_article
-- ----------------------------
INSERT INTO `wy_article` VALUES (1, '关于我们', 'about us', '柔和的阳光斜挂在苍松翠柏不凋的枝叶上,显得那么安静肃穆,绿色的草坪和白色的水泥道貌岸然上,脚步是那么轻起轻落,大家的心中 却是那么的激动与思绪波涌。\n2.这时候万籁无声,只有那暖夜沉默的黑暗将他们团团围着。做巢在蔷薇花和忍冬花丛里的反舌鸟,偶然从小梦里醒过来,唱出一个羞怯清 丽的调子。然后,仿佛经过一下慎重的考虑,又是完全地静默了', 1, 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220527110830about.jpg', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; text-align: center;\"><img alt=\"\" src=\"http://cdn.img-sys.com/comdata/86235/201912/20191224142618b692c0.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; text-align: center;\">&nbsp;</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127); font-size: 16px;\">常與</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">《庄子. 外物》吾失我常舆，我无所处。 意为：我失去我生活的环境，将会无法生存。&nbsp;</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">常與，意指生活的环境。&nbsp;</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">常舆文化，即为我们生活环境的文化。这是我们的创立宗 旨，也是我们工作的方向。&nbsp;</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">常與文化，以中国文化传承为根基，</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">旨在切实完善我们的生活环境，让生活更舒适、更便利、更有文化品位和格调 。将中国传统文化与生活环境做出最契合的融合。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">对于传统文化，传承、发展、弘扬是我们的职责。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\">&nbsp;</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><img src=\"http://cdn.img-sys.com/comdata/86235/201912/20191205151604183857.png\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; letter-spacing: 1.5px; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127); font-size: 18px;\">中国文化</span><span style=\"box-sizing: border-box; color: rgb(127, 127, 127); font-size: 16px;\">&nbsp;，不是我们的噱头，而是我们的坚持</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; text-align: center;\">&nbsp;</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">中国文化博大精深，源远流长。它指引我们方向，与我们的生活融为一体</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">传统，是为人处世的方式，是对生命、对生活的理解</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">立足于今天的语境，讲当代的传统。传承，不会因为形式的改变而改变其内在的神髓</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\"><span style=\"box-sizing: border-box; color: rgb(127, 127, 127);\">回归本心，用文化来改变生活，让文化去浸润生活</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\">&nbsp;</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\"><img src=\"http://www.changyuwenhua.com/images/imgbg.png\"/><img alt=\"\" src=\"http://cdn.img-sys.com/comdata/86235/201912/201912241435435501f4.png\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\">&nbsp;</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; line-height: 1.75em; text-align: center;\"><img alt=\"\" src=\"http://cdn.img-sys.com/comdata/86235/201912/20191224143543143c6d.png\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; text-align: center;\"><img alt=\"\" src=\"http://cdn.img-sys.com/comdata/86235/201912/2019122414354368dbdf.png\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; outline: none; text-align: center;\"><img alt=\"\" src=\"http://cdn.img-sys.com/comdata/86235/201912/201912241435434ce728.png\"/></p><p><br/></p>', 0, 9, 1621414936, 1653620913, NULL);
INSERT INTO `wy_article` VALUES (2, '质朴素雅，打造充满高级感的禅意空间！', '人生', '人生是一场独自的修行，谋生亦谋爱。人生的旅途中，大家都在忙着遇见各种人，以为这是在丰富生命，可是有价值的遇见，是在某一瞬间重遇了自己.....那一刻你才会懂得，走遍世界，也不过是为了寻找一条走回内心之路。', 1, 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220526190721news.jpg', '<p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">人生是一场独自的修行，谋生亦谋爱。人生的旅途中，大家都在忙着遇见各种人，以为这是在丰富生命，可是有价值的遇见，是在某一瞬间重遇了自己.....那一刻你才会懂得，走遍世界，也不过是为了寻找一条走回内心之路，有的路用脚来走，有的路用心测量，走好已选择的路，别走好走之路，才能拥有真正的自己。琢心社，正如一场修行，用自己的内心，慢慢找寻，琢磨，体悟人生之路，走向灵魂的高点.....</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">琢 · 琢玉成器_经过修磨锻炼，方能成器成才。</span></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">心 · 修心养性_通过自我观察，达到完美境界。</span></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">社 · 里社众人_量变到质变，一生二、二生三、三生万物。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/2019111214184798374a.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">进入序厅，静静的只听见潺潺流水声，一束光带我们来到琢心社的源起。推开门，一股茶香进入心头，铜面吧台、十二季茶、甜点进入我们的眼帘，低调而质朴。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/2019111214192046befe.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; line-height: 27.2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">原走廊过于狭长，破开窗洞，让光线晒入走廊，多了几分情趣和温暖。</span><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112141949db4b3b.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">走廊尽头，一具老柜，一尊达摩，诉说着他们的历史……</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/201911121420543127db.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">窗洞里的生命，是大厅和连廊的采光，又是生命的绽放。走入其中，让人豁然开朗。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142129b0581a.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">楼梯西侧，使用钢板作为支撑点，简洁的背后体现了技术的难度。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142209c66040.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">过廊门洞，由于低矮，两侧竖立的老柱，上方横放着一个警示标识，呵护着每一个人!</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/201911121425225950d7.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">进入包厢前，会被门口的门牌和灯的细节所打动，轻松惬意。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/201911121425336d021b.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142533034252.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">私人包厢内部，配有榆木桌椅和装置吊灯。既充分考虑了业主对于整体项目的投资预算，同时也给消费者带来质朴简约、平和静谧的空间体验。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142533930de5.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/201911121425339ae63f.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">用不同色彩、冷暖体现男女之间的温度。精心淘回来的石臼作为手盆，在古铜版和墙面的衬托下，形成松紧、粗细的心理反差，舒服舒心。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/201911121425335b6688.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/201911121425330a0f3b.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">山，石，景的相互映衬，彼此之间，各自拥有着自己的空间，静谧而细腻。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/201911121425333e2d75.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">大厅是合院的中空，加建屋顶形成8米的层高，宽敞舒适，是琢心社提气的地方。</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">包厢内，喝茶、品香、食素，自然而质朴，是繁华都市里的一片净土……</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142533c29b9a.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142533fa25bf.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; line-height: 27.2px; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">圆形茶台，形意合一，弹一首古琴，与香炉中的沉香交相呼应，改变着我们的生活方式。慢下来，静下来，听听我们自己心里在想着什么……</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142533178f21.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><img src=\"http://cdn.img-sys.com/comdata/86235/201911/20191112142533cbff2f.jpg\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><br/></p><p style=\"box-sizing: border-box; margin: 0px 16px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; border: none; color: rgb(51, 51, 51); font-family: \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(68, 68, 68); font-family: Optima-Regular, PingFangTC-light; letter-spacing: 2px; line-height: 27.2px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">繁华的都市，喧嚣的生活，透支着我们的生命，每个人都在追求美好的生活。然而，繁华过后的宁静与平凡，是我们需要有一个质朴的心，找回自己，寻找自己的生活方式……</span></p><p><br/></p>', 0, 11, 1621414936, 0, NULL);
INSERT INTO `wy_article` VALUES (4, '市政道路配套', '11111', '11111111111111111111111', 1, 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220527152451ABUIABACGAAg2Zzk_AUo9_nQjwUwoAs4lwQ.jpg', '<p><br/></p><p><br/></p><p><img src=\"http://rcfgsdrlf.hn-bkt.clouddn.com/2205270324271653636267756395.png\" title=\"1653636267756395.png\" alt=\"image.png\"/></p><p><br/></p><p><br/></p><p style=\"text-align: center;\"><strong style=\"background-clip: text; background-image: inherit;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(9, 107, 120); font-size: 24px;\">精装修设计</span></strong></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">地产住宅精装修设计及研发</span><br/></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">公司2008年开始涉足房地产交房标准室内精装修设计，是全国第一批进入该领域的专业设计公司，</span><br/></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">与万科，华润，保利，远洋，万达，龙湖，富力，首创，华夏等精装龙头地产公司都有过接触和合作，</span></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">十年间积累了大量的经验和精装修版型。</span></p>', 0, 6, 1653636429, 1653636429, NULL);
INSERT INTO `wy_article` VALUES (5, '市政道路配套', '11111', '11111111111111111111111', 1, 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220527152451ABUIABACGAAg2Zzk_AUo9_nQjwUwoAs4lwQ.jpg', '<p><br/></p><p><br/></p><p><img src=\"http://rcfgsdrlf.hn-bkt.clouddn.com/2205270324271653636267756395.png\" title=\"1653636267756395.png\" alt=\"image.png\"/></p><p><br/></p><p><br/></p><p style=\"text-align: center;\"><strong style=\"background-clip: text; background-image: inherit;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(9, 107, 120); font-size: 24px;\">精装修设计</span></strong></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">地产住宅精装修设计及研发</span><br/></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">公司2008年开始涉足房地产交房标准室内精装修设计，是全国第一批进入该领域的专业设计公司，</span><br/></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">与万科，华润，保利，远洋，万达，龙湖，富力，首创，华夏等精装龙头地产公司都有过接触和合作，</span></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">十年间积累了大量的经验和精装修版型。</span></p>', 0, 7, 1653636429, 1653636429, NULL);
INSERT INTO `wy_article` VALUES (6, '市政道路配套', '11111', '11111111111111111111111', 1, 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220527152451ABUIABACGAAg2Zzk_AUo9_nQjwUwoAs4lwQ.jpg', '<p><br/></p><p><br/></p><p><img src=\"http://rcfgsdrlf.hn-bkt.clouddn.com/2205270324271653636267756395.png\" title=\"1653636267756395.png\" alt=\"image.png\"/></p><p><br/></p><p><br/></p><p style=\"text-align: center;\"><strong style=\"background-clip: text; background-image: inherit;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(9, 107, 120); font-size: 24px;\">精装修设计</span></strong></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">地产住宅精装修设计及研发</span><br/></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">公司2008年开始涉足房地产交房标准室内精装修设计，是全国第一批进入该领域的专业设计公司，</span><br/></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">与万科，华润，保利，远洋，万达，龙湖，富力，首创，华夏等精装龙头地产公司都有过接触和合作，</span></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">十年间积累了大量的经验和精装修版型。</span></p>', 22, 8, 1653636429, 1653636429, NULL);
INSERT INTO `wy_article` VALUES (7, '市政道路配套', '11111', '11111111111111111111111', 1, 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220527152451ABUIABACGAAg2Zzk_AUo9_nQjwUwoAs4lwQ.jpg', '<p><br/></p><p><br/></p><p><img src=\"http://rcfgsdrlf.hn-bkt.clouddn.com/2205270324271653636267756395.png\" title=\"1653636267756395.png\" alt=\"image.png\"/></p><p><br/></p><p><br/></p><p style=\"text-align: center;\"><strong style=\"background-clip: text; background-image: inherit;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(9, 107, 120); font-size: 24px;\">精装修设计</span></strong></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">地产住宅精装修设计及研发</span><br/></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">公司2008年开始涉足房地产交房标准室内精装修设计，是全国第一批进入该领域的专业设计公司，</span><br/></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">与万科，华润，保利，远洋，万达，龙湖，富力，首创，华夏等精装龙头地产公司都有过接触和合作，</span></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">十年间积累了大量的经验和精装修版型。</span></p>', 0, 13, 1653636429, 1653636429, NULL);
INSERT INTO `wy_article` VALUES (8, '市政道路配套', '11111', '11111111111111111111111', 1, 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220527152451ABUIABACGAAg2Zzk_AUo9_nQjwUwoAs4lwQ.jpg', '<p><br/></p><p><br/></p><p><img src=\"http://rcfgsdrlf.hn-bkt.clouddn.com/2205270324271653636267756395.png\" title=\"1653636267756395.png\" alt=\"image.png\"/></p><p><br/></p><p><br/></p><p style=\"text-align: center;\"><strong style=\"background-clip: text; background-image: inherit;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(9, 107, 120); font-size: 24px;\">精装修设计</span></strong></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">地产住宅精装修设计及研发</span><br/></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"background-clip: text; background-image: inherit; color: rgb(75, 75, 75);\">公司2008年开始涉足房地产交房标准室内精装修设计，是全国第一批进入该领域的专业设计公司，</span><br/></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">与万科，华润，保利，远洋，万达，龙湖，富力，首创，华夏等精装龙头地产公司都有过接触和合作，</span></p><p style=\"text-align: center;\"><span style=\"color:#4b4b4b\">十年间积累了大量的经验和精装修版型。</span></p>', 0, 14, 1653636429, 1653636429, NULL);

-- ----------------------------
-- Table structure for wy_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `wy_article_cate`;
CREATE TABLE `wy_article_cate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `keywords` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`, `pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_article_cate
-- ----------------------------
INSERT INTO `wy_article_cate` VALUES (2, 0, '案例', '', '所有案例', 0, 0);
INSERT INTO `wy_article_cate` VALUES (3, 2, '园林', 'yuanlin', '', 0, 0);
INSERT INTO `wy_article_cate` VALUES (4, 2, '房地产', 'fangdichan', '', 0, 0);
INSERT INTO `wy_article_cate` VALUES (5, 0, '服务范畴', 'service', '', 0, 0);
INSERT INTO `wy_article_cate` VALUES (6, 5, '市政道路配套', 'fangdichan', 'Lorem ipsum dolor sitamet, consec tetur adipisicing elit. Dolores quae porro consequatur aliquam, incidunt eius magni provident', 0, 0);
INSERT INTO `wy_article_cate` VALUES (7, 5, '商业地产配套', 'gov', 'Lorem ipsum dolor sitamet, consec tetur adipisicing elit. Dolores quae porro consequatur aliquam, incidunt eius magni provident', 0, 0);
INSERT INTO `wy_article_cate` VALUES (8, 5, '水利护坡砖', 'personal', 'Lorem ipsum dolor sitamet, consec tetur adipisicing elit. Dolores quae porro consequatur aliquam, incidunt eius magni provident', 0, 0);
INSERT INTO `wy_article_cate` VALUES (9, 0, '关于我们', '', '', 0, 0);
INSERT INTO `wy_article_cate` VALUES (10, 9, '关于我们', '', '', 0, 0);
INSERT INTO `wy_article_cate` VALUES (11, 0, '新闻', '新闻', '', 0, 0);
INSERT INTO `wy_article_cate` VALUES (12, 11, '新闻', '', '', 0, 0);
INSERT INTO `wy_article_cate` VALUES (13, 5, '路面透水砖', '', 'Lorem ipsum dolor sitamet, consec tetur adipisicing elit. Dolores quae porro consequatur aliquam, incidunt eius magni provident', 0, 0);
INSERT INTO `wy_article_cate` VALUES (14, 5, '水泥预制构件', '', 'Lorem ipsum dolor sitamet, consec tetur adipisicing elit. Dolores quae porro consequatur aliquam, incidunt eius magni provident', 0, 0);

-- ----------------------------
-- Table structure for wy_company
-- ----------------------------
DROP TABLE IF EXISTS `wy_company`;
CREATE TABLE `wy_company`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '站点编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司地址',
  `postcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮政编码',
  `contact` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司联系人',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司传真',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司QQ',
  `weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信图标',
  `blicense` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业执照代码',
  `other` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_company
-- ----------------------------
INSERT INTO `wy_company` VALUES (1, '长沙巧圆建材贸易有限公司', '湖南长沙岳麓区雷锋大道888号', '410000', '王先生', '13988886666', '0731-88886666', '0731-88886666', 'admin@test.com', '88886666', 'http://rcfgsdrlf.hn-bkt.clouddn.com/20220525173913dg.jpg', '91430102567888888G', '');

-- ----------------------------
-- Table structure for wy_hook
-- ----------------------------
DROP TABLE IF EXISTS `wy_hook`;
CREATE TABLE `wy_hook`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '钩子类型1:系统钩子,2:应用钩子,3:模板钩子',
  `only` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否只允许一个插件运行0:多个,1:一个',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子',
  `module` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块名，模块专属钩子',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钩子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_hook
-- ----------------------------
INSERT INTO `wy_hook` VALUES (1, 1, 0, '应用初始化', 'app_init', 'vae', '应用初始化');
INSERT INTO `wy_hook` VALUES (2, 1, 0, '应用开始', 'app_begin', 'vae', '应用开始');
INSERT INTO `wy_hook` VALUES (3, 1, 0, '模块初始化', 'module_init', 'vae', '模块初始化');
INSERT INTO `wy_hook` VALUES (4, 1, 0, '控制器开始', 'action_begin', 'vae', '控制器开始');
INSERT INTO `wy_hook` VALUES (5, 1, 0, '视图输出过滤', 'view_filter', 'vae', '视图输出过滤');
INSERT INTO `wy_hook` VALUES (6, 1, 0, '应用结束', 'app_end', 'vae', '应用结束');
INSERT INTO `wy_hook` VALUES (7, 1, 0, '日志write方法', 'log_write', 'vae', '日志write方法');
INSERT INTO `wy_hook` VALUES (8, 1, 0, '输出结束', 'response_end', 'vae', '输出结束');
INSERT INTO `wy_hook` VALUES (9, 1, 0, '后台控制器初始化', 'admin_init', 'vae', '后台控制器初始化');
INSERT INTO `wy_hook` VALUES (10, 1, 0, 'API控制器初始化', 'api_init', 'vae', 'API控制器初始化');
INSERT INTO `wy_hook` VALUES (11, 2, 1, '后台首页', 'admin_main', 'admin', '后台首页');
INSERT INTO `wy_hook` VALUES (12, 2, 1, '后台登录页面', 'admin_login', 'admin', '后台登录页面初始化');
INSERT INTO `wy_hook` VALUES (13, 1, 0, '文件上传前', 'upload_begin', 'vae', '文件上传完成前');
INSERT INTO `wy_hook` VALUES (14, 1, 0, '文件上传后', 'upload_end', 'vae', '文件上传完成后');
INSERT INTO `wy_hook` VALUES (15, 2, 0, 'port模块数据输出前', 'port_return', 'port', 'port模块数据输出前');
INSERT INTO `wy_hook` VALUES (16, 2, 0, 'port模块接收参数前', 'port_param', 'vae', 'port模块接收参数前');
INSERT INTO `wy_hook` VALUES (17, 2, 0, 'port模块开始前', 'port_begin', 'port', 'port模块开始前');

-- ----------------------------
-- Table structure for wy_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `wy_hook_plugin`;
CREATE TABLE `wy_hook_plugin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态-1禁用,1启用',
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钩子关联插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_hook_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for wy_nav
-- ----------------------------
DROP TABLE IF EXISTS `wy_nav`;
CREATE TABLE `wy_nav`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导航' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_nav
-- ----------------------------
INSERT INTO `wy_nav` VALUES (2, 'Front', 'Front', 1, '前端导航', 0, 0);

-- ----------------------------
-- Table structure for wy_nav_info
-- ----------------------------
DROP TABLE IF EXISTS `wy_nav_info`;
CREATE TABLE `wy_nav_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `nav_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `src` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `order` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导航详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_nav_info
-- ----------------------------
INSERT INTO `wy_nav_info` VALUES (2, 0, 2, '首页', 'index.html', '', 1, 100, 0, 0);
INSERT INTO `wy_nav_info` VALUES (3, 0, 2, '关于我们', 'about.html', '', 1, 99, 0, 0);
INSERT INTO `wy_nav_info` VALUES (4, 0, 2, '服务范畴', 'services.html', '', 1, 98, 0, 0);
INSERT INTO `wy_nav_info` VALUES (5, 0, 2, '项目案例', 'projects.html', '', 1, 97, 0, 0);
INSERT INTO `wy_nav_info` VALUES (6, 0, 2, '动态', 'news.html', '', 1, 96, 0, 0);
INSERT INTO `wy_nav_info` VALUES (7, 0, 2, '联系我们', 'contact.html', '', 1, 95, 0, 0);

-- ----------------------------
-- Table structure for wy_plugin
-- ----------------------------
DROP TABLE IF EXISTS `wy_plugin`;
CREATE TABLE `wy_plugin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件标识',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `hook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '插件描述',
  `interface` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有后台管理,0:没有;1:有',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '插件配置',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '插件安装时间',
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for wy_route
-- ----------------------------
DROP TABLE IF EXISTS `wy_route`;
CREATE TABLE `wy_route`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1启用-1禁用',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '路由设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_route
-- ----------------------------

-- ----------------------------
-- Table structure for wy_slide
-- ----------------------------
DROP TABLE IF EXISTS `wy_slide`;
CREATE TABLE `wy_slide`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幻灯片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_slide
-- ----------------------------
INSERT INTO `wy_slide` VALUES (1, '首页轮播', 'VAE_INDEX_SLIDE', 1, '首页轮播组。', 0, 0);

-- ----------------------------
-- Table structure for wy_slide_info
-- ----------------------------
DROP TABLE IF EXISTS `wy_slide_info`;
CREATE TABLE `wy_slide_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `src` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `order` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幻灯片详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wy_slide_info
-- ----------------------------
INSERT INTO `wy_slide_info` VALUES (1, 1, '城市之心', '吾失我常舆，我无所处', '\\upload\\admin\\thumb\\1b\\7aa1904299f7f8a80df1344577af613953c421.jpg', '11111', 1, 0, 0, 0);
INSERT INTO `wy_slide_info` VALUES (2, 1, '时光之心', '让景观成为时光的朋友', '\\upload\\admin\\thumb\\10\\b88dea943434cc5f091e57156eda1be5227096.jpg', '', 1, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
