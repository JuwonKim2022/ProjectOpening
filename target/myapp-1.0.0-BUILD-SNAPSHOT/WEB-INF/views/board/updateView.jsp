<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	 	<script src="https://kit.fontawesome.com/e4a42c4ca5.js" crossorigin="anonymous"></script>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	 	
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&keyword=${scri.keyword}";
			})
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	<body>
	
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					
					<div class="shadow-sm p-3 mb-5 bg-body rounded">
						<div class="form-group ">
							<label for="title"  class="col-sm-2 control-label">제목</label>
							<input type="text" id="title" name="title" value="${update.title}" class="chk form-control" title="제목을 입력하세요."/>
						</div>
						<br/>
						<div class="form-group ">
							<label for="content" class="col-sm-2 control-label">내용</label>
							<textarea id="content" name="content" class="chk fulltext form-control" title="내용을 입력하세요." style="height: 330px;"><c:out value="${update.content}" /></textarea>
						</div>
						<br/>
						<div class="form-group">
							<div class="container text-center">
  							<div class="row">
    							<div class="col">
    								<label for="writer" class="col-sm-2 control-label">작성자</label>
      							<input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
    							</div>
    							<div class="col">
    								<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
    								<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>
    							</div>
  							</div>
							</div>
						</div>
					</div>	
					
					<div>
						<button type="submit" class="update_btn btn btn-success">저장</button>
						<button type="submit" class="cancel_btn btn btn-danger">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	</body>
</html>