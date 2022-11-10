<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    
    <style>
        * { list-style:none;}
       
        ol, ul {
            padding:0 0;
        }
        
        a:hover {
            color:red;
        }
        
        .form1 {
            max-width:500px;
            margin: 0 auto;
        }
       
    </style>
</head>
<body>
    
    <div class="container-fluid text-center">
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
    
        <main class="row content">
            <form class="form1" style="border:1px solid black">
                <div  class="col">
                    <lable for="id" >번호</lable>
                    <input id="id" type="text" value="${ user.id }" readonly />
                </div>
                <div  class="col">
                    <lable for="userName">유저 이름</lable>
                    <input id="userName" type="text" value="${ user.userName }" readonly />
                </div>
                <div  class="col">
                    <lable for="password">비밀번호</lable>
                    <input id="password" type="text" value="${ user.password }" readonly />
                </div>
                <div  class="col">
                    <lable for="email">이메일</lable>
                    <input id="email" type="text" value="${ user.email }" readonly />
                </div>
                <div  class="col">
                    <lable for="points">포인트</lable>
                    <input id="points" type="text" value="${ user.points }" readonly />
                </div>
            </form>
        </main>
    
    </div>

</body>
</html>