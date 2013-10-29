package com.telenoetica.service.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.telenoetica.service.MaintenanceVisitService;
import com.telenoetica.service.SiteService;
import com.telenoetica.service.util.Median;
import com.telenoetica.service.util.ServiceUtil;

public class MaintenanceVisitServiceTest extends BaseServiceTest {

  @Autowired
  private MaintenanceVisitService maintenanceVisitService;


  @Autowired
  private SiteService siteService;


  @Test
  public void testVisit() {
    maintenanceVisitService.getVisits();
  }

  /*@Test
  public void testFindBySite(){
    Site site = siteService.retrieve(5L);
    Date date = ServiceUtil.getDateInFormat("31/01/2013", "dd/MM/yyyy");
    maintenanceVisitService.findBySiteAndCreatedAtBetween(site, date);
  }*/
  
  @Test
  public void testFindBySite(){
	Median median = null;
    Date startdate = ServiceUtil.getDateInFormat("31/01/2013", "dd/MM/yyyy");
    Date enddate = ServiceUtil.getDateInFormat("31/12/2013", "dd/MM/yyyy");

    median =maintenanceVisitService.getSpareUsageList(startdate, enddate);
    System.out.println("Finish");
  }
}
