package pnunu.ssm.service;

import java.util.List;

import pnunu.ssm.po.ResourcePo;

public interface ResourceService {
	/** 
	 * @Title: findResourceList 
	 * @Description: 资源列表
	 * @param @return    
	 * @return List<ResourcePo>
	 * @throws 
	 */
	public List<ResourcePo> findResourceList(Integer roleId);
	public void add(ResourcePo resourcePo);
}
