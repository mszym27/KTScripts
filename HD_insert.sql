USE ttest
GO
SET IDENTITY_INSERT [Dimensions].[Companies] ON 
GO
INSERT [Dimensions].[Companies] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber], [PhoneNumber], [EmailAdress]) VALUES (1, N'Marine Merch', N'Gdańsk', N'Portowa', N'5', N'12', N'471-123-826', NULL)
GO
INSERT [Dimensions].[Companies] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber], [PhoneNumber], [EmailAdress]) VALUES (2, N'Wesley International', N'Katowice', N'Spodkowa', N'5', N'12', N'(+47) 657-35-73', NULL)
GO
INSERT [Dimensions].[Companies] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber], [PhoneNumber], [EmailAdress]) VALUES (3, N'Yam Sabate', N'Warszawa', N'Masłowskiego', N'141', N'11', N'888-151-253', N'YamSabateMedia@gmail.com')
GO
INSERT [Dimensions].[Companies] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber], [PhoneNumber], [EmailAdress]) VALUES (4, N'Messer Incorporated', N'Łódź', N'Ogrodowa', N'8', N'14', N'(+42) 642-15-53', NULL)
GO
INSERT [Dimensions].[Companies] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber], [PhoneNumber], [EmailAdress]) VALUES (5, N'K2 Peak', N'Łódź', N'Piotrkowska', N'10', N'152', N'813-386-334', NULL)
GO
SET IDENTITY_INSERT [Dimensions].[Companies] OFF
GO
SET IDENTITY_INSERT [Dimensions].[Clients] ON 
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (1, 1, N'Marcin', N'Szumigaj', N'446-881-802', NULL)
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (2, 1, N'Marcin', N'Halecki', N'445-221-887', NULL)
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (3, 1, N'Wojciech', N'Arański', N'446-445-212', N'waran@poczta.wp.pl')
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (4, 2, N'Anna', N'Malinowska', N'581-122-212', N'anna.malinowska22@poczta.onet.pl')
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (5, 3, N'Anna', N'Damada', N'202-555-135', NULL)
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (6, 5, N'Iryna', N'Sarwar', N'699-462-599', N'irynasarwar@gmail.com')
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (7, 4, N'Damian', N'Malinowski', N'696-55-265', NULL)
GO
INSERT [Dimensions].[Clients] ([Id], [CompanyId], [Name], [Surname], [PhoneNumber], [EmailAdress]) VALUES (8, 4, N'Hubert', N'Nowicki', N'696-55-265', NULL)
GO
SET IDENTITY_INSERT [Dimensions].[Clients] OFF
GO
INSERT [Dimensions].[LanguageProficency] ([Id], [EuropeanLevel], [ENDescription], [PLDescription]) VALUES (1, N'A1', N'początkujący', N'beginner')
GO
INSERT [Dimensions].[LanguageProficency] ([Id], [EuropeanLevel], [ENDescription], [PLDescription]) VALUES (2, N'A2', N'niższy srednio zaawansowany', N'elementary/pre-intermediate')
GO
INSERT [Dimensions].[LanguageProficency] ([Id], [EuropeanLevel], [ENDescription], [PLDescription]) VALUES (3, N'B1', N'średnio zaawansowany', N'intermediate')
GO
INSERT [Dimensions].[LanguageProficency] ([Id], [EuropeanLevel], [ENDescription], [PLDescription]) VALUES (4, N'B2', N'wyższy srednio zaawansowany', N'upper/post-intermediate')
GO
INSERT [Dimensions].[LanguageProficency] ([Id], [EuropeanLevel], [ENDescription], [PLDescription]) VALUES (5, N'C1', N'zaawansowany', N'advanced')
GO
INSERT [Dimensions].[LanguageProficency] ([Id], [EuropeanLevel], [ENDescription], [PLDescription]) VALUES (6, N'C2', N'profesjonalny', N'nearly native-speaker level')
GO
INSERT [Dimensions].[Days] ([Id], [Name]) VALUES (1, N'Monday')
GO
INSERT [Dimensions].[Days] ([Id], [Name]) VALUES (2, N'Tuesday')
GO
INSERT [Dimensions].[Days] ([Id], [Name]) VALUES (3, N'Wednesday')
GO
INSERT [Dimensions].[Days] ([Id], [Name]) VALUES (4, N'Thursday')
GO
INSERT [Dimensions].[Days] ([Id], [Name]) VALUES (5, N'Friday')
GO
INSERT [Dimensions].[Days] ([Id], [Name]) VALUES (6, N'Saturday')
GO
INSERT [Dimensions].[Days] ([Id], [Name]) VALUES (7, N'Sunday')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (1, N'January')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (2, N'February')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (3, N'March')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (4, N'April')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (5, N'May')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (6, N'June')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (7, N'July')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (8, N'August')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (9, N'September')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (10, N'October')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (11, N'November')
GO
INSERT [Dimensions].[Months] ([Id], [Name]) VALUES (12, N'December')
GO
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-01-02' AS Date), 3, 1, 1, 2019, 0)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-02-15' AS Date), 5, 2, 1, 2019, 0)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-01-05' AS Date), 6, 1, 1, 2019, 1)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-02-16' AS Date), 6, 2, 1, 2019, 1)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-02-23' AS Date), 6, 2, 1, 2019, 1)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-03-30' AS Date), 6, 3, 1, 2019, 1)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-04-02' AS Date), 2, 4, 2, 2019, 0)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-05-04' AS Date), 6, 5, 2, 2019, 1)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-03-15' AS Date), 5, 3, 1, 2019, 0)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-06-04' AS Date), 2, 6, 2, 2019, 0)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-01-12' AS Date), 6, 1, 1, 2019, 1)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2019-06-22' AS Date), 6, 6, 2, 2019, 1)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2015-03-30' AS Date), 1, 3, 1, 2015, 0)
INSERT [Dimensions].[Time] ([Date], [DayId], [MonthId], [QuarterNumber], [Year], [IsHoliday]) VALUES (CAST(N'2010-03-30' AS Date), 1, 1, 1, 2020, 0)


SET IDENTITY_INSERT [Dimensions].[Courses] ON 
GO
INSERT [Dimensions].[Courses] ([Id], [IsRecrutationStillOpen], [NumberOfSeats], [Name], [Description], [StartDate], [EndDate], [NumberOfHours], [LanguageProficencyId], [IndividualPrice]) VALUES (1, 1, 30, N'IT language for professionals', N'Aimed at working proffesionals, offers an opportunity to learn and practice IT-specific terms. Structured in short, intensive lessons. Perfect for busy managers and key IT staff aimming to deepen their knowledge of the field language.', CAST(N'2019-01-02' AS Date), CAST(N'2019-02-15' AS Date), 30, 6, CAST(5000.00 AS Decimal(18, 2)))
GO
INSERT [Dimensions].[Courses] ([Id], [IsRecrutationStillOpen], [NumberOfSeats], [Name], [Description], [StartDate], [EndDate], [NumberOfHours], [LanguageProficencyId], [IndividualPrice]) VALUES (2, 0, 30, N'Kurs przygotowujący do matury (I)', N'Przygotowany z myślą o uczniach dopiero zaczynających naukę języka. Powstał z myślą o uzupełnieniu lekcji pobieranych w trakcie normalnej nauki. Umożliwia pratykowanie języka oraz pogłębienie wiedzy w mniejszych grupach. Kontynuowany w kolejnych semestrach.', CAST(N'2019-01-05' AS Date), CAST(N'2019-02-16' AS Date), 90, 1, CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [Dimensions].[Courses] ([Id], [IsRecrutationStillOpen], [NumberOfSeats], [Name], [Description], [StartDate], [EndDate], [NumberOfHours], [LanguageProficencyId], [IndividualPrice]) VALUES (3, 0, 25, N'Kurs przygotowujący do matury (II)', N'Kontynuacja wcześniejszego kursu. Osoby które zapisują się na ten bez przejścia poprzedniego będą musiały przejść test ze znajomości języka.', CAST(N'2019-02-23' AS Date), CAST(N'2019-03-30' AS Date), 90, 2, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [Dimensions].[Courses] ([Id], [IsRecrutationStillOpen], [NumberOfSeats], [Name], [Description], [StartDate], [EndDate], [NumberOfHours], [LanguageProficencyId], [IndividualPrice]) VALUES (4, 1, 10, N'Kurs przygotowujący do matury (III)', N'Kulminacja linii kursów przygotowujących oferowanych przez naszą szkołę. W ostatnim ich części uczniowie koncentrują się na rozwiązywaniu arkuszy maturalnych i przeprowadzaniu testów języka. Osoby zapisujące się od razu na ten kurs będą musiały uzyskać odpowiednią ocenę na wejściowym sprawdzianie.', CAST(N'2019-04-02' AS Date), CAST(N'2019-05-04' AS Date), 120, 4, CAST(500.00 AS Decimal(18, 2)))
GO
INSERT [Dimensions].[Courses] ([Id], [IsRecrutationStillOpen], [NumberOfSeats], [Name], [Description], [StartDate], [EndDate], [NumberOfHours], [LanguageProficencyId], [IndividualPrice]) VALUES (5, 0, 120, N'Intensywny kurs przygotowujący do matury', N'Skierowany do osób pragnących nabrać praktycznego doświadczenia w przechodzeniu testów maturalnych. Odbywa się pod okiem faktycznych egzaminatorów, celuje w jak najwierniejsze odwzorowanie warunków maturalnych.', CAST(N'2019-04-02' AS Date), CAST(N'2019-05-04' AS Date), 21, 4, CAST(800.00 AS Decimal(18, 2)))
GO
INSERT [Dimensions].[Courses] ([Id], [IsRecrutationStillOpen], [NumberOfSeats], [Name], [Description], [StartDate], [EndDate], [NumberOfHours], [LanguageProficencyId], [IndividualPrice]) VALUES (6, 0, 20, N'Kurs kształcenia', N'Kurs jest skierowany do nauczycieli języka, chcących pogłębić swoją wiedzę na temat przekazywania informacji uczniom. Prowadzony jest przez instruktorów akademickich.', CAST(N'2019-03-15' AS Date), CAST(N'2019-06-04' AS Date), 120, 6, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [Dimensions].[Courses] ([Id], [IsRecrutationStillOpen], [NumberOfSeats], [Name], [Description], [StartDate], [EndDate], [NumberOfHours], [LanguageProficencyId], [IndividualPrice]) VALUES (7, 0, 50, N'Kurs podstaw', N'Kurs skierowany jest do osób pozbawionych głębszej znajomości języka. Ma na celu uzupełnienie wiedzy wyniesionej ze szkoły oraz wprowadzenie stopniowe wprowadzenie ich w tajniki języka.', CAST(N'2019-01-12' AS Date), CAST(N'2019-06-22' AS Date), 120, 1, CAST(1000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [Dimensions].[Courses] OFF
GO
SET IDENTITY_INSERT [Dimensions].[Locations] ON 
GO
INSERT [Dimensions].[Locations] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber]) VALUES (1, N'Filia A', N'Łódź', N'Piotrkowska', N'5', N'71')
GO
INSERT [Dimensions].[Locations] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber]) VALUES (2, N'Filia B', N'Warszawa', N'Sadowska', N'11', N'23')
GO
INSERT [Dimensions].[Locations] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber]) VALUES (3, N'Learnet', N'Gdańsk', N'Morska', N'223', N'1')
GO
INSERT [Dimensions].[Locations] ([Id], [Name], [City], [Street], [HouseNumber], [HomeNumber]) VALUES (4, N'Wyższa szkoła języków obcych', N'Katowice', N'Sadowska', N'14', N'2')
GO
SET IDENTITY_INSERT [Dimensions].[Locations] OFF
GO
SET IDENTITY_INSERT [Dimensions].[SalesReps] ON 
GO
INSERT [Dimensions].[SalesReps] ([Id], [HiringDate], [Name], [Surname], [City], [Street], [HouseNumber], [HomeNumber], [PrivatePhoneNumber], [PublicPhoneNumber], [EmailAdress]) VALUES (1, CAST(N'2015-03-30' AS Date), N'Przemysława', N'Pająk', N'Bełchatów', N'Węglowa', N'12', N'2', N'990-356-223', N'990-314-157', N'przemyslawa.pajak33@gmail.com.pl')
GO
INSERT [Dimensions].[SalesReps] ([Id], [HiringDate], [Name], [Surname], [City], [Street], [HouseNumber], [HomeNumber], [PrivatePhoneNumber], [PublicPhoneNumber], [EmailAdress]) VALUES (2, CAST(N'2015-03-30' AS Date), N'Hubert', N'Cieślar', N'Warszawa', N'Bednarskiego', N'82', N'21', N'990-354-123', NULL, N'hubert.cies2@poczta.onet.pl')
--GO
INSERT [Dimensions].[SalesReps] ([Id], [HiringDate], [Name], [Surname], [City], [Street], [HouseNumber], [HomeNumber], [PrivatePhoneNumber], [PublicPhoneNumber], [EmailAdress]) VALUES (3, CAST(N'2010-03-30' AS Date), N'Marian', N'Jaworski', N'Łódź', N'Bartoszewskiego', N'16', N'2', N'456-345-223', NULL, N'mj12566@gmail.com')
GO
SET IDENTITY_INSERT [Dimensions].[SalesReps] OFF
GO
SET IDENTITY_INSERT [Facts].[CourseSales] ON 
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (1, 1, 1, 1, 1, CAST(N'2019-02-15' AS Date), 30, CAST(9000.00 AS Decimal(18, 2)), CAST(9500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (2, 1, 2, 3, 2, CAST(N'2019-02-15' AS Date), 10, CAST(15000.00 AS Decimal(18, 2)), CAST(15500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (3, 2, 5, 2, 3, CAST(N'2019-02-15' AS Date), 5, CAST(10000.00 AS Decimal(18, 2)), CAST(10500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (4, 2, 2, 2, 2, CAST(N'2019-02-15' AS Date), 15, CAST(20000.00 AS Decimal(18, 2)), CAST(20500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (5, 5, 3, 3, 3, CAST(N'2019-02-15' AS Date), 13, CAST(20000.00 AS Decimal(18, 2)), CAST(20500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (6, 5, 8, 3, 3, CAST(N'2019-02-15' AS Date), 10, CAST(20000.00 AS Decimal(18, 2)), CAST(20500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (7, 4, 2, 3, 2, CAST(N'2019-02-15' AS Date), 15, CAST(11500.00 AS Decimal(18, 2)), CAST(12000.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (8, 3, 2, 2, 3, CAST(N'2019-02-15' AS Date), 6, CAST(15000.00 AS Decimal(18, 2)), CAST(15500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (9, 2, 4, 1, 2, CAST(N'2019-02-15' AS Date), 5, CAST(15000.00 AS Decimal(18, 2)), CAST(15500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (10, 1, NULL, 1, 1, CAST(N'2019-02-15' AS Date), 1, CAST(2000.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (11, 1, NULL, 1, 2, CAST(N'2019-02-15' AS Date), 1, CAST(1200.00 AS Decimal(18, 2)), CAST(1700.00 AS Decimal(18, 2)))
GO
INSERT [Facts].[CourseSales] ([Id], [CourseId], [ClientId], [SalesRepId], [LocationId], [Date], [Amount], [TotalNetto], [TotalBrutto]) VALUES (12, 1, 6, 1, 2, CAST(N'2019-02-15' AS Date), 3, CAST(12000.00 AS Decimal(18, 2)), CAST(12500.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [Facts].[CourseSales] OFF
GO