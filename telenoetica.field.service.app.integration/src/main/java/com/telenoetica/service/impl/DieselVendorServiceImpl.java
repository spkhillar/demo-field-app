package com.telenoetica.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.telenoetica.jpa.entities.DieselVendor;
import com.telenoetica.jpa.repositories.DieselVendorDAO;
import com.telenoetica.service.DieselVendorService;
import com.telenoetica.service.util.ServiceUtil;

@Service("dieselVendorService")
public class DieselVendorServiceImpl implements DieselVendorService {

  @Autowired
  private DieselVendorDAO dieselVendorDAO;

  @Override
  public DieselVendor retrieve(final Long id) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public DieselVendor saveOrUpdate(final DieselVendor baseEntity) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public void delete(final DieselVendor baseEntity) {
    // TODO Auto-generated method stub

  }

  @Override
  public List<DieselVendor> getDieselVendor() {
    return dieselVendorDAO.findAll();
  }

  @Override
  public Page<DieselVendor> findALL(Integer page, Integer rows, String sord, String sidx) {
    return dieselVendorDAO.findAll(ServiceUtil.getPage(page, rows, sord, sidx));
  }

}
