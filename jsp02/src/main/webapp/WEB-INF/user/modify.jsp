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
            <h1>유저 수정 페이지</h1>
        </div>
    
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="userListpage" value="/user"></c:url>
                    <a href="${ userListpage }">유저 목록</a>
                </li>
                <li>
                    <c:url var="userDetailPage" value="/user/detail">
                        <c:param name="id" value="${ user.id }"></c:param>
                    </c:url>
                    <a href="${ userDetailPage }">유저 상세</a>
                </li>
            </ul>
        </nav>
        
        <main>
            <form id="userForm">
                <div>
                    <lable for="id">번호</lable>
                    <input id="id" type="text" name="id" value="${ user.id }" readonly />
                </div>
                <div>
                    <lable for="userName">유저 이름</lable>
                    <input id="userName" type="text" name="userName" value="${ user.userName }" />
                </div>
                <div>
                    <lable for="password">비밀번호</lable>
                    <input id="password" type="text" name="password" value="${ user.password }"  />
                </div>
                <div>
                    <lable for="email">이메일</lable>
                    <input id="email" type="text" name="email" value="${ user.email }" />
                </div>
                <div>
                    <lable for="points">포인트</lable>
                    <input id="points" type="text" name="points" value="${ user.points }" />
                </div>
                <div>
                    <button id="btnDelete">삭제</button>
                    <button id="btnUpdate">수정완료</button>
                </div>
            </form>
        </main>
    </div>
    
    <c:url var="userDeletePage" value="/user/delete"></c:url>
    <c:url var="usermodifyPage" value="/user/modify"></c:url>
    
    <script>
    const form = document.querySelector('#userForm');
    
    const btnDelete = document.querySelector("#btnDelete");
    
    btnDelete.addEventListener('click', function(event) {
        event.preventDefault();
        
        const check = confirm("정말 삭제?");
        if (check == true) { // 사용자 "확인"을 선택했을 때
            form.action = '${ userDeletePage }'; // 제출 요청 주소
            form.method = 'post'; // 제출 요청 방식
            form.submit(); // 서버로 제출(데이터 전송)
        }
    });
    
  
    const btnUpdate = document.querySelector("#btnUpdate");
    
    btnUpdate.addEventListener("click", function(event) {
    	event.preventDefault();
    	
    	const userName = document.querySelector("#userName").value;
    	
    	const password = document.querySelector("#password").value;
    	
    	const email = document.querySelector("#email").value;
    	
    	const points = document.querySelector("#points").value;
    	
    	if (userName == '' || password == '' || email == '' || points == '') {
    		alert("이름, 비밀번호, 이메일, 포인트를 입력해주세요. ")
    	}
    	
    	const check = confirm("정말 수정>");
    	if (check == true) {
            form.action = '${ postUpdatePage }';
            form.method = 'post';
            form.submit();
        }
    	
    });
   
    </script>

</body>
</html>