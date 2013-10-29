package com.telenoetica.service.test;

import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.time.DateUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.telenoetica.jpa.entities.Site;
import com.telenoetica.service.DieselVisitService;
import com.telenoetica.service.SiteService;
import com.telenoetica.service.util.ServiceUtil;

public class DieselVisitServiceTest extends BaseServiceTest {

	@Autowired
	private DieselVisitService dieselVisitService;
	@Autowired
	private SiteService siteService;

	// @Test
	public void testVisit() {
		dieselVisitService.getVisits();
	}

	// @Test
	public void testFindBySite() {
		Site site = siteService.retrieve(5L);
		Date date = ServiceUtil.getDateInFormat("31/01/2013", "dd/MM/yyyy");
		dieselVisitService.findBySiteAndCreatedAtBetween(site, date);
	}

	@Test
	public void testVisitMdedian() {
		Date endDate = new Date();
		Date startDate = DateUtils.addDays(endDate, -30);
		dieselVisitService.calculateDieselMedian("dieselReceivedLtrs", startDate,
				endDate);
	}

}
