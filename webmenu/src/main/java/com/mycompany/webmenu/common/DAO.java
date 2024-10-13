package com.mycompany.webmenu.common;

import java.sql.SQLException;
import java.util.List;

public interface DAO<T> {

    List<T> getAll() throws SQLException;

    T get(int id) throws SQLException;

    void save(T t) throws SQLException;

    void update(T t) throws SQLException;

    void delete(T t) throws SQLException;
}
