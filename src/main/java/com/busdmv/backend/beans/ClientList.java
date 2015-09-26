/*
 * Отображает список имен пользователей
 */
package com.busdmv.backend.beans;

import com.busdmv.backend.db.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClientList {

    private final ArrayList<Client> clientList = new ArrayList<>();
    private final String query = "select * from users";

    public ArrayList<Client> getClient() throws ClassNotFoundException, SQLException {
        try (Connection conn = Database.getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();) {

            while (rs.next()) {
                Client client = new Client();
                client.setClientId(rs.getString("client_id"));
                clientList.add(client);
            }

        }
        return clientList;
    }

    public ArrayList<Client> getClientList() throws ClassNotFoundException, SQLException {
        if (!clientList.isEmpty()) {
            return clientList;
        } else {
            return getClient();
        }
    }

}
