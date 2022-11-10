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
       
    </style>
</head>
<body>

    <div class="container-fluid text-center" >
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
        
        <main class="row content">
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
                    <input type="submit" value="작성완료" />
                </div>
            </form>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
    crossorigin="anonymous"></script>

</body>
</html>