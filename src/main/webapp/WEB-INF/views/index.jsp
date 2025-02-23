<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Home</title>
  </head>
  <body>
    <%-- 머리말 --%>
    <jsp:include page="/common/header.jsp" />
 <img src="<c:url value='/resources/images/hirose.jpg' />" alt="hirose image">
    <jsp:include page="/common/footer.jsp" />
  </body>
</html>
