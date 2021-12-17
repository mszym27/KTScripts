USE ttest
GO
/****** Object:  Schema [Dimensions]    Script Date: 12/14/2021 4:10:51 PM ******/
CREATE SCHEMA [Dimensions]
GO
/****** Object:  Schema [Facts]    Script Date: 12/14/2021 4:10:51 PM ******/
CREATE SCHEMA [Facts]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitIds]    Script Date: 12/14/2021 4:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitIds]
(
	 @Ids NVARCHAR(1000)
	,@Separator CHAR(1)
)
RETURNS 
@IdsTable TABLE (Id INT)
AS
BEGIN
	DECLARE @separatorindex INT = 1
	DECLARE @Id NVARCHAR(10)
	 
	WHILE @separatorindex > 0
	BEGIN
		SELECT @separatorindex = CHARINDEX(@Separator,@Ids)

		IF @separatorindex  > 0
			SELECT @Id = LEFT(@Ids,@separatorindex - 1)
		ELSE
			SELECT @Id = @Ids

		INSERT @IdsTable(Id) VALUES (@Id)

		SELECT @Ids = RIGHT(@Ids,LEN(@Ids) - @separatorindex)
	END
	
	RETURN
END
GO
/****** Object:  Table [Dimensions].[Clients]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[EmailAdress] [varchar](255) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Dimensions].[Companies]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[City] [nvarchar](150) NOT NULL,
	[Street] [nvarchar](150) NOT NULL,
	[HouseNumber] [nvarchar](50) NOT NULL,
	[HomeNumber] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[EmailAdress] [varchar](255) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Dimensions].[Courses]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsRecrutationStillOpen] [bit] NOT NULL,
	[NumberOfSeats] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[NumberOfHours] [int] NOT NULL,
	[LanguageProficencyId] [int] NOT NULL,
	[IndividualPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Dimensions].[Locations]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[City] [nvarchar](150) NOT NULL,
	[Street] [nvarchar](150) NOT NULL,
	[HouseNumber] [nvarchar](50) NOT NULL,
	[HomeNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Dimensions].[SalesReps]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[SalesReps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HiringDate] [date] NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[City] [nvarchar](150) NOT NULL,
	[Street] [nvarchar](150) NOT NULL,
	[HouseNumber] [nvarchar](50) NOT NULL,
	[HomeNumber] [nvarchar](50) NOT NULL,
	[PrivatePhoneNumber] [varchar](15) NOT NULL,
	[PublicPhoneNumber] [varchar](15) NULL,
	[EmailAdress] [varchar](255) NULL,
 CONSTRAINT [PK_SalesReps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Facts].[CourseSales]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Facts].[CourseSales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[ClientId] [int] NULL,
	[SalesRepId] [int] NULL,
	[LocationId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Amount] [int] NOT NULL,
	[TotalNetto] [decimal](18, 2) NULL,
	[TotalBrutto] [decimal](18, 2) NULL,
 CONSTRAINT [PK_FactBikeSales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CourseSalesView]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CourseSalesView]
AS 
SELECT
	[Courses].Id AS CourseId,
	[Companies].Id AS CompanyId,
	[SalesReps].Id AS SalesRepId,
	[Courses].Name AS CourseName,
	[Locations].Name AS LocationName,
	[Clients].Name + ' ' + [Clients].Surname AS ClientName,
	[SalesReps].Name + ' ' + [SalesReps].Surname AS SalesRepName,
	[Companies].Name AS ClientCompanyName,
	[CourseSales].[Date],
	[Courses].NumberOfSeats AS PlannedAmount,
    [CourseSales].[Amount],
	[Courses].IndividualPrice AS CourseIndividualPrice,
    [CourseSales].[TotalNetto],
    [CourseSales].[TotalBrutto],
	[Courses].IndividualPrice * [Courses].NumberOfSeats AS PlannedReturns,
	[CourseSales].[Amount] * [CourseSales].[TotalBrutto] AS TotalCourseSale,
	[Courses].IsRecrutationStillOpen,
	[Courses].StartDate
FROM [Facts].[CourseSales]
JOIN [Dimensions].[Courses]
	ON [CourseSales].[CourseId] = [Courses].[Id]
JOIN [Dimensions].[Clients]
	ON [CourseSales].[ClientId] = [Clients].[Id]
JOIN [Dimensions].[Companies]
	ON [Clients].[CompanyId] = [Companies].[Id]
JOIN [Dimensions].[SalesReps]
	ON [CourseSales].[SalesRepId] = [SalesReps].[Id]
JOIN [Dimensions].[Locations]
	ON [CourseSales].[LocationId] = [Locations].[Id];
GO
/****** Object:  Table [Dimensions].[Days]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[Days](
	[Id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DimDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Dimensions].[LanguageProficency]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[LanguageProficency](
	[Id] [int] NOT NULL,
	[EuropeanLevel] [char](2) NULL,
	[ENDescription] [nvarchar](4000) NULL,
	[PLDescription] [nvarchar](4000) NULL,
 CONSTRAINT [PK_LanguageProficency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Dimensions].[Months]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[Months](
	[Id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DimMonths] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Dimensions].[Time]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimensions].[Time](
	[Date] [date] NOT NULL,
	[DayId] [int] NOT NULL,
	[MonthId] [int] NOT NULL,
	[QuarterNumber] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[IsHoliday] [bit] NOT NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[Clients]  WITH NOCHECK ADD  CONSTRAINT [FK_Clients_Companies] FOREIGN KEY([CompanyId])
REFERENCES [Dimensions].[Companies] ([Id])
GO
ALTER TABLE [Dimensions].[Clients] CHECK CONSTRAINT [FK_Clients_Companies]
GO
ALTER TABLE [Dimensions].[Courses]  WITH NOCHECK ADD  CONSTRAINT [FK_Courses_LanguageProficency] FOREIGN KEY([LanguageProficencyId])
REFERENCES [Dimensions].[LanguageProficency] ([Id])
GO
ALTER TABLE [Dimensions].[Courses] CHECK CONSTRAINT [FK_Courses_LanguageProficency]
GO
ALTER TABLE [Dimensions].[Courses]  WITH NOCHECK ADD  CONSTRAINT [FK_Courses_Time_EndDate] FOREIGN KEY([EndDate])
REFERENCES [Dimensions].[Time] ([Date])
GO
ALTER TABLE [Dimensions].[Courses] CHECK CONSTRAINT [FK_Courses_Time_EndDate]
GO
ALTER TABLE [Dimensions].[Courses]  WITH NOCHECK ADD  CONSTRAINT [FK_Courses_Time_StartDate] FOREIGN KEY([StartDate])
REFERENCES [Dimensions].[Time] ([Date])
GO
ALTER TABLE [Dimensions].[Courses] CHECK CONSTRAINT [FK_Courses_Time_StartDate]
GO
ALTER TABLE [Dimensions].[SalesReps]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesReps_Time_HiringDate] FOREIGN KEY([HiringDate])
REFERENCES [Dimensions].[Time] ([Date])
GO
ALTER TABLE [Dimensions].[SalesReps] CHECK CONSTRAINT [FK_SalesReps_Time_HiringDate]
GO
ALTER TABLE [Dimensions].[Time]  WITH NOCHECK ADD  CONSTRAINT [FK_Time_Days] FOREIGN KEY([DayId])
REFERENCES [Dimensions].[Days] ([Id])
GO
ALTER TABLE [Dimensions].[Time] CHECK CONSTRAINT [FK_Time_Days]
GO
ALTER TABLE [Dimensions].[Time]  WITH NOCHECK ADD  CONSTRAINT [FK_Time_Months] FOREIGN KEY([MonthId])
REFERENCES [Dimensions].[Months] ([Id])
GO
ALTER TABLE [Dimensions].[Time] CHECK CONSTRAINT [FK_Time_Months]
GO
ALTER TABLE [Facts].[CourseSales]  WITH NOCHECK ADD  CONSTRAINT [FK_CourseSales_Clients] FOREIGN KEY([ClientId])
REFERENCES [Dimensions].[Clients] ([Id])
GO
ALTER TABLE [Facts].[CourseSales] CHECK CONSTRAINT [FK_CourseSales_Clients]
GO
ALTER TABLE [Facts].[CourseSales]  WITH NOCHECK ADD  CONSTRAINT [FK_CourseSales_Courses] FOREIGN KEY([CourseId])
REFERENCES [Dimensions].[Courses] ([Id])
GO
ALTER TABLE [Facts].[CourseSales] CHECK CONSTRAINT [FK_CourseSales_Courses]
GO
ALTER TABLE [Facts].[CourseSales]  WITH NOCHECK ADD  CONSTRAINT [FK_CourseSales_Locations] FOREIGN KEY([LocationId])
REFERENCES [Dimensions].[Locations] ([Id])
GO
ALTER TABLE [Facts].[CourseSales] CHECK CONSTRAINT [FK_CourseSales_Locations]
GO
ALTER TABLE [Facts].[CourseSales]  WITH NOCHECK ADD  CONSTRAINT [FK_CourseSales_SalesReps] FOREIGN KEY([SalesRepId])
REFERENCES [Dimensions].[SalesReps] ([Id])
GO
ALTER TABLE [Facts].[CourseSales] CHECK CONSTRAINT [FK_CourseSales_SalesReps]
GO
ALTER TABLE [Facts].[CourseSales]  WITH NOCHECK ADD  CONSTRAINT [FK_CourseSales_Time] FOREIGN KEY([Date])
REFERENCES [Dimensions].[Time] ([Date])
GO
ALTER TABLE [Facts].[CourseSales] CHECK CONSTRAINT [FK_CourseSales_Time]
GO
/****** Object:  StoredProcedure [dbo].[CourseReport]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CourseReport]
AS
BEGIN
	SELECT IIF(GROUPING([SalesRepName]) = 0, [SalesRepName], 'ALL') AS [SalesRep],
		IIF(GROUPING([ClientCompanyName]) = 0, [ClientCompanyName], 'ALL') AS [Company],
		IIF(GROUPING([CourseName]) = 0, [CourseName], 'ALL') AS [Course],
		SUM([CourseSalesView].[TotalCourseSale]) AS Sale
	FROM [dbo].[CourseSalesView]
	GROUP BY CUBE([SalesRepName], [ClientCompanyName], [CourseName])
	ORDER BY 1, 2, 3
END
GO
/****** Object:  StoredProcedure [dbo].[CourseSalesReport]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CourseSalesReport]
	@CompanyIds NVARCHAR(1000),
	@CourseIds NVARCHAR(1000),
	@SalesRepIds NVARCHAR(1000)
AS
BEGIN
	DECLARE @Query NVARCHAR(MAX) = N''
	DECLARE @Parameters NVARCHAR(MAX) = N''

	SET @Parameters += N'
	 @CompanyIds NVARCHAR(1000)
	,@CourseIds NVARCHAR(1000)
	,@SalesRepIds NVARCHAR(1000) '

	SET @Query += N'
	SELECT IIF(GROUPING([SalesRepName]) = 0, [SalesRepName], ''ALL'') AS [SalesRep],
		IIF(GROUPING([ClientCompanyName]) = 0, [ClientCompanyName], ''ALL'') AS [Company],
		IIF(GROUPING([CourseName]) = 0, [CourseName], ''ALL'') AS [Course],
		SUM([CourseSalesView].[TotalCourseSale]) AS Sale
	FROM [dbo].[CourseSalesView]
	WHERE 1 = 1 '

	IF(@CompanyIds IS NOT NULL)
	BEGIN
		SET @Query += N'
		AND CourseSalesView.CompanyId IN (SELECT Id FROM SplitIds(@CompanyIds, '','')) '
	END

	IF(@CourseIds IS NOT NULL)
	BEGIN
		SET @Query += N'
		AND CourseSalesView.CourseId IN (SELECT Id FROM SplitIds(@CourseIds, '','')) '
	END

	IF(@SalesRepIds IS NOT NULL)
	BEGIN
		SET @Query += N'
		AND CourseSalesView.SalesRepId IN (SELECT Id FROM SplitIds(@SalesRepIds, '','')) '
	END

	SET @Query += N'
	GROUP BY ROLLUP([SalesRepName], [ClientCompanyName], [CourseName])
	ORDER BY [SalesRep], [Company], [Course] '

	EXEC sp_executesql @Query, @Parameters,
		@CompanyIds,
		@CourseIds,
		@SalesRepIds
END
GO
/****** Object:  StoredProcedure [dbo].[NumberOfAttendees]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NumberOfAttendees]
AS
BEGIN
	SELECT [CourseName]
		,LocationName
		,SUM([PlannedAmount]) AS Planned
		,SUM([Amount]) AS Actual
	FROM [dbo].[CourseSalesView]
	WHERE [IsRecrutationStillOpen] = 1
	GROUP BY [CourseName], LocationName
END
GO
/****** Object:  StoredProcedure [dbo].[NumberOfClients]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NumberOfClients]
AS
BEGIN
	SELECT COUNT([ClientId]) AS SalesToCompanyClients,
		COUNT(
			IIF(([ClientId] IS NULL), 1, NULL)
		) AS SalesToIndividualClients,
		COUNT(ISNULL([ClientId], 1)) AS TotalSales
	FROM [Facts].[CourseSales]
END
GO
/****** Object:  StoredProcedure [dbo].[OpenCoursesSummary]    Script Date: 12/14/2021 4:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OpenCoursesSummary]
AS
BEGIN
	SELECT temp.*
		,temp.Achieved - temp.Planned AS [Difference]
	FROM (
		SELECT [CourseName]
			,SUM([PlannedReturns]) AS Planned
			,SUM([TotalCourseSale]) AS Achieved
		FROM [dbo].[CourseSalesView]
		WHERE [IsRecrutationStillOpen] = 1
		GROUP BY GROUPING SETS ([CourseName], ())
	) temp
	ORDER BY IIF(CourseName IS NULL, 1, 0) ASC, CourseName ASC
END
GO