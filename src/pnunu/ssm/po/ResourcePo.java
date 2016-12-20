package pnunu.ssm.po;

/** 
* @ClassName: Resource 
* @Description: 资源(即需要权限访问控制的)
* @author Nunu
* @date 2016年12月3日 下午11:03:23  
*/
public class ResourcePo {
	private Integer resourceId;
	/** 
	* @Fields parentId : 父资源ID
	*/ 
	private Integer parentId;
	private String resourceName;
	private String resourceDesc;
	private String resourceUrl;
	private String resourceIcon;
	/** 
	 * 资源类型
	 * @Fields resource_type : 1：菜单 0：按钮
	 */ 
	private String resource_type;
	public Integer getResourceId() {
		return resourceId;
	}
	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getResourceDesc() {
		return resourceDesc;
	}
	public void setResourceDesc(String resourceDesc) {
		this.resourceDesc = resourceDesc;
	}
	public String getResourceUrl() {
		return resourceUrl;
	}
	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}
	public String getResourceIcon() {
		return resourceIcon;
	}
	public void setResourceIcon(String resourceIcon) {
		this.resourceIcon = resourceIcon;
	}
	public String getResource_type() {
		return resource_type;
	}
	public void setResource_type(String resource_type) {
		this.resource_type = resource_type;
	}
	@Override
	public String toString() {
		return "Resource [resourceId=" + resourceId + ", parentId=" + parentId + ", resourceName=" + resourceName
				+ ", resourceDesc=" + resourceDesc + ", resourceUrl=" + resourceUrl + ", resourceIcon=" + resourceIcon
				+ ", resource_type=" + resource_type + "]";
	}
	public ResourcePo(Integer resourceId, Integer parentId, String resourceName, String resourceDesc, String resourceUrl,
			String resource_type) {
		super();
		this.resourceId = resourceId;
		this.parentId = parentId;
		this.resourceName = resourceName;
		this.resourceDesc = resourceDesc;
		this.resourceUrl = resourceUrl;
		//this.resourceIcon = resourceIcon;
		this.resource_type = resource_type;
	}
	public ResourcePo() {
		super();
	}
}
