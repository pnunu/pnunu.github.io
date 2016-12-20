package pnunu.ssm.mapper;

import java.util.List;

import pnunu.ssm.po.ResourcePo;

/** 
* @ClassName: ResourceMapper 
* @Description: 资源列表
* @author Nunu
* @date 2016年12月4日 上午12:03:50  
*/
public interface ResourceMapper {
	public void addResource(ResourcePo resource);
	public void delResource(Integer resourceId);
	public void updateResource(ResourcePo resource);
	public List<ResourcePo> findResource(Integer roleId);
}
