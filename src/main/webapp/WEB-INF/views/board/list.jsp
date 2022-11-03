<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
  	<script src="https://kit.fontawesome.com/e4a42c4ca5.js" crossorigin="anonymous"></script>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	</head>
	<body>
	  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="<c:url value='/'/>">
        <i class="fa-brands fa-freebsd"> market A</i>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
          <li class="nav-item1">
            <a class="nav-link active1" aria-current="page1" href="https://map.kakao.com/">상권 지도</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              커뮤니티
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">공지사항</a></li>
              <li><a class="dropdown-item" href="#">묻고 답하기</a></li>
              <li><a class="dropdown-item" href="<c:url value='/board/list'/>">자유 게시판</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              나의 공간
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">내 정보</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">내 기록</a></li>
              <li><a class="dropdown-item" href="#">북마크</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              사이트 소개
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">사이트 소개</a></li>
              <li><a class="dropdown-item" href="#">참고 사이트</a></li>
              <li><a class="dropdown-item" href="#">사이트맵</a></li>
            </ul>
          </li>
          <li class="nav-item3">
            <a class="nav-link active3" aria-current="page3" href="<c:url value='/signUp/login'/>">로그인</a>
          </li>
          <li class="nav-item4">
            <a class="nav-link active4" aria-current="page4" href="<c:url value='/resources/registerForm.html'/>">회원가입</a>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-secondary" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
  
  
		<div class="container">
			<header>
				<h1>게시판</h1>
			</header>
			<hr/>
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<section  class="shadow-sm p-3 mb-5 bg-body rounded" id="container">
				<form role="form" method="get">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						
						<tbody class="table-group-divider">
							<c:forEach items="${list}" var = "list">
								<tr>
									<td>
										<c:out value="${list.bno}"/>
									</td>
									<td>
										<a href="/board/readView?bno=${list.bno}&
															page=${scri.page}&
															perPageNum=${scri.perPageNum}&
															searchType=${scri.searchType}&
															keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
									</td>
									<td>
										<c:out value="${list.writer}" /></td>
									<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>	
					</table>
					
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
    					<select name="searchType" class="form-select" aria-label="Default select example">
      						<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색 범위</option>
      						<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      						<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      						<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      						<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    					</select>
						</div>
						
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
    						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
								&nbsp;&nbsp;&nbsp;
									<button id="searchBtn" type="button" class="btn btn-dark">검색</button>
								</span>
    					</div>
    				</div>
    				<script>
    				$(function(){
    			        $('#searchBtn').click(function() {
    			          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    			        });
    			      });  
    				</script>
  				</div>
  				
  				
					<div>
  					<ul class="pagination pagination-sm justify-content-center">
    					<c:if test="${pageMaker.prev}">
    						<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    					</c:if> 
    					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    						<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}"/>>
    						<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
    					</c:forEach>
    					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    					&nbsp;&nbsp;
    						<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    					</c:if> 
  						</ul>
					</div>
				</form>
			</section>
			<hr />
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	</body>
</html>