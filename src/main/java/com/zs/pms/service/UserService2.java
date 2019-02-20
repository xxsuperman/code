package com.zs.pms.service;

import java.util.List;

import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryUser;

public interface UserService2 {
	public List<Tuser> queryByCon(QueryUser query);
}
