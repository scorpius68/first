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
<h2>�Խ��� ���</h2>
<table style="border:1px solid #ccc">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">�۹�ȣ</th>
            <th scope="col">����</th>
            <th scope="col">��ȸ��</th>
            <th scope="col">�ۼ���</th>
        </tr>
    </thead>
    <tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0 }">
				<c:forEach items="${list }" var="row">
					<tr>
						<td>${row.IDX }</td>
						<td class="title">
							<a href="#this" name="title">${row.TITLE }</a></td>
							<input type="hidden" name="idx" value="${row.IDX }" />
						<td>${row.HIT_CNT }</td>
						<td>${row.CREA_DTM }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">��ȸ�� ����� �����ϴ�.</td>
				</tr>
			</c:otherwise>
		</c:choose>
    </tbody>
</table>
<br/>
<a href="#this" class="btn" id="write">�۾���</a>
<%@ include file="/WEB-INF/include/include-body.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#write").on("click", function(e){
			e.preventDefault();
			fn_openBoardWrite();
		});
		
		$("a[name=title]").on("click", function(e){
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	});
	
	function fn_openBoardWrite(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
		comSubmit.submit();
	}
	
	function fn_openBoardDetaion(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
		comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
		comSubmit.submit();
	}
</script>
</body>
</html>