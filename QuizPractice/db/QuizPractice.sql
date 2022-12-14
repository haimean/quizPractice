USE [QuizPracticeSystem]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[optionId] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NULL,
	[content] [nvarchar](4000) NULL,
	[isCorrect] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[optionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[quizId] [int] NULL,
	[content] [nvarchar](4000) NULL,
	[media] [nvarchar](256) NULL,
	[explanation] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[quizName] [nvarchar](256) NULL,
	[thumbnail] [nvarchar](256) NULL,
	[quizDuration] [time](7) NULL,
	[numberQuestion] [int] NULL,
	[subjectId] [int] NULL,
	[description] [nvarchar](4000) NULL,
	[dateCreated] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizResult]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizResult](
	[quizResultId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[quizId] [int] NULL,
	[score] [float] NULL,
	[time] [time](7) NULL,
	[submitAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentWork]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentWork](
	[studentWorkId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[quizResultId] [int] NULL,
	[questionId] [int] NULL,
	[optionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](256) NULL,
	[thumbnail] [nvarchar](256) NULL,
	[description] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](256) NULL,
	[email] [nvarchar](256) NULL,
	[password] [nvarchar](256) NULL,
	[avatar] [nvarchar](256) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[roleId] [int] NULL,
	[status] [int] NULL,
	[code] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/4/2022 11:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (44, 13, N'SmallTalk', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (45, 13, N'C++', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (46, 13, N'Kotlin', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (47, 13, N'Java', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (51, 17, N'Adele Goldberg', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (52, 17, N'Dennis Ritchie', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (53, 17, N'Alan Kay', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (54, 17, N'Andrea Ferro', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (55, 18, N'Encapsulation', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (56, 18, N'Polymorphism', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (57, 18, N'Exception', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (58, 18, N'Abstraction', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (59, 20, N'Abstraction', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (60, 20, N'Encapsulation', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (61, 20, N'Polymorphism', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (62, 20, N'Inheritance', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (63, 21, N'C++ programming language', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (64, 21, N'Java programming language', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (65, 21, N'Ada programming language', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (66, 21, N'C# programming language', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (67, 22, N'Modularity', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (68, 22, N'Efficient Code', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (69, 22, N'Code reusability', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (70, 22, N'Duplicate or Redundant Data', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (71, 23, N'Inheritance', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (72, 23, N'Data hiding', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (73, 23, N'Encapsulation', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (74, 23, N'Polymorphism', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (75, 24, N'Smalltalk', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (76, 24, N'Kotlin', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (78, 24, N'Java', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (79, 24, N'C++', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (80, 25, N'Only 1', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (81, 25, N'Only 999', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (82, 25, N'Only 100', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (83, 25, N'Any number', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (84, 26, N'Overloading <<', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (85, 26, N'Overloading &&', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (86, 26, N'Overloading | |', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (87, 26, N'Overloading +=', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (88, 27, N'Ablation', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (89, 27, N'Galling', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (90, 27, N'Creep', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (91, 27, N'Plucking', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (92, 28, N'Ptolemy', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (93, 28, N'Copernicus', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (94, 28, N'Aristotle', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (95, 28, N'Strabo', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (96, 29, N'One Degree', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (97, 29, N'One Mile', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (98, 29, N'One Nautical Mile', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (99, 29, N'One mach', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (100, 30, N'Norway', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (101, 30, N'Sweden', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (102, 30, N'India', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (103, 30, N'Cuba', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (104, 31, N'China North Korea', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (105, 31, N'Iran Pakistan', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (106, 31, N'Iran Iraq', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (107, 31, N'Pakistan Afghanistan', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (108, 32, N'Kaiser Wilhelm', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (109, 32, N'Archbishop Ussher', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (110, 32, N'Queen Victoria', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (111, 32, N'Archduke Franz Ferdinand', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (112, 33, N'Germany', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (113, 33, N'Norway', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (114, 33, N'Italy', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (115, 33, N'England', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (116, 34, N'Arizona', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (117, 34, N'Lusitania', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (118, 34, N'Titanic', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (119, 34, N'Andrea Doria', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (120, 35, N'Submarine', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (121, 35, N'Tank', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (122, 35, N'Jet fighter', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (123, 35, N'Chariot', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (124, 36, N'1925', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (125, 36, N'1918', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (126, 36, N'1920', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (127, 36, N'1915', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (156, 44, N'sdfsdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (157, 44, N'sdfsdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (158, 44, N'dd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (159, 44, N'ee', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (160, 45, N'sadfsdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (161, 45, N'sadfsdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (162, 45, N'sadf', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (163, 45, N'ádf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (164, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (165, 45, N'sdf', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (166, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (167, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (168, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (169, 45, N'sdf', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (170, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (171, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (172, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (173, 45, N'd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (174, 45, N'd', 0)
GO
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (175, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (176, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (177, 45, N'd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (178, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (179, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (180, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (181, 45, N'd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (182, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (183, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (184, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (185, 45, N'd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (186, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (187, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (188, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (189, 45, N'd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (190, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (191, 45, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (192, 45, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (193, 45, N'dssd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (194, 45, N'sd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (195, 45, N'sd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (196, 46, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (197, 46, N'sdf', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (198, 46, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (199, 46, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (200, 46, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (201, 46, N'sdf', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (202, 46, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (203, 46, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (204, 47, N'asd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (205, 47, N'asd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (206, 47, N'asd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (207, 47, N'asd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (208, 47, N'asd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (209, 47, N'asd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (210, 47, N'asd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (211, 47, N'asd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (212, 48, N'ds', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (213, 48, N'sd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (214, 48, N'sd', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (215, 48, N'sd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (216, 48, N'ds', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (217, 48, N'dd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (218, 48, N'dd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (219, 48, N'dd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (220, 49, N'ds', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (221, 49, N'dd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (222, 49, N'dd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (223, 49, N'dd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (224, 50, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (225, 50, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (226, 50, N'ss', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (227, 50, N'ư3e', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (228, 51, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (229, 51, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (230, 51, N'ss', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (231, 51, N'ư3e', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (232, 52, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (233, 52, N'd', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (234, 52, N'ss', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (235, 52, N'ư3e', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (236, 53, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (237, 53, N'sdf', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (238, 53, N'sdf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (239, 53, N'sdf', 0)
SET IDENTITY_INSERT [dbo].[Option] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (13, 2, N'Which of the following language was developed as the first purely object programming language?', NULL, N'This programming language was invented as the first pure OOPS (object-oriented) language. This language was designed by Alan Kay in the early 1970s.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (17, 2, N'Who developed object-oriented programming?', NULL, N'In the year 1970, Alan Kay gave Object-Oriented programming. He coined the concept of OOPS at a grad school in the year 1966 or 1967. Alan kay, Adele Goldberg, Dan Ingalls and others developed the first Smalltalk programming language.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (18, 2, N'Which of the following is not an OOPS concept?', NULL, N'None.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (20, 2, N'Which feature of OOPS described the reusability of code?', NULL, N'Inheritance is the feature of OOPS, which allows the users of OOPS to reuse the code which is already written. This OOPS feature inherits the features of another class in the programs.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (21, 2, N'Which of the following language supports polymorphism but not the classes?', NULL, N'It is a programming language that disapproves of the concept of polymorphism but supports the concept of classes. It is an object-based language. So, it does not follow the Object-oriented programming concepts.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (22, 2, N'Which among the following feature is not in the general definition of OOPS?', NULL, N'Duplicacy or Redundancy of data is a feature which totally dependent on the programmers. So, it cannot be created by the OOPS.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (23, 2, N'Which feature of OOPS derives the class from another class?', NULL, N'Inheritance is an important OOPS feature which derives the class from the base class or superclass. This OOPS feature inherits the features of another class in the programs.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (24, 2, N'Define the programming language, which does not support all four types of inheritance?', NULL, N'Java is a programming language that disapproves of the concept of ''multiple inheritance''. So, it does not agree with all types of inheritance.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (25, 2, N'A single program of OOPS contains _______ classes?', NULL, N'We can define any number of classes with different names in a single program of OOPS.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (26, 2, N'Which operator from the following can be used to illustrate the feature of polymorphism?', NULL, N'<< is an insertion operator which is used for overloading (polymorphism).')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (27, 3, N'Which of the following is the correct word describing loss of snow from a glacier by means of sublimation, melting, evaporation or avalanches?', NULL, N'Ablation refers to loss of snow from glaciers by means of vaporization, melting, wind or other processes.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (28, 3, N'Who among the following proposed Helio-centric model of solar system?', NULL, N'Copernicus proposed Helio-centric model. According to this model, sun stands at the center of the universe, and Moon, the Earth, and remaining planets revolve around the sun.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (29, 3, N'One minute of arc of latitude along any meridian is also known as__?', NULL, N'One Nautical Mile is the unit of length corresponding approximately to one minute of arc of latitude along any meridian. By international agreement it is exactly 1,852 metres (approximately 6,076 feet).')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (30, 3, N'Which country is called “Sugar Bowl of world”?', NULL, N'Cuba is traditionally known as the “Sugar bowl of the world” as it used to be the worlds largest sugar producer. But now brazil has taken the top spot in sugar production.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (31, 3, N'n context with the international borders, Zero Point refers to an area on the border of which of the following neighbors?', NULL, N'The Iran Pakistan International Border is known as Zero Point. It is 959 km in length.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (32, 4, N'Involving all the world’s superpowers, this tragic war resulted in over 35 million casualties. From weaponry and spies to treaties and neutrality, test your knowledge of World War I in this quiz.', NULL, N'On June 28, 1914, Archduke Franz (Francis) Ferdinand of Austria-Hungary was assassinated. His murder led to World War I.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (33, 4, N'Which of these nations was neutral in World War I?', NULL, N'Norway was neutral, meaning that it did not take sides, during World War I (1914–18). The country did not want to enter World War II (1939–45) either, but Nazi Germany invaded it in 1940.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (34, 4, N'Which of these ships was sunk by a German submarine?', NULL, N'The British passenger ship Lusitania was sunk by a German submarine off the coast of Ireland in 1915, causing great loss of life.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (35, 4, N'Which weapon was first used at the Battle of the Somme in World War I?', NULL, N'The tank was introduced, at first by the British armed forces, at the Battle of the Somme during World War I.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (36, 4, N'World War I ended in:', NULL, N'World War I officially ended at 11 AM on November 11 (11/11), 1918.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (44, 2, N'sdf', N'310008956_1842116696137023_8050684393229413607_n.jpg', N'sdfsdfsd')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (45, 2, N'ádf', N'310008956_1842116696137023_8050684393229413607_n.jpg', N'23d')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (46, 1008, N'sdf', N'', N'sdf')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (47, 2, N'zdasd', N'', N'asdasd')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (48, 1008, N'dsf', N'', N'd')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (49, 1008, N'sd', N'309982051_449351533975768_225298310995959523_n.jpg', N'sdf')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (50, 1008, N'sdf', N'310008956_1842116696137023_8050684393229413607_n.jpg', N'sdf')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (51, 1008, N'sdf', N'310008956_1842116696137023_8050684393229413607_n.jpg', N'sdf')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (52, 1008, N'sdf', N'310008956_1842116696137023_8050684393229413607_n.jpg', N'sdf')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (53, 1008, N'dd', N'312954274_654500039565540_5932015628431733744_n.jpg', N'dd')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quizId], [quizName], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [description], [dateCreated]) VALUES (2, N'Java oops Concepts', NULL, CAST(N'00:05:00' AS Time), 13, 6, N'OOPS MCQ', CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [description], [dateCreated]) VALUES (3, N'World Geography', NULL, CAST(N'00:03:00' AS Time), 5, 2, N'World Geography Multiple Choice Questions (MCQs) Quiz for State and UPSC Civil Services Examinations. Objective Questions on Physical Geography and World Geography for competitive examinations.', CAST(N'2022-06-02' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [description], [dateCreated]) VALUES (4, N'WORLD WAR I QUIZ', NULL, CAST(N'01:03:00' AS Time), 5, 1, N'WORLD WAR I QUIZ – World History Multiple Choice Quiz', CAST(N'2022-06-02' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [description], [dateCreated]) VALUES (1007, N'dfg', N'', CAST(N'21:00:00' AS Time), 0, 1, N'dfgsdg', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [description], [dateCreated]) VALUES (1008, N'', N'', CAST(N'12:00:00' AS Time), 7, 1, N'', CAST(N'2022-11-04' AS Date))
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizResult] ON 

INSERT [dbo].[QuizResult] ([quizResultId], [userId], [quizId], [score], [time], [submitAt]) VALUES (2, 6, 3, 0, CAST(N'00:00:20' AS Time), CAST(N'2022-06-21T21:21:26.107' AS DateTime))
INSERT [dbo].[QuizResult] ([quizResultId], [userId], [quizId], [score], [time], [submitAt]) VALUES (3, 1, 3, 40, CAST(N'00:00:22' AS Time), CAST(N'2022-11-02T23:19:39.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[QuizResult] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([statusId], [statusName]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([statusId], [statusName]) VALUES (2, N'Not Active')
INSERT [dbo].[Status] ([statusId], [statusName]) VALUES (3, N'Block')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentWork] ON 

INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (11, 1, 3, 27, 88)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (12, 1, 3, 28, 93)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (13, 1, 3, 29, NULL)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (14, 1, 3, 30, 100)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (15, 1, 3, 31, NULL)
SET IDENTITY_INSERT [dbo].[StudentWork] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (1, N'History', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (2, N'Geography', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (3, N'Japanese', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (4, N'English', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (6, N'Java OOP', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (7, N'C# .NET', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (10, N'sdfsdf', N'312115187_835261154491243_2079142346389052939_n.jpg', N'                    
                            sdfsdf')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (11, N'asssa', N'312115187_835261154491243_2079142346389052939_n.jpg', N'                    saasas
                            ')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (12, N'sdfsd', N'312115187_835261154491243_2079142346389052939_n.jpg', N'                    
                            sdafasdfdsa')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (13, N'sdfdssdfdsdfsddfs', N'299232216_620816863110845_1790462141448179805_n.jpg', N'                    
                          ádfsadfscdacvfewfv5   dfg    ')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (14, N'xvc c', N'subject/312115187_835261154491243_2079142346389052939_n.jpg', N'                    sdfsdf
                            ')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (15, N'dddwe', N'subject/312115187_835261154491243_2079142346389052939_n.jpg', N'                    
                            ddd')
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (16, N'sdfds', N'312115187_835261154491243_2079142346389052939_n.jpg', N'                    
                            sdfsdfasd')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (1, N'DatNT', N'datnthe153704@fpt.edu.vn', N'123456dat', NULL, 1, CAST(N'2001-01-01' AS Date), 1, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (2, N'HuyNQ', N'huynqhe153639@fpt.edu.vn', N'123456huy', NULL, 1, CAST(N'2001-02-02' AS Date), 1, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (3, N'HungNL', N'hungnlhe153107@fpt.edu.vn', N'123456hung', NULL, 1, CAST(N'2001-03-03' AS Date), 2, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (4, N'SonNTHS', N'sonnthse04813@fpt.edu.vn', N'123456son', NULL, 1, CAST(N'2001-04-04' AS Date), 2, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (5, N'NghiaPT', N'nghiapthe150491@fpt.edu.vn', N'123456nghia', NULL, 1, CAST(N'2001-05-05' AS Date), 3, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (6, N'Data', N'datagame21stcentury@gmail.com', N'123456', NULL, 1, CAST(N'1999-10-10' AS Date), 3, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (7, N'NguyenDat', N'nguyendat091011@gmail.com', N'123456', NULL, 1, CAST(N'2022-06-01' AS Date), 3, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([roleId], [roleName]) VALUES (2, N'Expert')
INSERT [dbo].[UserRole] ([roleId], [roleName]) VALUES (3, N'Student')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([optionId])
REFERENCES [dbo].[Option] ([optionId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([quizResultId])
REFERENCES [dbo].[QuizResult] ([quizResultId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[UserRole] ([roleId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([statusId])
GO
