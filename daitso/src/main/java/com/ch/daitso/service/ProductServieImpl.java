package com.ch.daitso.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.ProductDao;
import com.ch.daitso.model.Product;

@Service
public class ProductServieImpl implements ProductService {
	@Autowired
	private ProductDao pd;
	public int getTotal(Product product) {
		return pd.getTotal(product);
	}
	public int getMaxNum() {
		return pd.getMaxNum();
	}
	@Override
	public int insert(Product product) {
		return pd.insert(product); 
	}
	public Product select(int p_num) {
		return pd.select(p_num);
	}
	public void updateReadCount(int p_num) {
		pd.updateReadCount(p_num); 		
	}
	public int update(Product product) {
		return pd.update(product);
	}
	public int delete(Product product) {
		return pd.delete(product);
	}
	public List<Product> list(Product product) {
		return pd.list(product);
	}
	@Override
	public Product select2(int p_num) {
		return pd.select2(p_num);
	}
	@Override
	public int getProductCount() {
		return pd.getProductCount();
	}
	@Override
	public int getProductCount2() {
		return pd.getProductCount2();
	}
} 

