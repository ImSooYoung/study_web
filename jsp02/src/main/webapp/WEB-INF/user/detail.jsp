<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    <div>
        <div>
            <h1>유저 상세 페이지</h1>
        </div>
    
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="userListPage" value="/user"></c:url>
                    <a href="${ userListPage }">유저 목록</a>
                </li>
                <li>
                    <c:url var="userModifyPage" value="/user/modify">
                        <c:param name="id" value="${ user.id }"></c:param>
                    </c:url>
                    <a href="${ userModifyPage }">유저 수정</a>
                </li>
            </ul>
        </nav>
    
        <main>
            <form>
                <div>
                    <lable for="id">번호</lable>
                    <input id="id" type="text" value="${ user.id }" readonly />
                </div>
                <div>
                    <lable for="userName">유저 이름</lable>
                    <input id="userName" type="text" value="${ user.userName }" readonly />
                </div>
                <div>
                    <lable for="password">비밀번호</lable>
                    <input id="password" type="text" value="${ user.password }" readonly />
                </div>
                <div>
                    <lable for="email">이메일</lable>
                    <input id="email" type="text" value="${ user.email }" readonly />
                </div>
                <div>
                    <lable for="points">포인트</lable>
                    <input id="points" type="text" value="${ user.points }" readonly />
                </div>
            </form>
        </main>
    
    </div>

</body>
</html>