package com.telenoetica.service.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.telenoetica.jpa.entities.DieselVendor;
import com.telenoetica.jpa.entities.DieselVisit;
import com.telenoetica.jpa.entities.Site;
import com.telenoetica.jpa.entities.User;
import com.telenoetica.jpa.repositories.GenericQueryExecutorDAO;
import com.telenoetica.service.DieselVendorService;
import com.telenoetica.service.DieselVisitService;
import com.telenoetica.service.SiteService;
import com.telenoetica.service.UserService;
import com.telenoetica.service.util.ServiceUtil;

public class DataPopulator extends BaseServiceTest {

  @Autowired
  private SiteService siteService;

  @Autowired
  private DieselVendorService dieselVendorService;

  @Autowired
  private UserService userService;

  @Autowired
  private DieselVisitService dieselVisitService;

  @Autowired
  private GenericQueryExecutorDAO genericQueryExecutorDAO;

  @Test
  public void test() {
    List<Site> siteList = siteService.getSites();
    List<DieselVendor> dieselVendorList = dieselVendorService.getDieselVendor();
    int siteListSize = siteList.size();
    int dieselVendorListSize = dieselVendorList.size();
    User user = userService.findByUserName("root");

    String ejbql = "select count(*) from DieselVisit";
    long count1 = genericQueryExecutorDAO.findCount(ejbql, null);
    for (int i = 0; i < 5000; i++) {
      int index = ServiceUtil.randomInt(0, siteListSize);
      Site site = siteList.get(index);
      index = ServiceUtil.randomInt(0, dieselVendorListSize);
      DieselVendor dieselVendor = dieselVendorList.get(index);
      DieselVisit dieselVisit =
          new DieselVisit(user, site, String.valueOf(ServiceUtil.randomInt(0, 999999)), "DRN-"
              + ServiceUtil.randomInt(0, 999999),
              "Bulk", null, dieselVendor.getName(), Long.valueOf(ServiceUtil.randomInt(
                0,
                6000)),
                Long.valueOf(ServiceUtil
                  .randomInt(0, 6000)), Long.valueOf(ServiceUtil.randomInt(0, 6000)), Long.valueOf(ServiceUtil.randomInt(0,
                    30000)), Long.valueOf(ServiceUtil.randomInt(0, 30000)), true,
                    true, ServiceUtil.randomDate());
      dieselVisitService.saveOrUpdate(dieselVisit);
    }

    long count2 = genericQueryExecutorDAO.findCount(ejbql, null);

    System.err.println(count1 + "...-----------Count-----------" + count2);
  }
}
