<%--
  Created by IntelliJ IDEA.
  User: broDuck
  Date: 2016-01-09
  Time: 오전 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/memo/list">
    <input type="hidden" name="user_id" value="${user}">
</form>

</body>

<script>
function doPost() {
    document.getElementsByTagName("form")[0].submit();

}

    doPost();
</script>
</html>
