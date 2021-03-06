package com.webbanhang.jpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webbanhang.jpa.model.OrderDetail;

public interface OrderDetailDao extends JpaRepository<OrderDetail, Integer>{

	@Query("SELECT o FROM OrderDetail o WHERE o.order.cutomer.id = ?1 and o.order.status = 0")
	List<OrderDetail> findAllUsername(int id);
	
	@Query("SELECT o FROM OrderDetail o WHERE o.product.id = ?1 and o.order.cutomer.id = ?2 and o.order.status = 0")
	OrderDetail findIdProduct(int idProduct, int idCutomer);
	
}
