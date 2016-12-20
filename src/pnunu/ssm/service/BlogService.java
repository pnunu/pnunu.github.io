package pnunu.ssm.service;

import java.util.List;

import pnunu.ssm.po.Blog;

public interface BlogService {

	void addBlog(Blog blog);

	List<Blog> find(Integer currentPage);

	Integer findCount();

	Blog blogById(Integer id);

}
