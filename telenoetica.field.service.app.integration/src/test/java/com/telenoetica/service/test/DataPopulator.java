package com.telenoetica.service.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.telenoetica.service.PopulatorService;

public class DataPopulator extends BaseServiceTest {

  @Autowired
  private PopulatorService populatorService;

  @Test
  public void populateCalloutVisit() {
    populatorService.populateCalloutVisit(10, 30);
  }
}
