<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/js/easyui/easyu_core.jsp"></jsp:include>
</head>
<body class="easyui-layout">
<table id="userData"></table>
<script type="text/javascript">
$(function(){
	$('#userData').datagrid({
	    url:'<%=request.getContextPath()%>/user/selectUserList.do',
	    fit:true,
	    //开启分页功能
	    pagination:true,
	    //每页要展示的条数
	     pageSize:5,
	    //选择性每页要展示的条数
	    pageList:[3,5,7],
	    //singleSelect:true,
	    ctrlSelect:true,   
	    pagePosition:"both",
	    //引入工具栏
	   // toolbar:"#toolbarId",
	    columns:[[
	        {field:'checkThis',checkbox:true,width:2},
	        {field:'userId',title:'用户ID',align:'center',width:90},    
	        {field:'userName',title:'名字',align:'center',width:90},    
	        {field:'userSex',title:'性别',align:'center',width:90},    
	        {field:'userAge',title:'年龄',align:'center',width:90},    
	        {field:'userBirthday',title:'生日',align:'center',width:90},    
	    ]]
	});
})
</script>
</body>
</html>