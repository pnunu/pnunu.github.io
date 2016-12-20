package pnunu.ssm.init;

import pnunu.ssm.po.ResourcePo;
import pnunu.ssm.service.ResourceService;

/** 
* @ClassName: InitDate 
* @Description: 系统数据初始化
* @author Nunu
* @date 2016年12月3日 下午11:49:58  
*/
public class InitDate {
	//private static ApplicationContext ac = new ClassPathXmlApplicationContext("spring-core.xml");

	public void add(ResourceService resourceService) {
		
		//ResourceService resourceService = (ResourceServiceImpl) ac.getBean("resourceService");
		ResourcePo p1 = new ResourcePo(1, null, "系统管理", "系统管理", "sys-ul", "1");
		ResourcePo p2 = new ResourcePo(2, null, "公告管理", "公告管理", "gg-ul", "1");
		ResourcePo p3 = new ResourcePo(3, null, "教学管理", "教学管理", "jx-ul", "1");
		ResourcePo p4 = new ResourcePo(4, null, "学习管理", "学习管理", "xx-ul", "1");
		resourceService.add(p1);
		resourceService.add(p2);
		resourceService.add(p3);
		resourceService.add(p4);
		
		ResourcePo pn1 = new ResourcePo(11, 1, "用户管理", "用户管理", "sys-user-li", "1");
		ResourcePo pn2 = new ResourcePo(12, 1, "角色管理", "角色管理", "sys-role-li", "1");
		ResourcePo pn3 = new ResourcePo(13, 1, "资源管理", "资源管理", "sys-rose-uli", "1");
		ResourcePo pn4 = new ResourcePo(14, 1, "学生管理", "学生管理", "sys-stu-li", "1");
		ResourcePo pn5 = new ResourcePo(15, 1, "日志管理", "日志管理", "sys-log-li", "1");
		ResourcePo pn6 = new ResourcePo(16, 1, "数据库管理", "日志管理", "sys-data-li", "1");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		resourceService.add(pn5);
		resourceService.add(pn6);
		//用户管理
		pn1 = new ResourcePo(111, 11, "用户列表", "用户列表", "sys-user-list-a", "0");  
		pn2 = new ResourcePo(112, 11, "用户添加", "用户添加", "sys-user-add-a", "0");
		pn3 = new ResourcePo(113, 11, "用户删除", "用户删除", "sys-user-del-a", "0");
		pn4 = new ResourcePo(114, 11, "用户修改", "用户修改", "sys-user-update-a", "0");
		pn5 = new ResourcePo(115, 11, "批量删除", "批量删除", "sys-user-delall-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		resourceService.add(pn5);
		
		//角色
		pn1 = new ResourcePo(121, 12, "角色列表", "角色列表", "sys-role-list-a", "0");  
		pn2 = new ResourcePo(122, 12, "角色添加", "角色添加", "sys-role-add-a", "0");
		pn3 = new ResourcePo(123, 12, "角色修改", "角色修改", "sys-role-update-a", "0");
		pn4 = new ResourcePo(124, 12, "角色删除", "角色删除", "sys-role-del-a", "0");
		pn5 = new ResourcePo(125, 12, "角色授权", "角色授权", "sys-role-grant-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		resourceService.add(pn5);
		
		//资源
		pn1 = new ResourcePo(131, 13, "资源列表", "资源列表", "sys-reso-list-a", "0");  
		pn2 = new ResourcePo(132, 13, "资源添加", "用户添加", "sys-reso-add-a", "0");
		pn3 = new ResourcePo(133, 13, "资源修改", "资源修改", "sys-reso-update-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		
		//学生管理
		pn1 = new ResourcePo(141, 14, "学生列表", "学生列表", "sys-stu-list-a", "0");  
		pn2 = new ResourcePo(142, 14, "学生添加", "学生添加", "sys-stu-add-a", "0");
		pn3 = new ResourcePo(143, 14, "学生删除", "学生删除", "sys-stu-del-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		
		//日志管理 日志列表
		pn1 = new ResourcePo(151, 15, "日志列表", "日志列表", "sys-log-list-a", "0");  
		pn2 = new ResourcePo(152, 15, "日志导出", "日志导出", "sys-log-export-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		
		//数据库备份
		pn1 = new ResourcePo(161, 16, "数据库备份记录", "备份", "sys-data-list-a", "0");  
		pn2 = new ResourcePo(162, 16, "数据库导出", "数据库导出", "sys-data-export-a", "0");
		pn3 = new ResourcePo(163, 16, "数据库导入", "数据库导入", "sys-data-import-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		
		//公告管理
		pn1 = new ResourcePo(21, 2, "首页公告管理", "首页公告管理", "gg-index-li", "1");  
		pn2 = new ResourcePo(22, 2, "后台公告管理", "后台公告管理", "gg-admin-li", "1");
		pn3 = new ResourcePo(23, 2, "学生公告管理", "学生公告管理", "gg-stu-li", "1");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		
		pn1 = new ResourcePo(211, 21, "首页公告修改", "首页公告修改", "gg-index-update-a", "0");  
		resourceService.add(pn1);
		
		pn1 = new ResourcePo(221, 22, "后台公告修改", "后台公告修改", "gg-admin-update-a", "0");  
		resourceService.add(pn1);
		
		pn1 = new ResourcePo(231, 23, "学生公告修改", "学生公告修改", "gg-stu-update-a", "0");  
		resourceService.add(pn1);
		
		//教学管理
		pn1 = new ResourcePo(31, 3, "课程分类管理", "课程分类管理", "jx-classcode-li", "1");  
		pn2 = new ResourcePo(32, 3, "课程管理", "课程管理", "jx-classyear-li", "1");
		pn3 = new ResourcePo(33, 3, "单节课管理", "单节课管理", "jx-blog-li", "1");
		pn4 = new ResourcePo(34, 3, "作业管理", "作业管理", "jx-task-li", "1");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		
		pn1 = new ResourcePo(311, 31, "分类列表", "分类列表", "jx-classcode-list-a", "0");  
		pn2 = new ResourcePo(312, 31, "分类添加", "分类添加", "jx-classcode-add-a", "0");
		pn3 = new ResourcePo(313, 31, "分类删除", "分类删除", "jx-classcode-del-a", "0");
		pn4 = new ResourcePo(314, 31, "分类修改", "分类修改", "jx-classcode-update-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		
		pn1 = new ResourcePo(321, 32, "课程列表", "课程列表", "jx-classyear-list-a", "0");  
		pn2 = new ResourcePo(322, 32, "课程添加", "课程添加", "jx-classyear-add-a", "0");
		pn3 = new ResourcePo(323, 32, "课程删除", "课程删除", "jx-classyear-del-a", "0");
		pn4 = new ResourcePo(324, 32, "课程修改", "课程修改", "jx-classyear-update-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		
		pn1 = new ResourcePo(331, 33, "单节课列表", "单节课列表", "jx-blog-list-a", "0");  
		pn2 = new ResourcePo(332, 33, "单节课添加", "单节课添加", "jx-blog-add-a", "0");
		pn3 = new ResourcePo(333, 33, "单节课删除", "单节课删除", "jx-blog-del-a", "0");
		pn4 = new ResourcePo(334, 33, "单节课修改", "单节课修改", "jx-blog-update-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		
		pn1 = new ResourcePo(341, 34, "作业列表", "作业列表", "jx-task-list-a", "0");  
		pn2 = new ResourcePo(342, 34, "作业添加", "作业添加", "jx-task-add-a", "0");
		pn3 = new ResourcePo(343, 34, "作业删除", "作业删除", "jx-task-del-a", "0");
		pn4 = new ResourcePo(344, 34, "作业修改", "作业修改", "jx-task-update-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		
		//学习管理
		pn1 = new ResourcePo(41, 4, "分类管理", "分类管理", "xx-stu-classcode-li", "1");  
		pn2 = new ResourcePo(42, 4, "课程管理", "课程管理", "xx-stu-user-classyear-li", "1");
		pn3 = new ResourcePo(43, 4, "课程内容管理", "课程内容管理", "xx-stu-blog-li", "1");
		pn4 = new ResourcePo(44, 4, "作业管理", "作业管理", "xx-stu-task-li", "1");
		resourceService.add(pn1);
		resourceService.add(pn2);
		resourceService.add(pn3);
		resourceService.add(pn4);
		
		pn1 = new ResourcePo(411, 41, "分类列表", "分类列表", "xx-stu-classcode-list-a", "0");
		resourceService.add(pn1);
		
		pn1 = new ResourcePo(421, 42, "课程列表", "课程", "xx-stu-classyear-list-a", "0");
		resourceService.add(pn1);
		
		pn1 = new ResourcePo(431, 43, "课程内容列表", "课程内容", "xx-stu-blog-list-a", "0");
		resourceService.add(pn1);
		
		pn1 = new ResourcePo(441, 44, "作业列表", "作业列表", "xx-stu-task-list-a", "0");  
		pn2 = new ResourcePo(442, 44, "作业提交", "作业提交", "xx-stu-task-submit-a", "0");
		resourceService.add(pn1);
		resourceService.add(pn2);
		
		System.out.println("资源初始化成功");
	}
	
}
