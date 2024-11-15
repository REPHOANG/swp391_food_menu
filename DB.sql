create database [webfood_s31];
go
USE [webfood_s31]
GO
/****** Object:  Table [Categories]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Discounts]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Discounts](
	[discount_id] [int] IDENTITY(1,1) NOT NULL,
	[discount_code] [nvarchar](200) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[discount_percent] [decimal](20, 2) NULL,
	[max_discount_value] [decimal](20, 2) NULL,
	[min_discount_value] [decimal](20, 2) NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[quantity] [int] NULL,
	[rm_quantity] [int] NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ImageProducts]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ImageProducts](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[is_main_image] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [OrderDetails]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderDetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Orders]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[table_id] [int] NULL,
	[user_id] [int] NULL,
	[discount_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[order_date] [datetime] NULL,
	[delivery_address] [nvarchar](255) NULL,
	[order_note] [nvarchar](255) NULL,
	[order_status] [int] NULL,
	[order_total] [decimal](20, 2) NULL,
	[shipping_fee] [decimal](20, 2) NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Products]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[price] [decimal](20, 2) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[approved_at] [datetime] NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Roles]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tables]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tables](
	[table_id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](50) NULL,
	[capacity] [int] NOT NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users]    Script Date: 11/8/2024 1:14:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[birth_date] [date] NULL,
	[address] [nvarchar](255) NULL,
	[avatar_url] [nvarchar](255) NULL,
	[full_name] [nvarchar](100) NULL,
	[password] [nvarchar](255) NULL,
	[token_reset_password] [nvarchar](255) NULL,
	[accumulated_points] [int] NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Categories] ON 

INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (1, N'Đồ uống', N'Đồ uống giải khát để bổ sung cho bữa ăn của bạn.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (2, N'Khai vị', N'Bắt đầu bữa ăn với các món khai vị ngon miệng của chúng tôi.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (3, N'Món chính', N'Các món chính hấp dẫn cho mọi khẩu vị.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (4, N'Tráng miệng', N'Các món ngọt hấp dẫn để kết thúc bữa ăn của bạn.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (5, N'Salad', N'Salad tươi mát và giòn để có lựa chọn lành mạnh.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (6, N'Súp', N'Các món súp ấm áp và thoải mái.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (7, N'Đồ nướng', N'Các món nướng hoàn hảo cho bạn.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (8, N'Mỳ Ý', N'Các món mỳ Ý cổ điển.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (9, N'Pizza', N'Pizza nướng với nguyên liệu tươi ngon.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (10, N'Bánh mì kẹp thịt', N'Bánh mì kẹp thịt đậm đà và ngon miệng.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (11, N'Hải sản', N'Các món hải sản tươi ngon và hấp dẫn.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (12, N'Đồ chay', N'Các món ăn từ thực vật cho lối sống thuần chay.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (13, N'Bánh mì', N'Đa dạng các loại bánh mì ngon.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (14, N'Bữa sáng', N'Bắt đầu ngày mới với các món ăn sáng của chúng tôi.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (15, N'Dành cho trẻ em', N'Các món ăn vui nhộn và ngon miệng dành cho trẻ em.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (16, N'Bánh ngọt', N'Các loại bánh và bánh ngọt mới ra lò.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (17, N'Sinh tố', N'Sinh tố từ trái cây và rau củ cho những người yêu sức khỏe.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (18, N'Ẩm thực châu Á', N'Đa dạng các món ăn lấy cảm hứng từ ẩm thực châu Á.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (19, N'Ẩm thực Mexico', N'Các món ăn Mexico đậm đà và cay nồng.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
INSERT [Categories] ([category_id], [name], [description], [created_at], [updated_at], [is_deleted]) VALUES (20, N'Ẩm thực Ấn Độ', N'Gia vị và hương vị Ấn Độ đích thực.', CAST(N'2024-10-26T12:45:37.550' AS DateTime), CAST(N'2024-10-26T12:45:37.550' AS DateTime), 0)
SET IDENTITY_INSERT [Categories] OFF
GO
SET IDENTITY_INSERT [Discounts] ON 

INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (1, N'NEWUSER10', N'10% Off for New Users', N'Welcome discount for new users.', CAST(10.00 AS Decimal(20, 2)), CAST(50.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 100, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (2, N'SUMMER20', N'20% Summer Sale', N'Special discount for the summer season.', CAST(20.00 AS Decimal(20, 2)), CAST(50.00 AS Decimal(20, 2)), NULL, CAST(N'2024-06-01' AS Date), CAST(N'2024-08-31' AS Date), 150, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (3, N'LOYAL15', N'15% Loyalty Discount', N'Reward for loyal customers.', CAST(15.00 AS Decimal(20, 2)), CAST(50.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 200, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (4, N'FALL10', N'10% Fall Special', N'Fall season special discount.', CAST(10.00 AS Decimal(20, 2)), CAST(50.00 AS Decimal(20, 2)), NULL, CAST(N'2024-09-01' AS Date), CAST(N'2024-11-30' AS Date), 100, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (5, N'HOLIDAY25', N'25% Holiday Sale', N'Discount for the holiday season.', CAST(25.00 AS Decimal(20, 2)), CAST(50.00 AS Decimal(20, 2)), NULL, CAST(N'2024-12-01' AS Date), CAST(N'2024-12-31' AS Date), 200, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (6, N'BIRTHDAY20', N'Birthday Discount', N'Celebrate your birthday with 20% off.', CAST(20.00 AS Decimal(20, 2)), CAST(30.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 150, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (7, N'FREESHIP', N'Free Shipping', N'Free shipping on orders over $50.', CAST(0.00 AS Decimal(20, 2)), CAST(80.00 AS Decimal(20, 2)), CAST(50.00 AS Decimal(20, 2)), CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 300, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (8, N'WEEKEND15', N'15% Off on Weekends', N'Discount on weekend orders.', CAST(15.00 AS Decimal(20, 2)), CAST(80.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 150, 1, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (9, N'STUDENT10', N'Student Discount', N'10% discount for students.', CAST(10.00 AS Decimal(20, 2)), CAST(80.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 100, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (10, N'ANNIVERSARY30', N'30% Anniversary Special', N'Celebrate our anniversary with 30% off.', CAST(30.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), CAST(20.00 AS Decimal(20, 2)), CAST(N'2024-05-01' AS Date), CAST(N'2024-05-31' AS Date), 100, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (11, N'BLACKFRIDAY40', N'40% Black Friday', N'Black Friday special discount.', CAST(40.00 AS Decimal(20, 2)), CAST(80.00 AS Decimal(20, 2)), CAST(30.00 AS Decimal(20, 2)), CAST(N'2024-11-24' AS Date), CAST(N'2024-11-24' AS Date), 50, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (12, N'CYBERMONDAY35', N'Cyber Monday 35%', N'Special 35% off for Cyber Monday.', CAST(35.00 AS Decimal(20, 2)), CAST(75.00 AS Decimal(20, 2)), NULL, CAST(N'2024-11-27' AS Date), CAST(N'2024-11-27' AS Date), 100, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (13, N'WELCOME5', N'5% Welcome Discount', N'Welcome offer for new users.', CAST(5.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 300, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (14, N'VIP50', N'50% VIP Discount', N'Exclusive discount for VIP members.', CAST(50.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 20, 1, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (15, N'SPRING20', N'Spring 20% Off', N'Celebrate spring with 20% off.', CAST(20.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), NULL, CAST(N'2024-03-01' AS Date), CAST(N'2024-05-31' AS Date), 150, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (16, N'REFERRAL10', N'10% Referral Discount', N'Refer a friend and get 10% off.', CAST(10.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 200, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (17, N'APP5', N'5% App Order Discount', N'Order through the app and save 5%.', CAST(5.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 100, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (18, N'MIDWEEK20', N'20% Mid-Week Special', N'Discount for mid-week orders.', CAST(20.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 150, 6, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (19, N'FAMILY25', N'Family Special 25%', N'Discount for family-sized orders.', CAST(25.00 AS Decimal(20, 2)), CAST(60.00 AS Decimal(20, 2)), NULL, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 100, 1, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (20, N'FLASHSALE50', N'50% Flash Sale', N'Limited time 50% off!', CAST(50.00 AS Decimal(20, 2)), CAST(100.00 AS Decimal(20, 2)), CAST(20.00 AS Decimal(20, 2)), CAST(N'2024-07-15' AS Date), CAST(N'2024-07-15' AS Date), 50, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (27, N'EK63633G', N'12e 1', N'yui.', CAST(10.05 AS Decimal(20, 2)), CAST(12.00 AS Decimal(20, 2)), CAST(12.00 AS Decimal(20, 2)), CAST(N'2024-11-01' AS Date), CAST(N'2024-10-28' AS Date), 12, 0, NULL)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (28, N'VM5RMEG2', N'50% OFF', N'discount off for order between 100k and 300k', CAST(50.00 AS Decimal(20, 2)), CAST(300000.00 AS Decimal(20, 2)), CAST(100000.00 AS Decimal(20, 2)), CAST(N'2024-11-04' AS Date), CAST(N'2024-11-09' AS Date), 10, 2, 0)
INSERT [Discounts] ([discount_id], [discount_code], [name], [description], [discount_percent], [max_discount_value], [min_discount_value], [start_date], [end_date], [quantity], [rm_quantity], [is_deleted]) VALUES (29, N'WJMIJQ1C', N'DISCOUNTNOW', N'happy halohalo', CAST(10.00 AS Decimal(20, 2)), CAST(50000.00 AS Decimal(20, 2)), CAST(300000.00 AS Decimal(20, 2)), CAST(N'2024-11-06' AS Date), CAST(N'2024-11-29' AS Date), 10, 5, 0)
SET IDENTITY_INSERT [Discounts] OFF
GO
SET IDENTITY_INSERT [ImageProducts] ON 

INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (1, 19, N'https://salt.tikicdn.com/cache/w1200/ts/product/5f/3c/dd/4b74faf5b4d9d541d44a14259dae5e0c.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (2, 19, N'https://salt.tikicdn.com/cache/w1200/ts/product/c6/01/6c/987dddbadf65102e16ce37e89fb910ea.jpg', 0)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (4, 19, N'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645.jpg', 0)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (5, 18, N'https://api.pepperonis.com.vn//uploads/images/undefined-1293.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (6, 17, N'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/5802fab5-fdce-468a-a830-43e8001f5a72/Derivates/c00dc34a-e73d-42f0-a86e-e2fd967d33fe.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (7, 16, N'https://divella.com.vn/vnt_upload//news/04_2017/one-pot-seafood-pasta-thumb.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (8, 15, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA_EF-1qMDLEoJA2sJ9S0rbE8qgw1ffJK3Bw&s', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (9, 14, N'https://cdn.mediamart.vn/images/news/cach-lam-suon-nuong-bbq-bang-noi-chien-khong-dau-sieu-ngon-hap-dan_5046a539.png', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (10, 1, N'https://baodongnai.com.vn/file/e7837c02876411cd0187645a2551379f/022024/174_mh_20240228114325.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (11, 13, N'https://cdn.tgdd.vn/Files/2020/05/14/1255401/2-cach-lam-tom-nuong-sa-te-va-nuong-sot-pho-mai-thom-ngon-dam-da-hap-dan.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (12, 2, N'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2024/6/30/nuocchanh1-17197597854281520642197.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (13, 9, N'https://cdn.tgdd.vn/2021/06/CookProduct/Saladtrondaugiam1200-1200x676.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (14, 3, N'https://traicayhoabien.com/wp-content/uploads/2023/05/PHO-MAI-QUE.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (15, 11, N'https://cdn.tgdd.vn/Files/2021/08/05/1373270/cach-nau-sup-ga-ngo-non-thom-ngon-bo-duong-202201141412125884.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (17, 8, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBkJz0MSy5mASpHNN4aXxMygk8QFANVRlF-A&s', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (18, 7, N'https://static.hawonkoo.vn/hwks1/images/2023/07/cach-lam-banh-flan-bang-noi-chien-khong-dau-1-1.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (19, 12, N'https://cdn.tgdd.vn/Files/2019/11/28/1222896/cach-lam-sup-bi-do-kem-tuoi-beo-ngay-chuan-vi-au-tai-nha-202208251727590660.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (20, 4, N'https://img-global.cpcdn.com/recipes/78a648f8678001d3/680x482cq70/ga-vien-chien-gion-ga-popcorn-recipe-main-photo.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (21, 5, N'https://cdn.tgdd.vn/Files/2020/06/04/1260722/cach-lam-mi-y-carbonara-don-gian-thom-ngon-beo-n-3-760x367.jpg', 1)
INSERT [ImageProducts] ([image_id], [product_id], [url], [is_main_image]) VALUES (22, 6, N'https://ussinavietnam.vn/wp-content/uploads/2022/05/B1_.png', 1)
SET IDENTITY_INSERT [ImageProducts] OFF
GO
SET IDENTITY_INSERT [OrderDetails] ON 

INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (1, 1, 19, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (2, 1, 18, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (3, 2, 19, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (4, 2, 18, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (5, 3, 19, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (6, 3, 18, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (7, 11, 19, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (8, 11, 18, 3)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (9, 12, 19, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (10, 12, 18, 5)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (11, 13, 19, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (12, 13, 18, 5)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (21, 16, 19, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (22, 17, 19, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (23, 18, 19, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (24, 19, 18, 3)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (25, 20, 16, 3)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (26, 20, 17, 3)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (27, 21, 17, 8)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (28, 22, 17, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (29, 22, 16, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (30, 23, 17, 12)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (55, 30, 17, 4)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (66, 33, 16, 5)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (67, 33, 17, 4)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (68, 33, 19, 8)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (69, 33, 14, 5)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (90, 38, 17, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (91, 38, 16, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (92, 38, 15, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (93, 39, 16, 12)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (94, 40, 16, 12)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (95, 41, 16, 12)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (96, 42, 17, 11)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (97, 43, 19, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (98, 43, 16, 3)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (99, 44, 19, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (100, 44, 16, 3)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (101, 45, 16, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (102, 46, 16, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (103, 47, 18, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (104, 47, 17, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (105, 48, 19, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (106, 49, 19, 8)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (107, 50, 17, 7)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (108, 51, 17, 7)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (109, 50, 16, 5)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (110, 51, 16, 5)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (111, 52, 1, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (112, 53, 17, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (113, 54, 15, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (114, 54, 16, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (115, 55, 11, 2)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (116, 55, 9, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (117, 55, 3, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (118, 56, 18, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (119, 56, 13, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (120, 56, 9, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (121, 56, 8, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (122, 56, 1, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (123, 56, 2, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (124, 57, 16, 5)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (125, 58, 15, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (126, 58, 17, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (127, 59, 11, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (128, 59, 9, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (129, 59, 8, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (130, 59, 18, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (131, 59, 13, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (132, 60, 9, 8)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (133, 60, 8, 1)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (134, 61, 9, 8)
INSERT [OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity]) VALUES (135, 61, 8, 1)
SET IDENTITY_INSERT [OrderDetails] OFF
GO
SET IDENTITY_INSERT [Orders] ON 

INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (1, NULL, NULL, NULL, N'', CAST(N'2024-10-26T22:56:01.927' AS DateTime), NULL, N'', 2, CAST(55555511.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (2, NULL, NULL, 16, N'', CAST(N'2024-10-26T23:11:52.837' AS DateTime), NULL, N'', 1, CAST(55555411.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (3, NULL, 2, 8, N'John Doe', CAST(N'2024-10-26T23:14:28.640' AS DateTime), N'user1@example.com', N'', 1, CAST(55555431.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (11, NULL, NULL, NULL, N'', CAST(N'2024-10-27T02:27:25.157' AS DateTime), NULL, N'', 1, CAST(111111034.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (12, NULL, NULL, NULL, N'', CAST(N'2024-10-27T02:31:17.223' AS DateTime), N'Nam huỳnh', N'', 1, CAST(111111056.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (13, NULL, NULL, NULL, N'NamHHuỳnh ', CAST(N'2024-10-27T02:32:37.930' AS DateTime), N'Nam huỳnh', N'NamHHuỳnh ', 6, CAST(111111056.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (16, 18, 2, NULL, N'John Doe', CAST(N'2024-10-27T22:36:41.133' AS DateTime), N'user1@example.com', N'', 3, CAST(111111001.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (17, 16, 2, 18, N'John Doe', CAST(N'2024-10-27T22:42:09.220' AS DateTime), N'user1@example.com', N'Ít đá', 1, CAST(111110901.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (18, 16, 2, 14, N'John Doe', CAST(N'2024-10-27T23:06:16.747' AS DateTime), NULL, N'', 6, CAST(55555400.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (19, NULL, NULL, NULL, N'', CAST(N'2024-10-28T22:10:53.507' AS DateTime), NULL, N'', 2, CAST(33.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (20, 19, 31, 17, N'Pham Quoc Thang', CAST(N'2024-10-28T22:13:44.467' AS DateTime), N'thangquoc10052020@gmail.com', N'make it spicy', 6, CAST(-47.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (21, 19, 31, 19, N'Pham Quoc Thang', CAST(N'2024-10-28T22:26:54.530' AS DateTime), N'thangquoc10052020@gmail.com', N'', 6, CAST(12.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (22, 19, 2, 18, N'John Doe', CAST(N'2024-10-28T22:44:50.620' AS DateTime), NULL, N'', 6, CAST(-82.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (23, NULL, NULL, 13, N'Ha', CAST(N'2024-10-29T12:28:09.927' AS DateTime), NULL, N'toi muon no nhieu cheese', 1, CAST(8.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (30, 19, 31, NULL, N'Pham Quoc Thang', CAST(N'2024-10-29T23:31:31.477' AS DateTime), NULL, N'more cheese', 1, CAST(36.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (33, 14, NULL, NULL, N'Pham hoang', CAST(N'2024-10-29T23:32:47.993' AS DateTime), NULL, N'123213', 4, CAST(444444138.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (38, 12, 44, NULL, N'Huy Nguyen', CAST(N'2024-10-29T23:39:28.957' AS DateTime), NULL, N'', 5, CAST(25.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (39, 5, NULL, NULL, N'Pham hoang', CAST(N'2024-10-30T07:35:16.137' AS DateTime), NULL, N'123213', 1, CAST(102.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (40, 5, NULL, NULL, N'Pham hoang', CAST(N'2024-10-30T07:35:19.523' AS DateTime), NULL, N'123213', 6, CAST(102.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (41, 5, NULL, NULL, N'Pham hoang', CAST(N'2024-10-30T07:35:19.693' AS DateTime), NULL, N'123213', 6, CAST(102.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (42, 9, NULL, NULL, N'blabla', CAST(N'2024-10-30T07:52:18.397' AS DateTime), NULL, N'vvvv', 3, CAST(99.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (43, 7, NULL, 18, N'dasddsadsa', CAST(N'2024-10-30T07:53:35.353' AS DateTime), NULL, N'sdsdsdds', 6, CAST(111110925.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (44, 7, NULL, 18, N'dasddsadsa', CAST(N'2024-10-30T07:53:39.107' AS DateTime), NULL, N'sdsdsdds', 6, CAST(111110925.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (45, 5, NULL, NULL, N'Hoàng Long', CAST(N'2024-10-30T08:26:59.410' AS DateTime), NULL, N'', 6, CAST(8.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (46, 5, NULL, NULL, N'Hoàng Long', CAST(N'2024-10-30T08:27:06.777' AS DateTime), NULL, N'', 2, CAST(8.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (47, 20, NULL, 19, N'Duc Anh', CAST(N'2024-11-01T14:55:34.117' AS DateTime), NULL, N'', 6, CAST(-40.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (48, 3, NULL, NULL, N'MN', CAST(N'2024-11-01T15:28:49.023' AS DateTime), NULL, N'', 6, CAST(55555500.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (49, 20, 31, 8, N'Pham Quoc Thang', CAST(N'2024-11-03T20:54:14.343' AS DateTime), NULL, N'add more sauce', 6, CAST(4443920.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (50, 7, 51, 18, N'pham duc hoang', CAST(N'2024-11-03T21:11:29.717' AS DateTime), NULL, N'yeahhh', 3, CAST(5.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (51, 7, 51, 18, N'pham duc hoang', CAST(N'2024-11-03T21:11:29.683' AS DateTime), NULL, N'yeahhh', 5, CAST(5.50 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (52, 19, 31, NULL, N'Pham Quoc Thang', CAST(N'2024-11-03T23:47:03.610' AS DateTime), NULL, N'more sugar', 6, CAST(3.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (53, 19, 31, NULL, N'Pham Quoc Thang', CAST(N'2024-11-03T23:47:37.707' AS DateTime), NULL, N'extra cheese', 6, CAST(18.00 AS Decimal(20, 2)), NULL, NULL)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (54, 18, NULL, NULL, N'Thu', CAST(N'2024-11-04T23:49:09.680' AS DateTime), NULL, N'nothing', 6, CAST(16.50 AS Decimal(20, 2)), NULL, 0)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (55, 7, 31, 29, N'Pham Quoc Thang', CAST(N'2024-11-06T08:37:46.607' AS DateTime), NULL, N'dont know', 1, CAST(-150000.00 AS Decimal(20, 2)), NULL, 0)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (56, 16, NULL, 29, N'Pham duc hoang', CAST(N'2024-11-06T08:37:54.657' AS DateTime), NULL, N'xin thêm giấy', 1, CAST(190000.00 AS Decimal(20, 2)), NULL, 0)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (57, 16, NULL, 29, N'nam', CAST(N'2024-11-06T12:35:40.773' AS DateTime), NULL, N'thêm sốt', 1, CAST(700000.00 AS Decimal(20, 2)), NULL, 0)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (58, 3, 51, 29, N'pham duc hoang', CAST(N'2024-11-06T18:51:33.760' AS DateTime), NULL, N'', 1, CAST(500000.00 AS Decimal(20, 2)), NULL, 0)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (59, 3, 51, 29, N'pham duc hoang', CAST(N'2024-11-06T18:55:35.387' AS DateTime), NULL, N'', 1, CAST(400000.00 AS Decimal(20, 2)), NULL, 0)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (60, 17, 31, 28, N'Pham Quoc Thang', CAST(N'2024-11-07T14:05:59.493' AS DateTime), NULL, N'no mayo', 1, CAST(125000.00 AS Decimal(20, 2)), NULL, 0)
INSERT [Orders] ([order_id], [table_id], [user_id], [discount_id], [user_name], [order_date], [delivery_address], [order_note], [order_status], [order_total], [shipping_fee], [is_deleted]) VALUES (61, 17, 31, 28, N'Pham Quoc Thang', CAST(N'2024-11-07T14:06:02.710' AS DateTime), NULL, N'no mayo', 3, CAST(125000.00 AS Decimal(20, 2)), NULL, 0)
SET IDENTITY_INSERT [Orders] OFF
GO
SET IDENTITY_INSERT [Products] ON 

INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (1, 1, CAST(50000.00 AS Decimal(20, 2)), N'Nước cam', N'Nước cam tươi mát.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:54:15.013' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (2, 1, CAST(15000.00 AS Decimal(20, 2)), N'Nước chanh', N'Nước chanh tươi với đá.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:57:32.297' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (3, 2, CAST(50000.00 AS Decimal(20, 2)), N'Phô mai que', N'Phô mai que chiên giòn.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:55:50.380' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (4, 2, CAST(55000.00 AS Decimal(20, 2)), N'Gà viên chiên', N'Gà viên giòn rụm, ăn kèm sốt.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:57:48.660' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (5, 3, CAST(250000.00 AS Decimal(20, 2)), N'Mỳ Ý Carbonara', N'Mỳ Ý sốt kem phô mai và thịt xông khói.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:58:47.007' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (6, 3, CAST(350000.00 AS Decimal(20, 2)), N'Steak bò', N'Steak bò nướng vừa chín tới.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:58:42.090' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (7, 4, CAST(60000.00 AS Decimal(20, 2)), N'Bánh flan', N'Bánh flan mềm mịn, phủ caramel.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:56:56.407' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (8, 4, CAST(25000.00 AS Decimal(20, 2)), N'Kem dừa', N'Kem dừa thơm ngon mát lạnh.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:56:15.750' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (9, 5, CAST(50000.00 AS Decimal(20, 2)), N'Salad trộn', N'Salad trộn rau củ tươi mát.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:54:57.250' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (10, 5, CAST(5.50 AS Decimal(20, 2)), N'Salad Caesar', N'Salad Caesar với sốt đặc biệt.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), NULL, 1)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (11, 6, CAST(25000.00 AS Decimal(20, 2)), N'Súp ngô', N'Súp ngô ngọt và mịn.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:55:29.087' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (12, 6, CAST(25000.00 AS Decimal(20, 2)), N'Súp bí đỏ', N'Súp bí đỏ kem mịn.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:56:53.237' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (13, 7, CAST(150000.00 AS Decimal(20, 2)), N'Tôm nướng', N'Tôm nướng sốt mỡ hành.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:54:09.433' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (14, 7, CAST(270000.00 AS Decimal(20, 2)), N'Sườn nướng BBQ', N'Sườn nướng với sốt BBQ.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:53:25.583' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (15, 8, CAST(250000.00 AS Decimal(20, 2)), N'Spaghetti Bolognese', N'Mỳ Ý sốt thịt bò băm.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:52:46.380' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (16, 8, CAST(150000.00 AS Decimal(20, 2)), N'Spaghetti Hải sản', N'Mỳ Ý sốt hải sản.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:51:57.363' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (17, 9, CAST(300000.00 AS Decimal(20, 2)), N'Pizza Margherita', N'Pizza phô mai và cà chua.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-06T07:51:14.797' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (18, 9, CAST(200000.00 AS Decimal(20, 2)), N'Pizza Pepperoni', N'', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-07T16:45:08.703' AS DateTime), 0)
INSERT [Products] ([product_id], [category_id], [price], [name], [description], [created_by], [created_at], [approved_at], [is_deleted]) VALUES (19, 10, CAST(555500.00 AS Decimal(20, 2)), N'Burger gà', N'Burger gà giòn với rau xanh.', 1, CAST(N'2024-10-26T13:38:08.163' AS DateTime), CAST(N'2024-11-03T23:23:41.327' AS DateTime), 1)
SET IDENTITY_INSERT [Products] OFF
GO
SET IDENTITY_INSERT [Roles] ON 

INSERT [Roles] ([role_id], [role]) VALUES (1, N'Admin')
INSERT [Roles] ([role_id], [role]) VALUES (2, N'User')
INSERT [Roles] ([role_id], [role]) VALUES (3, N'Staff')
SET IDENTITY_INSERT [Roles] OFF
GO
SET IDENTITY_INSERT [Tables] ON 

INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (1, N'Bàn 1', N'0', 4, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (2, N'Bàn 2', N'0', 6, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (3, N'Bàn 3', N'1', 4, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (4, N'Bàn 4', N'1', 2, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (5, N'Bàn 5', N'0', 8, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (6, N'Bàn 6', N'2', 6, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (7, N'Bàn 7', N'1', 4, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (8, N'Bàn 8', N'1', 6, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (9, N'Bàn 9', N'1', 2, 1)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (10, N'Bàn 10', N'1', 4, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (11, N'Bàn 11', N'2', 8, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (12, N'Bàn 12', N'1', 4, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (13, N'Bàn 13', N'1', 6, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (14, N'Bàn 14', N'0', 2, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (15, N'Bàn 15', N'2', 6, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (16, N'Bàn 16', N'1', 4, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (17, N'Bàn 17', N'1', 8, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (18, N'Bàn 18', N'0', 6, 0)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (19, N'Bàn 19', N'0', 4, 1)
INSERT [Tables] ([table_id], [table_name], [status], [capacity], [is_deleted]) VALUES (20, N'Bàn 20', N'0', 2, 1)
SET IDENTITY_INSERT [Tables] OFF
GO
SET IDENTITY_INSERT [Users] ON 

INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (1, 1, N'admin@example.com', N'123456658', CAST(N'1980-01-01' AS Date), N'123 Admin St.', N'https://example.com/avatar1.png', N'Admin User ', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (2, 2, N'dinhga@yopmail.com', N'0862227012', CAST(N'1990-02-02' AS Date), N'Tuyen quanh', N'https://example.com/avatar2.png', N'John Doe', N'2024', N'7be706fc-389c-4bad-a097-79dfec2b7b31', 55555318, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (3, 3, N'user2@example.com', N'1234567892', CAST(N'1991-03-03' AS Date), N'789 Another Ave.', N'https://example.com/avatar3.png', N'Jane Doe', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (4, 1, N'dinhga@yopmail.com', N'1234567893', CAST(N'1992-04-04' AS Date), N'101 Road St.', N'https://example.com/avatar4.png', N'Mike Smith', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (5, 2, N'user4@example.com', N'1234567894', CAST(N'1993-05-05' AS Date), N'202 Boulevard Ln.', N'https://example.com/avatar5.png', N'Lisa Wong', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (6, 2, N'user5@example.com', N'1234567895', CAST(N'1994-06-06' AS Date), N'303 Avenue Pl.', N'https://example.com/avatar6.png', N'Tom Green', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (7, 2, N'user6@example.com', N'1234567896', CAST(N'1995-07-07' AS Date), N'404 Lane Dr.', N'https://example.com/avatar7.png', N'Sara White', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (8, 2, N'user7@example.com', N'1234567897', CAST(N'1996-08-08' AS Date), N'505 Place Rd.', N'https://example.com/avatar8.png', N'Ken Brown', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (9, 2, N'user8@example.com', N'1234567898', CAST(N'1997-09-09' AS Date), N'606 Circle St.', N'https://example.com/avatar9.png', N'Mona Black', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (10, 2, N'user9@example.com', N'1234567899', CAST(N'1998-10-10' AS Date), N'707 Square Blvd.', N'https://example.com/avatar10.png', N'Eli Gold', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (11, 3, N'user10@example.com', N'1234567801', CAST(N'1999-11-11' AS Date), N'808 Hex Rd.', N'https://example.com/avatar11.png', N'Adam Silver', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (12, 3, N'user11@example.com', N'1234567802', CAST(N'2000-12-12' AS Date), N'909 Quad Pl.', N'https://example.com/avatar12.png', N'Nina Teal', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (13, 3, N'user12@example.com', N'1234567803', CAST(N'2001-01-13' AS Date), N'111 Circle Ave.', N'https://example.com/avatar13.png', N'Bob Grey', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (14, 3, N'user13@example.com', N'1234567804', CAST(N'2002-02-14' AS Date), N'222 Globe Rd.', N'https://example.com/avatar14.png', N'Kim Peach', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (15, 3, N'user14@example.com', N'1234567805', CAST(N'2003-03-15' AS Date), N'333 Heart Ln.', N'https://example.com/avatar15.png', N'Sam Rose', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (16, 3, N'user15@example.com', N'1234567806', CAST(N'2004-04-16' AS Date), N'444 Star Rd.', N'https://example.com/avatar16.png', N'Anna Blue', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (17, 3, N'user16@example.com', N'1234567807', CAST(N'2005-05-17' AS Date), N'555 Hill Dr.', NULL, N'Leo Maroon', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (18, 2, N'user17@example.com', N'1234567808', CAST(N'2006-06-18' AS Date), N'666 Tree Blvd.', N'https://example.com/avatar18.png', N'Rita Violet', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (19, 2, N'user18@example.com', N'1234567809', CAST(N'2007-07-19' AS Date), N'777 River Ln.', N'https://example.com/avatar19.png', N'Max Green', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (20, 2, N'user19@example.com', N'1234567810', CAST(N'2008-08-20' AS Date), N'888 Ocean Ave.', N'https://example.com/avatar20.png', N'Zara Pink', N'password1', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (21, 2, N'user5@example.com', NULL, NULL, NULL, N'user5@example.com', NULL, NULL, NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (22, 2, N'nguyenducanh28342001@gmail.com', NULL, NULL, NULL, NULL, N'Nguyễn Anh', NULL, NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (31, 2, N'thangquoc10052020@gmail.com', N'093448212', NULL, N'22 Tràng Thi ', NULL, N'Pham Quoc Thang', N'123', NULL, 4443905, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (32, 2, N'thangquoc10052020@gmail.com', NULL, NULL, NULL, N'thangquoc10052020@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (33, 2, N'thangquoc10052020@gmail.com', NULL, NULL, NULL, N'thangquoc10052020@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (34, 2, N'1234556@gmail.com', NULL, NULL, NULL, NULL, N'thang', N'123', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (35, 2, N'hoanglong57hn@gmail.com', NULL, NULL, NULL, NULL, N'Nguyen Hoang Long', N'123456', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (36, 2, N'user5@example.com', NULL, NULL, NULL, N'user5@example.com', NULL, NULL, NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (38, 2, N'hoanglong57hn@gmail.com', NULL, NULL, NULL, NULL, N'Nguyễn Hoàng Long', N'123456', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (39, 2, N'hoanglong57hn123@gmail.com', NULL, NULL, NULL, NULL, N'Nguyễn Hoàng Long', N'1234', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (40, 2, N'hoanglong57hn123@gmail.com', NULL, NULL, NULL, NULL, N'Nguyen Hoang Long', N'123', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (41, 2, N'hoanglong57hnabc@gmail.com', N'0348164992', NULL, N'FPT University Ha Noi Campus', NULL, N'Hoàng Long', N'abc', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (42, 2, N'linhtg@gmail.com', NULL, NULL, NULL, NULL, N'Thảo Linh', N'123456', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (43, 3, N'longnhhe172497@fpt.edu.vn', N'0348164992', NULL, N'FPT University Ha Noi Campus', NULL, N'Hoàng Long', N'hhzg7$AA', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (44, 2, N'nguyenhuy01042004@gmail.com', NULL, NULL, NULL, NULL, N'Huy Nguyen', N'01042004', NULL, 25, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (45, 2, N'nguyenhuy01042004@gmail.com', NULL, NULL, NULL, NULL, N'Huy Nguyen', N'01042004', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (46, 2, N'nguyenhuy01042004@gmail.com', NULL, NULL, NULL, NULL, N'Huy Nguyen', N'01042004', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (47, 2, N'nguyenhuy01042004@gmail.com', NULL, NULL, NULL, N'nguyenhuy01042004@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (48, 3, N'thoadphs171111@fpt.edu.vn', N'0348164992', NULL, N'FPT University Ha Noi Campus', NULL, N'Hoàng Long', N'TpYTl#7U', NULL, NULL, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (49, 2, N'phamhoang20112003@gmail.com', NULL, NULL, NULL, NULL, N'pham duc hoang', N'123', NULL, 0, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (50, 2, N'user9@example.com', NULL, NULL, NULL, N'user9@example.com', NULL, NULL, NULL, 0, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (51, 2, N'phamhoang20112003@gmail.com', NULL, NULL, NULL, NULL, N'pham duc hoang', N'password1', NULL, 5, NULL)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (52, 2, N'thangquoc10052020@gmail.com', NULL, NULL, NULL, N'thangquoc10052020@gmail.com', NULL, NULL, NULL, 0, 0)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (53, 3, N'hoanghoang20112003@gmail.com', N'0986879389', NULL, N'thon 4', NULL, N'Pham duc hoang', N'mBRWZhbU', NULL, 0, 0)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (54, 2, N'thangquoc10052020@gmail.com', NULL, NULL, NULL, NULL, N'katta', N'123', NULL, 0, 0)
INSERT [Users] ([user_id], [role_id], [email], [phone], [birth_date], [address], [avatar_url], [full_name], [password], [token_reset_password], [accumulated_points], [is_deleted]) VALUES (55, 2, N'katta3103@gmail.com', NULL, NULL, NULL, NULL, N'kattasenpai', N'123', NULL, 0, 0)
SET IDENTITY_INSERT [Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Discount__75C1F0060BBC50F3]    Script Date: 11/8/2024 1:14:59 AM ******/
ALTER TABLE [Discounts] ADD UNIQUE NONCLUSTERED 
(
	[discount_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Categories] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [Categories] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [Categories] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [Discounts] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [ImageProducts] ADD  DEFAULT ((0)) FOR [is_main_image]
GO
ALTER TABLE [Orders] ADD  DEFAULT ((0)) FOR [order_status]
GO
ALTER TABLE [Orders] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [Products] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [Tables] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [Users] ADD  DEFAULT ((0)) FOR [accumulated_points]
GO
ALTER TABLE [Users] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [ImageProducts]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [Products] ([product_id])
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [Orders] ([order_id])
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [Products] ([product_id])
GO
ALTER TABLE [Orders]  WITH CHECK ADD FOREIGN KEY([discount_id])
REFERENCES [Discounts] ([discount_id])
GO
ALTER TABLE [Orders]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [Tables] ([table_id])
GO
ALTER TABLE [Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [Users] ([user_id])
GO
ALTER TABLE [Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [Categories] ([category_id])
GO
ALTER TABLE [Products]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [Users] ([user_id])
GO
ALTER TABLE [Users]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [Roles] ([role_id])
GO
ALTER TABLE [Discounts]  WITH CHECK ADD CHECK  (([discount_percent]>=(0) AND [discount_percent]<=(100)))
GO
