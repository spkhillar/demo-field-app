package com.telenoetica.web.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.telenoetica.web.form.ReportCriteriaSearchForm;

@Controller
@RequestMapping(value = "/jsp")
public class SingleViewController extends BaseController {

  private static final Map<String, String> DIESEL_VISIT_SELECTION_FIELDS = new LinkedHashMap<String, String>();

  static{
    DIESEL_VISIT_SELECTION_FIELDS.put("dieselReceivedLtrs", "Diesel Received");
    DIESEL_VISIT_SELECTION_FIELDS.put("runHourGen1", "Run Hour Gen1");
    DIESEL_VISIT_SELECTION_FIELDS.put("runHourGen2", "Run Hour Gen2");
  }

  @RequestMapping(value = "/dashboard/home")
  public String home() {
    return "dashboard-home";
  }

  @RequestMapping(value = "/underconstruction")
  public String underConstruction() {
    return "under-construction";
  }

  @RequestMapping(value = "/dashboard/diesel")
  public String diesel(ModelMap map) {
    map.put("dieselVisitSelectionFields", DIESEL_VISIT_SELECTION_FIELDS);
    map.put("reportCriteriaSearchForm", new ReportCriteriaSearchForm());
    return "dashboard-diesel-input";
  }

  @RequestMapping(value = "/dashboard/maintenance")
  public String maintenance() {
    return "dashboard-maintenance";
  }

  @RequestMapping(value = "/dashboard/diesel/report/{filterField}/{startDate}/{endDate}")
  public String dieselMedianReport(ModelMap map, @PathVariable final String filterField,
      @PathVariable final String startDate,
      @PathVariable String endDate) {
    map.put("filterField", filterField);
    map.put("startDate", startDate);
    map.put("endDate", endDate);
    return "dashboard-diesel";
  }
}
