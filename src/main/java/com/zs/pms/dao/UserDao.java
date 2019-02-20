package com.zs.pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zs.pms.po.Tpermission;
import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryUser;
@Repository
public interface UserDao {
	public List<Tpermission> queryByUid(int id);
	public List<Tuser> queryByCon (QueryUser query);
	public void deleteByIds(int []ids);
	public void deleteById(int id);
	public void updateUser(Tuser user);
	public int insertUser(Tuser user);
	public List<Tuser> queryByPage(QueryUser query);
	public int queryCount(QueryUser query);
}
