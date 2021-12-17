USE ttest
GO
/****** Object:  StoredProcedure [dbo].[OpenCoursesSummary]    Script Date: 12/14/2021 2:30:35 PM ******/
DROP PROCEDURE [dbo].[OpenCoursesSummary]
GO
/****** Object:  StoredProcedure [dbo].[NumberOfClients]    Script Date: 12/14/2021 2:30:35 PM ******/
DROP PROCEDURE [dbo].[NumberOfClients]
GO
/****** Object:  StoredProcedure [dbo].[NumberOfAttendees]    Script Date: 12/14/2021 2:30:35 PM ******/
DROP PROCEDURE [dbo].[NumberOfAttendees]
GO
/****** Object:  StoredProcedure [dbo].[CourseSalesReport]    Script Date: 12/14/2021 2:30:35 PM ******/
DROP PROCEDURE [dbo].[CourseSalesReport]
GO
/****** Object:  StoredProcedure [dbo].[CourseReport]    Script Date: 12/14/2021 2:30:35 PM ******/
DROP PROCEDURE [dbo].[CourseReport]
GO
ALTER TABLE [Facts].[CourseSales] DROP CONSTRAINT [FK_CourseSales_Time]
GO
ALTER TABLE [Facts].[CourseSales] DROP CONSTRAINT [FK_CourseSales_SalesReps]
GO
ALTER TABLE [Facts].[CourseSales] DROP CONSTRAINT [FK_CourseSales_Locations]
GO
ALTER TABLE [Facts].[CourseSales] DROP CONSTRAINT [FK_CourseSales_Courses]
GO
ALTER TABLE [Facts].[CourseSales] DROP CONSTRAINT [FK_CourseSales_Clients]
GO
ALTER TABLE [Dimensions].[Time] DROP CONSTRAINT [FK_Time_Months]
GO
ALTER TABLE [Dimensions].[Time] DROP CONSTRAINT [FK_Time_Days]
GO
ALTER TABLE [Dimensions].[SalesReps] DROP CONSTRAINT [FK_SalesReps_Time_HiringDate]
GO
ALTER TABLE [Dimensions].[Courses] DROP CONSTRAINT [FK_Courses_Time_StartDate]
GO
ALTER TABLE [Dimensions].[Courses] DROP CONSTRAINT [FK_Courses_Time_EndDate]
GO
ALTER TABLE [Dimensions].[Courses] DROP CONSTRAINT [FK_Courses_LanguageProficency]
GO
ALTER TABLE [Dimensions].[Clients] DROP CONSTRAINT [FK_Clients_Companies]
GO
/****** Object:  Table [Dimensions].[Time]    Script Date: 12/14/2021 2:30:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[Time]') AND type in (N'U'))
DROP TABLE [Dimensions].[Time]
GO
/****** Object:  Table [Dimensions].[Months]    Script Date: 12/14/2021 2:30:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[Months]') AND type in (N'U'))
DROP TABLE [Dimensions].[Months]
GO
/****** Object:  Table [Dimensions].[LanguageProficency]    Script Date: 12/14/2021 2:30:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[LanguageProficency]') AND type in (N'U'))
DROP TABLE [Dimensions].[LanguageProficency]
GO
/****** Object:  Table [Dimensions].[Days]    Script Date: 12/14/2021 2:30:37 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[Days]') AND type in (N'U'))
DROP TABLE [Dimensions].[Days]
GO
/****** Object:  View [dbo].[CourseSalesView]    Script Date: 12/14/2021 2:30:37 PM ******/
DROP VIEW [dbo].[CourseSalesView]
GO
/****** Object:  Table [Facts].[CourseSales]    Script Date: 12/14/2021 2:30:37 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Facts].[CourseSales]') AND type in (N'U'))
DROP TABLE [Facts].[CourseSales]
GO
/****** Object:  Table [Dimensions].[SalesReps]    Script Date: 12/14/2021 2:30:37 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[SalesReps]') AND type in (N'U'))
DROP TABLE [Dimensions].[SalesReps]
GO
/****** Object:  Table [Dimensions].[Locations]    Script Date: 12/14/2021 2:30:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[Locations]') AND type in (N'U'))
DROP TABLE [Dimensions].[Locations]
GO
/****** Object:  Table [Dimensions].[Courses]    Script Date: 12/14/2021 2:30:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[Courses]') AND type in (N'U'))
DROP TABLE [Dimensions].[Courses]
GO
/****** Object:  Table [Dimensions].[Companies]    Script Date: 12/14/2021 2:30:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[Companies]') AND type in (N'U'))
DROP TABLE [Dimensions].[Companies]
GO
/****** Object:  Table [Dimensions].[Clients]    Script Date: 12/14/2021 2:30:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dimensions].[Clients]') AND type in (N'U'))
DROP TABLE [Dimensions].[Clients]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitIds]    Script Date: 12/14/2021 2:30:39 PM ******/
DROP FUNCTION [dbo].[SplitIds]
GO
/****** Object:  Schema [Facts]    Script Date: 12/14/2021 2:30:39 PM ******/
DROP SCHEMA [Facts]
GO
/****** Object:  Schema [Dimensions]    Script Date: 12/14/2021 2:30:39 PM ******/
DROP SCHEMA [Dimensions]