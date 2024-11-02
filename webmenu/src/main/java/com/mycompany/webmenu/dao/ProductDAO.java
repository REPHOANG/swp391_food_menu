package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.ImageProductDto;
import com.mycompany.webmenu.dto.ProductDto;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductDAO {

    public List<ProductDto> getListAllProduct(int page, int pageSize) throws SQLException {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT x1.product_id AS productId, x1.name, x1.price, x1.description, " +
                "x1.created_by AS createdBy, x1.created_at AS createAt, " +
                "x2.url AS urlImage, x3.category_id AS categoryId, x3.name AS categoryName " +
                "FROM Products x1 " +
                "LEFT JOIN ImageProducts x2 ON (x2.product_id = x1.product_id AND x2.is_main_image = 1) " +
                "JOIN Categories x3 ON x3.category_id = x1.category_id " +
                "ORDER BY x1.product_id DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {

            stm.setInt(1, offset);
            stm.setInt(2, pageSize);

            try (ResultSet rs = stm.executeQuery()) {
                List<ProductDto> list = new ArrayList<>();

                // Lặp qua kết quả truy vấn
                while (rs.next()) {
                    ProductDto dto = new ProductDto();
                    dto.setProductId(rs.getInt("productId"));             // ID sản phẩm
                    dto.setPrice(rs.getDouble("price"));                  // Giá sản phẩm
                    dto.setName(rs.getString("name"));                    // Tên sản phẩm
                    dto.setDescription(rs.getString("description"));      // Mô tả sản phẩm
                    dto.setCreatedBy(rs.getInt("createdBy"));             // ID người tạo
                    dto.setCreateAt(rs.getDate("createAt"));              // Ngày tạo
                    dto.setCategoryId(rs.getInt("categoryId"));           // ID danh mục
                    dto.setCategoryName(rs.getString("categoryName"));    // Tên danh mục

                    // Tạo đối tượng ImageProductDTO cho ảnh chính
                    ImageProductDto imageProductDTO = new ImageProductDto();
                    imageProductDTO.setUrl(rs.getString("urlImage"));
                    dto.setMainImg(imageProductDTO);                      // Đặt ảnh chính vào ProductDTO

                    list.add(dto); // Thêm đối tượng ProductDTO vào danh sách
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            throw e; // Ném lại lỗi để xử lý ở nơi gọi
        }
    }

    public List<ProductDto> getListAllProduct(
            int page, int pageSize, String productName,
            Double priceFrom, Double priceTo, List<Integer> listCategoryIds
    ) throws SQLException {
        int offset = (page - 1) * pageSize;
        StringBuilder sql = new StringBuilder(
                "SELECT x1.product_id AS productId, x1.name, x1.price, x1.description, " +
                        "x1.created_by AS createdBy, x1.created_at AS createAt, " +
                        "x2.url AS urlImage, x3.category_id AS categoryId, x3.name AS categoryName " +
                        "FROM Products x1 " +
                        "LEFT JOIN ImageProducts x2 ON (x2.product_id = x1.product_id AND x2.is_main_image = 1) " +
                        "JOIN Categories x3 ON x3.category_id = x1.category_id " +
                        "WHERE 1=1 "
        );

        // Thêm điều kiện lọc nếu có
        List<Object> parameters = new ArrayList<>();
        if (productName != null && !productName.isEmpty()) {
            sql.append("AND x1.name LIKE ? ");
            parameters.add("%" + productName + "%");
        }
        if (priceFrom != null) {
            sql.append("AND x1.price >= ? ");
            parameters.add(priceFrom);
        }
        if (priceTo != null) {
            sql.append("AND x1.price <= ? ");
            parameters.add(priceTo);
        }
        if (listCategoryIds != null && !listCategoryIds.isEmpty()) {
            sql.append("AND x3.category_id IN (");
            sql.append(listCategoryIds.stream().map(id -> "?").collect(Collectors.joining(", ")));
            sql.append(") ");
            parameters.addAll(listCategoryIds);
        }

        // Thêm điều kiện phân trang
        sql.append("ORDER BY x1.product_id DESC ");
        sql.append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        // Thêm offset và pageSize vào danh sách tham số
        parameters.add(offset);
        parameters.add(pageSize);

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql.toString())) {

            // Thiết lập tham số cho PreparedStatement
            for (int i = 0; i < parameters.size(); i++) {
                stm.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = stm.executeQuery()) {
                List<ProductDto> list = new ArrayList<>();

                // Lặp qua kết quả truy vấn
                while (rs.next()) {
                    ProductDto dto = new ProductDto();
                    dto.setProductId(rs.getInt("productId"));
                    dto.setPrice(rs.getDouble("price"));
                    dto.setName(rs.getString("name"));
                    dto.setDescription(rs.getString("description"));
                    dto.setCreatedBy(rs.getInt("createdBy"));
                    dto.setCreateAt(rs.getDate("createAt"));
                    dto.setCategoryId(rs.getInt("categoryId"));
                    dto.setCategoryName(rs.getString("categoryName"));

                    // Tạo đối tượng ImageProductDTO cho ảnh chính
                    ImageProductDto imageProductDTO = new ImageProductDto();
                    imageProductDTO.setUrl(rs.getString("urlImage"));
                    dto.setMainImg(imageProductDTO);

                    list.add(dto);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }


    // Phương thức để đếm tổng số sản phẩm
    public int getTotalProductCount() {
        String query = "SELECT COUNT(product_id) AS total FROM Products";
        try (Connection conn = DBUtil.getConnection(); // Sử dụng try-with-resources để tự động đóng kết nối
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) { // Tự động đóng statement và result set
            if (rs.next()) {
                return rs.getInt("total"); // Trả về tổng số sản phẩm ngay lập tức
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            return 0; // Ném lại lỗi để xử lý ở nơi gọi
        }
        return 0; // Trả về 0 nếu không có sản phẩm
    }

    public int getTotalProductCount(String productName, Double priceFrom, Double priceTo, List<Integer> listCategoryIds) {
        StringBuilder query = new StringBuilder("SELECT COUNT(product_id) AS total FROM Products WHERE 1=1");
        // Thêm điều kiện lọc nếu các tham số không null
        if (productName != null && !productName.isEmpty()) {
            query.append(" AND product_name LIKE ?");
        }
        if (priceFrom != null) {
            query.append(" AND price >= ?");
        }
        if (priceTo != null) {
            query.append(" AND price <= ?");
        }
        if (listCategoryIds != null && !listCategoryIds.isEmpty()) {
            query.append(" AND category_id IN (");
            query.append("?,".repeat(listCategoryIds.size()).replaceAll(",$", "")); // Tạo danh sách các dấu hỏi tương ứng với số lượng ID
            query.append(")");
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;
            // Thiết lập các giá trị tham số
            if (productName != null && !productName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + productName + "%"); // Sử dụng LIKE với ký tự đại diện
            }
            if (priceFrom != null) {
                stmt.setDouble(paramIndex++, priceFrom);
            }
            if (priceTo != null) {
                stmt.setDouble(paramIndex++, priceTo);
            }
            if (listCategoryIds != null && !listCategoryIds.isEmpty()) {
                for (Integer categoryId : listCategoryIds) {
                    stmt.setInt(paramIndex++, categoryId); // Thêm từng ID trong danh sách category
                }
            }
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total"); // Trả về tổng số sản phẩm
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Trả về 0 nếu có lỗi
        }
        return 0; // Trả về 0 nếu không có sản phẩm
    }


    @SneakyThrows
    public ProductDto getProductDetail(Integer productId) {
        String sql = "SELECT x1.product_id AS productId, x1.category_id AS categoryId, x1.name, " +
                "x1.price, x1.description, x1.created_by AS createdBy, x1.created_at AS createAt " +
                "FROM Products x1 " +
                "WHERE x1.product_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {

            stm.setInt(1, productId); // Đặt tham số productId

            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    // Tạo và trả về ProductDTO từ kết quả truy vấn
                    // Tạo đối tượng ProductDto và thiết lập các giá trị bằng setter
                    ProductDto product = new ProductDto();
                    product.setProductId(rs.getInt("productId"));               // ID sản phẩm
                    product.setCategoryId(rs.getInt("categoryId"));             // ID danh mục
                    product.setName(rs.getString("name"));                      // Tên sản phẩm
                    product.setPrice(rs.getDouble("price"));                    // Giá sản phẩm
                    product.setDescription(rs.getString("description"));        // Mô tả sản phẩm
                    product.setCreatedBy(rs.getInt("createdBy"));               // ID người tạo
                    product.setCreateAt(rs.getDate("createAt"));                // Ngày tạo
                    product.setMainImg(this.getMainImage(conn, productId));     // Lấy ảnh chính
                    product.setImgs(this.getAllImages(conn, productId));        // Lấy tất cả các ảnh của sản phẩm

                    return product;

                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            throw e; // Ném lại lỗi để xử lý ở nơi gọi
        }
        return null; // Trả về null nếu không tìm thấy sản phẩm
    }

    // Method to retrieve the main image
    private ImageProductDto getMainImage(Connection conn, Integer productId) throws SQLException {
        String sqlMainImg = "SELECT x1.image_id AS imageId, x1.product_id AS productId, x1.url, x1.is_main_image AS isMainImage " +
                "FROM ImageProducts x1 " +
                "WHERE x1.is_main_image = 1 AND x1.product_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sqlMainImg)) {
            stmt.setInt(1, productId); // Đặt tham số productId cho truy vấn
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return ImageProductDto.builder()
                            .imageId(rs.getInt("imageId"))              // ID hình ảnh
                            .productId(rs.getInt("productId"))          // ID sản phẩm
                            .url(rs.getString("url"))                   // URL hình ảnh
                            .isMainImage(rs.getBoolean("isMainImage"))  // Đánh dấu ảnh chính
                            .build();
                }
            }
        }
        return null; // Trả về null nếu không tìm thấy ảnh chính
    }

    // Method to retrieve all images except the main image
    private List<ImageProductDto> getAllImages(Connection conn, Integer productId) throws SQLException {
        List<ImageProductDto> images = new ArrayList<>();
        String sqlImgs = "SELECT x1.image_id AS imageId, x1.product_id AS productId, x1.url, x1.is_main_image AS isMainImage " +
                "FROM ImageProducts x1 " +
                "WHERE x1.is_main_image = 0 AND x1.product_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sqlImgs)) {
            stmt.setInt(1, productId); // Đặt tham số productId cho truy vấn
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ImageProductDto img = ImageProductDto.builder()
                            .imageId(rs.getInt("imageId"))              // ID hình ảnh
                            .productId(rs.getInt("productId"))          // ID sản phẩm
                            .url(rs.getString("url"))                   // URL hình ảnh
                            .isMainImage(rs.getBoolean("isMainImage"))  // Đánh dấu là ảnh phụ
                            .build();
                    images.add(img); // Thêm ảnh vào danh sách
                }
            }
        }
        return images; // Trả về danh sách các ảnh phụ
    }

    @SneakyThrows
    public boolean insertProductAndImages(ProductDto product) {
        Connection conn = null;
        PreparedStatement productStmt = null;
        PreparedStatement imageStmt = null;
        boolean success = false;

        String productSQL = "INSERT INTO Products (category_id, price, name, description, created_by, created_at, approved_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        String imageSQL = "INSERT INTO ImageProducts (product_id, url, is_main_image) VALUES (?, ?, ?)";

        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Chèn đối tượng Product
            productStmt = conn.prepareStatement(productSQL, Statement.RETURN_GENERATED_KEYS);
            productStmt.setInt(1, product.getCategoryId());
            productStmt.setDouble(2, product.getPrice());
            productStmt.setString(3, product.getName());
            productStmt.setString(4, product.getDescription());

            if (product.getCreatedBy() != null) {
                productStmt.setInt(5, product.getCreatedBy()); // ID người tạo
            } else {
                productStmt.setNull(5, java.sql.Types.INTEGER);
            }

            productStmt.setDate(6, new java.sql.Date(System.currentTimeMillis())); // Ngày tạo
            productStmt.setDate(7, new java.sql.Date(System.currentTimeMillis())); // Ngày phê duyệt
            int productRowsAffected = productStmt.executeUpdate();

            // Kiểm tra chèn thành công sản phẩm
            if (productRowsAffected == 0) {
                throw new SQLException("Failed to insert product.");
            }

            // Lấy ID của Product vừa chèn
            ResultSet rs = productStmt.getGeneratedKeys();
            if (rs.next()) {
                int productId = rs.getInt(1);
                product.setProductId(productId); // Gán ID vào ProductDTO
            } else {
                return false;
            }

            // Chuẩn bị cho câu lệnh chèn ảnh
            imageStmt = conn.prepareStatement(imageSQL);

            // Chèn ảnh chính (mainImg) nếu có
            if (product.getMainImg() != null) {
                ImageProductDto mainImg = product.getMainImg();
                imageStmt.setInt(1, product.getProductId()); // Liên kết với Product vừa tạo
                imageStmt.setString(2, mainImg.getUrl());
                imageStmt.setBoolean(3, true); // Đánh dấu là ảnh chính
                imageStmt.addBatch();
            }

            // Chèn các ảnh phụ (imgs) nếu có
            for (ImageProductDto img : product.getImgs()) {
                imageStmt.setInt(1, product.getProductId()); // Liên kết với Product vừa tạo
                imageStmt.setString(2, img.getUrl());
                imageStmt.setBoolean(3, false); // Đánh dấu là ảnh phụ
                imageStmt.addBatch();
            }

            // Thực thi batch cho tất cả ảnh
            imageStmt.executeBatch();

            // Commit transaction
            conn.commit();
            success = true; // Đánh dấu thành công nếu không có lỗi
        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback(); // Rollback nếu có lỗi
            }
            e.printStackTrace();
        } finally {
            // Đóng các resource
            if (productStmt != null) productStmt.close();
            if (imageStmt != null) imageStmt.close();
            if (conn != null) conn.close();
        }
        return success;
    }

    @SneakyThrows
    public boolean updateProductWithImages(ProductDto product) {
        Connection conn = DBUtil.getConnection();

        // Lấy danh sách image_id hiện tại của sản phẩm
        String sqlGetImageProduct = "SELECT image_id FROM ImageProducts WHERE product_id = ?";
        PreparedStatement getImageProduct = conn.prepareStatement(sqlGetImageProduct);
        getImageProduct.setInt(1, product.getProductId());
        ResultSet rs = getImageProduct.executeQuery();
        List<Integer> imageIdsPrevious = new ArrayList<>();
        while (rs.next()) {
            imageIdsPrevious.add(rs.getInt("image_id"));
        }
        rs.close();
        getImageProduct.close();

        // Lấy danh sách image_id mới từ product DTO
        List<Integer> imageIdsNew = new ArrayList<>();
        if (product.getMainImg() != null && product.getMainImg().getImageId() != null) {
            imageIdsNew.add(product.getMainImg().getImageId());
        }
        for (ImageProductDto img : product.getImgs()) {
            if (img.getImageId() != null) {
                imageIdsNew.add(img.getImageId());
            }
        }

        // Loại bỏ các image_id mới khỏi danh sách cũ để chỉ còn lại những ảnh cần xóa
        imageIdsPrevious.removeAll(imageIdsNew);

        // Câu lệnh cập nhật sản phẩm và ảnh
        String productUpdateQuery = "UPDATE Products SET category_id = ?, price = ?, name = ?, description = ?, created_by = ?, approved_at = ? WHERE product_id = ?";
        String imageUpdateQuery = "UPDATE ImageProducts SET url = ?, is_main_image = ? WHERE image_id = ? AND product_id = ?";
        String imageInsertQuery = "INSERT INTO ImageProducts (product_id, url, is_main_image) VALUES (?, ?, ?)";

        PreparedStatement productStmt = conn.prepareStatement(productUpdateQuery);
        PreparedStatement imgUpdateStmt = conn.prepareStatement(imageUpdateQuery);
        PreparedStatement imgInsertStmt = conn.prepareStatement(imageInsertQuery);
        boolean isSuccess = false;

        try {
            // Bắt đầu giao dịch
            conn.setAutoCommit(false);

            // Cập nhật thông tin sản phẩm
            productStmt.setInt(1, product.getCategoryId());
            productStmt.setDouble(2, product.getPrice());
            productStmt.setString(3, product.getName());
            productStmt.setString(4, product.getDescription());
            if (product.getCreatedBy() != null) {
                productStmt.setInt(5, product.getCreatedBy());
            } else {
                productStmt.setNull(5, java.sql.Types.INTEGER);
            }
            productStmt.setTimestamp(6, new Timestamp(System.currentTimeMillis())); // Ngày phê duyệt
            productStmt.setInt(7, product.getProductId()); // Cập nhật theo product_id
            int productRowsAffected = productStmt.executeUpdate();
            if (productRowsAffected == 0) {
                return false;
            }

            // Cập nhật hoặc thêm hình ảnh chính
            if (product.getMainImg() != null) {
                ImageProductDto mainImg = product.getMainImg();
                if (mainImg.getImageId() != null && mainImg.getImageId() != 0) {
                    imgUpdateStmt.setString(1, mainImg.getUrl());
                    imgUpdateStmt.setBoolean(2, true); // Đây là ảnh chính
                    imgUpdateStmt.setInt(3, mainImg.getImageId());
                    imgUpdateStmt.setInt(4, product.getProductId());
                    imgUpdateStmt.addBatch(); // Thêm vào batch cập nhật
                } else {
                    imgInsertStmt.setInt(1, product.getProductId());
                    imgInsertStmt.setString(2, mainImg.getUrl());
                    imgInsertStmt.setBoolean(3, true); // Đây là ảnh chính
                    imgInsertStmt.addBatch(); // Thêm vào batch chèn mới
                }
            }

            // Cập nhật hoặc thêm các hình ảnh phụ
            for (ImageProductDto img : product.getImgs()) {
                if (img.getImageId() != null && img.getImageId() != 0) {
                    // Cập nhật ảnh đã tồn tại
                    imgUpdateStmt.setString(1, img.getUrl());
                    imgUpdateStmt.setBoolean(2, false); // Đây là ảnh phụ
                    imgUpdateStmt.setInt(3, img.getImageId());
                    imgUpdateStmt.setInt(4, product.getProductId());
                    imgUpdateStmt.addBatch();
                } else {
                    // Thêm ảnh mới
                    imgInsertStmt.setInt(1, product.getProductId());
                    imgInsertStmt.setString(2, img.getUrl());
                    imgInsertStmt.setBoolean(3, false); // Đây là ảnh phụ
                    imgInsertStmt.addBatch();
                }
            }

            // Thực thi batch cập nhật và chèn ảnh
            imgUpdateStmt.executeBatch();
            imgInsertStmt.executeBatch();

            // Xóa ảnh cũ không còn sử dụng
            if (!imageIdsPrevious.isEmpty()) {
                String deleteImageQuery = "DELETE FROM ImageProducts WHERE product_id = ? AND image_id IN (" +
                        imageIdsPrevious.stream().map(id -> "?").collect(Collectors.joining(",")) + ")";
                PreparedStatement deleteImageStmt = conn.prepareStatement(deleteImageQuery);
                deleteImageStmt.setInt(1, product.getProductId());
                for (int i = 0; i < imageIdsPrevious.size(); i++) {
                    deleteImageStmt.setInt(i + 2, imageIdsPrevious.get(i));
                }
                deleteImageStmt.executeUpdate();
                deleteImageStmt.close();
            }

            // Commit transaction nếu tất cả thành công
            conn.commit();
            isSuccess = true;

        } catch (SQLException e) {
            conn.rollback();
            e.printStackTrace();
        } finally {
            conn.setAutoCommit(true);
            if (productStmt != null) productStmt.close();
            if (imgUpdateStmt != null) imgUpdateStmt.close();
            if (imgInsertStmt != null) imgInsertStmt.close();
            conn.close();
        }
        return isSuccess;
    }

}
