import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.po.Tdep;
import com.zs.pms.po.Tpermission;
import com.zs.pms.po.Tuser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationcontext.xml")
public class Test {
	@Autowired
	UserService us;
	
	public void TestOne() {
		
		List<Tpermission> list=us.queryByUid(1);
		
		for(Tpermission per1:us.getMenu(list)) {
			System.out.println(per1.getPname());
			for(Tpermission per2:per1.getChildren()) {
				System.out.println("-----"+per2.getPname());
			}
		}
	}
	
	public void TestQuery() {
		QueryUser query=new QueryUser();
		query.setLoginname("xhk");
		query.setPassword("123");
		System.out.println(us.queryByCon(query));
	}
	

	public void testdeleteids() {
		int[] ids= {4,5};
		us.deleteByIds(ids);
	}
	
	public void deleteid() {
		us.deleteById(4);
	}	
	
	public void testquery() {
		QueryUser query =new QueryUser();
		for(Tuser user:us.queryByPage(1, query)) {
			System.out.println(user.getId()+"---"+user.getLoginname());
		}
		System.out.println("共"+ us.queryCount(query)+"页");
	}
	
	@org.junit.Test
	public void TestInsert() {
		Tuser user=new Tuser();
		user.setLoginname("222test");
		user.setPassword("111111");
		user.setSex("男");
		user.setBirthday(new Date());
		user.setEmail("11111@qq.com");
		Tdep dep=new Tdep();
		dep.setId(2);
		user.setDept(dep);
		user.setRealname("猪八戒");
		user.setCreator(3001);
		user.setIsenable(1);
		user.setPic("inset");
		System.out.println(us.insertTest(user));
		

	}
	
	
	
		
}
