
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
	
	//文档就绪事件
	$(function(){
		
		//加载第一个下拉框
		//取一级部门下拉
		var dep1=$("#dep1");
		//取二级部门下拉
		var dep2=$("#dep2");
		
		//获取一级部门数据 一级部门 pid=0
		$.post("getDep.do",{pid:0},function(result){
			//对result进行全循环
			if(result!=""){
				$(result).each(function(){
					//追加记录 this 循环变量
					dep1.append("<option value='"+	this.id+"'>"+this.name+"</option>");
				})
			}
		},"json");
		//初始化第二个下拉框
		
		//清空第二个下拉框
				dep2.empty();
				//默认为pid=1
				$.post("getDep.do",{pid:1},function(result){
					//对result进行全循环
					if(result!=""){
						$(result).each(function(){
							//追加记录 this 循环变量
							dep2.append("<option value='"+	this.id+"'>"+this.name+"</option>");
						})
					}
				},"json");
				
		
		//在第一个部门的改变事件中
		$("#dep1").change(
			function(){
				//清空第二个下拉框
				dep2.empty();
				//this.value 是dep1选中的value
				$.post("getDep.do",{pid:this.value},function(result){
					//对result进行全循环
					if(result!=""){
						$(result).each(function(){
							//追加记录 this 循环变量
							dep2.append("<option value='"+	this.id+"'>"+this.name+"</option>");
						})
					}
				},"json");
			}
		);
		
		
		
		//检测登录名 失去焦点方法		
		$("#loginname").blur(function(){
			
			$.ajax({
				type:"post", //提交方式
				url:"userchkName.do",//提交路径    user/userchkName.do
				data:"loginname="+$("#loginname").val(),// url传参
				//成功回调函数 msg里是response写入的内容
				success:function(msg) {
					//可用
					if(msg=='Y'){
						//美观
						$("#loginnamemsg").html("该登录名可用");//写内容
						$("#loginnamemsg").css("color","green");//加样式
					}
					//不可用
					else{
						$("#loginnamemsg").html("该登录名已存在");//写内容
						$("#loginnamemsg").css("color","red");//加样式
						//清空
						$("#loginname").val('');
					}
				}
			});
			
			
			
			
		});
		
		
		
		
		
		
		
		//表单提交事件
		$("#jvForm").submit(
			function(){
				
				return true;
				//获得登录名
				var loginname=$("#loginname").val();
				//密码
				var password=$("#password").val();
				//确认密码
				var conpwd=$("#conpwd").val();
				
				//登录名
				if(loginname==""||loginname.length<=5){
					//美观
					$("#loginnamemsg").html("登录名不得小于5位");//写内容
					$("#loginnamemsg").css("color","red");//加样式
					//获得焦点
					$("#loginname").focus();
					//不提交
					return false;
				}
				//清空
				else{
					$("#loginnamemsg").html("");
				}
				//密码
				if(password!=conpwd){
					//美观
					$("#passwordmsg").html("两次密码输入不一致");//写内容
					$("#passwordmsg").css("color","red");//加样式
					//获得焦点
					$("#password").focus();
					return false;
				}
				else{
					$("#passwordmsg").html("");
				}
				//至少一个汉字
				var reg2=/^[\u4e00-\u9fa5]+$/;
				
				if(!reg2.test($("#realname").val())){
					$("#realnamemsg").html("请输入汉字");//写内容
					$("#realnamemsg").css("color","red");//加样式
					$("#realname").focus();
					return false;
				}
				else{
					$("#realnamemsg").html("");
				}
				//email 用正则
				//正则规则 /....../
				var reg =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				//正则.test(要比较的串)  return true: 通过 
				if(!reg.test($("#email").val())){
					$("#emailmsg").html("email格式不正确");//写内容
					$("#emailmsg").css("color","red");//加样式
					$("#email").focus();
					return false;
				}
				else{
					$("#emailmsg").html("");
				}
		

			}		
		)
	});
	
		
	
</script>
</head>
<body>
${pageContext.request.contextPath}<!--获得应用的绝对路径-->
<img src="${pageContext.request.contextPath}/images/logo4.png" /><br />  <!--绝对路径-->
<img src="../images/logo4.png" /><!--相对路径 ../ 表示上一级-->
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 添加 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="pn-frequired">${MSG}</span></div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='userlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form name="fm" id="jvForm" action="useradd.do" method="post" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						登录名:</td>
						<td width="80%" class="pn-fcontent">
						<input id="loginname" type="text" class="required" name="loginname" maxlength="100" />
						<span id="loginnamemsg" />
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td>
						<td width="80%" class="pn-fcontent">
						<input id="password" type="password" class="required" name="password" maxlength="100"/>
						<span id="passwordmsg" />
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
						<span id="realnamemsg" />
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
						<span id="emailmsg" />
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select id="dep1" name="dep1">
							
						</select>
						<select id="dep2" name="dep2">
							
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