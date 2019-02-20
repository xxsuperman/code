package com.zs.pms.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.po.Tpermission;
import com.zs.pms.po.Tuser;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.Constants;
import com.zs.pms.vo.QueryUser;
@Service
@Transactional
public class ServiceImpl implements UserService
{
@Autowired
UserDao dao;
	

	@Override
	public List<Tpermission> queryByUid(int id) {
		// TODO Auto-generated method stub
		
		
		return dao.queryByUid(id);
	}


	@Override
	public List<Tpermission> getMenu(List<Tpermission> pers) {
		// TODO Auto-generated method stub
		//创建新容器
		List<Tpermission>list=new ArrayList<>();
		//遍历权限列表
		for(Tpermission per:pers) {
			//一级菜单
			if(per.getLev()==1) {
				//遍历该一级菜单下的二级菜单
				for(Tpermission per2:pers) {
					//二级菜单的上级id等于一级菜单的id
					if(per2.getPid()==per.getId()) {
						//添加子权限
						per.addChild(per2);
					}
				}
				list.add(per);
			}
		}
		return list;
	}


	@Override
	public List<Tuser> queryByCon(QueryUser query) {
		// TODO Auto-generated method stub
		return  dao.queryByCon(query);
	}


	@Override
	public void deleteByIds(int[] ids) {
		// TODO Auto-generated method stub
		dao.deleteByIds(ids);
	}


	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		dao.deleteById(id);
	}


	@Override
	public void updateUser(Tuser user) {
		// TODO Auto-generated method stub
		dao.updateUser(user);
	}


	@Override
	public int insertUser(Tuser user) {
		
		// TODO Auto-generated method stub
		dao.insertUser(user);
		
		return user.getId();
	}


	@Override
	public List<Tuser> queryByPage(int page, QueryUser query) {
		// TODO Auto-generated method stub
		int start =(page-1)*Constants.PAGECONT+1;
		int end=page*Constants.PAGECONT;
		query.setStart(start);
		query.setEnd(end);
		return dao.queryByPage(query);
	}


	@Override
	public int queryCount(QueryUser query) {
		// TODO Auto-generated method stub
		int cont=dao.queryCount(query);
		if(cont%Constants.PAGECONT==0) {
			return cont/Constants.PAGECONT;
		}
		else {
			return cont/Constants.PAGECONT+1;
		}
		
	}


	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertTest(Tuser user) {
		// TODO Auto-generated method stub
		int a=1/0;
		dao.insertUser(user);
		
		return user.getId();
	}

}
