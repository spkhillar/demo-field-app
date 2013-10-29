package com.telenoetica.service.util;

import java.util.List;

public class Median {

  private int medianValue;
  
  private List<MedianFields> medianFields;
  
  public Median() {
  }

  public Median(int medianValue, List<MedianFields> medianFields) {
    super();
    this.medianValue = medianValue;
    this.medianFields = medianFields;
  }

  public int getMedianValue() {
    return medianValue;
  }

  public void setMedianValue(int medianValue) {
    this.medianValue = medianValue;
  }

  public List<MedianFields> getMedianFields() {
    return medianFields;
  }

  public void setMedianFields(List<MedianFields> medianFields) {
    this.medianFields = medianFields;
  }
  
  
  
  
}
