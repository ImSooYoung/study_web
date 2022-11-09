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
        <h1>유저 등록 페이지</h1>
        
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="user" value="/user"></c:url>
                    <a href="${ user }">목록 페이지</a>
                </li>
            </ul>
        </nav>
        
        <main>
            <form method="post">
                <div>
                    <input type="text" name="userName" placeholder="유저 이름" required autofocus />
                </div>
                <div>
                    <input type="text" name="password" placeholder="비밀번호" required />
                </div>
                <div>
                    <input type="text" name="email" placeholder="이메일" required />
                </div>
                <div>
                    <input type="number" name="points" placeholder="포인트" required />
                </div>
                <div>
                    <input type="submit" value="작성 완료" />
                </div>
            </form>
        </main>
    </div>

</body>
</html>