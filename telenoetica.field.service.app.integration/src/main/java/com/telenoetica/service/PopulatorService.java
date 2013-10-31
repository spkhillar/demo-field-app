package com.telenoetica.service;

public interface PopulatorService {


  void populateDieselVisit(int records, int lastDays);

  void populateCalloutVisit(int numberOfRecords, int lastDays);

  void populateMaintenanceVisit(int numberOfRecords, int lastDays);
}
