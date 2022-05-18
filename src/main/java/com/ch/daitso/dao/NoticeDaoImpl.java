package com.ch.daitso.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.NoticeBoard;


@Repository
public class NoticeDaoImpl implements NoticeDao{
   @Autowired
   private SqlSessionTemplate sst;

@Override
public int getTotal(NoticeBoard board) {
	return sst.selectOne("noticens.getTotal");
}

@Override
public List<NoticeBoard> list(NoticeBoard board) {
	/* selectList 는 변수 하나밖에 안들어가서 map으로 startRow,endRow 를 넣고 map을 변수로넣는다 */
//	Map<String, Integer> map = new HashMap<String, Integer>();
//    map.put("startRow",startRow);
//    map.put("endRow",endRow);
//	return sst.selectList("noticens.list",map);
	return sst.selectList("noticens.list",board);
}

@Override
public int getMaxNum() {
	return sst.selectOne("noticens.getMaxNum");
}

@Override
public int insert(NoticeBoard board) {
	return sst.insert("noticens.insert",board);
}

//@Override
//public void insertPh(List<NoticePhoto> photos) {
////	System.out.println("photos="+photos.get(0).getFnum());
//	sst.insert("noticens.insertPh", photos);
//	
//}

@Override
public void updateReadCount(int num) {
	sst.update("noticens.updateReadCount", num);
	
}

@Override
public NoticeBoard select(int num) {
	return sst.selectOne("noticens.select", num);
}

//@Override
//public List<NoticePhoto> listPhoto(int num) {
//	return sst.selectList("noticens.selectList", num);
//}

@Override
public int update(NoticeBoard board) {
	return sst.update("noticens.update", board);
}

@Override
public int delete(int num) {
	return sst.update("noticens.delete", num);
}

//@Override
//public void updatePhoto(List<NoticePhoto> photos) {
//	sst.update("noticens.updatePhoto", photos);
//	
//}

@Override
public int getNoticeCount() {
	return sst.selectOne("noticens.getNoticeCount");
}

}
