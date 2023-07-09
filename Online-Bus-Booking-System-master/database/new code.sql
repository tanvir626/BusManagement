USE [master]
GO
/****** Object:  Database [OnlineBusBooking]    Script Date: 7/9/2023 11:29:53 AM ******/
CREATE DATABASE [OnlineBusBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineBusBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineBusBooking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineBusBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineBusBooking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineBusBooking] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineBusBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineBusBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineBusBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineBusBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineBusBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineBusBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineBusBooking] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineBusBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineBusBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineBusBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineBusBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineBusBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineBusBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineBusBooking', N'ON'
GO
ALTER DATABASE [OnlineBusBooking] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineBusBooking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineBusBooking]
GO
/****** Object:  Table [dbo].[BookingMaster]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingMaster](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[RegId] [int] NULL,
	[BusId] [int] NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[SeatNo] [nvarchar](50) NULL,
	[TravelDate] [varchar](50) NULL,
	[Origin] [varchar](50) NULL,
	[Destination] [varchar](50) NULL,
	[BoardingID] [int] NULL,
	[Fare] [decimal](18, 2) NULL,
	[PNRNo] [varchar](50) NULL,
	[ScheduleID] [int] NULL,
 CONSTRAINT [PK_BookingMaster] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusMaster]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusMaster](
	[BusId] [int] IDENTITY(1,1) NOT NULL,
	[BusNo] [varchar](50) NULL,
	[BustType] [varchar](50) NULL,
	[TotalSeat] [int] NULL,
	[SeatColumn] [int] NULL,
	[SeatRow] [int] NULL,
	[BookedSeat] [int] NULL,
	[AvailableSeats] [int] NULL,
	[BusName] [varchar](50) NULL,
 CONSTRAINT [PK_BusMaster] PRIMARY KEY CLUSTERED 
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardDetails]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDetails](
	[CardID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CardType] [varchar](20) NULL,
	[BankName] [varchar](50) NULL,
	[CVVNo] [varchar](10) NULL,
	[CardNo] [nvarchar](100) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_CardDetails] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityDetails]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityDetails](
	[CityID] [bigint] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
 CONSTRAINT [PK_CityDetails] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpStand]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpStand](
	[StandId] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NULL,
	[PlaceName] [varchar](50) NULL,
	[PlaceTime] [varchar](50) NULL,
	[BusID] [int] NULL,
 CONSTRAINT [PK_PickUpStand] PRIMARY KEY CLUSTERED 
(
	[StandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PNRDetails]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PNRDetails](
	[PNRDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[PNRNo] [varchar](50) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[TotalTickets] [int] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_PNRDetails] PRIMARY KEY CLUSTERED 
(
	[PNRDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[regId] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[Picode] [varchar](15) NULL,
	[Contact] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[regId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteDetails]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteDetails](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [varchar](50) NULL,
	[Destination] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[BusID] [int] NULL,
 CONSTRAINT [PK_RouteDetails] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleMaster]    Script Date: 7/9/2023 11:29:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleMaster](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[BusId] [int] NULL,
	[Date] [varchar](50) NULL,
	[Fare] [decimal](18, 2) NULL,
	[EstimatedTime] [varchar](50) NULL,
	[ArivalTime] [varchar](50) NULL,
	[DepartureTime] [varchar](50) NULL,
	[RouteID] [int] NULL,
	[BookedSeats] [int] NULL,
	[AvailableSeats] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookingMaster] ON 

INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (13, 1, 3, N'Anand', N'Singh', N'abc@gmail.com', N'8291951419', N'Tongi', N'34', N'25/03/2023', N'Tongi', N'Jamalpur', 5, CAST(800.00 AS Decimal(18, 2)), N'OR9IJW', 5)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (14, 1, 3, N'Anmo', N'Sharma', N'abc@gmail.com', N'9029451159', N'Tongi', N'35', N'25/03/2023', N'Tongi', N'Jamalpur', 5, CAST(800.00 AS Decimal(18, 2)), N'OR9IJW', 5)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (15, 3, 3, N'Atul', N'Dubey', N'atul@gmail.com', N'98989898', N'Tongi', N'32', N'25/03/2023', N'Tongi', N'Jamalpur', 6, CAST(800.00 AS Decimal(18, 2)), N'6422EK', 5)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (16, 1, 5, N'Atul', N'Dubey', N'atul@gmail.com', N'9561454638', N'Tongi', N'31', N'30/03/2023', N'Tongi', N'Jessore', 10, CAST(800.00 AS Decimal(18, 2)), N'W3TBAF', 8)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (17, 1, 5, N'Amit', N'Dubey', N'a@gmail.com', N'8888245689', N'Tongi', N'32', N'30/03/2023', N'Tongi', N'Jessore', 10, CAST(800.00 AS Decimal(18, 2)), N'W3TBAF', 8)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (18, 1, 5, N'Suraj', N'Dubey', N'a@gmail.com', N'8945621547', N'Tongi', N'33', N'30/03/2023', N'Tongi', N'Jessore', 10, CAST(800.00 AS Decimal(18, 2)), N'W3TBAF', 8)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (19, 2, 5, N'Neha', N'Dubey', N'neha@gmail.com', N'9029451159', N'Tongi', N'26', N'28/03/2023', N'Tongi', N'Jessore', 9, CAST(500.00 AS Decimal(18, 2)), N'8DB5W0', 11)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (20, 2, 3, N'Atul', N'Dubey', N'atul@gmail.com', N'9029451159', N'Tongi', N'11', N'30/03/2023', N'Tongi', N'Jamalpur', 6, CAST(250.00 AS Decimal(18, 2)), N'4ZEV3G', 14)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (21, 2, 3, N'Kiran', N'Dubey', N'kiran@tiwari.com', N'8888245689', N'Tongi', N'12', N'30/03/2023', N'Tongi', N'Jamalpur', 6, CAST(250.00 AS Decimal(18, 2)), N'4ZEV3G', 14)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (22, 5, 3, N'Md.Tanvir', N'Hossain', N'testweb597@gmail.com', N'32', N'Dhaka', N'22', N'25/07/2023', N'Tongi', N'Jamalpur', 6, CAST(150.00 AS Decimal(18, 2)), N'HVE4DC', 15)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (23, 5, 3, N'Md.Tanvir', N'Hossain', N'hitanvirhossain@gmail.com', N'232323', N'a', N'23', N'25/07/2023', N'Tongi', N'Jamalpur', 6, CAST(150.00 AS Decimal(18, 2)), N'HVE4DC', 15)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (24, 6, 3, N'Md.Tanvir', N'Hossain', N'testweb597@gmail.com', N'34367676', N'Dhaka', N'31', N'25/07/2023', N'Tongi', N'Jamalpur', 8, CAST(150.00 AS Decimal(18, 2)), N'R6IQAI', 15)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (25, 6, 3, N'', N'', N'', N'', N'', N'12', N'25/07/2023', N'Tongi', N'Jamalpur', 8, CAST(150.00 AS Decimal(18, 2)), N'R6IQAI', 15)
INSERT [dbo].[BookingMaster] ([BookingId], [RegId], [BusId], [Fname], [Lname], [Email], [Contact], [City], [SeatNo], [TravelDate], [Origin], [Destination], [BoardingID], [Fare], [PNRNo], [ScheduleID]) VALUES (26, 6, 3, N'', N'', N'', N'', N'', N'19', N'25/07/2023', N'Tongi', N'Jamalpur', 8, CAST(150.00 AS Decimal(18, 2)), N'R6IQAI', 15)
SET IDENTITY_INSERT [dbo].[BookingMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[BusMaster] ON 

INSERT [dbo].[BusMaster] ([BusId], [BusNo], [BustType], [TotalSeat], [SeatColumn], [SeatRow], [BookedSeat], [AvailableSeats], [BusName]) VALUES (3, N'NV245632', N'AC', 35, 7, 5, 0, 35, N'Neeta Volvo')
INSERT [dbo].[BusMaster] ([BusId], [BusNo], [BustType], [TotalSeat], [SeatColumn], [SeatRow], [BookedSeat], [AvailableSeats], [BusName]) VALUES (4, N'64656', N'AC', 54, 9, 6, 0, 54, N'Atul Bus')
INSERT [dbo].[BusMaster] ([BusId], [BusNo], [BustType], [TotalSeat], [SeatColumn], [SeatRow], [BookedSeat], [AvailableSeats], [BusName]) VALUES (5, N'A254635', N'AC', 35, 7, 5, 0, 35, N'Tanvir Transporters')
INSERT [dbo].[BusMaster] ([BusId], [BusNo], [BustType], [TotalSeat], [SeatColumn], [SeatRow], [BookedSeat], [AvailableSeats], [BusName]) VALUES (6, N'A254635', N'AC', 54, 9, 6, 0, 54, N'tannu')
INSERT [dbo].[BusMaster] ([BusId], [BusNo], [BustType], [TotalSeat], [SeatColumn], [SeatRow], [BookedSeat], [AvailableSeats], [BusName]) VALUES (7, N'A232443', N'AC', 160, 40, 4, 0, 160, N'TANVIR ')
INSERT [dbo].[BusMaster] ([BusId], [BusNo], [BustType], [TotalSeat], [SeatColumn], [SeatRow], [BookedSeat], [AvailableSeats], [BusName]) VALUES (8, N'8', N'Normal', 40, 4, 10, 0, 40, N'iubat')
SET IDENTITY_INSERT [dbo].[BusMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CardDetails] ON 

INSERT [dbo].[CardDetails] ([CardID], [UserID], [CardType], [BankName], [CVVNo], [CardNo], [TotalAmount], [CreatedBy]) VALUES (12, 1, N'Credit Card', N'State Bank Of Bangladesh', N'MOV', N'A102556845546868', CAST(1600.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CardDetails] ([CardID], [UserID], [CardType], [BankName], [CVVNo], [CardNo], [TotalAmount], [CreatedBy]) VALUES (13, 3, N'Credit Card', N'ICICI Bank', N'456', N'656565446', CAST(800.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CardDetails] ([CardID], [UserID], [CardType], [BankName], [CVVNo], [CardNo], [TotalAmount], [CreatedBy]) VALUES (14, 1, N'Debit Card', N'Bank Of Bangladesh', N'MKV', N'A12345694', CAST(2400.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CardDetails] ([CardID], [UserID], [CardType], [BankName], [CVVNo], [CardNo], [TotalAmount], [CreatedBy]) VALUES (15, 2, N'Credit Card', N'Bank Of bangladesh', N'MKV', N'45645465466', CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CardDetails] ([CardID], [UserID], [CardType], [BankName], [CVVNo], [CardNo], [TotalAmount], [CreatedBy]) VALUES (16, 2, N'Credit Card', N'State Bank Of Bangladesh', N'456', N'254654644', CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CardDetails] ([CardID], [UserID], [CardType], [BankName], [CVVNo], [CardNo], [TotalAmount], [CreatedBy]) VALUES (17, 5, N'Credit Card', N'State Bank Of Bangladesh', N'32323', N'323323', CAST(300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CardDetails] ([CardID], [UserID], [CardType], [BankName], [CVVNo], [CardNo], [TotalAmount], [CreatedBy]) VALUES (18, 6, N'Credit Card', N'Bank Of Baroda', N'333', N'4344545565', CAST(450.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[CardDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[CityDetails] ON 

INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (7, N'Tongi')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (8, N'Jamalpur')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (9, N'Khulna')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (10, N'Jessore')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (11, N'Gazipur')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (12, N'Mymensingh')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (13, N'Dhaka')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (14, N'zx')
INSERT [dbo].[CityDetails] ([CityID], [CityName]) VALUES (15, N'Rongpur')
SET IDENTITY_INSERT [dbo].[CityDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PickUpStand] ON 

INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (5, 3, N'Abdullapur', N'04:00 PM', 3)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (6, 3, N'Kollaynpur', N'04:50 PM', 3)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (7, 3, N'Achole Talav', N'10:25 AM', 3)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (8, 3, N'Kamarpara', N'11:00 PM', 3)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (9, 5, N'Abdullapur', N'00:06 PM', 5)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (10, 5, N'Kollaynpur', N'06:45 PM', 5)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (11, 3, N'Kamarpara', N'02:30 PM', 3)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (12, 7, N'charag ali', N'12:00Am', 7)
INSERT [dbo].[PickUpStand] ([StandId], [RouteId], [PlaceName], [PlaceTime], [BusID]) VALUES (13, 8, N'kollayanpur', N'1:00 Am', 8)
SET IDENTITY_INSERT [dbo].[PickUpStand] OFF
GO
SET IDENTITY_INSERT [dbo].[PNRDetails] ON 

INSERT [dbo].[PNRDetails] ([PNRDetailsID], [PNRNo], [TotalAmount], [TotalTickets], [CreatedBy]) VALUES (12, N'OR9IJW', CAST(1600.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[PNRDetails] ([PNRDetailsID], [PNRNo], [TotalAmount], [TotalTickets], [CreatedBy]) VALUES (13, N'6422EK', CAST(800.00 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[PNRDetails] ([PNRDetailsID], [PNRNo], [TotalAmount], [TotalTickets], [CreatedBy]) VALUES (14, N'W3TBAF', CAST(2400.00 AS Decimal(18, 2)), 3, 1)
INSERT [dbo].[PNRDetails] ([PNRDetailsID], [PNRNo], [TotalAmount], [TotalTickets], [CreatedBy]) VALUES (15, N'8DB5W0', CAST(500.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[PNRDetails] ([PNRDetailsID], [PNRNo], [TotalAmount], [TotalTickets], [CreatedBy]) VALUES (16, N'4ZEV3G', CAST(500.00 AS Decimal(18, 2)), 2, 2)
INSERT [dbo].[PNRDetails] ([PNRDetailsID], [PNRNo], [TotalAmount], [TotalTickets], [CreatedBy]) VALUES (17, N'HVE4DC', CAST(300.00 AS Decimal(18, 2)), 2, 5)
INSERT [dbo].[PNRDetails] ([PNRDetailsID], [PNRNo], [TotalAmount], [TotalTickets], [CreatedBy]) VALUES (18, N'R6IQAI', CAST(450.00 AS Decimal(18, 2)), 3, 6)
SET IDENTITY_INSERT [dbo].[PNRDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([regId], [Fname], [Lname], [EmailId], [Address], [City], [Picode], [Contact], [Password], [CreatedDate]) VALUES (1, N'Anand', N'Singh', N'abc@gmail.com', N'Santosh Nagar', N'Tongi', N'400065', N'8291951419', N'12345', CAST(N'2017-03-12T22:44:36.520' AS DateTime))
INSERT [dbo].[Registration] ([regId], [Fname], [Lname], [EmailId], [Address], [City], [Picode], [Contact], [Password], [CreatedDate]) VALUES (2, N'Jitendra', N'Dubey', N'jitendra@gmail.com', N'Address goes her', N'Tongi', N'400064', N'9029451159', N'123456', CAST(N'2017-03-19T18:47:42.187' AS DateTime))
INSERT [dbo].[Registration] ([regId], [Fname], [Lname], [EmailId], [Address], [City], [Picode], [Contact], [Password], [CreatedDate]) VALUES (3, N'Atul', N'Dubey', N'atuldubey12@gmail.com', N'nallasopara east', N'Gazipur', N'401209', N'9561454638', N'123456', CAST(N'2017-03-19T18:48:52.240' AS DateTime))
INSERT [dbo].[Registration] ([regId], [Fname], [Lname], [EmailId], [Address], [City], [Picode], [Contact], [Password], [CreatedDate]) VALUES (4, N'rahul', N'shedge', N'rahul@gmail.com', N'navghar road', N'Mymensingh', N'400065', N'8237525022', N'123456', CAST(N'2017-03-19T19:17:28.170' AS DateTime))
INSERT [dbo].[Registration] ([regId], [Fname], [Lname], [EmailId], [Address], [City], [Picode], [Contact], [Password], [CreatedDate]) VALUES (5, N'Md.Tanvir', N'Hossain', N'testweb597@gmail.com', N'Mokter bari road,Shik Baccu Tower, 14/7', N'Dhaka', N'1711', N'01642333882', N'12345', CAST(N'2023-06-27T12:09:58.033' AS DateTime))
INSERT [dbo].[Registration] ([regId], [Fname], [Lname], [EmailId], [Address], [City], [Picode], [Contact], [Password], [CreatedDate]) VALUES (6, N'JANNATUL', N'NIPA', N'hitanvirhossain@gmail.com', N'ddfdf', N'AUCHPARA,SHIKH BACHU TOWER', N'1711', N'01642333881', N'12345', CAST(N'2023-07-08T10:51:06.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
SET IDENTITY_INSERT [dbo].[RouteDetails] ON 

INSERT [dbo].[RouteDetails] ([RouteID], [Origin], [Destination], [CreatedDate], [BusID]) VALUES (3, N'Tongi', N'Jamalpur', CAST(N'2023-07-17T09:30:07.137' AS DateTime), 3)
INSERT [dbo].[RouteDetails] ([RouteID], [Origin], [Destination], [CreatedDate], [BusID]) VALUES (4, N'Nallasopara', N'Churchgate', CAST(N'2023-07-19T18:57:53.960' AS DateTime), 4)
INSERT [dbo].[RouteDetails] ([RouteID], [Origin], [Destination], [CreatedDate], [BusID]) VALUES (5, N'Mumbai', N'Surat', CAST(N'2023-07-19T19:23:32.737' AS DateTime), 5)
INSERT [dbo].[RouteDetails] ([RouteID], [Origin], [Destination], [CreatedDate], [BusID]) VALUES (6, N'Vasai', N'Virar', CAST(N'2023-07-21T22:53:20.273' AS DateTime), 6)
INSERT [dbo].[RouteDetails] ([RouteID], [Origin], [Destination], [CreatedDate], [BusID]) VALUES (7, N'Tongi', N'Gazipur', CAST(N'2023-07-06T09:07:40.993' AS DateTime), 7)
INSERT [dbo].[RouteDetails] ([RouteID], [Origin], [Destination], [CreatedDate], [BusID]) VALUES (8, N'Dhaka', N'Rongpur', CAST(N'2023-07-08T11:28:30.703' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[RouteDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ScheduleMaster] ON 

INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (5, 3, N'25/07/2023', CAST(800.00 AS Decimal(18, 2)), N'01hr 05Mints', N'06:00 PM', N'04:00 PM', 3, 3, 32)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (6, 3, N'20/07/2023', CAST(150.00 AS Decimal(18, 2)), N'1hr50mins', N'10:25 AM', N'12;00 PM', 3, 0, 35)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (7, 3, N'22/07/2023', CAST(150.00 AS Decimal(18, 2)), N'1hr50mins', N'10:25 AM', N'12;00 PM', 3, 0, 35)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (8, 5, N'30/07/2023', CAST(800.00 AS Decimal(18, 2)), N'2Hr', N'08:00 PM', N'06:00 PM', 5, 3, 32)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (9, 5, N'30/07/2023', CAST(500.00 AS Decimal(18, 2)), N'01hr 05Mints', N'08:00 PM', N'06:00 PM', 5, 3, 32)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (10, 5, N'29/07/2023', CAST(500.00 AS Decimal(18, 2)), N'01hr 05Mints', N'08:00 PM', N'06:00 PM', 5, 3, 32)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (11, 5, N'28/07/2023', CAST(500.00 AS Decimal(18, 2)), N'01hr 05Mints', N'08:00 PM', N'06:00 PM', 5, 4, 31)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (12, 5, N'27/07/2023', CAST(500.00 AS Decimal(18, 2)), N'01hr 05Mints', N'08:00 PM', N'06:00 PM', 5, 3, 32)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (15, 3, N'25/07/2023', CAST(150.00 AS Decimal(18, 2)), N'10:25', N'10:25 AM', N'06:00 PM', 3, 5, 30)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (13, 6, N'30/07/2023', CAST(320.00 AS Decimal(18, 2)), N'2Hr', N'03:25', N'02:30', 6, 0, 54)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (14, 3, N'30/07/2023', CAST(250.00 AS Decimal(18, 2)), N'10:25', N'02:50', N'5', 3, 2, 33)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (16, 3, N'7/6/2023', CAST(500.00 AS Decimal(18, 2)), N'12', N'12:00Am', N'12:30', 3, 0, 35)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (17, 7, N'7/6/2023', CAST(500.00 AS Decimal(18, 2)), N'12hr22min', N'12:00am', N'12:30 Am', 0, 0, NULL)
INSERT [dbo].[ScheduleMaster] ([ScheduleId], [BusId], [Date], [Fare], [EstimatedTime], [ArivalTime], [DepartureTime], [RouteID], [BookedSeats], [AvailableSeats]) VALUES (18, 8, N'7/8/2023', CAST(300.00 AS Decimal(18, 2)), N'12hr22min', N'12:00Am', N'8:00 Pm', 8, 0, 40)
SET IDENTITY_INSERT [dbo].[ScheduleMaster] OFF
GO
/****** Object:  StoredProcedure [dbo].[addBordingDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addBordingDetails](
@RouteID int,
@PlaceName varchar(50),
@PlaceTime varchar(50),
@BusID int
)
as
set nocount on
begin
insert into dbo.PickUpStand
(RouteId,PlaceName,PlaceTime,BusID)
values(@RouteID,@PlaceName,@PlaceTime,@BusID)
end
GO
/****** Object:  StoredProcedure [dbo].[GetPassengerDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetPassengerDetails]( --GetPassengerDetails '48TF1G'
@PNRNo varchar(50)
)
as
set nocount on
begin
select  BM.Fname,BM.Lname,BM.Contact,BM.SeatNo,BM.TravelDate,BM.Origin,BM.Destination,PS.PlaceName
from dbo.BookingMaster BM
 inner join dbo.PickUpStand PS on
 PS.StandId=BM.BoardingID and  BM.PNRNo=@PNRNo
 declare @BusID int
 select @BusID=(BusId) from dbo.BookingMaster where PNRNo=@PNRNo
 declare @BusName varchar(50)
 declare @DeptTime varchar(50)
 declare @PlaceName varchar(50)
 declare @TotalAmount decimal(18,2)
 declare @TotalTickets int;
 select @PlaceName=PlaceName from dbo.PickUpStand where BusID=@BusID
 select @BusName=BusName from dbo.BusMaster where BusId=@BusID
 select @PNRNO=PNRNo from dbo.BookingMaster where PNRNo=@PNRNo
 select @DeptTime=PlaceTime from dbo.PickUpStand where PlaceName=@PlaceName
 select @TotalAmount=TotalAmount,@TotalTickets=TotalTickets from dbo.PNRDetails where PNRNo=@PNRNo
 select @BusName as BusName,@PNRNO as PNRNo,@DeptTime as DeptTime,@TotalAmount as Amount,@TotalTickets as TotalTickets
end
GO
/****** Object:  StoredProcedure [dbo].[ispAddBusDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispAddBusDetails](
@BusNo varchar(50),
@BustType varchar(50),
@SeatColumn int,
@SeatRow int,
@Origin varchar(50),
@Destination varchar(50),
@BusName varchar(50)	
)
as
set nocount on
begin
declare @Ret_Val int;
insert into dbo.BusMaster(BusNo,BustType,TotalSeat,SeatColumn,SeatRow,BookedSeat,AvailableSeats,BusName)
values(@BusNo,@BustType,(@SeatRow*@SeatColumn),@SeatColumn,@SeatRow,0,(@SeatRow*@SeatColumn),@BusName)
set @Ret_Val=@@IDENTITY;
if(@@ROWCOUNT>0)
  begin
   insert into dbo.RouteDetails(Origin,Destination,CreatedDate,BusID) values(@Origin,@Destination,GETDATE(),@Ret_Val)
  end
if not exists (select CityName from dbo.CityDetails where CityName=@Origin)
 begin
 insert into dbo.CityDetails (CityName) values(@Origin)
 end 
 if not exists (select CityName from dbo.CityDetails where CityName=@Destination)
 begin
 insert into dbo.CityDetails (CityName) values(@Destination)
 end 
end
GO
/****** Object:  StoredProcedure [dbo].[ispAddBusSchedule]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispAddBusSchedule]( --ispGetBusDataByBusID 1
@Date varchar(50) ,
@BusID int,
@Fare decimal(18,2),
@EstimatdTime varchar(50),
@ArrivalTime varchar(50),
@DepartureTime varchar(50),
@RouteID int
)	
as
set nocount on
begin
declare @AvailableSeats int;
select @AvailableSeats=AvailableSeats from dbo.BusMaster where BusId=@BusID 
insert into dbo.ScheduleMaster
(Date,Fare,EstimatedTime,ArivalTime,DepartureTime,RouteID,BusId,AvailableSeats,BookedSeats)
values(@Date,@Fare,@EstimatdTime,@ArrivalTime,@DepartureTime,@RouteID,@BusID,@AvailableSeats,0)
end
GO
/****** Object:  StoredProcedure [dbo].[ispAddCardDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispAddCardDetails](
@UserID int,
@CardType varchar(20),
@BankName varchar(50),
@CVVNo varchar(10),
@CardNo nvarchar(100),
@TotalAmount decimal(18,2)
)
as
set nocount on
begin
insert into dbo.CardDetails
(UserID,CardType,BankName,CVVNo,CardNo,TotalAmount)
values(@UserID,@CardType,@BankName,@CVVNo,@CardNo,@TotalAmount)
end
GO
/****** Object:  StoredProcedure [dbo].[ispAddPassengerDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispAddPassengerDetails](
@RegId int,
@BusId int,
@Fname varchar(50),
@Lname varchar(50),
@Email varchar(50),
@Contact varchar(50),
@City varchar(50),
@SeatNo nvarchar(50),
@TravelDate varchar(50),
@Origin varchar(50),
@Destination varchar(50),
@BoardingId int,
@Fare decimal(18,2),
@TotalSeats int,
@PNRNo varchar(50)
)
as
set nocount on
begin
declare @BookedSeat int;
declare @AvailableSeats int;
declare @scheduleID int;
select @scheduleID=ScheduleId from dbo.ScheduleMaster where Date=@TravelDate
insert into dbo.BookingMaster
(RegId,BusId,Fname,Lname,Email,Contact,City,SeatNo,TravelDate,Origin,Destination,BoardingID,Fare,PNRNo,ScheduleID)
values(@RegId,@BusId,@Fname,@Lname,@Email,@Contact,@City,@SeatNo,@TravelDate,@Origin,@Destination,@BoardingId,@Fare,@PNRNo,@scheduleID)
select @BookedSeat=BookedSeats from dbo.ScheduleMaster where ScheduleId=@scheduleID
select @AvailableSeats=AvailableSeats from dbo.ScheduleMaster where ScheduleId=@scheduleID
update dbo.ScheduleMaster set BookedSeats=(@BookedSeat+1) where ScheduleId=@scheduleID
update dbo.ScheduleMaster set AvailableSeats=(@AvailableSeats-1) where ScheduleId=@scheduleID
end
GO
/****** Object:  StoredProcedure [dbo].[ispAddPNRDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispAddPNRDetails](
@PNRNo varchar(50),
@TotalAmount decimal(18,2),
@TotalTicket int,
@CreatedBy int
)
as
set nocount on
begin
insert into dbo.PNRDetails 
(PNRNo,TotalAmount,TotalTickets,CreatedBy)
values(@PNRNo,@TotalAmount,@TotalTicket,@CreatedBy)
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetAvailableBusDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ispGetAvailableBusDetails]
(
    @Origin VARCHAR(50),
    @Destination VARCHAR(50),
    @TravelDate VARCHAR(50),
    @BustType VARCHAR(50)
)
AS
SET NOCOUNT ON
BEGIN
    DECLARE @ScheduleId INT;
    SELECT @ScheduleId = ScheduleId FROM dbo.ScheduleMaster WHERE Date = @TravelDate;

    SELECT
        BM.BusId,
        BM.BusName,
        BM.BusNo,
        BM.SeatColumn,
        BM.SeatRow,
        BM.BustType,
        BM.TotalSeat,
        SM.AvailableSeats,
        SM.Fare,
        SM.EstimatedTime,
        SM.DepartureTime,
        SM.ArivalTime
    FROM
        dbo.BusMaster BM
    LEFT JOIN
        dbo.ScheduleMaster SM ON SM.BusId = BM.BusId
    LEFT JOIN
        dbo.RouteDetails RD ON RD.RouteID = SM.RouteID
    WHERE
        SM.Date = @TravelDate
        AND RD.Origin = @Origin
        AND RD.Destination = @Destination
        AND SM.ScheduleId = @ScheduleId
        AND BM.BustType = @BustType;
END
GO
/****** Object:  StoredProcedure [dbo].[ispGetBoardingPoints]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ispGetBoardingPoints](
@BusID int
)
as
set nocount on
begin
select * from dbo.PickUpStand where BusID=@BusID
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetBookedSeatNo]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetBookedSeatNo]( -- ispGetBookedSeatNo 1
@BusID int,
@TravelDate varchar(50)
)
as
set nocount on
begin
declare @scheduleId int;
select @scheduleId=ScheduleId from dbo.ScheduleMaster where BusId=@BusID and Date=@TravelDate
select isnull(SeatNo,0) as SeatNo from dbo.BookingMaster
where ScheduleId=@scheduleId
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetBookingReportByAdmin]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetBookingReportByAdmin]
as
set nocount on
begin
select BM.Fname+''+BM.Lname as PaxName,BM.Email,BM.Contact,BM.SeatNo,Convert(varchar(11),CONVERT(SMALLDATETIME, BM.TravelDate, 103),13) as TravelDate,BM.Origin,BM.Destination,
Fare,UM.Fname+''+UM.Lname as BookedBy,BB.BusName From dbo.BookingMaster BM
left join dbo.BusMaster BB on  BM.BusId=BB.BusId 
left join dbo.Registration UM on  UM.regId=BM.RegId
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetBusDataByBusID]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetBusDataByBusID]( --ispGetBusDataByBusID 1
@BusID int
)	
as
set nocount on
begin
select BM.BusId,BM.BusNo,BM.BustType,BM.SeatColumn,BM.BusName,BM.SeatRow,RD.Origin,RD.Destination,RD.RouteID
from dbo.BusMaster BM 
left join dbo.RouteDetails RD
on BM.BusId=RD.BusID
where BM.BusId=@BusID
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetBusDetailsForUpdation]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetBusDetailsForUpdation]
as
set nocount on
begin
select BM.BusId,BM.BusNo,BM.BusName,BM.BustType,BM.SeatColumn,BM.SeatRow,RD.Origin,RD.Destination,RD.RouteID
from dbo.BusMaster BM 
left join dbo.RouteDetails RD
on BM.BusId=RD.BusID
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetCity]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ispGetCity]
as
set nocount on
begin
select * from dbo.CityDetails
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetPNRDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ispGetPNRDetails](
@UserID int
)
as
set nocount on
begin
select * from dbo.PNRDetails where CreatedBy=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetRouteDetails]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ispGetRouteDetails]
as
set nocount on
begin
select * from dbo.RouteDetails
end
GO
/****** Object:  StoredProcedure [dbo].[ispUpdateBusData]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ispUpdateBusData]( --ispGetBusDataByBusID 1
@BusID int,
@BusNo varchar(50),
@BusType varchar(50),
@seatColumn int,
@SeatRow int,
@BusName varchar(50),
@Origin varchar(50),
@Destination varchar(50)
)	
as
set nocount on
begin
update dbo.BusMaster set 
BusNo=@BusNo,BustType=@BusType,SeatColumn=@seatColumn,SeatRow=@SeatRow,BusName=@BusName
where BusId=@BusID
update dbo.RouteDetails set 
Origin=@Origin,Destination=@Destination where BusID=@BusID
end
GO
/****** Object:  StoredProcedure [dbo].[ispUserLogin]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ispUserLogin](
@MobileNo varchar(50),
@Password varchar(50)
)
as
set nocount on
begin
select * from dbo.Registration where Contact=@MobileNo and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[ispUserRegistration]    Script Date: 7/9/2023 11:29:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispUserRegistration](  
@FName varchar(50)='',  
@LName varchar(50),  
@EmailId varchar(50),  
@Address varchar(50),  
@City varchar(50),  
@PinCode varchar(15),  
@ContactNo varchar(50),  
@Password varchar(50),  
@Ret_Val bigint output  
)  
as  
set nocount on  
begin  
if exists(select Contact from dbo.Registration where Contact=@ContactNo)  
begin  
set @Ret_Val=-1;  
end  
else  
begin  
insert into dbo.Registration  
(Fname,Lname,EmailId,Address,City,Picode,Contact,Password,CreatedDate)  
values (@FName,@LName,@EmailId,@Address,@City,@PinCode,@ContactNo,@Password,GETDATE())  
set @Ret_Val=@@IDENTITY;  
end  
end
GO
USE [master]
GO
ALTER DATABASE [OnlineBusBooking] SET  READ_WRITE 
GO
