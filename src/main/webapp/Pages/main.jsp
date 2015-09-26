<%@page import="com.busdmv.backend.beans.Client"%>
<%@page import="com.busdmv.backend.beans.ClientList"%>
<%@page import="com.busdmv.backend.beans.Messages"%>
<%@page import="com.busdmv.backend.beans.MessagesList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Css/style_main.css" rel="stylesheet" type="text/css"/>
        <title>Интернет чат</title>
    </head>
    <body>
        <div class="main">

            <div class="description">
                <p class="title">Интернет чат</p>
                <div class="image">
                    <img src="../Images/chat.png" alt="Интернет чат" width="150" height="150">
                </div>
            </div>


            <div class="content">
                <div class="message_post">

                    <%
                        request.setCharacterEncoding("UTF-8");
                        if (request.getParameter("user_name") != null) {
                            session.setAttribute("user_name", request.getParameter("user_name"));
                        }
                    %>
                    Здравствуйте, <%=session.getAttribute("user_name")%> ! Введите сообщение и нажмите "Отправить", для отправки сообщения в чат.
                    <form name="message_post" action="insertData.jsp" method="POST">
                        <input type="text" name="message_post" size="100" />
                        <input type="submit" value="Отправить" />
                    </form>
                </div>
                <div class="author_list">
                    <form name="author_list">
                        Показать все сообщения пользователя:
                        <jsp:useBean id="clientList" class="com.busdmv.backend.beans.ClientList" scope="application"/>
                        <select name="clientList">
                            <% 
                                for (Client client : clientList.getClientList()) {
                            %>
                            <option><%=client.getClientId()%></option>
                            <%}%>
                        </select>
                        <input type="submit" value="Ok" />
                    </form>
                </div>
            </div>


            <div class="messages">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%">id</th>
                            <th style="width: 15%">client_id</th>
                            <th style="width: 80%">message</th>
                        </tr>
                    </thead>
                    <tbody>

                        <jsp:useBean id="messagesList" class="com.busdmv.backend.beans.MessagesList" scope="application"/>
                        <%
                            for (Messages messages : messagesList.getMessagesList()) {
                        %>
                        <tr>
                            <td><%=messages.getId()%></td>
                            <td><%=messages.getClientId()%></td>
                            <td><%=messages.getMessage()%></td>
                        </tr>
                        <%}%>

                    </tbody>
                </table>

            </div>

            <div>
                <p class="author">Разработчик: Бусыгин Дмитрий, 2015 г.</p>
            </div>
        </div>

    </body>
</html>
