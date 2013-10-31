package com.telenoetica.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.telenoetica.jpa.entities.CallOutVisit;
import com.telenoetica.jpa.entities.Client;
import com.telenoetica.jpa.entities.DieselVendor;
import com.telenoetica.jpa.entities.DieselVisit;
import com.telenoetica.jpa.entities.Fault;
import com.telenoetica.jpa.entities.Site;
import com.telenoetica.jpa.entities.Spare;
import com.telenoetica.jpa.entities.User;
import com.telenoetica.jpa.repositories.GenericQueryExecutorDAO;
import com.telenoetica.service.CallOutVisitService;
import com.telenoetica.service.ClientService;
import com.telenoetica.service.DieselVendorService;
import com.telenoetica.service.DieselVisitService;
import com.telenoetica.service.FaultService;
import com.telenoetica.service.PopulatorService;
import com.telenoetica.service.SiteService;
import com.telenoetica.service.SpareService;
import com.telenoetica.service.UserService;
import com.telenoetica.service.util.ServiceUtil;

@Service("populatorService")
public class PopulatorServiceImpl implements PopulatorService {

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

  @Autowired
  private SpareService spareService;

  @Autowired
  private ClientService clientService;

  @Autowired
  private FaultService faultService;

  @Autowired
  private CallOutVisitService callOutVisitService;

  @Override
  public void populateDieselVisit(int numberOfRecords, int lastDays) {
    List<Site> siteList = siteService.getSites();
    List<DieselVendor> dieselVendorList = dieselVendorService.getDieselVendor();
    int siteListSize = siteList.size();
    int dieselVendorListSize = dieselVendorList.size();
    User user = userService.findByUserName("root");
    String ejbql = "select count(*) from DieselVisit";
    long count1 = genericQueryExecutorDAO.findCount(ejbql, null);
    for (int i = 0; i < numberOfRecords; i++) {
      int index = ServiceUtil.randomInt(0, siteListSize);
      Site site = siteList.get(index);
      index = ServiceUtil.randomInt(0, dieselVendorListSize);
      DieselVendor dieselVendor = dieselVendorList.get(index);
      DieselVisit dieselVisit =
          new DieselVisit(user, null, String.valueOf(ServiceUtil.randomInt(0, 999999)), "DRN-"
              + ServiceUtil.randomInt(0, 999999), "Bulk", null, dieselVendor.getName(), Long.valueOf(ServiceUtil
                .randomInt(0, 6000)), Long.valueOf(ServiceUtil.randomInt(0, 6000)), Long.valueOf(ServiceUtil.randomInt(0,
                  6000)), Long.valueOf(ServiceUtil.randomInt(0, 30000)), Long.valueOf(ServiceUtil.randomInt(0, 30000)), true,
                  true, ServiceUtil.randomDate(lastDays));
      dieselVisit.setSiteId(site.getName());
      try {
        dieselVisitService.saveOrUpdate(dieselVisit);
      } catch (Exception e) {
        System.err.println(".Error Inserting.." + e.getMessage());
      }
    }
    long count2 = genericQueryExecutorDAO.findCount(ejbql, null);
    System.err.println(count1 + "...-----------Count-----------" + count2);
  }

  @Override
  public void populateCalloutVisit(int numberOfRecords, int lastDays) {
    List<Site> siteList = siteService.getSites();
    List<Spare> spareList = spareService.getSpares();
    List<Client> clientList = clientService.getClients();
    List<Fault> faultList = faultService.getFaults();

    int siteListSize = siteList.size();
    int spareListSize = spareList.size();
    int clientListSize = clientList.size();
    int faultListSize = faultList.size();

    User user = userService.findByUserName("root");
    String ejbql = "select count(*) from CallOutVisit";
    long count1 = genericQueryExecutorDAO.findCount(ejbql, null);
    for (int i = 0; i < numberOfRecords; i++) {
      Date createdAt = ServiceUtil.randomDate(lastDays);
      Date timeComplainReceived = DateUtils.addDays(createdAt, -5);
      Date timeReachedToSite = DateUtils.addDays(timeComplainReceived, 2);
      Date timeFaultResolved = createdAt;
      int index = ServiceUtil.randomInt(0, siteListSize);
      Site site = siteList.get(index);
      index = ServiceUtil.randomInt(0, clientListSize);
      String customer1Impacted = clientList.get(index).getName();
      index = ServiceUtil.randomInt(0, clientListSize);
      String customer2Impacted = clientList.get(index).getName();
      index = ServiceUtil.randomInt(0, clientListSize);
      String customer3Impacted = clientList.get(index).getName();
      index = ServiceUtil.randomInt(0, clientListSize);
      String customer4Impacted = clientList.get(index).getName();
      index = ServiceUtil.randomInt(0, faultListSize);
      String mainCategoryOfFault = faultList.get(index).getName();
      index = ServiceUtil.randomInt(0, spareListSize);
      String equipmentComponentCausedFault = spareList.get(index).getName();
      String equipmentComponentRepaired = equipmentComponentCausedFault;
      CallOutVisit callOutVisit =
          new CallOutVisit(user, null, String.valueOf(ServiceUtil.randomInt(0, 999999)), "CALL-"
              + ServiceUtil.randomInt(0, 999999), timeComplainReceived, timeReachedToSite, timeFaultResolved,
              customer1Impacted, customer2Impacted, customer3Impacted, customer4Impacted, mainCategoryOfFault,
              equipmentComponentCausedFault, equipmentComponentRepaired, null, "Temporary", null, createdAt);
      callOutVisit.setSiteId(site.getName());
      callOutVisitService.saveOrUpdate(callOutVisit);
    }
    long count2 = genericQueryExecutorDAO.findCount(ejbql, null);
    System.err.println(count1 + "...-----------Count-----------" + count2);
  }

  @Override
  public void populateMaintenanceVisit(int numberOfRecords, int lastDays) {

  }

}
