<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
	<table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>�Խñ� ��</caption>
        <tbody>
            <tr>
                <th scope="row">�� ��ȣ</th>
                <td>${map.TITLE }</td>
                <th scope="row">��ȸ��</th>
                <td>${map.HIT_CNT }</td>
            </tr>
            <tr>
                <th scope="row">�ۼ���</th>
                <td>${map.CREA_ID }</td>
                <th scope="row">�ۼ��ð�</th>
                <td>${map.CREA_DTM }</td>
            </tr>
            <tr>
                <th scope="row">����</th>
                <td colspan="3">${map.TITLE }</td>
            </tr>
            <tr>
                <td colspan="4">${map.CONTENTS }</td>
            </tr>
        </tbody>
    </table>
    
    <a href="#this" class="btn" id="list">�������</a>
    <a href="#this" class="btn" id="update">�����ϱ�</a>
    
<%@ include file="/WEB-INF/include/include-body.jsp" %>
<script type="text/javascript">
	$(function(){
		$("#list").on("click", function(e){
			e.preventDefault();
			fn_openBoardList();
		});
		
		$("#update").on("click", function(e){
			e.preventDefault();
			fn_openBoardUpdate();
		});
	});
	
	function fn_openBoardList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
		comSubmit.submit();
	}
	
	function fn_openBoardUpdate(){
		var idx = "${map.IDX}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
		comSubmit.addParam("IDX", idx);
		comSubmit.submit();
	}
</script>
</body>
</html>