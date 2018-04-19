<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>

</head>
<body>
	<!-- easyUI  HTML 代码 -->
	<div id="easyui-panel"  data-options="fit:true" style="height:100%">
		<!-- <div id="easyui-panel" style="height:20%; padding:0px; margin:0px">
		  <form id="conditionForm">
		  
			员工姓名： <input class="easyui-searchbox" id="empName" data-options="searcher:searchEmp"/>
			员工编号： <input class="easyui-textbox" id="empName" data-options="searcher:searchEmp"/>
			员工部门：<select class="easyui-combobox" panelheight="auto" id="empDep"></select>
			部门编号：<select class="easyui-combobox" id="depCode"></select>
			 员工学历： <select class="easyui-combobox" id="empDegree">
							<option value="">请选择</option>
							<option value="1">高中</option>
							<option value="2">大学</option>
							<option value="3">傻货</option>
							<option value="4">神童</option>
						</select><p></p>
			员工的学历：<select class="easyui-combobox" style="width:100px" id="empDegreeB"></select>
			员工生日 ： <input class="easyui-datebox"  id="empMinBirthday" /> ~ <input class="easyui-datebox" id="empMaxBirthday" />
			 <div onclick="searchEmp()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</div>
			 <div onclick="searchEmpReset()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重置</div>
		</form>
		</div>  -->
		<div id="easyui-panel" style="height:80%; padding:0px; margin:0px">
			
			<!-- 个人头像 -->
			<div style="display: none">
				<div id="imgDiv">
					<img id="showImg" alt="none" width="50"/>
				</div>
			</div>
		
			<!-- 个人简介 -->
			<div  style="display: none">
				<div id="myIntroduceDiv">
					<!-- <div id="introduceA" class="easyui-linkbutton" data-options="iconCls:'icon-search'">简介</div> -->
					<a href="#" id="introduceA" class="easyui-linkbutton" plain="true" iconCls="icon-search"></a>
				</div>
			</div>
		
			<!-- 每行的操作按钮 -->
			<div style="display: none">
				<div id="actionDiv">
					<div id="editEmp" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</div>
					<div id="delEmp" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</div>
				</div>
			</div>
			<table id="goodsData"></table>  
			<!-- 定义工具栏 -->
			<div id="toolbarId">
				<div class="easyui-linkbutton" onclick="addGoods();" data-options="iconCls:'icon-add'">新增</div>
				<div class="easyui-linkbutton" onclick="deleteGoods();" data-options="iconCls:'icon-remove'">删除</div>
				<div class="easyui-linkbutton" onclick="editGoodsGloble();" data-options="iconCls:'icon-edit'">修改</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//===========================================================easyUI==begin=============================================================
	
	
		
	$(function(){
		$('#goodsData').datagrid({
		    url:'<%=request.getContextPath()%>/goods/toSelectGoodsList.do',
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
		    toolbar:"#toolbarId",
		    columns:[[
		        {field:'checkThis',checkbox:true,width:2},
		        {field:'goodsId',title:'商品ID',align:'center',width:90},    
		        {field:'goodsName',title:'商品名称',align:'center',width:90},    
		        {field:'goodsPrice',title:'商品价格',align:'center',width:90},    
		        {field:'goodsDate',title:'商品日期',align:'center',width:90},    
		        {field:'goodsTypeId',title:'商品类型',align:'center',width:90,
		        	formatter:function(value,row,index){
		        		if (value==1) {
							row.商品类型='清洁类';
							return row.商品类型;
						}
		        		if (value==2) {
		        			row.商品类型='食品类';
		        			return row.商品类型;
						}
		        		if (value==3) {
		        			row.商品类型='电器类';
							return row.商品类型;
						}
		        		if (value==4) {
		        			row.商品类型='其他类';
							return row.商品类型;
						}
		        	}	
		        },    
		         {field:'goodsImgId',title:'商品图',align:'center',width:90,
		        	formatter:function(value,row,index){
		        		$("#showImg").attr("src","${pageContext.request.contextPath}"+value);
		        		//$("#showImg").attr("src","<%=request.getContextPath()%>/goods/showGoodsImg.do?goodsImgId='+value+'");
		        		<%-- return '<img alt="none" class="img-responsive img-circle"   width="100" heigth="100" src="<%=request.getContextPath()%>/book/showBookImg.do?bookImgId='+value+'">'; --%>
		        		return $("#imgDiv").html();
		        	}	
		        }, 
		        
		    ]]
		});
	})
	
	function addGoods(){
		var addGoods=$("<div></div>").dialog({
			title:"新增",
			//content中的href 引用的内容
			href:"<%=request.getContextPath()%>/goods/addPage.do",
			//模态模式
			modal:true,
			width:800,
			height:600,
			//底部图标
			buttons:
				
				[{
					text:'取消',
					iconCls:"icon-cancel",
					handler:function(){
						addGoods.dialog("destroy");
					  }
				},{
					
					text:'保存',
					iconCls:"icon-add",
					handler:function(){
						//ajax向后台发送请求  成功回调函数中销毁对话框 刷新数据表格
						$.ajax({
							url:"<%=request.getContextPath()%>/goods/toSaveUpdate.do",
							type:"post",
							data:$("#addUpdateForm").serialize(),
							dataType:"",
							success:function (data){
								alert("新增数据ok");
								addGoods.dialog("destroy");
								$('#goodsData').datagrid("load");
							},error:function (){
								alert("新增失败");
							}
						})
						
					}
				}]
		})
	}
	
	
	
	//展示个人简历
<%-- 	function showIntroduce(empId, ename){
		var introduceModal = $("<div></div>").dialog({
			title:ename+"个人简历",
			href:"<%=request.getContextPath()%>/emp/toShowIntroducePage.do?hrmEmpId="+empId,
			modal:true,
			width:500,
			height:400,
			buttons:
				[{
					text:"关闭",
					iconCls:"icon-cancel",
					handler:function(){
						introduceModal.dialog("close");
					}
				}]
		})
	}
	
	
	//查询条件
	function searchEmp(){
		
		/* var empName = $("#empName").val();
		var empDegree = $("#empDegree").combobox("getValue");
		var empDegreeB = $("#empDegreeB").combobox("getValue");
		var empMinBirthday = $("#empMinBirthday").datebox("getValue");
		var empMaxBirthday = $("#empMaxBirthday").datebox("getValue");
		var empDep = $("#empDep").combobox("getValue"); */
		
		$('#easyui-datagrid').datagrid('load',{    
			hrmEmpName:empName,
			hrmEmpDegree:empDegree,
			minBirthday:empMinBirthday,
			maxBirthday:empMaxBirthday,
			hrmDepId:empDep,
		});
	}
	
	function searchEmpReset(){
		$("#conditionForm").form("reset");
		searchEmp();
	} %-->
	
	
	
	<%--function deleteEmp(){
		//alert(123);
		//获取要删除的员工信息的行对象  
	     var checkedRows = $('#easyui-datagrid').datagrid("getChecked");  
		 var delValue="";
	     if (checkedRows.length < 1) {  
	         $.messager.alert("提示","请选择要删除的数据");
	         return;
	     }else{
				$.messager.confirm("确认","确定要删除这条数据吗!",function(p){
			    	for (var i = 0; i < checkedRows.length; i++) {
			    		delValue+=checkedRows[i].hrmEmpId+",";
					}
				     alert("+++++"+delValue);
				     $.ajax({
							url:"<%=request.getContextPath()%>/emp/deleteEmp.do",
							type:"post",
							data:{'empids':delValue},
							dataType:"json",
							success:function (data){
								alert("成功删除"+data.flag+"条数据");
								$('#easyui-datagrid').datagrid("load");
							},error:function (){
								alert("删除失败");
							}
						})
	         }); 
	     }
	}
	//单删除
	function delThisEmp(eid){
		$.ajax({
			url:"<%=request.getContextPath()%>/emp/deleteEmp.do",
			type:"post",
			data:{'empids':eid},
			dataType:"json",
			success:function (data){
				alert("成功删除"+data.flag+"条数据");
				$('#easyui-datagrid').datagrid("load");
			},error:function (){
				alert("删除失败");
			}
		})
	}
	
	//单修改
	function editThisEmp(eid){
		var updateHrm=$("<div></div>").dialog({
			title:"修改",
			//content中的href 引用的内容
			href:"<%=request.getContextPath()%>/emp/editQueryEmp.do?hrmEmpId="+eid,
			//模态模式
			modal:true,
			width:520,
			height:620,
			//底部图标
			buttons:
				
				[{
					text:'取消',
					iconCls:"icon-cancel",
					handler:function(){
						updateHrm.dialog("destroy");
					  }
				},{
					
					text:'更新',
					iconCls:"icon-add",
					handler:function(){
						//alert($("#updateForm").serialize());
						//ajax向后台发送请求  成功回调函数中销毁对话框 刷新数据表格
						$.ajax({
							url:"<%=request.getContextPath()%>/emp/updateEmp.do",
							type:"post",
							data:$("#updateForm").serialize(),
							dataType:"json",
							success:function (data){
								$.messager.alert("Success！","更新"+data.flag+"条数据");
								updateHrm.dialog("destroy");
								$('#easyui-datagrid').datagrid("reload");
							},error:function (){
								$.messager.alert("Failed","更新失败");
							}
						})
						
					}
				}]
		})
	}
	
	//全局的但那个修改
	function editEmpGloble(){
		var checkedRows = $("#easyui-datagrid").datagrid("getChecked");
		var id = "";
		if (checkedRows.length<1) {
			$.messager.alert("警告！","请选择要修改的数据");
			return;
		}else if (checkedRows.length!=1) {alert(123);
			$.messager.alert("提示！","请选择其中的一条数据进行修改！");
			return;
		}else{
			for (var i = 0; i < checkedRows.length; i++) {
				id = checkedRows[i].hrmEmpId;
			}
			
		    
			var updateHrm=$("<div></div>").dialog({
				title:"修改",
				//content中的href 引用的内容
				href:"<%=request.getContextPath()%>/emp/editQueryEmp.do?hrmEmpId="+id,
				//模态模式
				modal:true,
				width:500,
				height:600,
				//底部图标
				buttons:
					
					[{
						text:'取消',
						iconCls:"icon-cancel",
						handler:function(){
							updateHrm.dialog("destroy");
						  }
					},{
						
						text:'更新',
						iconCls:"icon-add",
						handler:function(){
							alert($("#updateForm").serialize());
							//ajax向后台发送请求  成功回调函数中销毁对话框 刷新数据表格
							$.ajax({
								url:"<%=request.getContextPath()%>/emp/updateEmp.do",
								type:"post",
								data:$("#updateForm").serialize(),
								dataType:"json",
								success:function (data){
									$.messager.alert("Success！","更新"+data.flag+"条数据");
									updateHrm.dialog("destroy");
									$('#easyui-datagrid').datagrid("reload");
								},error:function (){
									$.messager.alert("Failed","更新失败");
								}
							})
							
						}
					}]
			})
					
		}
	}
	  --%>
	
	</script>
</body>
</html>