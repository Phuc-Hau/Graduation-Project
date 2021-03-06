USE [master]
GO
/****** Object:  Database [WebBanHang]    Script Date: 24/06/2022 11:23:32 ******/
CREATE DATABASE [WebBanHang]

GO
USE [WebBanHang]
GO
/****** Object:  Table [dbo].[Cutomers]    Script Date: 24/06/2022 11:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cutomers](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](200) NULL,
    [birthday] [date] NULL,
    [procvince] [nvarchar](200) NULL,
    [address] [ntext] NULL,
    [tel] [varchar](20) NULL,
    [district] [nvarchar](200) NULL,
    [sex] [nvarchar](10) NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[GroupProduct]    Script Date: 24/06/2022 11:23:33 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[GroupProduct](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](500) NOT NULL,
    [Content] [ntext] NOT NULL,
    [images] [nvarchar](300) NOT NULL,
    [Status] [bit] NOT NULL,
    PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Img]    Script Date: 24/06/2022 11:23:33 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Img](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Imageid] [int] NULL,
    [Image] [nvarchar](200) NULL,
    PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Orderdetail]    Script Date: 24/06/2022 11:23:33 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Orderdetail](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Order_Id] [int] NULL,
    [Product_Id] [int] NULL,
    [Quantity] [int] NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24/06/2022 11:23:33 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Orders](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Customer_id] [int] NULL,
    [Totalmoney] [float] NULL,
    [Date] [datetime] NULL,
    [Status] [bit] NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Product]    Script Date: 24/06/2022 11:23:33 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Product](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](500) NULL,
    [Detail] [nvarchar](500) NULL,
    [Price] [float] NULL,
    [Sale] [float] NULL,
    [Date] [date] NULL,
    [Amount] [int] NULL,
    [Status] [bit] NULL,
    [GroupID] [int] NULL,
    PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[User]    Script Date: 24/06/2022 11:23:33 ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[User](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [Username] [varchar](25) NOT NULL,
    [Password] [varchar](25) NOT NULL,
    [Email] [varchar](50) NOT NULL,
    [Status] [bit] NOT NULL,
    [Rules] [int] NOT NULL,
    [Cutomers_id] [int] NOT NULL,
    [img] [nvarchar](200) NULL,
    PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
    SET IDENTITY_INSERT [dbo].[Cutomers] ON

    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (1, N'Lan', CAST(N'2000-12-09' AS Date), N'Cao Bằng', N'85/3/1 ,Phạm Văn Đồng phường 3, quận Bình thạnh', NULL, N'Huyện Hòa An', N'Male')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (2, N'Mai', CAST(N'2000-01-01' AS Date), N'Bà Rịa - Vũng Tàu', N'4/3/1 ,Trường Chinh phường 1, quận Tan Phù', NULL, N'Huyện Châu Đức', N'true')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (3, N'Phúc hậuDuong', CAST(N'2000-03-02' AS Date), N'Đắk Nông', N'8/6/1', NULL, N'Huyện Cư Jút', N'true')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (4, N'Chíhieep', CAST(N'2001-02-08' AS Date), N'Bến Tre', N'8/4/1 ,Nam Kỳ Khởi Nghĩa phường 5, quận Bình thạnh', NULL, N'Huyện Giồng Trôm', N'Male')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (5, N'Phát', CAST(N'2002-12-01' AS Date), N'Bắc Giang', N'84/3/1 Quang Trung, phường 1, quận Gò Vấp', NULL, N'Huyện Sơn Động', N'Male')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (6, N'hùng', CAST(N'2000-12-09' AS Date), N'Bà Rịa - Vũng Tàu', N'85/3/1 ,Phạm Văn Đồng phường 3, quận Bình thạnh', NULL, N'Huyện Xuyên Mộc', N'Male')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (7, N'Đào', CAST(N'2000-01-01' AS Date), NULL, N'4/3/1 ,Trường Chinh phường 3, quận Tan Phù', N'0845736568', NULL, N'Male')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (8, N'Liêm', CAST(N'2000-02-01' AS Date), NULL, N'8/6/1 ,Cộng Hòa phường 6, quận Bình thạnh', N'0845938565', NULL, N'Male')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (9, N'Tâm', CAST(N'2001-02-01' AS Date), NULL, N'8/4/1 ,Nam Kỳ Khởi Nghĩa phường 7, quận Bình thạnh', N'0845938565', NULL, N'Male')
    INSERT [dbo].[Cutomers] ([Id], [name], [birthday], [procvince], [address], [tel], [district], [sex]) VALUES (10, N'Dương Phúc Hậu', CAST(N'1900-01-01' AS Date), N'Bắc Kạn', N'', NULL, N'Huyện Bạch Thông', N'Male')

    SET IDENTITY_INSERT [dbo].[Cutomers] OFF

    go
    SET IDENTITY_INSERT [dbo].[GroupProduct] ON

    INSERT [dbo].[GroupProduct] ([ID], [Name], [Content], [images], [Status]) VALUES (1, N'Kem đánh răng', N'Kem đánh răng Coldgate', N'colgate.jpg', 1)
    INSERT [dbo].[GroupProduct] ([ID], [Name], [Content], [images], [Status]) VALUES (2, N'Bánh bông lan', N'Bánh bông lan Solife', N'solite.jpg', 1)
    INSERT [dbo].[GroupProduct] ([ID], [Name], [Content], [images], [Status]) VALUES (3, N'Bánh socola', N'Bánh socola Chocobie', N'chocopie.jpg', 1)
    INSERT [dbo].[GroupProduct] ([ID], [Name], [Content], [images], [Status]) VALUES (4, N'Sữa chua vinamilk', N'Sữa chua vinamilk hương dâu', N'suachua.jpg', 1)
    SET IDENTITY_INSERT [dbo].[GroupProduct] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Img] ON

    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (1, 1, N'ponnie.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (2, 1, N'ponnie1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (3, 1, N'ponnie2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (4, 1, N'ponnie3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (5, 2, N'phomai.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (6, 2, N'phomai1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (7, 2, N'phomai2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (8, 2, N'phomai3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (9, 3, N'halan.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (10, 3, N'halan1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (11, 3, N'halan2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (12, 3, N'halan3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (13, 4, N'solite.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (14, 4, N'solite1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (15, 4, N'solite2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (16, 4, N'solite3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (17, 5, N'colgate.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (18, 5, N'colgate1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (19, 5, N'colgate2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (20, 5, N'colgate3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (21, 6, N'chocopie.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (22, 6, N'chocopie1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (23, 6, N'chocopie2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (24, 6, N'chocopie3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (25, 7, N'suachua.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (26, 7, N'suachua1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (27, 7, N'suachua2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (28, 7, N'suachua3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (29, 8, N'comfort.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (30, 8, N'comfort1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (31, 8, N'comfort2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (32, 8, N'comfort3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (33, 9, N'nuoc-lau-san.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (34, 9, N'nuoc-lau-san1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (35, 9, N'nuoc-lau-san2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (36, 9, N'nuoc-lau-san3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (37, 10, N'cocacola.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (38, 10, N'cocacola1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (39, 10, N'cocacola2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (40, 10, N'cocacola3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (41, 11, N'pepsi.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (42, 11, N'pepsi1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (43, 11, N'pepsi2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (44, 11, N'pepsi3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (45, 12, N'3mien.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (46, 12, N'3mien1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (47, 12, N'3mien2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (48, 12, N'3mien3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (49, 13, N'haohao.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (50, 13, N'haohao1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (51, 13, N'haohao2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (52, 13, N'haohao3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (53, 14, N'milo.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (54, 14, N'milo1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (55, 14, N'milo2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (56, 14, N'milo3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (57, 15, N'ovaltine.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (58, 15, N'ovaltine1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (59, 15, N'ovaltine2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (60, 15, N'ovaltine3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (61, 16, N'lays.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (62, 16, N'lays1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (63, 16, N'lays2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (64, 16, N'lays3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (65, 17, N'swing.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (66, 17, N'swing1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (67, 17, N'swing2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (68, 17, N'swing3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (69, 18, N'dainisa.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (70, 18, N'dainisa1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (71, 18, N'dainisa2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (72, 18, N'dainisa3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (73, 19, N'banhbia.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (74, 19, N'banhbia1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (75, 19, N'banhbia2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (76, 19, N'banhbia3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (77, 20, N'romano.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (78, 20, N'romano1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (79, 20, N'romano2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (80, 20, N'romano3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (81, 21, N'xmen.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (82, 21, N'xmen1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (83, 21, N'xmen2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (84, 21, N'xmen3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (85, 22, N'sua-rua-mat.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (86, 22, N'sua-rua-mat1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (87, 22, N'sua-rua-mat2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (88, 22, N'sua-rua-mat3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (89, 23, N'bot-ngot.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (90, 23, N'bot-ngot1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (91, 23, N'bot-ngot2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (92, 23, N'bot-ngot3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (93, 24, N'knorr.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (94, 24, N'knorr1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (95, 24, N'knorr2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (96, 24, N'knorr3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (97, 25, N'tuongot.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (98, 25, N'tuongot1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (99, 25, N'tuongot2.jpg')
    GO
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (100, 25, N'tuongot3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (101, 26, N'tuongca.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (102, 26, N'tuongca1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (103, 26, N'tuongca2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (104, 26, N'tuongca3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (105, 27, N'merino.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (106, 27, N'merino1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (107, 27, N'merino2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (108, 27, N'merino3.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (109, 28, N'g7.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (110, 28, N'g71.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (111, 28, N'g72.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (112, 28, N'g73.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (113, 29, N'nescf.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (114, 29, N'nescf1.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (115, 29, N'nescf2.jpg')
    INSERT [dbo].[Img] ([ID], [Imageid], [Image]) VALUES (116, 29, N'nescf3.jpg')
    SET IDENTITY_INSERT [dbo].[Img] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Orderdetail] ON
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (1, 1, 1, 1)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (3, 1, 4, 5)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (4, 3, 4, 8)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (5, 1, 15, 1)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (6, 1, 2, 1)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (7, 4, 2, 1)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (8, 4, 3, 3)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (9, 5, 3, 1)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (10, 4, 4, 3)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (11, 7, 1, 4)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (12, 7, 2, 2)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (13, 6, 1, 5)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (14, 6, 2, 3)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (15, 8, 2, 3)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (16, 8, 3, 4)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (17, 8, 4, 2)
    INSERT [dbo].[Orderdetail] ([Id], [Order_Id], [Product_Id], [Quantity]) VALUES (18, 8, 14, 2)
    SET IDENTITY_INSERT [dbo].[Orderdetail] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Orders] ON
    INSERT [dbo].[Orders] ([Id], [Customer_id], [Totalmoney], [Date], [Status]) VALUES (1, 3, 162000, CAST(N'2022-04-29T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[Orders] ([Id], [Customer_id], [Totalmoney], [Date], [Status]) VALUES (3, 2, 80000, CAST(N'2022-04-29T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[Orders] ([Id], [Customer_id], [Totalmoney], [Date], [Status]) VALUES (4, 3, 118100, CAST(N'2022-06-17T08:46:36.270' AS DateTime), 1)
    INSERT [dbo].[Orders] ([Id], [Customer_id], [Totalmoney], [Date], [Status]) VALUES (5, 2, 6300, CAST(N'2022-06-15T23:17:11.740' AS DateTime), 0)
    INSERT [dbo].[Orders] ([Id], [Customer_id], [Totalmoney], [Date], [Status]) VALUES (6, 3, 122600, CAST(N'2022-06-18T18:13:27.533' AS DateTime), 1)
    INSERT [dbo].[Orders] ([Id], [Customer_id], [Totalmoney], [Date], [Status]) VALUES (7, 1, 92000, CAST(N'2022-06-18T17:55:46.687' AS DateTime), 1)
    INSERT [dbo].[Orders] ([Id], [Customer_id], [Totalmoney], [Date], [Status]) VALUES (8, 3, 168500, CAST(N'2022-06-24T10:31:21.370' AS DateTime), 1)
    SET IDENTITY_INSERT [dbo].[Orders] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Product] ON
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (1, N'Xúc xích ponnie', N'Xúc xích ponnie được làm từ thịt', 6000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (2, N'Phô mai con bò cười', N'Thơm ngon, mềm mịn, 8 miếng vị truyền thống', 28000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (3, N'Sữa tươi Cô gái Hà Lan', N'Sữa tươi cô gái Hà Lan, tươi như gái Hà Lan', 7000, 0.1, CAST(N'2022-05-29' AS Date), 1, 1, 2)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (4, N'Bánh bông lan solite', N'Bánh bông lan kem bơ sữa', 20000, 0.1, CAST(N'2022-05-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (5, N'Kem đánh răng Colgate', N'Cho hơi thở mát lạnh, giảm 90% sự phát triển của vi khuẩn', 79000, 0.1, CAST(N'2022-05-29' AS Date), 1, 1, 3)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (6, N'Bánh Chocopie', N'Hạnh phúc là trao tặng, tình như Chocopie', 58000, 0.1, CAST(N'2022-05-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (7, N'Sữa chua Vinamilk', N'Vinamilk "Vươn cao Việt Nam"', 25000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 2)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (8, N'Nước giặt Comfort', N'Thơm mát suốt ngày dài năng động', 129000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 3)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (9, N'Nước lau sàn Sunlight', N'Nhà sạch – không hại da tay – sạch đến bất ngờ', 55000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 3)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (10, N'Nước ngọt có ga Coca Cola', N'CocaCola! Uống cùng cảm xúc', 8000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 2)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (11, N'Nước ngọt có ga Pepsi', N'Pepsi – hương vị tuyệt vời cho cuộc sống của bạn', 7000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 2)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (12, N'Mì 3 miền gold', N'Nổi bật hương vị bò hầm rau thơm', 4000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (13, N'Mì Hảo Hảo', N'Biểu tượng của chất lượng', 4500, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (14, N'Thức uống lúa mạch Milo', N'Nhà vô địch làm từ Milo', 6500, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 2)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (15, N'Thức uống lúa mạch Ovaltine', N'Chẳng cần vô địch, chỉ cần con thích', 6500, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 2)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (16, N'Lays! Snack khoai tây', N'Hương vị đến từ khoai tây', 9000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (17, N'Wing! Snack khoai tây', N'Snack khoai tây vị bít tết kiểu New York', 8500, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (18, N'Bánh quy Dainisa', N'Bánh quy bơ Dainisa', 125000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (19, N'Đặc sản Bánh Bía', N'Bánh Bía Sốc Trăng', 70000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (20, N'Dầu gội Romano', N'Dầu gội cao cấp cho Nam', 150000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 3)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (21, N'Dầu gội Xmen', N'Dầu gội hương nước hoa', 15000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 3)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (22, N'Sữa rửa mặt bùn khoáng Nivea', N'Sữa rửa mặt nam Than hoạt tính giúp sáng da', 79000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 3)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (23, N'Bột ngọt Ajinomoto', N'Bột ngọt làm tăng vị ngon, vị ngọt thịt cho thức ăn', 60000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 4)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (24, N'Hạt nêm knorr', N'Hạt nêm tạo vị ngon cho món ăn', 75000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 4)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (25, N'Tương ớt ChinSu', N'Gia vị Việt Nam luôn có trong mỗi căn bếp', 13000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 4)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (26, N'Tương cà ChinSu', N'Tương cà chua với vị umami ngọt thanh, làm cho món ăn thêm hợp khẩu vị và có mùi thơm hấp dẫn', 13000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 4)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (27, N'Kem Merino', N'Thơm ngon, sánh mịn', 12000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 1)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (28, N'Cafe G7', N'Ngon hơn, vị cà phê mạnh hơn', 44000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 2)
    INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Sale], [Date], [Amount], [Status], [GroupID]) VALUES (29, N'NesCafe', N'Cà phê cho phái mạnh', 44000, 0.1, CAST(N'2022-04-29' AS Date), 1, 1, 2)
    SET IDENTITY_INSERT [dbo].[Product] OFF
    GO
    SET IDENTITY_INSERT [dbo].[User] ON

    INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Status], [Rules], [Cutomers_id], [img]) VALUES (1, N'huuchi', N'123456789', N'huuchi@gmail.com', 1, 0, 1, N'genshin.jpg')
    INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Status], [Rules], [Cutomers_id], [img]) VALUES (2, N'anhtuan', N'123456789', N'anhtuan@gmail.com', 0, 0, 2, N'avata.jpg')
    INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Status], [Rules], [Cutomers_id], [img]) VALUES (3, N'phuchau', N'19011901', N'phuchau164@gmail.com', 1, 0, 3, N'9.jpg')
    INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Status], [Rules], [Cutomers_id], [img]) VALUES (4, N'minhhiep', N'123123123', N'minhhiep@gmail.com', 1, 0, 4, N'56fe8269cf723d2c6463.jpg')
    INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Status], [Rules], [Cutomers_id], [img]) VALUES (5, N'zidan', N'1234', N'zidan@gmail.com', 1, 0, 5, N'avata.jpg')
    INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Status], [Rules], [Cutomers_id], [img]) VALUES (6, N'minhthu', N'1234', N'minhthu@gmail.com', 1, 1, 6, N'avata.jpg')
    INSERT [dbo].[User] ([ID], [Username], [Password], [Email], [Status], [Rules], [Cutomers_id], [img]) VALUES (9, N'admin', N'sdasdasd', N'haudpp@fpt.edu.vn', 1, 1, 10, N'avata.jpg')
    SET IDENTITY_INSERT [dbo].[User] OFF
    GO
    SET ANSI_PADDING ON
    GO
/****** Object:  Index [UQ__User__536C85E4EA623D8F]    Script Date: 24/06/2022 11:23:33 ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED
    (
    [Username] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    GO
ALTER TABLE [dbo].[Img]  WITH CHECK ADD  CONSTRAINT [FK_Img] FOREIGN KEY([Imageid])
    REFERENCES [dbo].[Product] ([Id])
    GO
ALTER TABLE [dbo].[Img] CHECK CONSTRAINT [FK_Img]
    GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([Order_Id])
    REFERENCES [dbo].[Orders] ([Id])
    GO
ALTER TABLE [dbo].[Orderdetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
    GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([Product_Id])
    REFERENCES [dbo].[Product] ([Id])
    GO
ALTER TABLE [dbo].[Orderdetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
    GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cutomers] FOREIGN KEY([Customer_id])
    REFERENCES [dbo].[Cutomers] ([Id])
    GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Cutomers]
    GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GroupProduct] FOREIGN KEY([GroupID])
    REFERENCES [dbo].[GroupProduct] ([ID])
    GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GroupProduct]
    GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_user_cutomers] FOREIGN KEY([Cutomers_id])
    REFERENCES [dbo].[Cutomers] ([Id])
    GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_user_cutomers]
    GO
    USE [master]
    GO
ALTER DATABASE [WebBanHang] SET  READ_WRITE 
GO
