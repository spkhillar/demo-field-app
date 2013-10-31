package com.telenoetica.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.telenoetica.jpa.entities.Client;
import com.telenoetica.jpa.entities.DieselVendor;
import com.telenoetica.jpa.entities.Fault;
import com.telenoetica.jpa.entities.MaintenanceVisitCategory;
import com.telenoetica.jpa.entities.Site;
import com.telenoetica.jpa.entities.Spare;
import com.telenoetica.service.ClientService;
import com.telenoetica.service.DieselVendorService;
import com.telenoetica.service.FaultService;
import com.telenoetica.service.MaintenanceVisitCategoryService;
import com.telenoetica.service.SiteService;
import com.telenoetica.service.SpareService;
import com.telenoetica.web.util.DomainObjectMapper;
import com.telenoetica.web.util.JqGridResponse;

@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {

  @Autowired
  private SiteService siteService;

  @Autowired
  private FaultService faultService;

  @Autowired
  private SpareService spareService;

  @Autowired
  private MaintenanceVisitCategoryService maintenanceVisitCategoryService;

  @Autowired
  private DieselVendorService dieselVendorService;

  @Autowired
  private ClientService clientService;

  @RequestMapping(value = "/site/view")
  public String viewSites() {
    return "admin.sites";
  }

  @RequestMapping(value = "/site/list", produces = "application/json")
  public @ResponseBody
  JqGridResponse<Site> listSites(@RequestParam("_search") final Boolean search,
    @RequestParam(value = "filters", required = false) final String filters,
    @RequestParam(value = "page", required = false) final Integer page,
    @RequestParam(value = "rows", required = false) final Integer rows,
    @RequestParam(value = "sidx", required = false) final String sidx,
    @RequestParam(value = "sord", required = false) final String sord) {
    Page<Site> users = null;
    users = siteService.findALL(page, rows, sord, sidx);
    List<Object> list = DomainObjectMapper.listEntities(users);
    JqGridResponse<Site> response = new JqGridResponse<Site>();
    response.setRows(list);
    response.setRecords(Long.valueOf(users.getTotalElements()).toString());
    response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
    response.setPage(Integer.valueOf(users.getNumber() + 1).toString());
    return response;
  }

  @RequestMapping(value = "/fault/view")
  public String viewFaults() {
    return "admin.faults";
  }

  @RequestMapping(value = "/fault/list", produces = "application/json")
  public @ResponseBody
  JqGridResponse<Fault> listFaults(@RequestParam("_search") final Boolean search,
    @RequestParam(value = "filters", required = false) final String filters,
    @RequestParam(value = "page", required = false) final Integer page,
    @RequestParam(value = "rows", required = false) final Integer rows,
    @RequestParam(value = "sidx", required = false) final String sidx,
    @RequestParam(value = "sord", required = false) final String sord) {
    Page<Fault> users = null;
    users = faultService.findALL(page, rows, sord, sidx);
    List<Object> list = DomainObjectMapper.listEntities(users);
    JqGridResponse<Fault> response = new JqGridResponse<Fault>();
    response.setRows(list);
    response.setRecords(Long.valueOf(users.getTotalElements()).toString());
    response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
    response.setPage(Integer.valueOf(users.getNumber() + 1).toString());
    return response;
  }

  @RequestMapping(value = "/spare/view")
  public String viewSpares() {
    return "admin.spares";
  }

  @RequestMapping(value = "/spare/list", produces = "application/json")
  public @ResponseBody
  JqGridResponse<Spare> listSpares(@RequestParam("_search") final Boolean search,
    @RequestParam(value = "filters", required = false) final String filters,
    @RequestParam(value = "page", required = false) final Integer page,
    @RequestParam(value = "rows", required = false) final Integer rows,
    @RequestParam(value = "sidx", required = false) final String sidx,
    @RequestParam(value = "sord", required = false) final String sord) {
    Page<Spare> users = null;
    users = spareService.findALL(page, rows, sord, sidx);
    List<Object> list = DomainObjectMapper.listEntities(users);
    JqGridResponse<Spare> response = new JqGridResponse<Spare>();
    response.setRows(list);
    response.setRecords(Long.valueOf(users.getTotalElements()).toString());
    response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
    response.setPage(Integer.valueOf(users.getNumber() + 1).toString());
    return response;
  }

  @RequestMapping(value = "/maintenancecategories/view")
  public String viewMaintenaceCategories() {
    return "admin.maintenancecategories";
  }

  @RequestMapping(value = "/maintenancecategories/list", produces = "application/json")
  public @ResponseBody
  JqGridResponse<MaintenanceVisitCategory> listMaintenaceCategories(@RequestParam("_search") final Boolean search,
    @RequestParam(value = "filters", required = false) final String filters,
    @RequestParam(value = "page", required = false) final Integer page,
    @RequestParam(value = "rows", required = false) final Integer rows,
    @RequestParam(value = "sidx", required = false) final String sidx,
    @RequestParam(value = "sord", required = false) final String sord) {
    Page<MaintenanceVisitCategory> users = null;
    users = maintenanceVisitCategoryService.findALL(page, rows, sord, sidx);
    List<Object> list = DomainObjectMapper.listEntities(users);
    JqGridResponse<MaintenanceVisitCategory> response = new JqGridResponse<MaintenanceVisitCategory>();
    response.setRows(list);
    response.setRecords(Long.valueOf(users.getTotalElements()).toString());
    response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
    response.setPage(Integer.valueOf(users.getNumber() + 1).toString());
    return response;
  }

  @RequestMapping(value = "/diselvendor/view")
  public String viewDieselVendors() {
    return "admin.diselvendor";
  }

  @RequestMapping(value = "/diselvendor/list", produces = "application/json")
  public @ResponseBody
  JqGridResponse<DieselVendor> listDieselVendors(@RequestParam("_search") final Boolean search,
    @RequestParam(value = "filters", required = false) final String filters,
    @RequestParam(value = "page", required = false) final Integer page,
    @RequestParam(value = "rows", required = false) final Integer rows,
    @RequestParam(value = "sidx", required = false) final String sidx,
    @RequestParam(value = "sord", required = false) final String sord) {
    Page<DieselVendor> users = null;
    users = dieselVendorService.findALL(page, rows, sord, sidx);
    List<Object> list = DomainObjectMapper.listEntities(users);
    JqGridResponse<DieselVendor> response = new JqGridResponse<DieselVendor>();
    response.setRows(list);
    response.setRecords(Long.valueOf(users.getTotalElements()).toString());
    response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
    response.setPage(Integer.valueOf(users.getNumber() + 1).toString());
    return response;
  }

  @RequestMapping(value = "/client/view")
  public String viewClients() {
    return "admin.client";
  }

  @RequestMapping(value = "/client/list", produces = "application/json")
  public @ResponseBody
  JqGridResponse<Client> listClients(@RequestParam("_search") final Boolean search,
    @RequestParam(value = "filters", required = false) final String filters,
    @RequestParam(value = "page", required = false) final Integer page,
    @RequestParam(value = "rows", required = false) final Integer rows,
    @RequestParam(value = "sidx", required = false) final String sidx,
    @RequestParam(value = "sord", required = false) final String sord) {
    Page<Client> users = null;
    users = clientService.findALL(page, rows, sord, sidx);
    List<Object> list = DomainObjectMapper.listEntities(users);
    JqGridResponse<Client> response = new JqGridResponse<Client>();
    response.setRows(list);
    response.setRecords(Long.valueOf(users.getTotalElements()).toString());
    response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
    response.setPage(Integer.valueOf(users.getNumber() + 1).toString());
    return response;
  }
}
