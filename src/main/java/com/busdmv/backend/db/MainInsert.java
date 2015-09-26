/*
 * Класс для проверки работы записи данных в БД
 */
package com.busdmv.backend.db;

import java.sql.SQLException;

public class MainInsert {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        InsertDb in = new InsertDb("Имя", "текст тестовый2");
    }
}
