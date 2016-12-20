package pnunu.ssm.controller;

import javax.annotation.Resource;

import pnunu.ssm.service.BlogService;
import pnunu.ssm.service.ClassYearService;
import pnunu.ssm.service.ClasscodeService;
import pnunu.ssm.service.ResourceService;
import pnunu.ssm.service.RoleService;
import pnunu.ssm.service.UserService;

public class BaseController {
	@Resource(name="resourceService")
	protected ResourceService resourceService;
	@Resource(name="userService")
	protected UserService userService;
	@Resource(name="roleService")
	protected RoleService roleService;
	@Resource(name="classcodeService")
	protected ClasscodeService classcodeService;
	@Resource(name="classYearService")
	protected ClassYearService classYearService;
	@Resource(name="blogService")
	protected BlogService blogService;
}
