package pnunu.ssm.mapper;

import java.util.List;

import pnunu.ssm.po.Blog;

/** 
* @ClassName: BlogMapper 
* @Description: 每节课的基本信息的增删改
* @author Nunu
* @date 2016年12月3日 下午11:59:05  
*/
public interface BlogMapper {
	public void addBlog(Blog blog);
	public void delBlog(Integer blogId);
	public void updateBlog(Blog blog);
	public List<Blog> findBlog(Integer currentPage);
	public Integer findCount();
	public Blog blogById(Integer id);
}
