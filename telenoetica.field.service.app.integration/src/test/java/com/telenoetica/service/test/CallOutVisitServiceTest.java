package com.telenoetica.service.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.telenoetica.jpa.entities.CallOutVisit;
import com.telenoetica.jpa.entities.Site;
import com.telenoetica.jpa.entities.User;
import com.telenoetica.jpa.repositories.SiteDAO;
import com.telenoetica.jpa.repositories.UserDAO;
import com.telenoetica.service.CallOutVisitService;
import com.telenoetica.service.util.Median;
import com.telenoetica.service.util.ServiceUtil;

public class CallOutVisitServiceTest extends BaseServiceTest{

  @Autowired
  private CallOutVisitService callOutVisitService;

  @Autowired
  private SiteDAO siteDao;

  @Autowired
  private UserDAO userDAO;

  @Test
  public void testFindBySite(){
	Median median = null;
    Date startdate = ServiceUtil.getDateInFormat("31/01/2013", "dd/MM/yyyy");
    Date enddate = ServiceUtil.getDateInFormat("31/12/2013", "dd/MM/yyyy");

    median =callOutVisitService.getCustomerImpactedList(startdate, enddate);
    System.out.println("Finish");
  }
}
