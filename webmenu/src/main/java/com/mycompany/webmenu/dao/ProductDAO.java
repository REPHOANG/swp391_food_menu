package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.ImageProductDTO;
import com.mycompany.webmenu.dto.ProductDTO;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductDAO {

    public List<ProductDTO> getListALlProduct(int page, int pageSize) throws SQLException {
        int offset = (page - 1) * pageSize;
        String sql = "select x1.product_id, x1.name, x1.price, x1.description, x2.url as urlImage,x3.category_id as categoryId,x3.name as categoryName\n" +
                "from Product x1\n" +
                "left join image_product x2 on x2.product_id = x1.product_id\n" +
                "join Category x3 on x3.category_id = x1.category_id \n" +
                "where (x2.image_id is null or x2.is_main_img = 1)\n" +
                "ORDER BY x1.product_id desc \n" +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (Connection conn = DBUtil.getConnection(); // Sử dụng try-with-resources để tự động đóng kết nối
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, offset);
            stm.setInt(2, pageSize);
            try (ResultSet rs = stm.executeQuery()) { // Tự động đóng result set
                ArrayList<ProductDTO> list = new ArrayList<>();
                while (rs.next()) {
                    ProductDTO dto = new ProductDTO();
                    dto.setProductId(rs.getInt("product_id"));
                    dto.setPrice(rs.getDouble("price"));
                    dto.setName(rs.getString("name"));
                    dto.setDescription(rs.getString("description"));
                    dto.setCategoryName(rs.getString("categoryName"));
                    dto.setCategoryId(rs.getInt("categoryId"));
                    ImageProductDTO imageProductDTO = new ImageProductDTO();
                    imageProductDTO.setUrl(rs.getString("urlImage"));
                    dto.setMainImg(imageProductDTO);
                    list.add(dto);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            throw e; // Ném lại lỗi để xử lý ở nơi gọi
        }
    }

    // Phương thức lấy danh sách sản phẩm cho quản lý
    public ArrayList<ProductDTO> getListProductManager(int page, int pageSize) throws SQLException {
        int offset = (page - 1) * pageSize;
        String sql = "select x1.product_id, x1.name, x1.price, x1.description, x2.url as urlImage,x3.category_id as categoryId,x3.name as categoryName\n" +
                "from Product x1\n" +
                "left join image_product x2 on x2.product_id = x1.product_id\n" +
                "join Category x3 on x3.category_id = x1.category_id \n" +
                "where (x2.image_id is null or x2.is_main_img = 1)\n" +
                "ORDER BY x1.approve_at desc \n" +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBUtil.getConnection(); // Sử dụng try-with-resources để tự động đóng kết nối
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, offset);
            stm.setInt(2, pageSize);
            try (ResultSet rs = stm.executeQuery()) { // Tự động đóng result set
                ArrayList<ProductDTO> list = new ArrayList<>();
                while (rs.next()) {
                    ProductDTO dto = new ProductDTO();
                    dto.setProductId(rs.getInt("product_id"));
                    dto.setPrice(rs.getDouble("price"));
                    dto.setName(rs.getString("name"));
                    dto.setDescription(rs.getString("description"));
                    dto.setCategoryName(rs.getString("categoryName"));
                    dto.setCategoryId(rs.getInt("categoryId"));
                    ImageProductDTO imageProductDTO = new ImageProductDTO();
                    imageProductDTO.setUrl(rs.getString("urlImage"));
                    dto.setMainImg(imageProductDTO);
                    list.add(dto);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            throw e; // Ném lại lỗi để xử lý ở nơi gọi
        }
    }

    // Phương thức để đếm tổng số sản phẩm
    public int getTotalProductCount() throws SQLException {
        String query = "SELECT COUNT(product_id) AS total FROM [EcommmercePlatform].[dbo].[Product]";
        try (Connection conn = DBUtil.getConnection(); // Sử dụng try-with-resources để tự động đóng kết nối
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) { // Tự động đóng statement và result set
            if (rs.next()) {
                return rs.getInt("total"); // Trả về tổng số sản phẩm ngay lập tức
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            throw e; // Ném lại lỗi để xử lý ở nơi gọi
        }
        return 0; // Trả về 0 nếu không có sản phẩm
    }

    @SneakyThrows
    public ProductDTO getProductDetail(Integer productId) {
        String sql = "select x1.product_id, x1.name, x1.price, x1.description,x1.category_id from Product x1 where x1.product_id = ?";
        try (Connection conn = DBUtil.getConnection(); // Try-with-resources to auto-close
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, productId); // Set productId parameter
            try (ResultSet rs = stm.executeQuery()) { // Execute the query and get the result
                if (rs.next()) {
                    // Build and return the ProductDTO from the result set
                    return ProductDTO.builder()
                            .productId(rs.getInt("product_id"))
                            .categoryId(rs.getInt("category_id"))
                            .name(rs.getString("name"))
                            .price(rs.getDouble("price"))
                            .description(rs.getString("description"))
                            .mainImg(this.getMainImage(conn, productId)) // Fetch main image
                            .imgs(this.getAllImages(conn, productId)) //
                            .build();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error
            throw e; // Re-throw the exception for handling elsewhere
        }
        return null; // Return null if no product is found
    }

    // Method to retrieve the main image
    private ImageProductDTO getMainImage(Connection conn, Integer productId) throws SQLException {
        String sqlMainImg = "select x1.image_id as imageId,x1.url from image_product x1 where x1.is_main_img = 1 and x1.product_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sqlMainImg)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return ImageProductDTO.builder()
                            .imageId(rs.getInt("imageId"))
                            .url(rs.getString("url"))
                            .build();
                }
            }
        }
        return null; // Return null if no main image is found
    }

    // Method to retrieve all images
    private List<ImageProductDTO> getAllImages(Connection conn, Integer productId) throws SQLException {
        List<ImageProductDTO> images = new ArrayList<>();
        String sqlImgs = "select x1.image_id as imageId,x1.url from image_product x1 where x1.is_main_img = 0 and x1.product_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sqlImgs)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ImageProductDTO img = ImageProductDTO.builder()
                            .imageId(rs.getInt("imageId"))
                            .url(rs.getString("url"))
                            .build();
                    images.add(img);
                }
            }
        }
        return images; // Return the list of images
    }

    @SneakyThrows
    public boolean insertProductAndImages(ProductDTO product) {
        Connection conn = null;
        PreparedStatement productStmt = null;
        PreparedStatement imageStmt = null;
        boolean success = false; // Biến để theo dõi kết quả

        String productSQL = "INSERT INTO Product (category_id, price, name, description, user_admin_id, create_at, approve_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        String imageSQL = "INSERT INTO image_product (product_id, url, is_main_img) VALUES (?, ?, ?)";

        try {
            conn = DBUtil.getConnection();
//            conn.setAutoCommit(false); // Bắt đầu transaction

            // Chèn đối tượng Product
            productStmt = conn.prepareStatement(productSQL, Statement.RETURN_GENERATED_KEYS);
            productStmt.setInt(1, product.getCategoryId());
            productStmt.setDouble(2, product.getPrice());
            productStmt.setString(3, product.getName());
            productStmt.setString(4, product.getDescription());

            if (product.getUserAdminId() != null) {
                productStmt.setInt(5, product.getUserAdminId());
            } else {
                productStmt.setNull(5, java.sql.Types.INTEGER); // Set to NULL in the database
            }

            productStmt.setDate(6, new java.sql.Date(System.currentTimeMillis())); // Lấy ngày hiện tại cho create_at
            productStmt.setDate(7, new java.sql.Date(System.currentTimeMillis())); // Lấy ngày hiện tại cho approve_at
            int productRowsAffected = productStmt.executeUpdate();

            // Kiểm tra xem có chèn được product hay không
            if (productRowsAffected == 0) {
                throw new SQLException("Failed to insert product.");
            }

            // Lấy ID của Product vừa chèn
            ResultSet rs = productStmt.getGeneratedKeys();
            if (rs.next()) {
                int productId = rs.getInt(1);
                product.setProductId(productId); // Gán ID vào đối tượng Product
            } else {
                return false;
            }
            // Chuẩn bị cho câu lệnh chèn ảnh
            imageStmt = conn.prepareStatement(imageSQL);
            // Chèn ảnh chính (mainImg) nếu có
            if (product.getMainImg() != null) {
                ImageProductDTO mainImg = product.getMainImg();
                imageStmt.setInt(1, product.getProductId()); // Liên kết với Product vừa tạo
                imageStmt.setString(2, mainImg.getUrl());
                imageStmt.setBoolean(3, true); // Ảnh chính
                imageStmt.addBatch(); // Thêm vào batch
            }
            // Chèn danh sách các ImageProduct khác (nếu có)
            for (ImageProductDTO img : product.getImgs()) {
                imageStmt.setInt(1, product.getProductId()); // Liên kết với Product vừa tạo
                imageStmt.setString(2, img.getUrl());
                imageStmt.setBoolean(3, false); // Ảnh phụ hoặc không
                imageStmt.addBatch(); // Thêm vào batch
            }
            // Thực thi batch cho tất cả ảnh
            imageStmt.executeBatch();
            // Commit transaction
            conn.commit();
            success = true; // Nếu không có lỗi, đánh dấu thành công
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
        return success; // Trả về kết quả
    }

    @SneakyThrows
    public boolean updateProductWithImages(ProductDTO product) {
        Connection conn = DBUtil.getConnection();
        // Lấy danh sách image_id hiện tại của sản phẩm
        String sqlGetImageProduct = "SELECT x1.image_id, x1.url, x1.is_main_img FROM image_product x1 WHERE x1.product_id = ?";
        PreparedStatement getImageProduct = conn.prepareStatement(sqlGetImageProduct);
        getImageProduct.setInt(1, product.getProductId());
        ResultSet rs = getImageProduct.executeQuery();
        List<Integer> imageIdsPrevious = new ArrayList<>();
        while (rs.next()) {
            imageIdsPrevious.add(rs.getInt("image_id"));
        }

        // Lấy danh sách image_id mới từ product DTO
        List<Integer> imageIdsNew = new ArrayList<>();
        if (product.getMainImg() != null) {
            imageIdsNew.add(product.getMainImg().getImageId());
        }
        for (ImageProductDTO img : product.getImgs()) {
            if (img.getImageId() != null) {
                imageIdsNew.add(img.getImageId());
            }
        }
        // Loại bỏ các image_id mới khỏi danh sách cũ để chỉ còn lại những ảnh cần xóa
        imageIdsPrevious.removeAll(imageIdsNew);

        // Câu lệnh cập nhật sản phẩm và ảnh
        String productUpdateQuery = "UPDATE Product SET category_id = ?, price = ?, name = ?, description = ?, user_admin_id = ?, approve_at = ? WHERE product_id = ?";
        String imageUpdateQuery = "UPDATE image_product SET url = ?, is_main_img = ? WHERE image_id = ? AND product_id = ?";
        String imageInsertQuery = "INSERT INTO image_product (product_id, url, is_main_img) VALUES (?, ?, ?)";

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
            if (product.getUserAdminId() != null) {
                productStmt.setInt(5, product.getUserAdminId());
            } else {
                productStmt.setNull(5, java.sql.Types.INTEGER); // Đặt giá trị NULL cho userAdminId nếu không có
            }
            Timestamp currentTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
            productStmt.setTimestamp(6, currentTimestamp); // Ngày hiện tại
            productStmt.setInt(7, product.getProductId()); // Cập nhật theo product_id
            int productRowsAffected = productStmt.executeUpdate(); // Thực thi câu lệnh cập nhật sản phẩm
            if (productRowsAffected == 0) {
                return false;
            }

            // Cập nhật hoặc thêm hình ảnh chính
            if (product.getMainImg() != null) {
                ImageProductDTO mainImg = product.getMainImg();
                imgUpdateStmt.setString(1, mainImg.getUrl());
                imgUpdateStmt.setBoolean(2, true); // Đây là ảnh chính
                imgUpdateStmt.setInt(3, mainImg.getImageId());
                imgUpdateStmt.setInt(4, product.getProductId());
                imgUpdateStmt.addBatch(); // Thêm vào batch
            }

            // Cập nhật hoặc thêm các hình ảnh phụ
            for (ImageProductDTO img : product.getImgs()) {
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

            // Xóa ảnh cũ (nếu có)
            if (!imageIdsPrevious.isEmpty()) {
                String deleteImageQuery = "DELETE FROM image_product WHERE product_id = ? AND image_id IN (" +
                        imageIdsPrevious.stream().map(id -> "?").collect(Collectors.joining(",")) + ")";
                PreparedStatement deleteImageStmt = conn.prepareStatement(deleteImageQuery);
                deleteImageStmt.setInt(1, product.getProductId()); // Thêm product_id vào câu lệnh

                // Gán các giá trị image_id vào câu lệnh DELETE
                for (int i = 0; i < imageIdsPrevious.size(); i++) {
                    deleteImageStmt.setInt(i + 2, imageIdsPrevious.get(i)); // Gán từng giá trị image_id
                }
                deleteImageStmt.executeUpdate(); // Thực thi lệnh xóa ảnh
                deleteImageStmt.close(); // Đóng PreparedStatement sau khi sử dụng
            }

            // Commit giao dịch nếu tất cả thành công
            conn.commit();
            isSuccess = true;

        } catch (SQLException e) {
            // Rollback nếu có lỗi
            conn.rollback();
            e.printStackTrace();
            isSuccess = false;
        } finally {
            // Đóng tài nguyên và trả lại kết nối về trạng thái ban đầu
            conn.setAutoCommit(true);
            if (productStmt != null) productStmt.close();
            if (imgUpdateStmt != null) imgUpdateStmt.close();
            if (imgInsertStmt != null) imgInsertStmt.close();
            if (conn != null) conn.close();
        }
        return isSuccess; // Trả về kết quả thành công hay thất bại
    }

}
