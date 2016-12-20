package pnunu.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pnunu.ssm.mapper.ResourceMapper;
import pnunu.ssm.po.ResourcePo;
import pnunu.ssm.service.ResourceService;

@Service("resourceService")
@Transactional
public class ResourceServiceImpl implements ResourceService {

	@Resource(name="resourceMapper")
	private ResourceMapper resourceMapper;

	/** (非 Javadoc) 
	 * <p>Title: findResourceList</p> 
	 * <p>Description: </p> 
	 * @return 查询资源列表
	 * @see pnunu.ssm.service.ResourceService#findResourceList() 
	 */
	@Override
	public List<ResourcePo> findResourceList(Integer roleId) {
		return resourceMapper.findResource(roleId);
	}

	@Override
	public void add(ResourcePo resourcePo) {
		// TODO Auto-generated method stub
		resourceMapper.addResource(resourcePo);
	}

}
