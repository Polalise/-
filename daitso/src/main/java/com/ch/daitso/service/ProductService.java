package com.ch.daitso.service;
import java.util.List;

import com.ch.daitso.model.Product;


public interface ProductService {
	int getTotal(Product product);
	int getMaxNum();
	int insert(Product product);
	Product select(int p_num);
	void updateReadCount(int p_num);
	int update(Product product);
	int delete(Product product);
	List<Product> list(Product product);
	Product select2(int p_num);
	int getProductCount();
	int getProductCount2();

}
