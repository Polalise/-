package com.ch.daitso.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(Product product) {
		return sst.selectOne("productns.getTotal", product);
	}

	/*
	 * public List<Product> list(int startRow, int endRow) { selectList 는 변수 하나밖에
	 * 안들어가서 map으로 startRow,endRow 를 넣고 map을 변수로넣는다 Map<String, Integer> map = new
	 * HashMap<String, Integer>(); map.put("startRow", startRow); map.put("endRow",
	 * endRow); return sst.selectList("productns.list",map); }
	 */
	public int getMaxNum() {
		return sst.selectOne("productns.getMaxNum");
	}

	public int insert(Product product) {
		return sst.insert("productns.insert", product);
	}

	public Product select(int p_num) {
		return sst.selectOne("productns.select", p_num);
	}

	public void updateReadCount(int p_num) {
		sst.update("productns.updateReadCount", p_num);

	}

	public int update(Product product) {
		System.out.println("product:" + product);
		return sst.update("productns.update", product);
	}

	public int delete(Product product) {
		return sst.update("productns.delete", product);
	}

	public List<Product> list(Product product) {
		return sst.selectList("productns.list", product);
	}

	@Override
	public Product select2(int p_num) {
		return sst.selectOne("productns.select2", p_num);
	}

	@Override
	public int getProductCount() {
		return sst.selectOne("productns.getProductCount");
	}

	@Override
	public int getProductCount2() {
		return sst.selectOne("productns.getProductCount2");
	}

	@Override
	public int getProductCount3() {
		return sst.selectOne("productns.getProductCount3");
	}

}
