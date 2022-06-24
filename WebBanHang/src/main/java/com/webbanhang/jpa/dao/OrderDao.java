package com.webbanhang.jpa.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webbanhang.jpa.model.Order;

public interface OrderDao extends JpaRepository<Order, Integer>{

	
	@Query("select o from Order o where o.status = 0 and o.cutomer.id= ?1 ")
	Order findIdCutomer(int i);
	
	@Query("SELECT MAX(o.id) FROM Order o")
	int maxId();
	
	@Query("SELECT SUM(o.quantity*(o.product.price-o.product.price*o.product.sale)) "
			+ "  FROM OrderDetail o where o.order.id = ?1")
	int sumPriceOrder(int idOrder);
	
	@Query("SELECT sum(o.totalmoney) FROM Order o where o.status = 1 and MONTH(o.date)= ?1 ")
	int sumPriceMonth(int month);
	
	@Query("SELECT sum(o.totalmoney) FROM Order o where o.status = 1 and YEAR(o.date)= ?1 ")
	int sumPriceYear(int year);
	
	@Query("SELECT COUNT(o) FROM Order o where o.status = 1 and MONTH(o.date)= ?1 ")
	int sumCountMonth(int thang);
	
}
