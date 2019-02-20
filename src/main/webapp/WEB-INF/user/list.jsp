<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>用户列表</title>

</head>
<body>

<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onClick="javascript:window.location.href='init.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<form action="v_list.shtml" method="post" style="padding-top:5px;">
登录名: <input type="text" name="name"/>
	<select >
		<option value="1">有效</option>
		<option value="0">无效</option>
	</select>
	<input type="submit" class="query" value="查询"/>
</form>
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onClick="checkBox('ids',this.checked)"/></th>
			<th>用户ID</th>
			<th>登录名</th>
			<th>性别</th>
			<th>部门</th>
			<th>出生日期</th>
			<th>是否可用</th>
			<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
<c:forEach items="${USERLIST}" var="user" >
		<tr bgcolor="#ffffff" onMouseOut="this.bgColor='#ffffff'" onMouseOver="this.bgColor='#eeeeee'">
			<td><input type="checkbox" value="8" name="ids"/></td>
			<td align="center">${user.id} </td>
			<td align="center">${user.loginname}</td>
			<td align="center">${user.sex}</td>
			<td align="center">${user.dept.name}</td>
			<td align="center">${user.birthday}</td>
			<td align="center">${user.enabledTxt}</td>
			<td align="center">
			<a class="pn-opt" href="userget.do?id=${user.id} ">修改</a> | <a class="pn-opt"   onClick="if(!confirm('是否删除数据?')){return false;}" href="userdelete.do?id=${user.id}">删除</a>
			</td>
		</tr>
</c:forEach>		

	</tbody>
</table>
<div style="margin-top:15px;">
	<input class="del-button" type="button" value="删除" onClick="optDelete();"/>
	<div style="float:right"><a href="userlist.do?page=1">第一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="userlist.do?page=${(PAGE-1)<=0?1:(PAGE-1)}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="userlist.do?page=${PAGE+1>PAGECONT?PAGECONT:PAGE+1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="userlist.do?page=${PAGECONT}">最后页</a>&nbsp;&nbsp;&nbsp;&nbsp;当前第${PAGE}页 /共${PAGECONT}页</div>
</div>
</body>
</html>