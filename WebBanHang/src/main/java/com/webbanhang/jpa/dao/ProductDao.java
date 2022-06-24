package com.webbanhang.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webbanhang.jpa.model.Product;

public interface ProductDao extends JpaRepository<Product, Integer>{

}
