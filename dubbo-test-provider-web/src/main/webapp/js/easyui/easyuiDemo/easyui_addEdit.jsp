<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form id="addUpdateForm">
	
		<input type="hidden" value="${gds.goodsId }" name="goodsId"/><p></p>
		商品名称<input class="easyui-textbox" value="${gds.goodsName }" name="goodsName"/><p></p>
		商品图 <input type="file" name="uploadImgName" id="toUpImg"/><p></p>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:$('#toUpImg').uploadify('upload','*')">开始上传</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-lock'" href="javascript:$('#toUpImg').uploadify('stopa')">停止上传</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:$('#toUpImg').uploadify('upload')">上传</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:$('#toUpImg').uploadify('cancel')">取消上传</a>
				<div id="fileQuence"></div>
				<div id="imgQuence"><img id="showImg" src="<%=request.getContextPath()%>/goods/showGoodsImg.do?goodsImgId=${gds.goodsImgId}" alt="none" ></div>
				<input type="hidden" value="${gds.goodsImgId }" name="goodsImgId"/>
		商品价格<input class="easyui-textbox" value="${gds.goodsPrice }" name="goodsPrice"/><p></p>
		商品日期<input class="easyui-datebox" value="${gds.goodsDate }" name="goodsDate"/><p></p>
		商品类型<select name="goodsTypeId">
					<option value="">请选择</option>
					<option <c:if test="${gds.goodsTypeId==1 }">selected</c:if> value="1">清洁类</option>
					<option <c:if test="${gds.goodsTypeId==2 }">selected</c:if> value="2">食品类</option>
					<option <c:if test="${gds.goodsTypeId==3 }">selected</c:if> value="3">电器类</option>
					<option <c:if test="${gds.goodsTypeId==4 }">selected</c:if> value="4">其他类</option>
				</select><p></p>
		<%-- 个人简介：<textarea name="hrmEmpIntroduce" class="easyui-kindeditor" style="width:100%;height:200px">${gds.hrmEmpIntroduce }</textarea> --%>
		<!-- <input type="button" name="update" value="修改"/> -->
	</form>
	<script type="text/javascript">
		
	//上传员工头像
	$(function(){
		//editor.readonly(true);   // 设置  kindeditor   修改时只读
		 $("#toUpImg").uploadify({
			'swf'     : '${pageContext.request.contextPath}/js/uploadify/privateUpload/uploadify.swf',//按钮的动画
			'uploader': '${pageContext.request.contextPath}/goods/uploadResumeFiles.do',
			'cancelImg': 'image/uploadify', //uploaddify 图片
			'queueID' :'fileQuence',  //  存放序列的地方
			'method'  : 'post',			
			'fileObjName' : 'goodsImgId',     //和后台的Action 属性驱动名字一样
			'sizeLimit':30,
			'progressData' :'percentage', //  设置上传进度显示方式，percentage显示上传百分比，speed显示上传速度
			'auto':false,   //是否自动  上传
			'multi': false,  //是否选择多个
			'removeCompleted' : false,// 上传完是否自动删除任务
			'fileSizeLimit': 0, // "4MB"  写0的话就是对 他不做限制
			'buttonText' :  '上传商品',
			'buttonCursor': 'head', // 光标的样子
			'fileTypeDesc' : 'mp4/avi/kux', // 你得告知  上传者    可以上传  什么类型的吧  与下面的那个属性连用
			'fileTypeExts' : '*.jpg;*.png;*.bmp',//  告诉 uploadify可以上传  什么类型的
			'uploadLimit': 1, //设置   上传时的上传文件数       超过就会触发 on
			//'onSelectError':uploadErrorMsg,
			'onUploadSuccess': function (file,data,response){  //  上传成功回掉函数
									var filePath=eval("("+data+")"); 
			alert(filePath);
									 //回显图片	
									$("#imgQuence").html(filePath.fileName +"<br>"+"<img width='100'  src='${pageContext.request.contextPath}/uploadImg/"+filePath.fileNameReal+"'>");
									// 保存路径
									$("[name='goodsImgId']").val("/uploadImg/"+filePath.fileNameReal);
								},
			'onUploadError' :function (file, errorCode, errorMsg, errorString){
								alert("上传失败/只能上传一个");	
							},
		});	
	})		
	
	
	//加载部门编号  以及 部门名称
	<%-- $(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/dep/toGetDep.do",
			type:"post",
			data:"",
			dataType:"json",
			async:false,
			success:function(data){
			   var depList = data.dep;
				var depNameHtml = '<option value="0">请选择</option>';
				var depCodeHtml = '<option value="0">请选择</option>';
				for (var i = 0; i < depList.length; i++) {
					depNameHtml += '<option value="'+depList[i].depId+'">'+depList[i].hrmDepName+'</option>';
					depCodeHtml += '<option value="'+depList[i].depId+'">'+depList[i].hrmDepCode+'</option>';
				}
				$("#empDepB").html(depNameHtml);
				$("#depCodeB").html(depCodeHtml);
				$("#empDepB").val($("#depNameID").val());
				$("#depCodeB").val($("#depNameID").val());
				/* $("#empDepB").combobox("setValue",$("#depNameID").combobox("getValue"));
				 $("#depCodeB").combobox("setValue",$("#depNameID").combobox("getValue"));*/
			},
			error:function(){
				alert("加载失败");
			}
		})
	})
	
	$(function(){
		$("#empDepB").combobox({
			onChange:function(){
				$("#depCodeB").combobox("setValue", $("#empDepB").combobox("getValue"));
			}
		})
	})
	
	$(function(){
		$("#depCodeB").combobox({
			onChange:function(){
				$("#empDepB").combobox("setValue", $("#depCodeB").combobox("getValue"));
			}
		})
	}) --%>
	
	
	
		<%-- $("[name='update']").click(
			function (){
				$.ajax({
					url:"<%=request.getContextPath() %>/emp/update.do",
					type:"post",
					data:$("form").serialize(),
					dataType:"json",
					async:true,
					success:function(date){
						alert("更新成功"+date.flag+"条信息");
						location.href = "<%=request.getContextPath() %>/emp/selectHrmList.do";
					},
					error:function(){
						alert("系统错误");
					}
			   })
			}		
		) --%>
	</script>
</body>
</html>