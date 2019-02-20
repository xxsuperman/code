
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户新增</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>

<script src="../res/common/js/jquery.js" type="text/javascript"></script>

<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />

<script type="text/javascript">
	//检测用户新增
	function chkSubmit(){
		
		//获得登录框的值
		var loginname =document.getElementById("loginname").value;
		//密码
		var password=fm.password.value;
		//确认密码
		var conpwd=fm.conpwd.value;
		//登录名
		if(loginname==""||loginname.length<=5){
			
			alert("登录名输入不得小于5位");
			return false;
		}
		//密码
		if(password!=conpwd){
			alert("两次密码输入不一致");
			return false;
		}
		//email 用正则
		//正则规则 /....../
		var reg =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		//正则.test(要比较的串)  return true: 通过 
		if(!reg.test(document.getElementById("email").value)){
			alert("email格式不正确");
			return false;
		}
		//至少一个汉字
		var reg2=/^[\u4e00-\u9fa5]+$/;
		
		if(!reg2.test(document.getElementById("realname").value)){
			alert("请输入汉字");
			return false;
		}
		
		//可提交
		return true;
	
	}
	
	
	//检测登录名是否唯一
	function chkLoginname(){
		//jquery获取
		var name=$("#loginname").val();
		
		if(name==''){
			return ;
		}
		//发送ajax数据
		//json数据格式 {"key1":value1,"key2":value2}
		var data={"loginname":name};
		//发送ajax请求
		$.ajax({
			url:"userchkName.do",//请求地址
			data:data,//提交数据
			dataType:"text",//发送文本
			type:"post",//提交方式
			async:"true",//是否异步
			//成功调用方法
			success:function(result){
				//用户存在
				if(result=='Y'){
					//jquery写
					$("#loginnamemsg").html("该用户名已存在");
					$("#loginnamemsg").css("color","red");
					$("#loginname").val("");
				}
				else{
					$("#loginnamemsg").html("该用户名可用");
					$("#loginnamemsg").css("color","green");
				}
			},
			//失败调用方法
			error:function(result,status){
				alert(status);
			}
			
		});
		
		
		
	}
	
	//根据部门id获得子部门
	function getDepByPid(val){
		//获得下拉框
		var dep1=$("#dep1");
		//清空
		dep1.empty();
		
		//发送ajax请求
		// url,传参,成功处理方法,传递的json格式
		$.post("getDep.do",{id:val},function(result){
			if(result!=""){
				$(result).each(function(){  //匿名方法
					//下拉框 拼串 加子项 
					dep1.append("<option value='"+this.id+"'>"+this.name+"</option>");
				})
			}
		},"json");
		
		
		
		
	}
	
	
</script>
</head>
<body onload="getDepByPid(1)">
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 添加 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="pn-frequired">${MSG}</span></div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='userlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form name="fm" id="jvForm" action="useradd.do" method="post"  
	onSubmit="return chkSubmit()">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						登录名:</td>
						<td width="80%" class="pn-fcontent">
						<input id="loginname" type="text" class="required" name="loginname" maxlength="100" onblur="chkLoginname()"/>
						<span id="loginnamemsg" />
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td>
						<td width="80%" class="pn-fcontent">
						<input id="password" type="password" class="required" name="password" maxlength="100"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						确认密码:</td>
						<td width="80%" class="pn-fcontent">
						<input id="conpwd"  type="password" class="required" name="conpwd" maxlength="100"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						真实姓名:</td>
						<td width="80%" class="pn-fcontent">
						<input id="realname" type="text" class="required" name="realname" maxlength="100"/>
					</td>
				</tr>
		
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<input type="radio"  name="sex"  checked value="男"/>男
						<input type="radio"  name="sex"   value="女"/>女
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						出生日期:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="birthday" maxlength="80"   class="Wdate" onclick="WdatePicker()" readonly="readonly"/>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						email:</td><td width="80%" class="pn-fcontent">
						<input id="email" type="text"  name="email" maxlength="80"/>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select name="dep" onchange="getDepByPid(this.value)">
							<c:forEach items="${DEPLIST}" var="dep">
								<option value="${dep.id}">${dep.name}</option>
								</c:forEach>
						</select>
						<select id="dep1" name="dep1">
							
						</select>
					</td>
				</tr>
				
			
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>