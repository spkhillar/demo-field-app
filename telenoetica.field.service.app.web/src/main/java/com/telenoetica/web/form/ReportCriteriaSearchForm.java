package com.telenoetica.web.form;

import java.util.Date;

public class ReportCriteriaSearchForm {

  private String searchFieldName;

  private Date startDate;

  private Date endDate;

  public String getSearchFieldName() {
    return searchFieldName;
  }

  public void setSearchFieldName(String searchFieldName) {
    this.searchFieldName = searchFieldName;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }
}
