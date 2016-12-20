package pnunu.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pnunu.ssm.mapper.BlogMapper;
import pnunu.ssm.po.Blog;
import pnunu.ssm.service.BlogService;

@Service("blogService")
@Transactional
public class BlogServiceImpl implements BlogService {
	@Resource(name="blogMapper")
	private BlogMapper blogMapper;

	@Override
	public void addBlog(Blog blog) {
		blogMapper.addBlog(blog);
	}

	@Override
	public List<Blog> find(Integer currentPage) {
		return blogMapper.findBlog(currentPage*10);
	}

	@Override
	public Integer findCount() {
		return blogMapper.findCount();
	}

	@Override
	public Blog blogById(Integer id) {
		return blogMapper.blogById(id);
	}

}
