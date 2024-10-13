package com.mycompany.webmenu.common;

import com.mycompany.webmenu.dto.ProductDTO;
import com.mycompany.webmenu.utils.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class AbstractDAO<T> implements DAO<T> {
    protected Connection conn = DBUtil.getConnection();

}
