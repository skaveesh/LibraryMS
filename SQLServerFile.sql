USE [master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 2016-12-13 11:23:41 PM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'9rwKyM7F3/qwKBasVJsXQAgtyxeJrg9gyo+XvITQnKg=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 2016-12-13 11:23:41 PM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'lX+2uEUGnfn5YQMkKNOuDO0GzIhkMFZlkmBsN4j1MjY=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [ASUS-X455LD\Samintha]    Script Date: 2016-12-13 11:23:41 PM ******/
CREATE LOGIN [ASUS-X455LD\Samintha] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [LibraryUser]    Script Date: 2016-12-13 11:23:41 PM ******/
CREATE LOGIN [LibraryUser] WITH PASSWORD=N'GjYqcbODcN+U4/HCbc9LmCvAQ4xLWa4lC32n5N1KS0I=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [LibraryUser] DISABLE
GO

GO
USE [LibraryManagementSystem]
GO
/****** Object:  User [LibraryUser]    Script Date: 2016-12-13 11:23:41 PM ******/
CREATE USER [LibraryUser] FOR LOGIN [LibraryUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [LibraryUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [LibraryUser]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2016-12-13 11:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[author] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[publisher] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[category] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[isbn] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[edition] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[available_copies] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Books] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2016-12-13 11:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[username] [varchar](20) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[password] [varchar](255) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[email] [varchar](255) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
	[reservation_book] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Users] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([bookID], [title], [author], [publisher], [category], [isbn], [edition], [available_copies]) VALUES (1, N'Story of a Real Man', N'Boris Nicholaevich Polevoi', N'S.Godage and Brothers', N'Novels', N'ISBN 978-955-30-1399-6', N'2', 10)
INSERT [dbo].[Books] ([bookID], [title], [author], [publisher], [category], [isbn], [edition], [available_copies]) VALUES (2, N'The Blue Economy', N'Gunter Pauli', N'Paradigm Publications', N'Technology: Biomimetics', N'ISBN 1-930865', N'1', 5)
INSERT [dbo].[Books] ([bookID], [title], [author], [publisher], [category], [isbn], [edition], [available_copies]) VALUES (9, N'Man Hunt', N'Nicholaevich Polevoi', N'Sathmina and Brothers', N'Young Novel', N'ISBN 978-955-30-1459-6', N'2', 0)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Address], [Contact], [username], [password], [email], [reservation_book]) VALUES (1, N'Admin', N'', N'', N'', N'admin', N'e2fc714c4727ee9395f324cd2e7f331f', NULL, NULL)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Address], [Contact], [username], [password], [email], [reservation_book]) VALUES (2, N'Samintha', N'Kaveesh', N'Kelaniya', N'0711234567', N'samintha', N'81dc9bdb52d04dc20036dbd8313ed055', N'skaveesh@gmail.com', 9)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Address], [Contact], [username], [password], [email], [reservation_book]) VALUES (8, N'Miyuru', N'Ranaweera', N'123/2 Weliweriya', N'07143544353', N'miyuru', N'bad5f33780c42f2588878a9d07405083', N'skaveeshii@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_isbn]    Script Date: 2016-12-13 11:23:41 PM ******/
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [UQ_isbn] UNIQUE NONCLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_email]    Script Date: 2016-12-13 11:23:41 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_username]    Script Date: 2016-12-13 11:23:41 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([reservation_book])
REFERENCES [dbo].[Books] ([bookID])
GO
/****** Object:  Trigger [dbo].[EMAILAUTOSEND]    Script Date: 2016-12-13 11:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[EMAILAUTOSEND]
ON [dbo].[Books]
AFTER UPDATE
AS
BEGIN
	
	DECLARE @last_available_copies_of_book int
	DECLARE @newly_available_copies_of_book int
	DECLARE @book_title varchar(255)
	DECLARE @user_email varchar(255)
	DECLARE @user_fname varchar(255)
	DECLARE @user_lname varchar(255)
	DECLARE @reservation_cur CURSOR

	DECLARE @emailbody varchar(255)

	SELECT @last_available_copies_of_book = available_copies FROM deleted;
	SELECT @newly_available_copies_of_book = available_copies FROM dbo.Books;
	

	SET @reservation_cur = CURSOR FOR
	SELECT title,email,FirstName,LastName 
	FROM dbo.Users u INNER JOIN dbo.Books b ON u.reservation_book = b.bookID; 
	
	IF((@last_available_copies_of_book = 0) AND @newly_available_copies_of_book>@last_available_copies_of_book)
	BEGIN
		OPEN @reservation_cur
		FETCH NEXT
		FROM @reservation_cur INTO @book_title, @user_email, @user_fname, @user_lname
		WHILE @@FETCH_STATUS = 0

		BEGIN
		--send an email to each user who reserved a book
			UPDATE dbo.Users SET reservation_book = NULL WHERE email = @user_email
			SET @emailbody = 'Hello ' + @user_fname + ' ' + @user_lname + ', '+@book_title+' you requested is available now.';
			EXEC msdb.dbo.sp_send_dbmail
			  @recipients = @user_email, 
			  @profile_name = 'default',
			  @subject = 'Book is Available', 
			  @body = @emailbody;
			
			FETCH NEXT
			FROM @reservation_cur INTO @book_title, @user_email, @user_fname, @user_lname
		END
	END
END
GO
/****** Object:  Trigger [dbo].[EMAILLOWER]    Script Date: 2016-12-13 11:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[EMAILLOWER]
ON [dbo].[Users]
FOR INSERT,UPDATE
AS
BEGIN
UPDATE dbo.Users SET email =(SELECT LOWER(email) FROM INSERTED) WHERE ID =(SELECT ID FROM INSERTED)
END
GO
