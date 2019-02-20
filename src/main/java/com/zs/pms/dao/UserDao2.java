package com.zs.pms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.zs.pms.po.Tuser;
import com.zs.pms.vo.QueryUser;
@Repository
public  interface  UserDao2 {
	@Select("select * from tuser where loginname=#{loginname}")
     public List<Tuser> queryByCon(QueryUser query);
}
