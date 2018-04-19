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
    <!-- <div data-options="region:'north',title:'上',split:true,height:120"></div>   
    <div data-options="region:'south',title:'下',split:true,height:130"></div>   
    <div data-options="region:'east',title:'右',split:true,width:100"></div>    -->
    <div data-options="region:'west',title:'左',split:true,width:200">
    	<div id="aa" class="easyui-accordion" fit="true">   
		    <div title="商品管理" data-options="iconCls:'icon-reload'", style="overflow:auto;padding:10px;">   
		       	<div id="GOODSMG"></div>
		    </div>   
		    <div title="类型管理" data-options="iconCls:'icon-save'", selected:true" style="padding:10px;">   
		       <div id="depart"></div>   
		    </div>   
		    <div title="采购管理">   
		       <div id="degree"></div>         
		    </div>   
	   </div>  
    </div>
    <div data-options="region:'center',title:'中'">
		<div id="content_tabs" class="easyui-tabs" data-options="fit:true">
			<div title="首页">
				这是一个神奇的网站！欢迎被坑！！！
			</div>
		</div>    
    </div>   
    <script type="text/javascript">
    
    //员工管理
    	$("#GOODSMG").tree({
    		url:"<%=request.getContextPath()%>/tree/getTreeListData.do",
    		 onClick:function (node){
    			 if (node.href!=null) { 
    				var has = $("#content_tabs").tabs('exists', node.text);
        			if (!has) {
    	    			$("#content_tabs").tabs('add',{
    	    				title:node.text,
    	    				closable:true,
    	    				href:"<%=request.getContextPath()%>/"+node.href
    	    			});
    				}else{
    					$("#content_tabs").tabs('select', node.text);
    				}
			 	}
    		}
    		
    	});
    
    
    </script>
</body>
</html>