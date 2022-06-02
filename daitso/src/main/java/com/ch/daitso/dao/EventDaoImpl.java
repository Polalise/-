package com.ch.daitso.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.EventBoard;

@Repository
public class EventDaoImpl implements EventDao {
	@Autowired
     private SqlSessionTemplate sst;

	@Override
	public int getTotal(EventBoard board) {
		return sst.selectOne("eventns.getTotal");
	}

	@Override
	public List<EventBoard> list(EventBoard board) {
		/* selectList 는 변수 하나밖에 안들어가서 map으로 startRow,endRow 를 넣고 map을 변수로넣는다 */
//		Map<String, Integer> map = new HashMap<String, Integer>();
//	    map.put("startRow",startRow);
//	    map.put("endRow",endRow);
		return sst.selectList("eventns.list",board);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("eventns.getMaxNum");
	}

	@Override
	public int insert(EventBoard board) {

		return sst.insert("eventns.insert",board);
	}

	@Override
	public void updateReadCount(int e_num) {
		sst.update("eventns.updateReadCount", e_num);
		
	}

	@Override
	public EventBoard select(int e_num) {
		return sst.selectOne("eventns.select", e_num);
	}

	@Override
	public int update(EventBoard board) {
		return sst.update("eventns.update", board);
	}

	@Override
	public int delete(int e_num) {
		return sst.update("eventns.delete", e_num);
	}

	@Override
	public int getEventCount() {
		return sst.selectOne("eventns.getEventCount");
	}

	@Override
	public List<EventBoard> list2() {
		return sst.selectList("eventns.list2");
	}
}
