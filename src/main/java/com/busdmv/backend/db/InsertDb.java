/*
 * Класс для записи данных в БД
 */
package com.busdmv.backend.db;

import com.busdmv.backend.beans.Client;
import com.busdmv.backend.beans.ClientList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertDb {

    public InsertDb(String client_id, String message) throws ClassNotFoundException, SQLException {

        PreparedStatement psUsers = null;
        PreparedStatement psMessages = null;
        String sqlUsers = "insert into users (client_id) values (?)";
        String sqlMessages = "insert into messages (client_id, message) values (?, ?)";

        try (Connection conn = Database.getConnection();) {
            // Получаем список пользователей в String списке
            ClientList cl = new ClientList();
            ArrayList<Client> clients = cl.getClientList();
            ArrayList<String> clientsString = new ArrayList<>();
            for (Client temp : clients) {
                clientsString.add(temp.getClientId());
            }
            // Если список пользователей не содержит client_id
            if (!clientsString.contains(client_id)) {
                // то занести нового пользователя в БД
                psUsers = conn.prepareStatement(sqlUsers);
                psUsers.setString(1, client_id);
                psUsers.executeUpdate();
            }

            psMessages = conn.prepareStatement(sqlMessages);
            psMessages.setString(1, client_id);
            psMessages.setString(2, message);
            psMessages.executeUpdate();

            if (psUsers != null) {
                psUsers.close();
            }
            if (psMessages != null) {
                psMessages.close();
            }
        }
    }
}
