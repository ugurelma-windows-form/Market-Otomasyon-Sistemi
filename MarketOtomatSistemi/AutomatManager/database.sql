USE [AutomatSystem]
GO
/****** Object:  Table [dbo].[ManagerList]    Script Date: 16.03.2025 09:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerList](
	[id] [char](8) NOT NULL,
	[pin] [char](4) NULL,
	[email] [nvarchar](50) NULL,
	[companyName] [nvarchar](40) NULL,
	[managerName] [nvarchar](40) NULL,
	[companyLogo] [nvarchar](200) NULL,
	[managerLogo] [nvarchar](200) NULL,
	[isBe] [bit] NULL,
	[databaseName] [nvarchar](40) NULL,
	[userScene] [bit] NULL,
 CONSTRAINT [PK__ManagerL__3213E83F0C51D667] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ManagerList] ([id], [pin], [email], [companyName], [managerName], [companyLogo], [managerLogo], [isBe], [databaseName], [userScene]) VALUES (N'12345678', N'8487', N'elmaugur2004@gmail.com', N'Ugur Game Center', NULL, NULL, NULL, 1, N'myManager', 0)
GO
ALTER TABLE [dbo].[ManagerList] ADD  DEFAULT ((0)) FOR [isBe]
GO
/****** Object:  StoredProcedure [dbo].[AddManager]    Script Date: 16.03.2025 09:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[AddManager](@id char(8), @pin char(4), @isBe bit, @databasename varchar(40), @userscene bit)
	as Insert into ManagerList values(@id, @pin, null, null, null, null, null, @isBe, @databasename, @userscene)
--exec AddManager '10000001', '0000', '0', 'GunesMarket', '0';
--exec updateIsBe '1', '37520300';
--Select * from ManagerList;
--Select * from MT;
--Select * from CT;
GO
/****** Object:  StoredProcedure [dbo].[ChangePasswordManager]    Script Date: 16.03.2025 09:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ChangePasswordManager](@id char(8),@pin char(4)) as Update ManagerList set pin = @pin where id = @id;
--exec Buy '11111111','1','71893133';
--Select * from ManagerList;
--Drop Procedure _Example;
GO
/****** Object:  StoredProcedure [dbo].[GetManager]    Script Date: 16.03.2025 09:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetManager](@id char(8))
	as Select * from ManagerList where id = @id;
--exec AddManager '234577689', '4545', 'elmaugur2004@gmail.com';

GO
/****** Object:  StoredProcedure [dbo].[isUserScene]    Script Date: 16.03.2025 09:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[isUserScene](@id char(8),@value bit) 
	as Update ManagerList set userScene = @value where id = @id; Select * from ManagerList where id = @id;
--exec GetManager '10000002';
--Drop Procedure _Example;
GO
/****** Object:  StoredProcedure [dbo].[SetManager]    Script Date: 16.03.2025 09:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec AddManager '259563', '1212', '1';
--Select * from ManagerList
Create Procedure [dbo].[SetManager](@email nvarchar(50),@companyName nvarchar(40),@managerName nvarchar(40),@companyLogo nvarchar(200),@managerLogo nvarchar(200), @ID char(8))
	as Update ManagerList set email = @email, companyName = @companyName, managerName = @managerName, companyLogo = @companyLogo, managerLogo = @managerLogo where id = @ID;
GO
/****** Object:  StoredProcedure [dbo].[updateIsBe]    Script Date: 16.03.2025 09:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec AddManager '75023466', '4750', 'GameStudio', '0'
Create Procedure [dbo].[updateIsBe] (@iBe bit, @id char(8)) as
	Update ManagerList set isBe = @iBe where id = @id
--Update ManagerList set isBe = '0' where id = '75023466'
--Select * from ManagerList

GO
