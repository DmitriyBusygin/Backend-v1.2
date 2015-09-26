<%@page import="com.busdmv.backend.db.InsertDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Добавление в БД - Успешно!</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            if (request.getParameter("user_name") != null) {
                session.setAttribute("user_name", request.getParameter("user_name"));
            }
            if (request.getParameter("message_post") != null) {
                session.setAttribute("message_post", request.getParameter("message_post"));
            }
        %>

        <%
            String name = session.getAttribute("user_name").toString(); //так правильно?
            String message = request.getParameter("message_post"); //или так?
            InsertDb insertDb = new InsertDb(name, message);
        %>

        <p>Ваше сообщение успешно добавлено в БД. <br>
            Для отображения всех сообщений пожалуйста соберите проект заново. Или чтобы добавить еще сообщения в БД перейдите по ссылке</p>
        <a href="main.jsp">Отправить еще сообщение</a>

    </body>
</html>
