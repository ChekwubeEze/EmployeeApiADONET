USE [master]
GO
/****** Object:  Database [CompanyADODotNET]    Script Date: 07/11/2022 12:40:09 ******/
CREATE DATABASE [CompanyADODotNET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompanyADODotNET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CompanyADODotNET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CompanyADODotNET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CompanyADODotNET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CompanyADODotNET] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompanyADODotNET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompanyADODotNET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompanyADODotNET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompanyADODotNET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompanyADODotNET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompanyADODotNET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET RECOVERY FULL 
GO
ALTER DATABASE [CompanyADODotNET] SET  MULTI_USER 
GO
ALTER DATABASE [CompanyADODotNET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompanyADODotNET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompanyADODotNET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompanyADODotNET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CompanyADODotNET] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CompanyADODotNET] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CompanyADODotNET', N'ON'
GO
ALTER DATABASE [CompanyADODotNET] SET QUERY_STORE = OFF
GO
USE [CompanyADODotNET]
GO
/****** Object:  Table [dbo].[ADOCompany]    Script Date: 07/11/2022 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADOCompany](
	[EmployeeId] [int] NOT NULL,
	[EmployeeName] [varchar](100) NULL,
	[DateOfBirth] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[CurrentAddress] [varchar](250) NULL,
	[PermanentAddress] [varchar](250) NULL,
	[City] [varchar](150) NULL,
	[Nationality] [varchar](100) NULL,
	[PINCode] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddEmployee]    Script Date: 07/11/2022 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddEmployee]
	-- Add the parameters for the stored procedure here
	@EmployeeId int,
	@EmployeeName varchar(100),
	@DateOfBirth varchar(100),
	@Gender varchar (100),
	@CurrentAddress varchar(250),
	@PermanentAddress varchar(250),
	@City varchar (150),
	@Nationality varchar(100),
	@PINCode varchar(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into dbo.ADOCompany
	Values(
	@EmployeeId,
	@EmployeeName,
	@DateOfBirth,
	@Gender,
	@CurrentAddress,
	@PermanentAddress,
	@City,
	@Nationality,
	@PINCode)
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 07/11/2022 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteEmployee] 
	-- Add the parameters for the stored procedure here
	@EmployeeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete From dbo.ADOCompany 
	Where EmployeeId = @EmployeeId
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployee]    Script Date: 07/11/2022 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllEmployee]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From dbo.ADOCompany
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeById]    Script Date: 07/11/2022 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetEmployeeById]
	-- Add the parameters for the stored procedure here
	@EmployeeId int
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From dbo.ADOCompany
	Where EmployeeId = @EmployeeId 
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployeeCity]    Script Date: 07/11/2022 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateEmployeeCity] 
	-- Add the parameters for the stored procedure here
	@EmployeeId int,
	@City varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.ADOCompany
	Set City = @City
	Where EmployeeId = @EmployeeId
END
GO
USE [master]
GO
ALTER DATABASE [CompanyADODotNET] SET  READ_WRITE 
GO
