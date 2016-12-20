package pnunu.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pnunu.ssm.mapper.ClassCodeMapper;
import pnunu.ssm.mapper.ClassYearMapper;
import pnunu.ssm.mapper.UserMapper;
import pnunu.ssm.po.ClassCode;
import pnunu.ssm.po.ClassYear;
import pnunu.ssm.service.ClassYearService;

@Service("classYearService")
@Transactional
public class ClassYearServiceImpl implements ClassYearService {

	@Resource(name="classYearMapper")
	private ClassYearMapper classYearMapper;
	@Resource(name="classCodeMapper")
	private ClassCodeMapper classCodeMapper;
	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	@Override
	public List<ClassYear> find(Integer currentPage) {
		// TODO Auto-generated method stub
		List<ClassYear> classYears = classYearMapper.findClassYear(currentPage*10);
		for (ClassYear classYear : classYears) {
			Integer id = classYear.getId();
			ClassCode classCode = classCodeMapper.findById(id);
			classYear.setCodeName(classCode.getName());
			//User teacher = userMapper.findById(classYear.getClassId());
		}
		return classYears;
	}

	@Override
	public Integer count() {
		return classYearMapper.count();
	}

	@Override
	public void add(ClassYear classYear) {
		classYearMapper.addClassYear(classYear);
		Integer classId = classYear.getClassId();
		//Map<String, Integer> map = new HashMap<>();
		//System.out.println(classYear.getTeacher());
		//map.put("classId", classId);
		//map.put("userId", classYear.getTeacher().getUserId());
		Integer userId = classYear.getTeacher().getUserId();
		//System.out.println(classId+"=="+userId);
		classYearMapper.addYearTeacher(classId,userId);
	}

	@Override
	public void update(ClassYear classYear) {
		classYearMapper.updateClassYear(classYear);
	}

	@Override
	public List<ClassYear> findByTea(Integer userId) {
		return classYearMapper.findByTea(userId);
	}

	@Override
	public List<ClassYear> findByCode(Integer id) {
		return classYearMapper.findByCode(id);
	}
}
