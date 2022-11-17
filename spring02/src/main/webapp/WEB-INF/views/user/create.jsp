<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Spring 2</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
        crossorigin="anonymous">
</head>
<body>

<div class="container-fluid">

    <header class="mb-2 p-4 text-center text-bg-secondary">
        <h1>Spring MVC &amp; MyBatis</h1>
        <h2>유저 작성 페이지</h2>    
    </header>
    
    <nav>
        <ul class="nav bg-light">
            <li class="nav-item">
                <c:url var="mainPage" value="/"></c:url>
                <a class="nav-link active" href="${ mainPage }">메인 페이지</a> 
            </li>
            <li class="nav-item">
                <c:url var="userListPage" value="/user/list"></c:url>
                <a class="nav-link active" href="${ userListPage }">목록 페이지</a> 
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">LINK 3</a> 
            </li>
        </ul>
    </nav>

    <main>
        <div class="card my-4">
            <form class="m-4" action="" method="post">
                <div class="my-2">
                    <label for="userName" class="form-label">이름</label>
                    <input id="userName" class="form-control" type="text" name="userName" required autofocus/>
                </div>
                <div class="my-2">
                    <label for="password" class="form-label">비밀번호</label>
                    <input id="password" class="form-control" type="password" name="password" required />
                </div>
                <div class="my-2">
                    <label for="email" class="form-label">이메일</label>
                    <input id="email" class="form-control" type="text" name="email" required />
                </div>
                <div class="my-2">
                    <input class="form-control btn btn-success" type="submit"  value="작성 완료" />
                </div>
            </form>
        </div>
    </main>

</div>
    
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" 
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" 
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
    crossorigin="anonymous"></script>
</body>
</html>