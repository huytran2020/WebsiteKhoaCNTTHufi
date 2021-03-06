USE [master]
GO
/****** Object:  Database [DB_ITWebsite]    Script Date: 1/15/2021 1:12:26 AM ******/
CREATE DATABASE [DB_ITWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_ITWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB_ITWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_ITWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB_ITWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_ITWebsite] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ITWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_ITWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_ITWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_ITWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_ITWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_ITWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_ITWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [DB_ITWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_ITWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_ITWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_ITWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_ITWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_ITWebsite] SET QUERY_STORE = OFF
GO
USE [DB_ITWebsite]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [varchar](50) NOT NULL,
	[Name] [nchar](16) NULL,
	[Password] [nchar](16) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConTentTinTuc]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConTentTinTuc](
	[IDConTent] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](50) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warrantly] [int] NULL,
	[ModifiedDay] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[IDTinTuc] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ConTentTinTuc] PRIMARY KEY CLUSTERED 
(
	[IDConTent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachDeTaiDaDangKy]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachDeTaiDaDangKy](
	[MaDeTaiDaDangKi] [bigint] NOT NULL,
	[MaSV1] [bigint] NULL,
	[TenSV1] [nvarchar](50) NULL,
	[MaDeTai] [nchar](10) NULL,
	[TenDeTai] [nvarchar](500) NULL,
	[TenLoaiDeTai] [nvarchar](50) NULL,
	[MaNhom] [bigint] NULL,
	[MaGVHD] [nchar](10) NULL,
	[MaKhoa] [nchar](10) NULL,
	[ChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhSachDeTaiDaDangKy_1] PRIMARY KEY CLUSTERED 
(
	[MaDeTaiDaDangKi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeTai]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeTai](
	[MaDeTai] [nchar](10) NOT NULL,
	[MaKhoa] [nchar](10) NULL,
	[TenDeTai] [nvarchar](500) NULL,
	[YeuCau] [nvarchar](500) NULL,
	[MucDich] [nvarchar](250) NULL,
	[MaLoai] [bigint] NULL,
	[MaGV] [nchar](10) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_DeTai_1] PRIMARY KEY CLUSTERED 
(
	[MaDeTai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoiTac]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTac](
	[ID] [int] NOT NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Hinh] [nvarchar](max) NULL,
 CONSTRAINT [PK_DoiTac] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoVienHD]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVienHD](
	[MaGiaoVien] [nchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DateBorn] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Specialized] [nvarchar](50) NULL,
 CONSTRAINT [PK_GiaoVienHD] PRIMARY KEY CLUSTERED 
(
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [nchar](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Noidung] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDeTai]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDeTai](
	[MaLoai] [bigint] NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[STC] [int] NULL,
	[NBD] [datetime] NULL,
	[NKT] [datetime] NULL,
 CONSTRAINT [PK_LoaiDeTai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiNhom]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNhom](
	[LoaiNhom] [bigint] NOT NULL,
	[TenLoaiNhom] [nvarchar](50) NULL,
	[NBD] [datetime] NULL,
	[NKT] [datetime] NULL,
	[STC] [int] NULL,
 CONSTRAINT [PK_LoaiNhom] PRIMARY KEY CLUSTERED 
(
	[LoaiNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCon]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCon](
	[MaMenuCon] [int] NOT NULL,
	[TenConTT] [nvarchar](150) NULL,
 CONSTRAINT [PK_MenuCon] PRIMARY KEY CLUSTERED 
(
	[MaMenuCon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuTrungGian]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuTrungGian](
	[MaMenu] [int] NOT NULL,
	[MaConMenu] [int] NOT NULL,
 CONSTRAINT [PK_MenuTrungGian] PRIMARY KEY CLUSTERED 
(
	[MaMenu] ASC,
	[MaConMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomSV]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSV](
	[MaNhom] [bigint] NOT NULL,
	[TenLoaiDeTai] [nvarchar](50) NULL,
	[MaKhoaSV1] [nchar](10) NULL,
	[MaSV1] [bigint] NULL,
	[TenSV1] [nvarchar](50) NULL,
	[ChucVuSV1] [nvarchar](50) NULL,
	[MaSV2] [bigint] NULL,
	[TenSV2] [nvarchar](50) NULL,
	[ChucVuSV2] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[MaLoaiNhom] [bigint] NULL,
	[MaKhoaSV2] [nchar](10) NULL,
 CONSTRAINT [PK_NhomSV_1] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomSVChinh]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSVChinh](
	[MaNhom] [bigint] NOT NULL,
	[TenLoaiDeTai] [nvarchar](50) NULL,
	[MaSv1] [bigint] NULL,
	[TenSv1] [nvarchar](50) NULL,
	[MaKhoaSv1] [nchar](10) NULL,
	[ChucVuSv1] [nvarchar](50) NULL,
	[MaSv2] [bigint] NULL,
	[TenSv2] [nvarchar](50) NULL,
	[MaKhoaSv2] [nchar](10) NULL,
	[ChucVuSv2] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[MaLoaiNhom] [bigint] NULL,
 CONSTRAINT [PK_NhomCho] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSinhVien] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DateBorn] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[Password] [nchar](16) NULL,
	[Mark] [float] NOT NULL,
	[MaKhoa] [nchar](10) NOT NULL,
	[MaNhom] [bigint] NULL,
	[ChucVu] [nvarchar](50) NULL,
	[MaLoaiDeTai] [bigint] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDN] [bigint] NOT NULL,
	[MatKhau] [nchar](16) NOT NULL,
	[ViTri] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[ID] [bigint] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDay] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[IDTypeMenu] [int] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([ID], [Name], [Password], [Email], [Address], [Phone], [Position]) VALUES (N'admin', N'Hải             ', N'admin123        ', N'hai@gmail.com', N'TP HCM', N'0931463360', N'Quản trị viên')
INSERT [dbo].[Admin] ([ID], [Name], [Password], [Email], [Address], [Phone], [Position]) VALUES (N'admin1', N'Huy             ', N'admin123        ', N'huy@gmail.com', N'TP HCM', N'0893446552', N'Quản trị viên')
GO
SET IDENTITY_INSERT [dbo].[ConTentTinTuc] ON 

INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (1, N'Trường ĐH Công nghiệp Thực phẩm TPHCM: Điểm chuẩn một số ngành sẽ cao', N'tuyen-sinh-1', N'Kết thúc đợt điều chỉnh nguyện vọng xét tuyển đại học năm 2020,qua cuộc tổng kết tổng số nguyện vọng đăng kí vào Trường Đại học Công nghiệp Thực phẩm TP.HCM (HUFI) năm 2020 tăng từ 15.956 lên 20.175 nguyện vọng so với năm 2019.', N'tuyensinhdh.jpg', 1, N'Kết thúc đợt điều chỉnh nguyện vọng xét tuyển đại học năm 2020,qua cuộc tổng kết tổng số nguyện vọng đăng kí vào Trường Đại học Công nghiệp Thực phẩm TP.HCM (HUFI) năm 2020 tăng từ 15.956 lên 20.175 nguyện vọng so với năm 2019.', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (2, N'Điểm chuẩn kỳ xét tuyển đại học hệ chính quy năm 2020 theo phương thức xét điểm thi THPT', N'tuyen-sinh-2', N'Căn cứ vào đề án tuyển sinh năm 2020 và về việc xác định ngưỡng ĐBCL đầu vào của các ngành tuyển sinh năm 2020...', N'tuyensinh1.jpg', 1, N'Căn cứ vào đề án tuyển sinh năm 2020 và về việc xác định ngưỡng ĐBCL đầu vào của các ngành tuyển sinh năm 2020 và công văn báo cáo chỉ tiêu tuyển sinh đại học năm 2020 của Trường đối với Bộ Giáo dục và Đào tạo. Hội đồng tuyển sinh Trường ĐH Công nghiệp Thực phẩm TP.HCM công bố điểm chuẩn kỳ xét tuyển đại học hệ chính quy năm 2020 theo phương thức xét điểm thi THPT cho 28 ngành tại trường', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), 2, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (3, N'Trường ĐH Công nghiệp Thực phẩm TP.HCM: Điểm chuẩn cũng không cao khi xét tuyển sinh thử lần 2', N'tuyen-sinh-3', N'Trong khi nhiều thí sinh lo lắng về điểm chuẩn khi nhiều trường đồng loạt tăng điểm  khiến nhiều thí sinh lo lắng, nôn nao khi chỉ còn...', N'tuyensinhdh.jpg', 1, N'Trong khi nhiều thí sinh lo lắng về điểm chuẩn khi nhiều trường đồng loạt tăng điểm  khiến nhiều thí sinh lo lắng, nôn nao khi chỉ còn không ít thời gian nữa là sẽ có đã có kết quả không biết là các bạn thí sinh có “gặt hái được quả ngọt” không đây, để rõ hơn thì chúng ta cùng nhau tham khảo một số thông tin dự báo thông tin điểm chuẩn của trường nhé!', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-19T00:00:00.000' AS DateTime), 3, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (4, N'Trường ĐH Công nghiệp Thực phẩm TPHCM: Điểm chuẩn một số ngành sẽ cao', N'tuyen-sinh-4', N'Kết thúc đợt điều chỉnh nguyện vọng xét tuyển đại học năm 2020, qua cuộc tổng kết tổng số nguyện vọng đăng kí vào...', N'tuyensinhdh.jpg', 1, N'Kết thúc đợt điều chỉnh nguyện vọng xét tuyển đại học năm 2020, qua cuộc tổng kết tổng số nguyện vọng đăng kí vào Trường Đại học Công nghiệp Thực phẩm TP.HCM (HUFI) năm 2020 tăng từ 15.956 lên 20.175 nguyện vọng so với năm 2019', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-10T00:00:00.000' AS DateTime), 4, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (5, N'TT Giáo dục phổ thông HUFI môi trường học tập thân thiện, an toàn và năng động', N'tin-tuc-1', N'Là một Trung tâm giáo dục phổ thông thuộc trường Đại học Công nghiệp Thực phẩm TP. Hồ Chí Minh nên có rất nhiều thuận lợi nhất là cơ sở vật chất hiện đại...', N'hoithao.jpg', 3, N'Là một Trung tâm giáo dục phổ thông thuộc trường Đại học Công nghiệp Thực phẩm TP. Hồ Chí Minh nên có rất nhiều thuận lợi nhất là cơ sở vật chất hiện đại như: phòng học, phòng thực hành, thư viện, sân thể thao, … Đó là cơ sở để Trung tâm xây dựng một môi trường học tập thân thiện, an toàn và năng động cho học sinh', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (6, N'Thông báo 1021/TB-DCT về kế hoạch đăng ký học phần học kỳ II năm học 2020 - 2021', N'tin-tuc-2', NULL, N'hoithao.jpg', 3, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, 3, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (7, N'Thông báo số 999/TB-DCT V/v tổ chức kiểm tra thu hoạch kết thúc Tuần sinh hoạt công dân - HSSV cuối khóa, năm 2020-2021', N'tin-tuc-3', NULL, N'hoithao.jpg', 3, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-19T00:00:00.000' AS DateTime), NULL, NULL, 3, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (8, N'Thông báo V/v gia hạn thu học phí cho tất cả sinh viên học kỳ 1 năm học 2020-2021', N'tin-tuc-4', NULL, N'hoithao.jpg', 3, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-10T00:00:00.000' AS DateTime), NULL, NULL, 3, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (9, N'Đào tạo ngắn hạn', N'dao-tao-1', N'Gồm có 58 chương trình đào tạo', N'nganhan.jpg', 2, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (10, N'Các ngành nghề đào tạo', N'dao-tao-2', N'Có 3 loại ngành nghề đào tạo', N'daihoc.jpg', 2, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (11, N'Chương trình đào tạo liên kết quốc tế', N'dao-tao-3', N'Hiện nay có 3 chương trình đào tạo liên kết quốc tế', N'lienketquocte.jpg', 2, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-19T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (12, N'Giới thiệu mô hình giáo dục bậc THPT - HUFI', N'dao-tao-4', N'Trường Đại học Công nghiệp Thực phẩm TP. Hồ Chí Minh là trường công lập đào tạo đa ngành nghề, nhiều bậc đạo tạo từ bậc THPT...', N'phothong.jpg', 2, N'Trường Đại học Công nghiệp Thực phẩm TP. Hồ Chí Minh là trường công lập đào tạo đa ngành nghề, nhiều bậc đạo tạo từ bậc THPT đến đại học và sau đại học, trong đó có bậc THPT theo hệ (GDTX). Từ năm 2009 Trung tâm Giáo dục phổ thông ra đời nhằm đáp ứng nhu cầu đào tạo phân luồng và hướng nghiệp của TP. HCM nói chung và cả nước nói riêng.', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-10T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (13, N'Nguy cơ bảo mật ẩn dưới nền tảng học trực tuyến tăng hơn 1000% tại ĐNÁ', N'khoa-hoc-1', NULL, N'khoahoc.jpg', 5, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (14, N'Tổ chức hội thảo khoa học Khoa CNTT lần thứ 8 - năm 2020', N'khoa-hoc-2', NULL, N'khoahoc.jpg', 5, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, 5, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (15, N'Thông báo số 2 V/v thay đổi thời gian tổ chức và nhận bài hội thảo khoa học Khoa CNTT lần 8 - năm 2020', N'khoa-hoc-3', NULL, N'khoahoc.jpg', 5, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-19T00:00:00.000' AS DateTime), NULL, NULL, 5, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (16, N'Đăng ký tham dự Seminar: Các vấn đề nghiên cứu khoa học trong sinh viên
', N'khoa-hoc-4', NULL, N'khoahoc.jpg', 5, NULL, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-10T00:00:00.000' AS DateTime), NULL, NULL, 5, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (17, N'Thông điệp của Hiệu trưởng Trường Đại học Công nghiệp Thực phẩm TP. Hồ Chí Minh', N'gioi-thieu-1', N'Trường đại học Công Nghiệp Thực Phẩm TP.HCM với bề dày lịch sử gần 40 năm xây dựng và phát triển đã định hình tầm nhìn trở thành một trường đại học...', N'santruong.png', 4, N'Trường đại học Công Nghiệp Thực Phẩm TP.HCM với bề dày lịch sử gần 40 năm xây dựng và phát triển đã định hình tầm nhìn trở thành một trường đại học định hướng ứng dụng hàng đầu ở Việt Nam vào năm 2035', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (18, N'Cơ sở vật chất hiện đại', N'gioi-thieu-2', N'Cơ sở vật chất của HUFI được thiết kế hiện đại, khang trang, đẹp, thanh lịch, và tiện nghi với đầy đủ trang thiết bị hiện đại đáp ứng xu hướng phát triển...', N'santruong.png', 4, N'Cơ sở vật chất của HUFI được thiết kế hiện đại, khang trang, đẹp, thanh lịch, và tiện nghi với đầy đủ trang thiết bị hiện đại đáp ứng xu hướng phát triển của CMCN 4.0 là điều kiện cần để thực hiện các hoạt động đào tạo, nghiên cứu khoa học và các hoạt động khác. ', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, 4, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (19, N'Lịch sử phát triển', N'gioi-thieu-3', N'1982: Sau ngày thống nhất đất nước, nhu cầu cán bộ công nhân viên chức các ngành, các địa phương ở miền Nam rất lớn.', N'santruong.png', 4, N'1982: Sau ngày thống nhất đất nước, nhu cầu cán bộ công nhân viên chức các ngành, các địa phương ở miền Nam rất lớn. Ngày 09/09/1982 Bộ Công nghiệp Thực phẩm ban hành quyết định 986/CNTP về việc thành lập trường Kinh tế Kỹ thuật Công nghiệp Thực phẩm TP. Hồ Chí Minh nhằm bồi dưỡng, đào tạo đội ngũ cán bộ kinh tế kỹ thuật cho ngành công nghiệp thực phẩm tại phía Nam.', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-19T00:00:00.000' AS DateTime), NULL, NULL, 4, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (20, N'Nhận diện thương hiệu HUFI', N'gioi-thieu-4', N'Logo là biểu hiện hình ảnh gọn của một thương hiệu', N'thuonghieu.jpg', 4, N'Logo là biểu hiện hình ảnh gọn của một thương hiệu. Đối với các bạn sinh viên của trường đại học Công Nghiệp Thực Phẩm TP.HCM hẳn đã quá quen thuộc với hình ảnh logo hình tròn màu trắng xanh, nổi bật với màu đỏ cửa chữ Hufi.', NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-10T00:00:00.000' AS DateTime), NULL, NULL, 4, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (21, N'Trường Đại học Công nghiệp Thực phẩm TP. HCM dự kiến phương án tuyển sinh năm 2021', N'tuyen-sinh-5', N'Dự kiến năm 2021, Trường Đại học Công nghiệp Thực phẩm TP. HCM (HUFI) sẽ có 04 phương án tuyển sinh cho 34 ngành đại học.', N'tuyensinh1.jpg', 1, N'Theo thạc sĩ Hoàng Thị Thoa - Phó giám đốc Trung tâm Tuyển sinh và Truyền thông HUFI, trường dự kiến duy trì 4 phương thức tuyển sinh trong năm 2021 gồm: xét tuyển học bạ THPT các năm; xét tuyển thí sinh theo kết quả điểm thi tốt nghiệp THPT năm 2021; xét tuyển thí sinh theo kết quả điểm bài thi ĐGNL ĐHQG-HCM năm 2021 và Xét tuyển thẳng theo Quy chế tuyển sinh đại học của Bộ Giáo dục & Đào tạo.Trong đó, riêng phương thức xét tuyển học bạ sẽ có điều chỉnh về cách thức xét tuyển. Cụ thể, Nhà trường sử dụng điểm trung bình cộng của tổ hợp môn xét tuyển, ứng với từng ngành xét tuyển của 3 năm lớp 10, lớp 11 và học kỳ 1 lớp 12 đạt từ 18 điểm trở lên hoặc tổng điểm lớp 12 theo tổ hợp môn xét tuyển, ứng với từng ngành xét tuyển đạt từ 18 điểm trở lên.', NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 5, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (22, N'Năm 2021 vẫn giữ phương thức thi THPT, tương lai thi trên máy tính', N'tuyen-sinh-6', N'Tại hội nghị trực tuyến về giáo dục đại học do Bộ GD-ĐT tổ chức, hầu hết các trường đều khẳng định muốn giữ ổn định phương thức xét tuyển bằng kết quả thi THPT Quốc gia.', N'hoinghi.jpg', 1, N'Sáng 12-12, Bộ GD-ĐT đã tổ chức Hội nghị trực tuyến về giáo dục đại học bàn về năm nội dung: Công tác tuyển sinh; tự chủ đại học và Hội đồng trường; công tác kiểm định chất lượng giáo dục đại học; chuyển đổi số trong giáo dục đại học; cơ sở dữ liệu quốc gia về giáo dục đại học.Theo báo cáo của Bộ GD-ĐT, năm 2020, ngoài các phương thức xét tuyển riêng, phần lớn các cơ sở đào tạo đại học vẫn chọn phương thức xét tuyển đại học bằng kết quả thi THPT.Tại hội thảo, hầu hết các trường đại học đều ủng hộ duy trì phương thức xét tuyển này trong năm 2021 để giữ vững sự ổn định cho các trường THPT và cho thí sinh.

GS Nguyễn Hữu Tú, phó hiệu trưởng ĐH Y Hà Nội, góp ý: "Bộ GD-ĐT vẫn cần giữ vai trò chỉ đạo dù kỳ thi tốt nghiệp THPT được giao về các địa phương, và vai trò tổ chức lọc ảo, cố gắng để kỳ thi có tính phân loại tốt. Chỉ có thế các trường mới yên tâm sử dụng kết quả thi của kỳ thi THPT Quốc gia".', NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-31T00:00:00.000' AS DateTime), 6, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (23, N'''Chốt'' phương án thi tốt nghiệp THPT năm 2021', N'tin-tuc-5', N'Bộ GD-ĐT vừa có văn bản khẳng định kỳ thi tốt nghiệp THPT năm 2021 sẽ được tổ chức theo hướng giữ ổn định như năm 2020,', N'thithpt.jpg', 3, N'Thông tin được nêu trong văn bản hướng dẫn nhiệm vụ quản lý chất lượng năm học 2020 - 2021 do Thứ trưởng Bộ GD-ĐT Nguyễn Hữu Độ ký ban hành.

Theo đó, kỳ thi tốt nghiệp THPT năm 2021 sẽ được tổ chức theo hướng giữ ổn định như năm 2020, nhằm đánh giá chính xác kết quả học tập của học sinh sau 12 năm học theo chuẩn đầu ra của chương trình, bảo đảm kết quả thi phản ánh trung thực, khách quan, đúng trình độ, năng lực của học sinh, có độ tin cậy và sự phân hóa.

Kết quả kỳ thi được sử dụng để xét công nhận tốt nghiệp THPT cho thí sinh và cung cấp thông tin để đánh giá chất lượng giáo dục, điều chỉnh quá trình dạy học nhằm nâng cao chất lượng dạy học trong các trường phổ thông.

', NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, 3, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (24, N'Tọa đàm diễn đàn “Khởi nghiệp đổi mới sáng tạo tỉnh Lào Cai 2020”', N'tin-tuc-6', N'Chiều ngày 27 tháng 12 năm 2020, tại Trung tâm Hội nghị Tỉnh Lào Cai,  đoàn công tác Trường Đại học Công nghiệp Thực phẩm Tp.Hồ Chí Minh (HUFI) do PGS.TS Nguyễn Xuân Hoàn, Bí thư Đảng ủy,', N'tintuc6.jpg', 3, N'Về phía tỉnh Lào Cai có đồng chí Trịnh Xuân Trường, Phó Bí thư Tỉnh ủy, Chủ tịch UBND tỉnh Lào Cai, đồng chí Dương Đức Huy Trưởng Ban Tuyên giáo tỉnh Lào Cai, Lãnh đạo các sở ban ngành, Đoàn Thanh niên Cộng sản tỉnh Lào Cai, Đài phát thanh – truyền hình, Báo Lào Cai và một số hãng thông tấn báo chí Trung ương đóng trên địa bàn Tỉnh Lào Cai  và một số diễn giả, đặc biệt với sự góp mặt của hơn 100 đại biểu thanh niên ưu tú đại diện hơn 150 ngàn đoàn viên thanh niên tỉnh Lào Cai.', NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, 3, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (25, N'Đào tạo sau đại học', N'dao-tao-5', N'Chương trình đào tạo trình độ thạc sĩ khóa 1', N'saudh.jpg', 2, N'CÁC CHƯƠNG TRÌNH ĐÀO TẠO TRÌNH ĐỘ THẠC SĨ KHÓA 1', NULL, CAST(N'2020-05-18T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-05-18T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (26, N'Đào tạo cao đẳng', N'dao-tao-6', N'Chương trình đào tạo cao đẳng', N'caodang.jpg', 2, NULL, NULL, CAST(N'2020-12-09T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-09T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (27, N'Thông báo số 3: V/v Tổ chức hội thảo khoa học Khoa CNTT lần thứ 8 – năm 2020', N'khoa-hoc-5', NULL, N'khoahoc5.jpg', 5, NULL, NULL, CAST(N'2020-12-09T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-09T00:00:00.000' AS DateTime), NULL, NULL, 5, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (28, N'Thông báo: Tổ chức Seminar về cách mạng Công nghiệp 4.0', N'khoa-hoc-6', NULL, N'khoahoc6.jpg', 5, N' https://docs.google.com/forms/d/e/1FAIpQLSdmIUWG7hSXPIxSIzy6sbHzHscOl2N6pbCUh8ddnEkGROYLIQ/viewform', NULL, CAST(N'2020-08-09T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-08-09T00:00:00.000' AS DateTime), NULL, NULL, 5, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (29, N'Xác nhận nhập học bằng giấy chứng nhận kết quả thi', N'tuyen-sinh-7', N'Theo thông báo từ Bộ GD&ĐT, sau khi biết điểm thi, thí sinh sẽ được nhận Giấy chứng nhận kết quả thi THPT quốc gia 2020. Thí sinh sẽ sử dụng giấy này để xác nhận nhập học vào trường mà mình trúng tuyển. ', N'tuyensinh1.jpg', 1, N'Thí sinh nhận Giấy chứng nhận kết quả thi tại trường THPT mình đã theo học. Mỗi trường sẽ thông báo thời gian nhận chính xác, thí sinh nhớ theo dõi để đến nhận. Thí sinh tự do có thể được nhận Giấy này qua địa chỉ ghi trong hồ sơ hoặc đến địa điểm đăng ký dự thi để nhận.', NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-12-20T00:00:00.000' AS DateTime), 7, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (30, N'Trường Đại học Công nghiệp Thực phẩm TPHCM: Điểm sàn 20 điểm thì cao hay thấp?', N'tuyen-sinh-8', N'Điểm thi tốt nghiệp THPT năm 2020 tăng cao là cơ sở để Trường Đại học Công nghiệp Thực phẩm TP.HCM (HUFI) đưa ra mức điểm sàn tăng cũng khá mạnh.', N'tuyensinh8.jpg', 1, N'Theo Th.S Phạm Thái Sơn - Giám đốc Trung tâm Tuyển sinh và Truyền thông, HUFI nhận xét mức điểm sàn của trường dao động từ 15-20 điểm nguyên nhân là do điểm thi tăng, cộng thêm chỉ tiêu xét điểm thi tốt nghiệp THPT giảm so năm 2019 nên điểm chuẩn xét tuyển kết quả thi của phần lớn các trường đại học sẽ tăng lên và HUFI cũng không ngoại lệ.

Với mức điểm sàn là từ 15-20 điểm thí sinh hoàn toàn có thể xét tuyển vào trường. HUFI luôn tạo cơ hội, điều kiện giúp cho thí sinh được vào đúng ngành nghề mình yêu thích và theo đuổi ước mơ của mình. Bên cạnh đó, mức điểm này vẫn đáp ứng được chất lượng đầu vào và đảm bảo được chuẩn đầu ra ổn định.', NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), 8, NULL, 1, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (10021, N'Làm sao để nhận diện các tình huống lừa đảo khi sinh viên đi tìm việc làm?', N'tin-tuc-7', N'Nhằm cung cấp những thông tin, kiến thức cần thiết cho sinh viên khi đi tìm việc làm tránh khỏi các hình thức lừa đảo trong quá trình tìm việc. Chiều ngày 27/12, đã diễn ra Talkshow “Nhận diện các tình huống lừa đảo khi sinh viên đi tìm việc”, ', N'tintuc7.jpg', 3, N'Qua buổi talkshow các bạn sinh viên đã biết thêm nhiều kiến thức về: đặc điểm, phương thức, thủ đoạn của các cá nhân/ tổ chức lừa đảo tín dụng đen, lừa đảo đa cấp biến tướng, các trung tâm giới thiệu việc làm ảo, hậu quả, cách phòng tránh các chiêu trò lừa đảo và cách khắc phục nếu đang bị vướng vào các cá nhân/ tổ chức lừa đảo trên.

Không chỉ vậy, các bạn còn biết được những địa chỉ, trang web uy tín để tìm việc làm và được nghe những câu chuyện, chia sẻ của các vị khách mời, được giải đáp thắc mắc xoay quanh vấn đề của chương trình.Chương trình kết thúc thành công cả về lượng lẫn về chất vì thu hút được sự quan tâm, theo dõi của hơn 500 bạn sinh viên của Nhà trường. Bên cạnh đó các bạn còn rút ra được kinh nghiệm để bảo vệ được bản thân, bảo vệ gia đình tránh khỏi các hình thức lừa đảo trong quá trình tìm việc làm, từ đó có cơ hội tìm được nhiều việc làm tốt hơn nữa.', NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), NULL, NULL, 3, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (10022, N'Thông báo số 1: Mời viết bài hội thảo khoa CNTT lần thứ 8', N'khoa-hoc-7', NULL, N'saudh.jpg', 5, NULL, NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), NULL, NULL, 5, NULL)
INSERT [dbo].[ConTentTinTuc] ([IDConTent], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warrantly], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tags], [IDTinTuc], [Status]) VALUES (10023, N'Tầm nhìn sứ mạng Trường Đại học Công nghiệp Thực phẩm Tp.HCM', N'dao-tao-7', NULL, N'saudh.jpg', 2, NULL, NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-08-12T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[ConTentTinTuc] OFF
GO
INSERT [dbo].[DanhSachDeTaiDaDangKy] ([MaDeTaiDaDangKi], [MaSV1], [TenSV1], [MaDeTai], [TenDeTai], [TenLoaiDeTai], [MaNhom], [MaGVHD], [MaKhoa], [ChucVu]) VALUES (2001170077, 2001170077, N'Trần Quốc Huy', N'DT002     ', N'Xây dựngwebsite khoaCông nghệThông tin', N'Đồ án chuyên ngành', 2001170077, N'GV003     ', N'08DH      ', N'Trưởng nhóm')
GO
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT001     ', N'08DH      ', N'Xây dựng hệ
thống phần mềm
quản lý và hỗ trợ
mua bán các mặt
hàng điện dân
dụng', N'1/ Tìm hiểu yêu cầu nghiệp vụ mua bán hàng điện dân dụng tại các cửa hàng lớn,
có nhiều sản phẩm và nhiều nhân viên bán hàng.
2/ Phân tích hệ thống thông tin của phần mềm
3/ Xây dựng Web/hoặc Form và app cho nghiệp vụ :
- Web/Form: quản lý thông tin sản phẩm, kho hàng, báo cáo thống kê.
- App dành cho nhân viên bán hàng: tìm kiếm sản phẩm và nơi lưu kho', NULL, 3, N'GV006     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT002     ', N'08DH      ', N'Xây dựng
website khoa
Công nghệ
Thông tin', N'1/ Tìm hiểu yêu cầu nghiệp vụ của website tin tức khoa CNTT
2/ Tim hiểu mô hình MVC
3/ Phân tích hệ thống thông tin của ứng dụng
4/ Xây dựng Website khoa CNTT', NULL, 3, N'GV003     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT003     ', N'08DH      ', N'Xây dựng ứng
dụng quản lý
mua bán đồ gỗ
online', N'1/ Tìm hiểu yêu cầu nghiệp vụ mua bán đồ gỗ (có mua trực tiếp và online), quản
lý cả phần giao hàng.
2/ Phân tích hệ thống thông tin của ứng dụng
3/ Xây dựng Website và App Mobile cho nghiệp vụ:
- Website: Quản lý thông tin sản phẩm, bán sản phẩm, kho hàng, báo cáo thống
kê.
- App dành cho nhân viên bán hàng: Tìm kiếm sản phẩm và nơi lưu kho', NULL, 3, N'GV003     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT004     ', N'08DH      ', N'Xây dựng ứng
dụng quản lý
phòng trọ', N'1/ Tìm hiểu yêu cầu nghiệp vụ cho thuê phòng trọ, có nhiều dãy trọ và loại
phòng trọ.
2/ Phân tích hệ thống thông tin của ứng dụng
3/ Xây dựng ứng dụng windows để quàn lý: Quản lý loại phòng, phòng, quản lý
cho thuê, quản lý đặt phòng.', NULL, 3, N'GV003     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT005     ', N'08DH      ', N'Xây dựng ứng
dụng quản lý
mua bán Đồng hồ', N'1/ Tìm hiểu yêu cầu nghiệp vụ mua bán đồng hồ tại các cửa hàng lớn, có nhiều
sản phẩm và nhiều nhân viên bán hàng.
2/ Phân tích hệ thống thông tin của phần mềm
3/ Xây dựng Website và App Mobile cho nghiệp vụ:
- Website: Quản lý thông tin sản phẩm, bán sản phẩm, kho hàng, báo cáo thống
kê.
- App dành cho nhân viên bán hàng: Tìm kiếm sản phẩm và nơi lưu kho', NULL, 3, N'GV007     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT006     ', N'08DH      ', N'Xây dựng ứng
dụng quản lý
mua bán Máy vi
tính', N'1/ Tìm hiểu yêu cầu nghiệp vụ mua bán Máy vi tính tại các cửa hàng lớn, có
nhiều sản phẩm và nhiều nhân viên bán hàng.
2/ Phân tích hệ thống thông tin của phần mềm
3/ Xây dựng Website và App Mobile cho nghiệp vụ:
- Website: Quản lý thông tin sản phẩm, bán sản phẩm, kho hàng, báo cáo thống
kê.
- App dành cho nhân viên bán hàng: Tìm kiếm sản phẩm và nơi lưu kho', NULL, 1, N'GV007     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT007     ', N'08DH      ', N'Xây dựng ứng
dụng quản lý Đặt
tiệc tại nhà hàng', N'1/ Tìm hiểu yêu cầu nghiệp vụ chính tại các cửa hàng nhà lớn, có nhiều sảnh tiệc
(có thể có nhiều chi nhánh) và nhiều nhân viên phục vụ.
2/ Phân tích hệ thống thông tin của phần mềm.
3/ Xây dựng Website và App Mobile cho nghiệp vụ:
- Website: Quản lý thông tin sản phẩm món ăn, đặt/hủy tiệc, sảnh tiệc, báo cáo
thống kê.
- App dành cho nhân viên lễ tân/phục vụ: Tìm kiếm món ăn, sảnh tiệc', NULL, 4, N'GV007     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT008     ', N'08DH      ', N'Xây dựng
Website mua bán
trang thiết bị
điện tử', N'- Tìm hiểu yêu cầu nghiệp vụ mua bán trang thiết bị điện tử tại các cửa hàng lớn
(có website): thế giới di động, điện máy xanh, Thiên hoà, Nguyễn kim, ...
- Phân tích hệ thống thông tin của phần mềm
- Xây dựng Website và App Mobile cho nghiệp vụ:
+ Website: Quản lý thông tin sản phẩm, bán sản phẩm, kho hàng, báo cáo
thống kê.
+ App: Tìm kiếm và hiển thị thông tin sản phẩm', NULL, 4, N'GV008     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT009     ', N'08DH      ', N'Xây dựng hệ
thống phần mềm
hỗ trợ các công
ty xây dựng quản
lý nhân công và
công trình', N'1/ Tìm hiểu yêu cầu nghiệp vụ quản lý xây dựng công trình của các công ty xây
dựng.
2/ Phân tích hệ thống thông tin của phần mềm
3/ Xây dựng Web/hoặc Form và app cho nghiệp vụ :
- Web/Form: quản lý thông tin nhân công, công trình, tiền lương, tiền xây dựng,
tiền vật tư, tiến độ xây dựng.
- App dành cho giám sát công trình: báo cáo tiến độ', NULL, 4, N'GV006     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT010     ', N'08DH      ', N'Xây dựng
Website hỗ trợ
việc dạy và học
của giáo viên và
sinh viên Khoa
Công nghệ
Thông tin -
Trường Đại học
Công nghiệp
Thực phẩm
Tp.HCM', N'- Khảo sát nghiệp vụ để xây dựng ứng dụng website hỗ trợ việc dạy và học của
giáo viên và sinh viên Khoa công nghệ thông tin tại trường Đại học Công nghiệp
Thực phẩm Tp.HCM.
- Tìm hiểu Zend Framework, MVC và Bootstrap
- Quản lý thông tin giáo viên và sinh viên liên quan đến môn học
- Xây dựng hệ thống quản lý tài liệu liên quan đến môn học theo từng chương:
nội dung chương, câu hỏi và câu trả lời
- Xây dựng cơ chế gửi/nhận bài giữa giáo viên và sinh viên', NULL, 4, N'GV006     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT011     ', N'08DH      ', N'Xây dựng
website du lịch', N'- Khảo sát nghiệp vụ tại các công ty du lịch và các website du lịch để xây dựng
một mô hình cho Website du lịch
- Tìm hiểu và sử dụng PHP và các framework PHP
- Xây dựng danh sách các tour du lịch, chi tiết về thông tin các tour du lịch,
thông tin của chương trình tour
- Xây dựng tính năng tìm kiếm các tour, lựa chọn xem chi tiết về thông tin tour,
lịch trình của tour.
- Xây dựng quy trình đặt tour cho khách hàng
- Tư vấn khách hàng: chatbox', NULL, 4, N'GV006     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT012     ', N'08DH      ', N'Xây dựng
Website mua bán
đồ dùng trẻ em', N'- Tìm hiểu nghiệp vụ mua bán đồ dùng trẻ em các website (KidsPalza,
Bibomart, Concung,..)
- Phân tích hệ thống thống của phần mềm
- Xây dựng nghiệp vụ hệ thống bán hàng trực tuyến (Website): hiển thị thông tin
hàng hóa, quản lý thông tin khách hàng, quản lý thông tin hàng hóa, quản lý mua
hàng', NULL, 4, N'GV009     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT013     ', N'08DH      ', N'Tìm kiếm ảnh
tưng tự theo
nội dung dựa
trên kỹ thuật
phân lớp ảnh
theo tiếp cận
cây KD-Tree', N'+ Tìm các tài liệu, bài báo có liên quan đến tìm kiếm hình ảnh tương tự theo nội
dung, các phương pháp phân lớp dữ liệu ảnh, kỹ thuật phân lớp ảnh theo tiếp cận cây
KD-Tree.
+ Nghiên cứu bài toán tìm kiếm ảnh tương tự.
+ Nghiên cứu kỹ thuật phân lớp hình ảnh (Classification).
+ Xây dựng cấu trúc dữ liệu theo tiếp cận cây KD-Tree phân lớp.
+ Nghiên cứu và xây dựng mô hình tìm kiếm ảnh tương tự dựa trên kỹ thuật phân lớp
KD-Tree.', NULL, 5, N'GV001     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT014     ', N'08DH      ', N'Trích xuất đặc
trưng hình ảnh
- Ứng dụng
phân lớp ảnh
bằng thuật toán
cây quyết định
Decision Tree.', N'+ Tìm các tài liệu, bài báo có liên quan đến trích xuất đặc trưng hình ảnh, phân lớp
hình ảnh, thuật toán cây quyết định Decision Tree.
+ Nghiên cứu bài toán trích xuất đặc trưng hình ảnh dựa trên kỹ thuật phân vùng ảnh
theo độ tương phản, gom cụm màu theo thuật toán k-Means, kỹ thuật trích xuất
đường biên theo phương pháp LoG, phép lọc Sobel.', NULL, 5, N'GV001     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT015     ', N'08DH      ', N'Tìm kiếm ảnh
bằng kỹ thuật

gom cụm K-
means dựa trên

phân bố màu
sắc', N'''-Kết quả thực nghiệm của đề tài: Sử dụng kỹ thuật gom cụm vào việc tìm kiếm tập
ảnh tương tự theo phân bố màu sắc trong các lĩnh vực khác nhau như tìm kiếm hình
ảnh con người, động thực vật, giống cây trồng...
''-Bộ dữ liệu thực nghiệm: Bộ ảnh ImageClef
- Ngôn ngữ lập trình: C#, Python', NULL, 5, N'GV002     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT016     ', N'08DH      ', N'Phân loại hình
ảnh dựa trên
kỹ thuật láng
giềng gần nhất
k-NN', N'- Mục tiêu tìm hiểu đề tài: Kỹ thuật láng giềng gần nhất k-NN.
''-Kết quả thực nghiệm của đề tài: Thực hiện phân loại hình ảnh trong một bộ dữ liệu
mẫu cho trước và từ đó tìm kiếm tập hình ảnh tương tự theo chủ đề đã được phân loại
như xác định các loài hoa, động vật, giống cây trồng...', NULL, 5, N'GV002     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT017     ', N'08DH      ', N'Tìm hiểu công
cụ SRILM và
xây dựng ứng
dụng gợi ý sửa
lỗi chính tả
tiếng Việt', N'- Tìm hiểu mô hình ngôn ngữ n-gram
- Tìm hiểu công cụ SRILM
- Sử dụng được SRILM để huấn luyện mô hình ngôn ngữ n-gram
- Tìm hiểu một số lỗi sai chính tả tiếng Việt
- Xây dựng ứng dụng gợi ý sửa lỗi chính tả tiếng Việt
- Ngôn ngữ lập trình: Java, Python.....', NULL, 5, N'GV004     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT018     ', N'08DH      ', N'Xây dựng ứng
dụng cho phép
hiệu chỉnh kết
quả gióng hàng
từ thủ công.', N'- Tìm hiểu về gióng hàng từ .
- Tìm hiểu công cụ Giza++ và sử dụng nó để gióng hàng từ.
- Xây dựng ứng dụng cho phép hiệu chỉnh thủ công kết quả gióng hàng từ trên ngôn
ngữ: Tiếng Anh, Tiếng Việt.', NULL, 5, N'GV004     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT019     ', N'08DH      ', N'Khai thác tập
hữu ích cao có
lợi nhuận âm
trên cơ sở dữ
liệu bán hàng
siêu thị bằng
thuật toán
FHN.', N'- Tìm hiểu về khai thác tập hữu ích cao trên cơ sở dữ liệu giao dịch.
- Tìm hiểu và cài đặt thuật toán FHN để khai thác tập hữu ích cao có lợi nhuận âm.
- Chuyển dữ liệu bán hàng về cơ sở dữ liệu giao dịch dạng số.
- Ứng dụng thuật toán FHN để khai thác tập hữu ích cao trên cơ sở dữ liệu bán hàng
siêu thị.', NULL, 5, N'GV005     ', 1)
INSERT [dbo].[DeTai] ([MaDeTai], [MaKhoa], [TenDeTai], [YeuCau], [MucDich], [MaLoai], [MaGV], [TrangThai]) VALUES (N'DT020     ', N'08DH      ', N'Tìm hiểu thuật
toán FHM+.
Ứng dụng khai
thác tập hữu
ích cao có
ràng buộc trên
cơ sở dữ liệu
bán hàng.', N'- Tìm hiểu bài toán khai thác tập hữu ích cao có ràng buộc số lượng item.
- Tìm hiểu về cơ sở dữ liệu giao dịch và các khái niệm liên quan.
- Chuyển dữ liệu bán hàng về cơ sở dữ liệu giao dịch dạng số.
- Cài đặt thuật toán FHM+ để khai thác tập hữu ích cao có ràng buộc trên cơ sở dữ
liệu bán hàng.', NULL, 5, N'GV005     ', 1)
GO
INSERT [dbo].[DoiTac] ([ID], [Link], [DisplayOrder], [Target], [Status], [Hinh]) VALUES (1, N'http://datvietsoftware.com/', 1, N'_self', 1, N'datviet.PNG')
INSERT [dbo].[DoiTac] ([ID], [Link], [DisplayOrder], [Target], [Status], [Hinh]) VALUES (2, N'http://viettech.net.vn/', 1, N'_self', 1, N'dps.PNG')
INSERT [dbo].[DoiTac] ([ID], [Link], [DisplayOrder], [Target], [Status], [Hinh]) VALUES (3, N'http://viettech.net.vn/', 1, N'_self', 1, N'viettech.PNG')
INSERT [dbo].[DoiTac] ([ID], [Link], [DisplayOrder], [Target], [Status], [Hinh]) VALUES (4, N'https://www.gameloft.com/en/', 1, N'_self', 1, N'gamelot.PNG')
INSERT [dbo].[DoiTac] ([ID], [Link], [DisplayOrder], [Target], [Status], [Hinh]) VALUES (5, N'https://gianhangvn.com/', 1, N'_self', 1, N'gianhangvn.PNG')
INSERT [dbo].[DoiTac] ([ID], [Link], [DisplayOrder], [Target], [Status], [Hinh]) VALUES (6, N'https://infoasia.com.vn/', 1, N'_self', 1, N'infoasafia.PNG')
GO
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'', NULL, NULL)
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'1', N'Liên hệ', NULL)
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'2', N'Địa chỉ', NULL)
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'3', N'Số người online', NULL)
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'4', N'Số người truy cập', NULL)
GO
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV001     ', N'ThS Nguyễn Thị Định', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV002     ', N'ThS Nguyễn Phương Hạc', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV003     ', N'ThS Vũ Văn Vinh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV004     ', N'ThS Nguyễn Thế
Hữu
 và Trần Thanh
Phước', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV005     ', N'ThS Nguyễn Văn Lễ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV006     ', N'ThS Nguyễn Thị
Bích Ngân', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV007     ', N'ThS Trần Văn Thọ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV008     ', N'ThS Phan Thị Ngọc Mai', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GiaoVienHD] ([MaGiaoVien], [Name], [DateBorn], [Email], [Address], [Phone], [Specialized]) VALUES (N'GV009     ', N'ThS Đào Minh Châu', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'07DH      ', N'07 Đại học')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'08DH      ', N'08 Đại học ')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'09DH      ', N'09 Đại học')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'17CD      ', N'Cao đẳng')
GO
INSERT [dbo].[LoaiDeTai] ([MaLoai], [TenLoai], [STC], [NBD], [NKT]) VALUES (1, N'Đồ án ', 8, CAST(N'2020-11-21T00:00:00.000' AS DateTime), CAST(N'2021-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[LoaiDeTai] ([MaLoai], [TenLoai], [STC], [NBD], [NKT]) VALUES (2, N'Khóa luận ', 8, CAST(N'2020-11-15T00:00:00.000' AS DateTime), CAST(N'2021-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[LoaiDeTai] ([MaLoai], [TenLoai], [STC], [NBD], [NKT]) VALUES (3, N'Đồ án chuyên ngành', 4, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[LoaiDeTai] ([MaLoai], [TenLoai], [STC], [NBD], [NKT]) VALUES (4, N'Đồ án tốt nghiệp', 4, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[LoaiDeTai] ([MaLoai], [TenLoai], [STC], [NBD], [NKT]) VALUES (5, N'Khóa luận tốt nghiệp', 8, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[LoaiNhom] ([LoaiNhom], [TenLoaiNhom], [NBD], [NKT], [STC]) VALUES (1, N'Đồ án chuyên ngành', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-02-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[LoaiNhom] ([LoaiNhom], [TenLoaiNhom], [NBD], [NKT], [STC]) VALUES (2, N'Đồ án tốt nghiệp', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-02-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[LoaiNhom] ([LoaiNhom], [TenLoaiNhom], [NBD], [NKT], [STC]) VALUES (3, N'Khóa luận tốt nghiệp', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-02-01T00:00:00.000' AS DateTime), 8)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Tuyển sinh', N'/tuyen-sinh', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Đào tạo', N'/dao-tao', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Giới thiệu', N'/gioi-thieu', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Khoa học', N'/khoa-hoc', 6, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Liên hệ', N'/lien-he', 7, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1002, N'Đăng nhập', N'/dang-nhap', 8, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1003, N'Đăng xuất', N'/dang-xuat', 9, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (1, N'Chương trình đào tạo')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (2, N'Đào tạo ngắn hạn')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (3, N'Quy chế đào tạo')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (4, N'Mục tiêu đào tạo')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (5, N'Giới thiệu khoa')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (6, N'Cơ cấu tổ chức')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (7, N'Bộ môn khoa học máy tính')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (8, N'Bộ môn mạng máy tính')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (9, N'Bộ môn hệ thống thông tin')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (10, N'Bộ môn công nghệ phần mềm')
INSERT [dbo].[MenuCon] ([MaMenuCon], [TenConTT]) VALUES (11, NULL)
GO
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (4, 1)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (4, 2)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (4, 3)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (4, 4)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (5, 5)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (5, 6)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (5, 7)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (5, 8)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (5, 9)
INSERT [dbo].[MenuTrungGian] ([MaMenu], [MaConMenu]) VALUES (5, 10)
GO
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'MenuChinh')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'MenuTop')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
GO
INSERT [dbo].[NhomSV] ([MaNhom], [TenLoaiDeTai], [MaKhoaSV1], [MaSV1], [TenSV1], [ChucVuSV1], [MaSV2], [TenSV2], [ChucVuSV2], [TrangThai], [MaLoaiNhom], [MaKhoaSV2]) VALUES (2001170077, N'Đồ án chuyên ngành', N'08DH      ', 2001170077, N'Trần Quốc Huy', N'Trưởng nhóm', 2001170023, N'Vũ Minh Hiếu', N'Thành viên', NULL, 1, N'08DH      ')
INSERT [dbo].[NhomSV] ([MaNhom], [TenLoaiDeTai], [MaKhoaSV1], [MaSV1], [TenSV1], [ChucVuSV1], [MaSV2], [TenSV2], [ChucVuSV2], [TrangThai], [MaLoaiNhom], [MaKhoaSV2]) VALUES (2001170078, N'Đồ án chuyên ngành', N'08DH      ', 2001170078, N'Nguyễn Hoàng Bảo', N'Trưởng nhóm', 2001170110, N'Đặng Hữu Nhân', N'Thành viên', NULL, 1, N'08DH      ')
INSERT [dbo].[NhomSV] ([MaNhom], [TenLoaiDeTai], [MaKhoaSV1], [MaSV1], [TenSV1], [ChucVuSV1], [MaSV2], [TenSV2], [ChucVuSV2], [TrangThai], [MaLoaiNhom], [MaKhoaSV2]) VALUES (2001170986, N'Khóa luận tốt nghiệp', N'08DH      ', 2001170986, N'Nguyễn Như Huỳnh', N'Trưởng nhóm', 2001170099, N'Nguyễn Văn Nam', N'Thành viên', NULL, 3, N'08DH      ')
INSERT [dbo].[NhomSV] ([MaNhom], [TenLoaiDeTai], [MaKhoaSV1], [MaSV1], [TenSV1], [ChucVuSV1], [MaSV2], [TenSV2], [ChucVuSV2], [TrangThai], [MaLoaiNhom], [MaKhoaSV2]) VALUES (20011701101, N'Đồ án tốt nghiệp', N'08DH      ', 2001170110, N'Đặng Hữu Nhân', N'Trưởng nhóm', 2001170753, N'Nguyễn Thị Hà', N'Thành viên', NULL, 2, N'08DH      ')
INSERT [dbo].[NhomSV] ([MaNhom], [TenLoaiDeTai], [MaKhoaSV1], [MaSV1], [TenSV1], [ChucVuSV1], [MaSV2], [TenSV2], [ChucVuSV2], [TrangThai], [MaLoaiNhom], [MaKhoaSV2]) VALUES (20011703211, N'Khóa luận tốt nghiệp', N'08DH      ', 2001170321, N'Lê Văn Hoài', N'Trưởng nhóm', 2001170066, N'Đặng Nguyên Vũ', N'Thành viên', NULL, 3, N'07DH      ')
INSERT [dbo].[NhomSV] ([MaNhom], [TenLoaiDeTai], [MaKhoaSV1], [MaSV1], [TenSV1], [ChucVuSV1], [MaSV2], [TenSV2], [ChucVuSV2], [TrangThai], [MaLoaiNhom], [MaKhoaSV2]) VALUES (20011709871, N'Đồ án tốt nghiệp', N'08DH      ', 2001170987, N'Trần Văn Toàn', N'Trưởng nhóm', 2001170078, N'Nguyễn Hoàng Bảo', N'Thành viên', NULL, 2, N'08DH      ')
INSERT [dbo].[NhomSV] ([MaNhom], [TenLoaiDeTai], [MaKhoaSV1], [MaSV1], [TenSV1], [ChucVuSV1], [MaSV2], [TenSV2], [ChucVuSV2], [TrangThai], [MaLoaiNhom], [MaKhoaSV2]) VALUES (20011763831, N'Khóa luận tốt nghiệp', N'08Dh      ', 2001176383, N'Trần Như Uyên', N'Trưởng nhóm', 2001170090, N'Lê Văn Hiển', N'Thành viên', NULL, 3, N'08DH      ')
GO
INSERT [dbo].[NhomSVChinh] ([MaNhom], [TenLoaiDeTai], [MaSv1], [TenSv1], [MaKhoaSv1], [ChucVuSv1], [MaSv2], [TenSv2], [MaKhoaSv2], [ChucVuSv2], [TrangThai], [MaLoaiNhom]) VALUES (2001170078, N'Đồ án chuyên ngành', 2001170078, N'Nguyễn Hoàng Bảo', N'08DH      ', N'Trưởng nhóm', 2001170110, N'Đặng Hữu Nhân', N'08DH      ', N'Thành viên', NULL, 1)
INSERT [dbo].[NhomSVChinh] ([MaNhom], [TenLoaiDeTai], [MaSv1], [TenSv1], [MaKhoaSv1], [ChucVuSv1], [MaSv2], [TenSv2], [MaKhoaSv2], [ChucVuSv2], [TrangThai], [MaLoaiNhom]) VALUES (20011709861, N'Khóa luận tốt nghiệp', 2001170986, N'Nguyễn Như Huỳnh', N'08DH      ', N'Trưởng nhóm', 2001170099, N'Nguyễn Văn Nam', N'08DH      ', N'Thành viên', NULL, 3)
INSERT [dbo].[NhomSVChinh] ([MaNhom], [TenLoaiDeTai], [MaSv1], [TenSv1], [MaKhoaSv1], [ChucVuSv1], [MaSv2], [TenSv2], [MaKhoaSv2], [ChucVuSv2], [TrangThai], [MaLoaiNhom]) VALUES (200117011011, N'Đồ án tốt nghiệp', 2001170110, N'Đặng Hữu Nhân', N'08DH      ', N'Trưởng nhóm', 2001170753, N'Nguyễn Thị Hà', N'08DH      ', N'Thành viên', NULL, 2)
INSERT [dbo].[NhomSVChinh] ([MaNhom], [TenLoaiDeTai], [MaSv1], [TenSv1], [MaKhoaSv1], [ChucVuSv1], [MaSv2], [TenSv2], [MaKhoaSv2], [ChucVuSv2], [TrangThai], [MaLoaiNhom]) VALUES (200117032111, N'Khóa luận tốt nghiệp', 2001170321, N'Lê Văn Hoài', N'08DH      ', N'Trưởng nhóm', 2001170066, N'Đặng Nguyên Vũ', N'07DH      ', N'Thành viên', NULL, 3)
INSERT [dbo].[NhomSVChinh] ([MaNhom], [TenLoaiDeTai], [MaSv1], [TenSv1], [MaKhoaSv1], [ChucVuSv1], [MaSv2], [TenSv2], [MaKhoaSv2], [ChucVuSv2], [TrangThai], [MaLoaiNhom]) VALUES (200117087811, N'Đồ án chuyên ngành', 2001170878, N'Nguyễn Công Phượng', N'08DH      ', N'Trưởng nhóm', 2001170098, N'Nguyễn Tuấn', N'08DH      ', N'Thành viên', NULL, 2)
INSERT [dbo].[NhomSVChinh] ([MaNhom], [TenLoaiDeTai], [MaSv1], [TenSv1], [MaKhoaSv1], [ChucVuSv1], [MaSv2], [TenSv2], [MaKhoaSv2], [ChucVuSv2], [TrangThai], [MaLoaiNhom]) VALUES (200117638311, N'Khóa luận tốt nghiệp', 2001176383, N'Trần Như Uyên', N'08Dh      ', N'Trưởng nhóm', 2001170090, N'Lê Văn Hiển', N'08DH      ', N'Thành viên', NULL, 3)
GO
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170022, N'Nguyễn Thị Nhung', CAST(N'1999-09-23T00:00:00.000' AS DateTime), N'nhung123@gmail.com', N'Hà Nội', N'0912387465', 1, N'321             ', 1.9, N'17CD      ', NULL, N'Null', 0)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170023, N'Vũ Minh Hiếu', CAST(N'1999-05-12T00:00:00.000' AS DateTime), N'vuminhhieu@gmail.com', N'TP HCM', N'0893225446', 1, N'123             ', 2.49, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170044, N'Lê Văn Hải', CAST(N'1999-06-06T00:00:00.000' AS DateTime), N'kmmm25366@gmail.com', N'TP HCM', N'0931463360', 1, N'134             ', 2.48, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170050, N'Võ Anh Hào', CAST(N'1999-03-12T00:00:00.000' AS DateTime), N'haova@gmail.com', N'TP HCM', N'01669513669', 1, N'124             ', 3.2, N'08DH      ', NULL, NULL, 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170066, N'Đặng Nguyên Vũ', CAST(N'1998-12-23T00:00:00.000' AS DateTime), N'nguyenvu12@ggmail.com', N'TP HCM', N'0987654321', 1, N'555             ', 2.5, N'07DH      ', NULL, NULL, 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170077, N'Trần Quốc Huy', CAST(N'1999-03-03T00:00:00.000' AS DateTime), N'tranquochuy123@gmail.com', N'Vũng tàu', N'0941345990', 1, N'222             ', 2.45, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170078, N'Nguyễn Hoàng Bảo', CAST(N'1999-12-25T00:00:00.000' AS DateTime), N'bao@gmail.com', N'TPHCM', N'0947255556', 1, N'980             ', 2.3, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170090, N'Lê Văn Hiển', CAST(N'1999-03-03T00:00:00.000' AS DateTime), N'hien@gmail.com', N'Nam Định', N'0928472828', 1, N'888             ', 3.2, N'08DH      ', NULL, NULL, 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170098, N'Nguyễn Tuấn', CAST(N'1999-09-07T00:00:00.000' AS DateTime), N'tuan@gmail.com', N'Nha Trang', N'0984728788', 1, N'576             ', 2.1, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170099, N'Nguyễn Văn Nam', CAST(N'1999-12-23T00:00:00.000' AS DateTime), N'nam@gmail.com', N'Hà Tĩnh', N'0912837656', 1, N'789             ', 3, N'08DH      ', NULL, NULL, 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170110, N'Đặng Hữu Nhân', CAST(N'1999-12-12T00:00:00.000' AS DateTime), N'nhan123@gmail.com', N'Tiền Giang', N'0987654321', 1, N'432             ', 2.4, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170119, N'Đặng Hữu Nhân', CAST(N'1999-02-02T00:00:00.000' AS DateTime), N'dhnhan@gmail.com', N'Bến Tre', N'0984191976', 1, N'333             ', 3.5, N'08DH      ', NULL, N'null', 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170120, N'Lê Thị Hà', CAST(N'1999-03-09T00:00:00.000' AS DateTime), N'lethiha123@gmail.com', N'Vũng tàu', N'0941345990', 1, N'444             ', 3.4, N'08DH      ', NULL, N'null', 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170234, N'Nguyễn Thị Oanh', CAST(N'1999-09-23T00:00:00.000' AS DateTime), N'oanh@gmail.com', N'Huế', N'0912348765', 1, N'678             ', 2.3, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170321, N'Lê Văn Hoài', CAST(N'1999-05-09T00:00:00.000' AS DateTime), N'hoai@gmail.com', N'Phan Thiết', N'0947666666', 1, N'999             ', 2.6, N'08DH      ', NULL, NULL, 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170657, N'Nguyễn Tuấn Anh', CAST(N'1999-09-07T00:00:00.000' AS DateTime), N'anh@gmail.com', N'Gia Lai', N'0928474888', 1, N'765             ', 2.6, N'08DH      ', NULL, NULL, 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170753, N'Nguyễn Thị Hà', CAST(N'1999-12-23T00:00:00.000' AS DateTime), N'ha@gmail.com', N'Kiên Giang', N'0948478888', 1, N'808             ', 2.3, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170878, N'Nguyễn Công Phượng', CAST(N'1999-09-09T00:00:00.000' AS DateTime), N'phuong@gmail.com', N'Cần Thơ', N'0987483788', 1, N'777             ', 2.2, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170986, N'Nguyễn Như Huỳnh', CAST(N'1999-08-04T00:00:00.000' AS DateTime), N'huynh@gmail.com', N'Phú Quốc', N'0923837888', 1, N'090             ', 2.7, N'08DH      ', NULL, NULL, 2)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001170987, N'Trần Văn Toàn', CAST(N'1999-04-23T00:00:00.000' AS DateTime), N'toan@gmail.com', N'Bình Phước', N'0927834829', 1, N'999             ', 2.4, N'08DH      ', NULL, NULL, 1)
INSERT [dbo].[SinhVien] ([MaSinhVien], [Name], [DateBorn], [Email], [Address], [Phone], [Status], [Password], [Mark], [MaKhoa], [MaNhom], [ChucVu], [MaLoaiDeTai]) VALUES (2001176383, N'Trần Như Uyên', CAST(N'1999-09-23T00:00:00.000' AS DateTime), N'uyen@gmail.com', N'Đồng Nai', N'0927773737', 1, N'967             ', 2.9, N'08Dh      ', NULL, NULL, 2)
GO
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [ViTri]) VALUES (2001170044, N'111111          ', N'admin')
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [ViTri]) VALUES (2001170050, N'222222          ', N'user')
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [ViTri]) VALUES (2001170077, N'123456          ', N'admin')
GO
INSERT [dbo].[TinTuc] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [IDTypeMenu]) VALUES (1, N'Tuyển sinh', N'tuyen-sinh', 2, 1, NULL, CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'admin', CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [IDTypeMenu]) VALUES (2, N'Đào tạo', N'dao-tao', 4, 2, NULL, CAST(N'2020-01-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2020-01-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [IDTypeMenu]) VALUES (3, N'Tin tức', N'tin-tuc', 3, 3, NULL, CAST(N'2020-01-28T00:00:00.000' AS DateTime), N'admin1', CAST(N'2020-01-28T00:00:00.000' AS DateTime), N'admin1', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [IDTypeMenu]) VALUES (4, N'Giới thiệu', N'gioi-thieu', 5, 4, NULL, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'admin1', CAST(N'2020-01-28T00:00:00.000' AS DateTime), N'admin1', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [IDTypeMenu]) VALUES (5, N'Khoa học', N'khoa-hoc', 6, 5, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), N'admin', CAST(N'2020-01-28T00:00:00.000' AS DateTime), N'admin1', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDay], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [IDTypeMenu]) VALUES (6, N'Liên hệ', N'lien-he', 7, 6, NULL, CAST(N'2020-10-12T00:00:00.000' AS DateTime), N'admin', CAST(N'2020-01-28T00:00:00.000' AS DateTime), N'admin1', NULL, NULL, 1, NULL, NULL)
GO
ALTER TABLE [dbo].[ConTentTinTuc]  WITH CHECK ADD  CONSTRAINT [FK_ConTentTinTuc_TinTuc] FOREIGN KEY([IDTinTuc])
REFERENCES [dbo].[TinTuc] ([ID])
GO
ALTER TABLE [dbo].[ConTentTinTuc] CHECK CONSTRAINT [FK_ConTentTinTuc_TinTuc]
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachDeTaiDaDangKy_DeTai] FOREIGN KEY([MaDeTai])
REFERENCES [dbo].[DeTai] ([MaDeTai])
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy] CHECK CONSTRAINT [FK_DanhSachDeTaiDaDangKy_DeTai]
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachDeTaiDaDangKy_GiaoVienHD] FOREIGN KEY([MaGVHD])
REFERENCES [dbo].[GiaoVienHD] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy] CHECK CONSTRAINT [FK_DanhSachDeTaiDaDangKy_GiaoVienHD]
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachDeTaiDaDangKy_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy] CHECK CONSTRAINT [FK_DanhSachDeTaiDaDangKy_Khoa]
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachDeTaiDaDangKy_SinhVien] FOREIGN KEY([MaSV1])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[DanhSachDeTaiDaDangKy] CHECK CONSTRAINT [FK_DanhSachDeTaiDaDangKy_SinhVien]
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD  CONSTRAINT [FK_DeTai_GiaoVienHD] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVienHD] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[DeTai] CHECK CONSTRAINT [FK_DeTai_GiaoVienHD]
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD  CONSTRAINT [FK_DeTai_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[DeTai] CHECK CONSTRAINT [FK_DeTai_Khoa]
GO
ALTER TABLE [dbo].[DeTai]  WITH CHECK ADD  CONSTRAINT [FK_DeTai_LoaiDeTai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiDeTai] ([MaLoai])
GO
ALTER TABLE [dbo].[DeTai] CHECK CONSTRAINT [FK_DeTai_LoaiDeTai]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_MenuType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[MenuType] ([ID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_MenuType]
GO
ALTER TABLE [dbo].[MenuTrungGian]  WITH CHECK ADD  CONSTRAINT [FK_MenuTrungGian_Menu] FOREIGN KEY([MaMenu])
REFERENCES [dbo].[Menu] ([ID])
GO
ALTER TABLE [dbo].[MenuTrungGian] CHECK CONSTRAINT [FK_MenuTrungGian_Menu]
GO
ALTER TABLE [dbo].[MenuTrungGian]  WITH CHECK ADD  CONSTRAINT [FK_MenuTrungGian_MenuCon] FOREIGN KEY([MaConMenu])
REFERENCES [dbo].[MenuCon] ([MaMenuCon])
GO
ALTER TABLE [dbo].[MenuTrungGian] CHECK CONSTRAINT [FK_MenuTrungGian_MenuCon]
GO
ALTER TABLE [dbo].[NhomSV]  WITH CHECK ADD  CONSTRAINT [FK_NhomSV_LoaiNhom] FOREIGN KEY([MaLoaiNhom])
REFERENCES [dbo].[LoaiNhom] ([LoaiNhom])
GO
ALTER TABLE [dbo].[NhomSV] CHECK CONSTRAINT [FK_NhomSV_LoaiNhom]
GO
ALTER TABLE [dbo].[NhomSV]  WITH CHECK ADD  CONSTRAINT [FK_NhomSV_SinhVien] FOREIGN KEY([MaSV1])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[NhomSV] CHECK CONSTRAINT [FK_NhomSV_SinhVien]
GO
ALTER TABLE [dbo].[NhomSV]  WITH CHECK ADD  CONSTRAINT [FK_NhomSV_SinhVien1] FOREIGN KEY([MaSV2])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[NhomSV] CHECK CONSTRAINT [FK_NhomSV_SinhVien1]
GO
ALTER TABLE [dbo].[NhomSVChinh]  WITH CHECK ADD  CONSTRAINT [FK_NhomCho_LoaiNhom] FOREIGN KEY([MaLoaiNhom])
REFERENCES [dbo].[LoaiNhom] ([LoaiNhom])
GO
ALTER TABLE [dbo].[NhomSVChinh] CHECK CONSTRAINT [FK_NhomCho_LoaiNhom]
GO
ALTER TABLE [dbo].[NhomSVChinh]  WITH CHECK ADD  CONSTRAINT [FK_NhomCho_SinhVien] FOREIGN KEY([MaSv1])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[NhomSVChinh] CHECK CONSTRAINT [FK_NhomCho_SinhVien]
GO
ALTER TABLE [dbo].[NhomSVChinh]  WITH CHECK ADD  CONSTRAINT [FK_NhomSVChinh_SinhVien] FOREIGN KEY([MaSv2])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[NhomSVChinh] CHECK CONSTRAINT [FK_NhomSVChinh_SinhVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_SinhVien] FOREIGN KEY([TenDN])
REFERENCES [dbo].[SinhVien] ([MaSinhVien])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_SinhVien]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_Menu] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Menu] ([ID])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_Menu]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_MenuCon] FOREIGN KEY([IDTypeMenu])
REFERENCES [dbo].[MenuCon] ([MaMenuCon])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_MenuCon]
GO
/****** Object:  StoredProcedure [dbo].[Admin_Login]    Script Date: 1/15/2021 1:12:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Admin_Login]
@ID varchar(20),
@Password varchar(20)
as
begin
declare @count int
declare @res bit
select @count = count(*) from Admin where ID = @ID and Password = @Password 
end
GO
USE [master]
GO
ALTER DATABASE [DB_ITWebsite] SET  READ_WRITE 
GO
