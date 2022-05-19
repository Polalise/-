package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Product;

public interface ProductDao {
	int getMaxNum = 0;
	int getTotal(Product prodcut);
	int getMaxNum();
	int insert(Product product);
	Product select(int p_num);
	void updateReadCount(int p_num);
	int update(Product product);
	int delete(Product product);
	List<Product> list(Product product);
	Product select2(int p_num);

	

}
 