USE [master]
GO
/****** Object:  Database [autoparts]    Script Date: 2/24/2017 4:15:28 PM ******/
CREATE DATABASE [autoparts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'autoparts', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\autoparts.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'autoparts_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\autoparts_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [autoparts] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [autoparts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [autoparts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [autoparts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [autoparts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [autoparts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [autoparts] SET ARITHABORT OFF 
GO
ALTER DATABASE [autoparts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [autoparts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [autoparts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [autoparts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [autoparts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [autoparts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [autoparts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [autoparts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [autoparts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [autoparts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [autoparts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [autoparts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [autoparts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [autoparts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [autoparts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [autoparts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [autoparts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [autoparts] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [autoparts] SET  MULTI_USER 
GO
ALTER DATABASE [autoparts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [autoparts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [autoparts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [autoparts] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [autoparts] SET DELAYED_DURABILITY = DISABLED 
GO
USE [autoparts]
GO
/****** Object:  Table [dbo].[product_review_images]    Script Date: 2/24/2017 4:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_review_images](
	[id] [int] NOT NULL,
	[fk_review_id] [int] NOT NULL,
	[image_path] [varchar](max) NULL,
 CONSTRAINT [PK_product_review_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_review_questions]    Script Date: 2/24/2017 4:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_review_questions](
	[id] [int] NOT NULL,
	[fk_review_id] [int] NOT NULL,
	[question] [text] NOT NULL,
 CONSTRAINT [PK_product_review_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_review_videos]    Script Date: 2/24/2017 4:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_review_videos](
	[id] [int] NOT NULL,
	[fk_review_id] [int] NOT NULL,
	[video_path] [varchar](max) NULL,
 CONSTRAINT [PK_product_review_videos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 2/24/2017 4:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] NOT NULL,
	[sku] [varchar](max) NOT NULL,
	[name] [varchar](max) NULL,
	[new_review_date] [date] NULL,
	[oldest_review_date] [date] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[review_answers]    Script Date: 2/24/2017 4:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_answers](
	[id] [int] NOT NULL,
	[fk_review_id] [int] NOT NULL,
	[fk_question_id] [int] NOT NULL,
	[answer] [text] NOT NULL,
 CONSTRAINT [PK_review_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reviews]    Script Date: 2/24/2017 4:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [int] NOT NULL,
	[fk_product_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[created_date] [date] NOT NULL,
	[source] [char](10) NOT NULL,
	[headline] [varchar](max) NOT NULL,
	[overall_rating] [int] NOT NULL,
	[comments] [text] NOT NULL,
	[nick_name] [varchar](50) NULL,
	[location] [varbinary](50) NULL,
	[merchant_review_id] [int] NULL,
	[merchant_user_id] [int] NULL,
	[merchant_email_address] [varchar](50) NULL,
	[campaign_id] [int] NULL,
	[site_id] [int] NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_previews] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[product_review_images]  WITH CHECK ADD  CONSTRAINT [FK_product_review_images_reviews] FOREIGN KEY([fk_review_id])
REFERENCES [dbo].[reviews] ([id])
GO
ALTER TABLE [dbo].[product_review_images] CHECK CONSTRAINT [FK_product_review_images_reviews]
GO
ALTER TABLE [dbo].[product_review_questions]  WITH CHECK ADD  CONSTRAINT [FK_product_review_questions_reviews] FOREIGN KEY([fk_review_id])
REFERENCES [dbo].[reviews] ([id])
GO
ALTER TABLE [dbo].[product_review_questions] CHECK CONSTRAINT [FK_product_review_questions_reviews]
GO
ALTER TABLE [dbo].[product_review_videos]  WITH CHECK ADD  CONSTRAINT [FK_product_review_videos_reviews] FOREIGN KEY([fk_review_id])
REFERENCES [dbo].[reviews] ([id])
GO
ALTER TABLE [dbo].[product_review_videos] CHECK CONSTRAINT [FK_product_review_videos_reviews]
GO
ALTER TABLE [dbo].[review_answers]  WITH CHECK ADD  CONSTRAINT [FK_review_answers_product_review_questions] FOREIGN KEY([fk_question_id])
REFERENCES [dbo].[product_review_questions] ([id])
GO
ALTER TABLE [dbo].[review_answers] CHECK CONSTRAINT [FK_review_answers_product_review_questions]
GO
ALTER TABLE [dbo].[review_answers]  WITH CHECK ADD  CONSTRAINT [FK_review_answers_reviews] FOREIGN KEY([fk_review_id])
REFERENCES [dbo].[reviews] ([id])
GO
ALTER TABLE [dbo].[review_answers] CHECK CONSTRAINT [FK_review_answers_reviews]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_products] FOREIGN KEY([fk_product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_products]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains product review images' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_review_images'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains the product review questions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_review_questions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains the product review videos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_review_videos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains autopart products' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains the product review question''s answers' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'review_answers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains all the product reviews by merchant' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reviews'
GO
USE [master]
GO
ALTER DATABASE [autoparts] SET  READ_WRITE 
GO
