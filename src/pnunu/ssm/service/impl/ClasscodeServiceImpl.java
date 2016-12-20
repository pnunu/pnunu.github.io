package pnunu.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pnunu.ssm.mapper.ClassCodeMapper;
import pnunu.ssm.po.ClassCode;
import pnunu.ssm.service.ClasscodeService;

@Service("classcodeService")
@Transactional
public class ClasscodeServiceImpl implements ClasscodeService {

	@Resource(name="classCodeMapper")
	private ClassCodeMapper classCodeMapper;

	@Override
	public void add(ClassCode classCode) {
		classCodeMapper.addClassCode(classCode);
	}

	@Override
	public void update(ClassCode classCode) {
		classCodeMapper.updateClassCode(classCode);
	}

	@Override
	public List<ClassCode> find(Integer currentPage) {
		return classCodeMapper.findClassCode(currentPage);
	}

	@Override
	public Integer count() {
		return classCodeMapper.count();
	}
}
