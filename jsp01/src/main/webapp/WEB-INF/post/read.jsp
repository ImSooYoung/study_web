<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        td{
            border:1px solid black;
        }
    </style>
</head>
<body>

    <table>
        <thead>
            <tr>
                <td>번호</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성 시간</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${ list }">
                <tr>
                    <td>${ c.id }</td>
                    <td>${ c.title }</td>
                    <td>${ c.content }</td>
                    <td>${ c.createTime }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
</body>
</html>