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
<script type="text/javascript">

var setting = {
		async: {
			enable: true,
			url:"<%=request.getContextPath()%>/treeController/asyncTreeList.do",
			autoParam:["id"],
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "pid",
			},
			key:{
				url:"Xurl",
			}
		},
		
		callback: {
			onClick: zTreeOnClick
		}
		
	};

	function zTreeOnClick(event, treeId, treeNode) {
	   // alert(treeNode.tId + ", " + treeNode.name);
	   
	   if(treeNode!=null){
		 //获得父节点的名称和id
		   var parentNode  =treeNode.getParentNode();
		   $("#async_parentId").text(parentNode.id);
		   $("#async_parentName").text(parentNode.name);
		   $("#pid").val(parentNode.id);
		   $("#id").val(treeNode.id);
		   $("#name").val(treeNode.name);
		   $("#icon").val(treeNode.icon);
		   $("#target").val(treeNode.target);
		   $("#type").val(treeNode.type);
	   }else{
		   $("#async_parentId").text("");
		   $("#async_parentName").text("");
		   $("#pid").val("");
		   $("#id").val("");
		   $("#name").val("");
		   $("#icon").val("");
		   $("#target").val("");
		   $("#type").val("");
	   }
	   
	  
	   
	};
	
	function updateAfterSave(){
		$.ajax({
			url:"<%=request.getContextPath()%>/treeController/updateAfterSave.do",
			data:$("#async_form").serialize(),
			dataType:"json",
			type:"post",
			success:function(tree){
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				var nodes = treeObj.getSelectedNodes();
				alert(nodes[0].name);
				if (nodes.length>0) {
					nodes[0].name = tree.name;
					nodes[0].pid=tree.pid;
					nodes[0].url=tree.url;
					nodes[0].target=tree.target;
					nodes[0].type=tree.type;
					nodes[0].icon=tree.icon;
					treeObj.updateNode(nodes[0]);
				}
			},error:function(){
				alert("修改失败");
			}
			
		})
	}
	
	function deleteTree(){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/treeController/deleteTree.do",
			data:$("#async_form").serialize(),
			type:"post",
			success:function(data){
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				var nodes = treeObj.getSelectedNodes();
			    treeObj.removeNode(nodes[0]);
			    $("#async_parentId").text("");
				   $("#async_parentName").text("");
				   $("#pid").val("");
				   $("#id").val("");
				   $("#name").val("");
				   $("#icon").val("");
				   $("#target").val("");
				   $("#type").val("");
			},
			error:function(){
				alert("失败");
			}
		})
		
	}
	
	function addTreeNode(){
		$("#updateAfterSaveBtn").hide();
		$("#addTreeBtn").hide();
		$("#deleteTreeBtn").hide();
		$("#addAfterSaveBtn").show();
	}

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting);
		$("#addAfterSaveBtn").hide();
	});


</script>
  <div style="border:1px red solid;width: 300px;height: 400px;margin-top: 10px;margin-left: 10px;float: left;">
   <div id="treeDemo" class="ztree"></div>
</div>
   <div style="border: 1px green solid ;width: 500px;height: 400px;margin-top: 10px;margin-left: 10px;float: left;">
    <div style="margin-top: 3px">
       <input type="button" value="修改后保存" id="updateAfterSaveBtn" onclick="updateAfterSave()">
       <input type="button" value="新建菜单" id="addTreeBtn" onclick="addTreeNode()">
       <input type="button" value="删除菜单" id="deleteTreeBtn" onclick="deleteTree()">
       <input type="button" value="新建后保存" id="addAfterSaveBtn" onclick="addAfterSave()">
    </div>
    <div style="margin-top: 3px">
      <form id="async_form">
         &nbsp; &nbsp; &nbsp; &nbsp;父节点Id： &nbsp; &nbsp; &nbsp; &nbsp;<span id="async_parentId"></span>
           <input type="hidden" id="pid" name="pid">
         <br><br> 
          &nbsp; &nbsp; &nbsp; &nbsp;父节点名称： &nbsp; &nbsp; &nbsp; &nbsp;<span id="async_parentName">
          </span>
            <input type="hidden" id="id" name="id">
          <br><br>
         &nbsp; &nbsp; &nbsp; &nbsp;节点名称： &nbsp; &nbsp; <input type="text" id="name" name="name" width="188px"><br><br>
         &nbsp; &nbsp; &nbsp; &nbsp;节点图标：    &nbsp; &nbsp;<input type="text" id="icon" name="icon"  width="188px"><br><br>
    &nbsp; &nbsp; &nbsp; &nbsp;   URL： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="text" id="url" name="url"  width="188px"><br><br> 
       &nbsp; &nbsp; &nbsp; &nbsp;展开方式：<select id="target" name="target"  width="188px">
          <option value="_blank">_blank</option>
          <option value="_parent">_parent</option>
          <option value="_top">_top</option>
          <option value="_self">_self</option>
          <option value="main">main</option>
      </select><br><br>
      &nbsp; &nbsp; &nbsp; &nbsp; 菜单类型：<select id="type" name="type"  width="188px">
          <option value="0">菜单</option>
          <option value="1">功能</option>
      </select>
      </form>
    </div>
 
 
 </div>
</body>

</html>