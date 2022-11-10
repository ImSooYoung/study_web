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
        * { list-style: none;}
        
        .tb { border:0px solid black; max-width:600px; margin:0 auto;}
        
        .tr_head {
            background: #ccc;
        }
        
        table, tr, th, td {
            border:0px solid black;
        }
        
        .a:hover  {
            color:red;
        }
        
    </style>
</head>
<body>
    <div class="container-fluid text-center">
        
        <nav class="row">
            
                
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a class="a" href="${ mainPage }">메인 페이지</a>
                </li>
                
                <li>
                    <c:url var="userCreatePage" value="/user/create"></c:url>
                    <a class="a" href="${ userCreatePage }">유저 등록</a>
                </li>
            </ul>
        </nav>
    
        <main class="row content">
            <table class="tb table table-striped">
                <thead>
                    <tr class="tr_head">
                        <th>번호</th>
                        <th>사용자 이름</th>
                        <th>이메일</th>
                        <th>포인트</th>                
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${ users }"> 
                    <tr>
                        <td>${ u.id }</td>
                        <td>
                            <c:url var="userDetailPage" value="/user/detail">
                                <c:param name="id" value="${ u.id }"></c:param>
                            </c:url>
                            <a class="a" href="${ userDetailPage }">${ u.userName }</a>
                        </td>
                        <td>${ u.email }</td>
                        <td>${ u.points }</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>  
        </main>    
        
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
    crossorigin="anonymous"></script>
</body>
</html>