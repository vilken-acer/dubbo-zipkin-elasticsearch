<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/js/zTree/demo/jsp/inc.jsp"></jsp:include>
<body>
   <ul id="treeDemo" class="ztree"></ul>
</body>
<script type="text/javascript">

var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "pid",
			}
		}
	};


	$(document).ready(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/treeController/queryTree.do",
			dataType:"json",
			type:"post",
			success:function(zNodes){
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				treeObj.expandAll(true);
			},error:function(){
				alert("查询失败");
			}
		})
		
	});


</script>
</html>