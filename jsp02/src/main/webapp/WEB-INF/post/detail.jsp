<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2</title>
</head>
<body>

    <div>
        <div>
            <h1>포스트 상세 페이지</h1>
        </div>
        
        <nav>
            <ul>
                <c:if test="${ not empty signInUser }">
                    <li>
                        <span>${ signInUser }</span>
                        <c:url var="signOutPage" value="/user/signout"></c:url>
                        <a href="${ signOutPage }">로그아웃</a>
                    </li>
                </c:if>
                
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="postListPage" value="/post"></c:url>
                    <a href="${ postListPage }">포스트 목록</a>
                </li>
                
                <c:if test="${ signInUser == post.author }">
                    <li>
                        <c:url var="postModifyPage" value="/post/modify">
                            <c:param name="id" value="${ post.id }"></c:param>
                        </c:url>
                        <a href="${ postModifyPage }">포스트 수정</a>
                    </li>
                </c:if>
            </ul>
        </nav>
        
        <main>
            <form>
                <div>
                    <lable for="id">번호</lable>
                    <input id="id" type="text" value="${ post.id }" readonly />
                </div>
                <div>
                    <lable for="title">제목</lable>
                    <input id="title" type="text" value="${ post.title }" readonly />
                </div>
                <div>
                    <lable for="content">내용</lable>
                    <textarea id="content" type="text"readonly >${ post.content }</textarea>
                </div>
                <div>
                    <lable for="author">작성자</lable>
                    <input id="author" type="text" value="${ post.author }" readonly />
                </div>
                <div>
                    <lable for="createdTime">작성시간</lable>
                    <input id="createdTime" type="text" value="${ post.createdTime }" readonly />
                </div>
                <div>
                    <lable for="modifiedTime">수정시간</lable>
                    <input id="modifiedTime" type="text" value="${ post.modifiedTime }" readonly />
                </div>
            </form>
        </main>
    </div>
    
</body>
</html>