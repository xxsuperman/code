package com.zs.pms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zs.pms.po.Tpermission;
import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryUser;
@Service
public interface UserService {
	//public void hello();
	public List<Tpermission> queryByUid(int id);
	public List<Tpermission> getMenu(List<Tpermission> pers);
	public List<Tuser> queryByCon (QueryUser query);
	public void deleteByIds (int[]ids);
	public void deleteById(int id);
	public void updateUser(Tuser user);
	public int insertUser(Tuser user);
	public List<Tuser> queryByPage( int page,QueryUser query);
	public int queryCount(QueryUser query);
	public int insertTest(Tuser user);
}