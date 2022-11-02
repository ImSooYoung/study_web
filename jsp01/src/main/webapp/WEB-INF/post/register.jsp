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
        <input type="number" name="id" placeholder="글 번호" required />
        <br/>
        <input type="text" name="title" placeholder="글 제목" />
        <br/>
        <textarea name="content" placeholder="글 내용"></textarea>
        <br/>
        <input type="datetime-local" name="createTime" />
        <br/>
        <input type="submit" value="등록" />
    </form>

</body>
</html>