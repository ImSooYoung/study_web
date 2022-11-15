<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spring 2</title>
</head>
<body>
    
    <div>
        <div>
            <h1>포스트 상세 페이지</h1>
        </div>
        
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/home"></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="postListPage" value="/list"></c:url>
                    <a href="${ postListPage }">포스트 목록</a>
                </li>
                <li>
                    <c:url var="postModifyPage" value="/modify">
                        <c:param name="id" value="${ id }"></c:param>
                    </c:url>
                    <a href="${ postModifyPage }">포스트 수정</a>
                </li>
            </ul>
        </nav>
        
        <main>
            <form>
                <div>
                    <lable for="id">번호</lable>
                    <input id="id" type="text" value="${ id }" readonly />
                </div>
                <div>
                    <lable for="title">제목</lable>
                    <input id="title" type="text" value="${ title }" readonly />
                </div>
                <div>
                    <lable for="content">내용</lable>
                    <textarea id="content" type="text"readonly >${ content }</textarea>
                </div>
                <div>
                    <lable for="author">작성자</lable>
                    <input id="author" type="text" value="${ author }" readonly />
                </div>
                <div>
                    <lable for="createdTime">작성시간</lable>
                    <input id="createdTime" type="text" value="${ createdTime }" readonly />
                </div>
                <div>
                    <lable for="modifiedTime">수정시간</lable>
                    <input id="modifiedTime" type="text" value="${ modifiedTime }" readonly />
                </div>
            </form>
        </main>
        
    </div>


</body>
</html>