<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    
    <h1>포스트 등록 결과 페이지</h1>
    <div>
        <lable>글 번호</lable>
        <input type="text" name="id" value='${ post.id }' readonly/>
    </div>
    <div>
        <lable>글 제목</lable>
        <input type="text" name="title" value='${ post.title }' readonly/>
    </div>
    <div>
        <lable>글 내용</lable>
        <textarea rows="5" cols="30" "content" readonly>${ post.content }</textarea>
    </div>
    <div>
        <lable>작성 시간</lable>
        <input type="text" name="createTime" value='${ post.createTime }' readonly/>
    </div>


</body>
</html>