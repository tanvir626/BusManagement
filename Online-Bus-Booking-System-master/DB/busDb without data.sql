USE [master]
GO
/****** Object:  Database [OnlineBusBooking]    Script Date: 8/15/2023 8:05:29 AM ******/
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
/****** Object:  Table [dbo].[BookingMaster]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[BusMaster]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[CardDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[CityDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[PickUpStand]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[PNRDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[Registration]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[RouteDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  Table [dbo].[ScheduleMaster]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[addBordingDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPassengerDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
select BM.Fname,BM.Lname,BM.Contact,BM.SeatNo,BM.TravelDate,BM.Origin,BM.Destination,PS.PlaceName
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

 declare @PlaceTime  varchar(50);

 --BookingMaster.TravelDate

 select @PlaceName=PlaceName  from dbo.PickUpStand where BusID=@BusID
 select @BusName=BusName from dbo.BusMaster where BusId=@BusID

 select @PlaceTime=PlaceTime from dbo.PickUpStand where BusID=@BusID
 
 select @PNRNO=PNRNo from dbo.BookingMaster where PNRNo=@PNRNo
 select @DeptTime=PlaceTime from dbo.PickUpStand where PlaceName=@PlaceName
 select @TotalAmount=TotalAmount,@TotalTickets=TotalTickets from dbo.PNRDetails where PNRNo=@PNRNo
 select @BusName as BusName,@PNRNO as PNRNo,@DeptTime as DeptTime,@TotalAmount as Amount,@TotalTickets as TotalTickets,@PlaceName as PlaceName,@PlaceTime as PlaceTime
end

GO
/****** Object:  StoredProcedure [dbo].[ispAddBusDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispAddBusSchedule]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispAddCardDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispAddPassengerDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispAddPNRDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispGetAvailableBusDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispGetAvailableBusDetailsWithType]    Script Date: 8/15/2023 8:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ispGetAvailableBusDetailsWithType]
(@Origin varchar(50),
@Destination varchar(50),
@TravelDate varchar(50)
)
as
set nocount on
begin
declare @scheduleid int;
select @scheduleid=ScheduleId from dbo.ScheduleMaster where Date=@TravelDate
select BM.BusId,BM.BusName,BM.BusNo,BM.SeatColumn,BM.SeatRow,BM.BustType,BM.TotalSeat,SM.AvailableSeats,SM.Fare,SM.EstimatedTime,SM.DepartureTime,SM.ArivalTime
from dbo.BusMaster BM
left join dbo.ScheduleMaster SM
on SM.BusId=BM.BusId
left join dbo.RouteDetails RD
on RD.RouteID=SM.RouteID
where SM.Date=@TravelDate and RD.Origin=@Origin and RD.Destination=@Destination and SM.ScheduleId=@scheduleid
end

GO
/****** Object:  StoredProcedure [dbo].[ispGetBoardingPoints]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispGetBookedSeatNo]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispGetBookingReportByAdmin]    Script Date: 8/15/2023 8:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetBookingReportByAdmin]
as
set nocount on
begin
select BM.Fname+' '+BM.Lname as PaxName,BM.Email,BM.Contact,BM.SeatNo,BM.TravelDate as TravelDate,BM.Origin,BM.Destination,
Fare,UM.Fname+' '+UM.Lname as BookedBy,BB.BusName From dbo.BookingMaster BM
left join dbo.BusMaster BB on  BM.BusId=BB.BusId 
left join dbo.Registration UM on  UM.regId=BM.RegId ORDER BY TravelDate asc;
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetBookingSalesReportByAdmin]    Script Date: 8/15/2023 8:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetBookingSalesReportByAdmin]
as
set nocount on
begin
select BB.BusName,BM.Origin,BM.Destination, Convert(varchar(11),CONVERT(SMALLDATETIME, BM.TravelDate, 103),13) as TravelDate,
BM.Fare From dbo.BookingMaster BM
left join dbo.BusMaster BB on  BM.BusId=BB.BusId 
left join dbo.Registration UM on  UM.regId=BM.RegId
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetBusDataByBusID]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispGetBusDetailsForUpdation]    Script Date: 8/15/2023 8:05:30 AM ******/
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
on BM.BusId=RD.BusID ORDER BY BM.BusId desc;
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetCity]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispGetPNRDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetPNRDetails](
@UserID int
)
as
set nocount on
begin
SELECT distinct  PNRDetails.PNRNo , BookingMaster.Origin, BookingMaster.Destination, BookingMaster.TravelDate
FROM   BookingMaster INNER JOIN
             PNRDetails ON BookingMaster.PNRNo = PNRDetails.PNRNo Where CreatedBy=@UserID ORDER BY BookingMaster.TravelDate  ASC;
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetRouteDetails]    Script Date: 8/15/2023 8:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ispGetRouteDetails]
as
set nocount on
begin
SELECT RouteDetails.BusID, RouteDetails.RouteID, RouteDetails.Origin, RouteDetails.Destination, ScheduleMaster.Date, ScheduleMaster.DepartureTime FROM RouteDetails INNER JOIN ScheduleMaster ON RouteDetails.RouteID = ScheduleMaster.RouteID order by MONTH(CONVERT( date, ScheduleMaster.Date, 103)) DESC, DAY(CONVERT(date, ScheduleMaster.Date, 103)) DESC, Year(convert(date,ScheduleMaster.Date,103)) DESC ;
end
GO
/****** Object:  StoredProcedure [dbo].[ispGetTotalSalesByAdmin]    Script Date: 8/15/2023 8:05:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ispGetTotalSalesByAdmin]
as
set nocount on
begin
select sum(Fare) from BookingMaster
end
GO
/****** Object:  StoredProcedure [dbo].[ispUpdateBusData]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispUserLogin]    Script Date: 8/15/2023 8:05:30 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ispUserRegistration]    Script Date: 8/15/2023 8:05:30 AM ******/
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
