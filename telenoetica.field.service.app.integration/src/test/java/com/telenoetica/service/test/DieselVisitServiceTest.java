package com.telenoetica.service.test;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.telenoetica.jpa.entities.Site;
import com.telenoetica.service.DieselVisitService;
import com.telenoetica.service.SiteService;
import com.telenoetica.service.util.Median;
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

  // @Test
  public void testVisitMdedian() {
    Date endDate = dieselVisitService.getMaxDateCreated();
    if (endDate == null) {
      endDate = new Date();
    }
    Date startDate = DateUtils.addDays(endDate, -30);
    dieselVisitService.calculateDieselMedian("dieselReceivedLtrs", startDate,
      endDate);
  }

  // @Test
  public void testTopTenDieselConsumers() {
    Date endDate = dieselVisitService.getMaxDateCreated();
    System.err.println("..max date..." + endDate);
    if (endDate == null) {
      endDate = new Date();
    } else {
      endDate = DateUtils.addHours(endDate, 1);
    }
    Date startDate = DateUtils.addDays(endDate, -30);
    Median median = dieselVisitService.calculateTopDieselConsumers("dieselReceivedLtrs", startDate, endDate);
    System.err.println("..Median.." + median);
  }

  @Test
  public void testComputeDieselReceivedBetween() {
    Date endDate = dieselVisitService.getMaxDateCreated();
    if (endDate == null) {
      endDate = new Date();
    }
    Date startDate = DateUtils.addDays(endDate, -7);
    dieselVisitService.computeDieselReceivedBetween(startDate, endDate);
  }

}
