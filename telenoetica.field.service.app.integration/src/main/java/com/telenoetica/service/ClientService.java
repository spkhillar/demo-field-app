/*
 * Copyright (C) 2013 Telenoetica, Inc. All rights reserved
 */
package com.telenoetica.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.telenoetica.jpa.entities.Client;

/**
 * The Interface ClientService.
 */
public interface ClientService extends BaseService<Client>{

  /**
   * Gets the clients.
   *
   * @return the clients
   */
  List<Client> getClients();

  Page<Client> findALL(Integer page, Integer rows, String sord, String sidx);
}
