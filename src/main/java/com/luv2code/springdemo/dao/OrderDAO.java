package com.luv2code.springdemo.dao;



import java.util.List;


import com.luv2code.springdemo.entity.Orders;

public interface OrderDAO {

	void saveOrder(Orders theOrder);

	List<Orders> getOrdersWithStatus(int i);

	void changeOrder(int theId, int i);

	void deleteOrder(int theId);

	List<Orders> getOrdersWithStatusandtuser(int i, String userName);

	List<Orders> getallOrders();

	List<Orders> getorderbyuser(String userName);

	Orders getorderbyid(int ot);

	int getlastOrdernull();


	
}
