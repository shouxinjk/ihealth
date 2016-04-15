package com.shouxin.service.medical.medicalexamitem.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shouxin.controller.base.BaseController;
import com.shouxin.service.medical.medicalexamitem.MedicalExamItemManager;
import com.shouxin.util.PageData;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath*:ApplicationContext.xml")
public class MedicalExamItemServiceTest extends BaseController {
	
	@Resource
	private MedicalExamItemManager medicalexamitemService;

	@Test
	public void testListExamItemAndCenter() throws Exception {
		System.out.println(11);
	}

}
