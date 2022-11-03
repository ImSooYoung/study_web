<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h1>포스트 등록 페이지</h1>
    <form method="post">
        <input type="number" name="id" placeholder="글 번호" required autofocus/>
        <br/>
        <input type="text" name="title" placeholder="글 제목" required/>
        <br/>
        <textarea rows="5" cols="30" name="content" placeholder="글 내용" required></textarea>
        <br/>
        <input type="datetime-local" name="createTime" required/>
        <br/>
        <input type="submit" value="등록" />
    </form>

</body>
</html>