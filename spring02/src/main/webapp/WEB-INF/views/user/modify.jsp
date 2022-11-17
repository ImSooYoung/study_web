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
        <h2>유저 수정 페이지</h2>    
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

    <main class="my-4">
        <div class="card">
            <div class="card-header"></div>
            <div class="card-body">
                <form id="formModify">
                    <div class="my-2">
                        <label for="id" class="form-label">번호</label>
                        <input id="id" class="form-control"
                            type="text" name="id" value="${ user.id }" readonly />
                    </div>
                    <div class="my-2">
                        <label for="userName" class="form-label">이름</label>
                        <input id="userName" class="form-control"
                            type="text" name="userName" value="${ user.userName }" required autofocus />
                    </div>
                    <div class="my-2">
                        <label for="password" class="form-label">비밀번호</label>
                        <input id="password" class="form-control"
                            type="text" name="password" value="${ user.password }"  />
                    </div>
                    <div class="my-2">
                        <label for="email" class="form-label">이메일</label>
                        <input id="email" class="form-control"
                            type="text" name="email" value="${ user.email }"  />
                    </div>
                    <div class="my-2">
                        <button id="btnDelete" class="btn btn-danger">삭제</button>
                        <button id="btnUpdate" class="btn btn-success">업데이트</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

</div>
    
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" 
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" 
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
    crossorigin="anonymous"></script>
    
<c:url var="userDeletePage" value="/user/delete"></c:url>
<c:url var="userUpdatePage" value="/user/update"></c:url>

<script>
    // HTML 문서 로딩이 모두 끝난 이후에 function을 실행.

    const form = document.querySelector('#formModify');
    
    const btnDelete = document.querySelector('#btnDelete');
    
    btnDelete.addEventListener('click', function (event) {
        event.preventDefault(); // 버튼의 이벤트 처리 기본 동작(폼 제출)을 막음.
        const result = confirm('정말 삭제?');
        if (result) {
            form.action = '${ userDeletePage }'; // EL
            form.method = 'post';
            form.submit(); 
        }
    });
    
    const btnUpdate = document.querySelector('#btnUpdate');
    
    btnUpdate.addEventListener('click', function (event) {
        event.preventDefault();
        const result = confirm("정말 수정?");
        if (result) {
            const userName = document.querySelector("#userName").value;
            const password = document.querySelector("#password").value;
            const email = document.querySelector("#email").value;
            if (userName == '' || password == '' || email == '') {
                alert("내용은 반드식 입력!");
                return;
            }
            
            form.action = '${ userUpdatePage }';
            form.method = 'post';
            form.submit();
        }
    });
    
</script>

</body>
</html>