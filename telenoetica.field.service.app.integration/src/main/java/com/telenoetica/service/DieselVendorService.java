package com.telenoetica.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.telenoetica.jpa.entities.DieselVendor;

/**
 * The Interface DieselVendorService.
 */
public interface DieselVendorService extends BaseService<DieselVendor> {

  /**
   * Gets the DieselVendor.
   * 
   * @return the DieselVendor
   */
  List<DieselVendor> getDieselVendor();

  Page<DieselVendor> findALL(Integer page, Integer rows, String sord, String sidx);
}
