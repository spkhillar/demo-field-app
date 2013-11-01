package com.telenoetica.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.telenoetica.service.PopulatorService;

@Controller
@RequestMapping(value = "/populate")
public class PopulatorController extends BaseController {

  @Autowired
  private PopulatorService populatorService;

  @RequestMapping(value = "/diesel/{records}/{lastDays}")
  @ResponseBody
  public String diesel(@PathVariable int records, @PathVariable int lastDays) {
    populatorService.populateDieselVisit(records, lastDays);
    return "Done";
  }

  @RequestMapping(value = "/callout/{records}/{lastDays}")
  @ResponseBody
  public String callOut(@PathVariable int records, @PathVariable int lastDays) {
    populatorService.populateCalloutVisit(records, lastDays);
    return "Done";
  }

  @RequestMapping(value = "/maintenance/{records}/{lastDays}")
  @ResponseBody
  public String maintenance(@PathVariable int records, @PathVariable int lastDays) {
    populatorService.populateMaintenanceVisit(records, lastDays);
    return "Done";
  }

  @RequestMapping(value = "/routine/{records}/{lastDays}")
  @ResponseBody
  public String routine(@PathVariable int records, @PathVariable int lastDays) {
    populatorService.populateRoutineVisit(records, lastDays);
    return "Done";
  }
}
