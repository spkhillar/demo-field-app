package com.telenoetica.service.util;

public class MedianFields {
  
  private String fieldName;
  
  private int fieldValue;
  
  public MedianFields() {
    super();
  }

  public MedianFields(String fieldName, int fieldValue) {
    super();
    this.fieldName = fieldName;
    this.fieldValue = fieldValue;
  }

  public String getFieldName() {
    return fieldName;
  }

  public void setFieldName(String fieldName) {
    this.fieldName = fieldName;
  }

  public int getFieldValue() {
    return fieldValue;
  }

  public void setFieldValue(int fieldValue) {
    this.fieldValue = fieldValue;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("MedianFields [");
    if (fieldName != null) {
      builder.append("fieldName=");
      builder.append(fieldName);
      builder.append(", ");
    }
    builder.append("fieldValue=");
    builder.append(fieldValue);
    builder.append("]");
    return builder.toString();
  }
  
  

}
