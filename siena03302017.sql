USE [master]
GO
/****** Object:  Database [Siena_Dev]    Script Date: 3/30/2017 9:49:05 PM ******/
CREATE DATABASE [Siena_Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Siena_Dev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Siena_Dev.mdf' , SIZE = 1974272KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Siena_Dev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Siena_Dev_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Siena_Dev] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Siena_Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Siena_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Siena_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Siena_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Siena_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Siena_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Siena_Dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Siena_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Siena_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Siena_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Siena_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Siena_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Siena_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Siena_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Siena_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Siena_Dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Siena_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Siena_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Siena_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Siena_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Siena_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Siena_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Siena_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Siena_Dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Siena_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [Siena_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Siena_Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Siena_Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Siena_Dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Siena_Dev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Siena_Dev] SET QUERY_STORE = OFF
GO
USE [Siena_Dev]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Siena_Dev]
GO
/****** Object:  Table [dbo].[JobCategories]    Script Date: 3/30/2017 9:49:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCategories](
	[Category] [varchar](200) NULL,
	[Title] [varchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobDetail]    Script Date: 3/30/2017 9:49:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDetail](
	[JobId] [uniqueidentifier] NULL,
	[JobDetailContent] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobPost]    Script Date: 3/30/2017 9:49:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPost](
	[Id] [uniqueidentifier] NULL,
	[JobName] [varchar](300) NULL,
	[CompanyName] [varchar](300) NULL,
	[JobLocation] [varchar](300) NULL,
	[JobDescription] [varchar](max) NULL,
	[JobPostDate] [datetime] NULL,
	[Salary] [varchar](300) NULL,
	[Category] [varchar](300) NULL,
	[Title] [varchar](300) NULL,
	[Url] [varchar](500) NULL,
	[IsIndeed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MessageLog]    Script Date: 3/30/2017 9:49:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageLog](
	[LogMessage] [varchar](max) NULL,
	[StackMessage] [varchar](max) NULL,
	[Parameter] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebData]    Script Date: 3/30/2017 9:49:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebData](
	[url] [varchar](max) NULL,
	[html] [varchar](max) NULL,
	[LinkName] [varchar](200) NULL,
	[HtmlText] [varchar](max) NULL,
	[linkUID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Accountant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Director Of Finance')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Office Manager Bookkeeper')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Accounting Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Finance Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Quantitative Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Accounting Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Financial Advisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Quantitative Research Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Accounting Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Financial Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Senior Accountant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Assistant Controller')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Financial Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Tax Accountant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Billing Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Financial Reporting Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Tax Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Bookkeeper')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Full Charge Bookkeeper')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Treasury Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Budget Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'General Ledger Accountant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'VP Director of Finance')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'CNA')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Internal Auditor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'VP of Finance')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Controller')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'Night Auditor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Accounting/Finance', N'WFF USC Credit Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Case Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Medical Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Phlebotomist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Dental Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nuclear Medicine Technologist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Physical Therapist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Dental Hygienist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nurse')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Physician Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Director of Nursing')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nurse Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Respiratory Therapist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Health Unit Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nurse LVN')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Social Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Home Health Aide')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nurse Practitioner')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Unit Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Massage Therapist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nurse RN')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Unit Secretary')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Medical Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nursing Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Veterinary Receptionist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Medical Receptionist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Nutritionist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Veterinary Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Medical Technologist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Occupational Therapist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Healthcare', N'Vocational Rehabilitation Counselor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Community Volunteer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Care Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Leader')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Red Cross')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Care Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Program Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Special Events Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Program Director')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Volunteer Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Counselor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Volunteer Recruiter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Development Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Advocate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Non-Profit/Volunteering', N'Youth Development Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Accounts Payable Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Executive Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Program Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Accounts Receivable Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Executive Director')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Program Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Administrative Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'File Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Project Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Assistant Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Medical Records Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Project Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Branch Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Office Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Purchasing Agent')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Office Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Purchasing Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Data Entry Operator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Office Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Receptionist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Director of Operations')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Operations Manager')
GO
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Receptionist Administrative Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'District Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Personal Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Secretary')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Executive Administrative Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Product Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Administrative', N'Territory Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Application Developer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'IT Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Software Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Business Objects Developer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Informatica Developer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'System Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Business Systems Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Java Developer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Systems Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Data Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'NET Developer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Systems Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Database Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Network Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Technical Support Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Director Of Development')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Network Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Technical Support Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Embedded Software Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Network Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Unix System Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'IT Director')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Oracle Database Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Web Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'IT Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Oracle Developer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Web Developer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'IT Project Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Programmer Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Computer/Internet', N'Webmaster')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Pharmaceutical/Bio-tech', N'Analytical Chemist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Pharmaceutical/Bio-tech', N'Lab Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Pharmaceutical/Bio-tech', N'Pharmacist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Pharmaceutical/Bio-tech', N'Lab Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Pharmaceutical/Bio-tech', N'Pharmaceutical Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Pharmaceutical/Bio-tech', N'Pharmacy Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Art Director')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Graphics Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Unigraphics Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Assistant Editor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Graphics Designer Production Artist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'User Interface Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Illustrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Video Editor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Editor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Journalist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Writer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Editorial Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'News Producer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Writer Editor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Graphic Artist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'News Reporter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Zoo Keeper')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Graphic Web Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Arts/Entertainment/Publishing', N'Photographer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Banquet Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Greeter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Kennel Attendant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Event Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Guest Service Agent')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Kennel Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Event Planner')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Housekeeper')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Travel Agent')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Floral Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Hospitality/Travel', N'Kennel Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Real Estate', N'Assistant Property Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Real Estate', N'Leasing Agent')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Real Estate', N'Real Estate Appraiser')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Real Estate', N'Land Surveyor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Real Estate', N'Leasing Consultant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Real Estate', N'Lease Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Real Estate', N'Property Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Investment Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Underwriter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Bank Teller')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Loan Consultant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Underwriter Trainee')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Banker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Loan Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Underwriting Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Credit Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Loan Processor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Universal Banker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Escrow Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Mortgage Loan Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'In Store Banker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Banking/Loans', N'Teller')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'Director Of Human Resources')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'Recruiting Coordinator')
GO
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'Executive Recruiter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Recruiter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'Recruiting Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'Technical Recruiter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Consultant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'VP of Human Resources')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'Job Coach')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'HR Generalist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Human Resources', N'Recruiter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Baker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Bath Department Supervisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Line Cook')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Bartender')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Restaurant Bartender')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Cook')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Helper')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Restaurant Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Dishwasher')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Restaurant Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Executive Chef')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Staff')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Sous Chef')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Food Service Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Steward')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Wait Staff')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Grill Cook')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Supervisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Restaurant/Food Service', N'Kitchen Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Carpenter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Groundskeeper')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Laborer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Construction Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'HVAC Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Maintenance Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Construction Superintendent')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Heavy Equipment Operator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Maintenance Mechanic')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Construction Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Industrial Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Maintenance Supervisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Custodian')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Industrial Electrician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Maintenance Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Electrician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Installer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Maintenance Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Equipment Operator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Interior Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Painter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Estimator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Janitor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Plant Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Facilities Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Journeyman Electrician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Welder')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'General Maintenance Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Journeyman Lineman')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Construction/Facilities', N'Welder Fabricator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Benefits Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Fraud Investigator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Investigator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Benefits Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Inspector')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Lead Asset Protection Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Benefits Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Insurance Agent')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Field Investigator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Insurance', N'Insurance Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Assistant Store Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Hair Stylist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Retail Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Buyer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Head Cashier')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Retail Store Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Buyer Planner')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Jeweler')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Sales Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Cashier')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Key Holder')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Store Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Esthetician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Kitchen Bath Sales Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Visual Merchandiser')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Footwear Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Night Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Youth Department Sales Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Garden Sales Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Representative Retail Sales')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Grooming Salon Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Retail', N'Retail Sales Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Branch Customer Service Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Field Service Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Lot Attendent')
GO
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Customer Service Advisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Field Service Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Relationship Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Customer Service Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Field Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Retail Customer Support Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Customer Service Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Flight Attendant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Sales Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Customer Service Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Game Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Service Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Desktop Support')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'General Service Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Service Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Desktop Support Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Help Desk Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Universal Service Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Emergency Road Service Counselor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Help Desk Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Valet Attendant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Field Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Help Desk Technical Support')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Field Service Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Customer Service', N'Help Desk Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Criminal Investigator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Loss Prevention Investigator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Security Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'International Police Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Loss Prevention Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Transportation Security Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Juvenile Detention Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Police Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Unarmed Security Guard')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Juvenile Probation Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Law Enforcement/Security', N'Security Guard')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Account Executive')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Key Account Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Sales Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Account Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Merchandiser')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Sales Executive')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Account Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'National Account Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Sales Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Business Development Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'National Sales Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Business Development Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Outside Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Sales Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Director Of Business Development')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Regional Sales Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Telemarketer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Director Of Sales')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Retail Merchandiser')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Territory Sales Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'District Sales Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Route Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Trader')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Field Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Sales Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'VP of Sales')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Inside Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Sales Consultant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Sales', N'Work Sales Representative')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Assistant Teacher')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Kids Activity Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Trainer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Counselor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Kindergarten Teacher')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Training Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Enrollment Counselor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Korean Language Instructor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Training Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Guidance Counselor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Nanny')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Training Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Health Educator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Teacher')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Yoga Instructor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Instructional Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Technical Trainer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Instructor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Education/Training', N'Technical Writer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Attorney')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Legal Administrative Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Litigation Attorney')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'General Counsel')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Legal Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Litigation Paralegal')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Judge Advocate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Legal Secretary')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Legal', N'Paralegal')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Telecommunications', N'Broadband Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Telecommunications', N'Telecommunications Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Telecommunications', N'Wireless Consultant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Telecommunications', N'Communications Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Telecommunications', N'Telecommunications Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Telecommunications', N'ZURB Operator')
GO
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Architect')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'GIS Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Mechanical Design Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Civil Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'GIS Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Mechanical Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Design Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'GIS Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Operations Research Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Electrical Designer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'General Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Optical Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Electrical Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Geographer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Process Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Electronics Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Geologist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Project Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Geotechnical Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Scientist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Engineering Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Hardware Design Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Test Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Engineering Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Hardware Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Ultrasound Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Environmental Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'Industrial Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Engineering/Architecture', N'VP Of Engineering')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Assembler')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Manufacturing Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'QA Tester')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Autocad Drafter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Material Handler')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Quality Control Inspector')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Automotive Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Operator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Quality Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'CNC Machinist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Production Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Research Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Chemist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Production Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Research Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Drafter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Production Supervisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Research Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Electronic Assembler')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Production Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Research Scientist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Electronics Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'QA Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Safety Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Machine Operator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'QA Engineer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Machinist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'QA Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Manufacturing/Mechanical', N'Test Technician')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Bus Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Logistics Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Van Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Delivery Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Logistics Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Diesel Mechanic')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Nationwide Truck Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Dispatcher')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Order Builder')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Receiving Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Driver Merchandiser')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Receiving Merchandise Pick Up Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Lead')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Forklift Operator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Route Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Freight Team Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Shipping Clerk')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Household Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Transportation Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Supervisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Logistics Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Truck Driver')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Transportation/Logistics', N'Warehouse Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Environmental Scientist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Lifeguard')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Zoning Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Federal Government Worker')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'USAR Unit Administrator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Zoning Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Firefighter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Wildlife Biologist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Zoning Supervisor')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Grant Writer')
GO
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Zipsort Operator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Intelligence Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Government/Military', N'Zoning Enforcement Inspector')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Brand Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Marketing Assistant')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Online Marketing Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Copywriter')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Marketing Associate')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Product Marketing Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Director Of Communication')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Marketing Coordinator')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Public Relations Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Director Of Marketing')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Marketing Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'VP of Marketing')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Market Research Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Marketing/Advertising/PR', N'Marketing Specialist')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'Business Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'Business Process Analyst')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'General Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'Business Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'Chief Financial Officer')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'Business Office Manager')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'Director')
INSERT [dbo].[JobCategories] ([Category], [Title]) VALUES (N'Upper Management/Consulting', N'VP')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'428bb71d-fdc9-4951-b845-fcac36ee2330', N'<p>Staff and Senior accountants report to the Accounting Managers and are responsible for providing accounting and financial support to ensure adequate internal controls and efficiency of procedures and processes within the Accounting department, which ensure the accuracy of financial reporting and accounting.</p><p><b>Duties & Responsibilities: </b></p><ul><li>Primary support for Accounting Manager in month-end closes and account analysis. Responsible for preparation of detail account analysis, journal entries, G/L account reconciliations, account roll- forwards, budget vs. actual analysis, system balancing and all other tasks required to close month-end on a timely basis and maintain G/L account integrity.</li><li>Ability to engage peers and unit operating managers where appropriate in gathering, reporting and explaining substance of business transactions as it relates to the analysis within their work plan.</li><li>Primary support for Accounting Manager in financial statement audits, including preparation of detail audit schedules (monthly and at year-end) and analysis in accordance with the established time frames determined by Supervisor.</li><li>Demonstrated proficiency in use of core financial systems including, general ledger, GL report writer and budgeting software.</li><li>Must be able to demonstrate active knowledge of generally accepted accounting principles in daily execution of accounting functions and tasks.</li><li>Assist in preparation of the annual budget as directed by Supervisor. Duties to include processing/review of data input for reasonableness and accuracy with respect to prior year, current budget and trends.</li><li>Provide back-up to other Staff Accountants, as needed.</li><li>All other job-related duties as assigned.</li></ul><p><b>Qualifications: </b></p><ul><li>2-5 years progressively responsible accounting experience</li><li>Experience with Microsoft Office, especially Excel with graphics, PowerPoint and Word</li><li>Must have financial reporting experience including exposure to full set of Financial Statements and all aspect of GL accounting; exposure to AP and Payroll a plus</li><li>Must have exceptional analytical skills</li><li>Must be self-motivated, capable of taking initiative, successfully handle and prioritize multiple competing priorities, and effectively manage deadlines</li><li>Proven ability to work effectively in a team environment and have strong rapport with the executive team, colleagues, and subordinates</li><li>CPA and/or MBA certification preferred</li></ul><p>Job Type: Full-time</p><p>Salary: $55,000.00 to $75,000.00 /year</p><p>Job Location:</p><ul><li>Cincinnati, OH</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'7a6d2e4e-9503-4f47-88f9-4b559e057a42', N'<p>The West Chester University Foundation has an opening for detail orientated <b>Senior Accountant</b> to join its dedicated and focused Accounting and Finance team. The WCU Foundation is an independent non-profit organization that raises funds, manages resources, and conducts special projects that advance the mission and goals of West Chester University of Pennsylvania. More about the WCU Foundation can be found at www.wcufoundation.org</p><p>The <b>Senior Accountant</b> is responsible for general accounting and financial reporting of full scope of activities for the West Chester University Foundation’s fundraising activities, management of donated resources and promoting University needs through entrepreneurial activities.</p><p><b>Essential Job Functions: </b></p><ul><li>Month-end close activities and journal entries</li><li>Preparation of financial statements and variance analysis</li><li>Account and bank reconciliations and resolution of discrepancies</li><li>Management of restricted funds including responding to inquiries on fund activity, creation of funds, and preparation of all required reporting</li><li>Maintenance of fixed asset and depreciation schedules and all related documentation</li><li>Preparation of audit schedules and assistance as needed with the audit inquiries</li><li>Preparation of budget</li><li>Preparation of work papers required for tax returns</li><li>Cross-trained on accounts payable process</li><li>Participation in one Foundation event each year outside normal work hours</li><li>Continuous focus on skills development and knowledge by participating in educational opportunities and reading professional publications</li><li>Ad hoc reporting and work</li><li>Special projects as needed</li></ul><p><b>Job Requirements/Qualifications: </b></p><ul><li>Bachelor’s in Accounting or Finance</li><li>3-5 years of experience in accounting</li><li>Experience in not-for-profit accounting preferred but not required</li><li>Experience with Microsoft Office; proficiency in Excel</li><li>Detail oriented with an ability to work independently and within reporting deadlines</li></ul><p>Compensation is competitive and commensurate with experience and ability ($55,000 - $60,000) and includes full benefit package such as paid time off, medical, dental and life insurance, and employer contribution to retirement plan. For details on available benefits, please refer to the Benefits Summary on our website www.wcufoundation.org/employment. No relocation assistance is available for this position.</p><p>Applicants must submit a <b>letter of interest highlighting relevant professional accomplishments, a current resume, three references, and salary requirements</b> .</p><p>Please apply on this website or visit our website at www.wcufoundation.org/employment to view the job description and apply. Review of applications will begin immediately and will continue until the position is filled.</p><p>Job Type: Full-time</p><p>Salary: $55,000.00 to $60,000.00 /year</p><p>Required education:</p><ul><li>Bachelor''s</li></ul><p>Required experience:</p><ul><li>accounting: 3 years</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'faa23b9e-17e1-4976-aad4-42d25d4ccfda', N'<p>MFA Talent Management has an excellent opportunity for a General Ledger Accountant to join a very busy, multi-entity organization. This is a great opportunity for someone who thrives in a fast-paced environment to join an accounting team of 12.</p><p>Responsibilities:</p><p>· Prepare and record revenue, expenses, liabilities and assets for multiple (non-consolidated) entities</p><p>· Balance subsidiary accounts and resolve discrepancies</p><p>· Perform account reconciliations</p><p>· Prepare and post all related journal entries and prepare trial balance</p><p>· Complete financial reporting through preparation of trial balance and profit & loss statements</p><p>· Continually analyze general ledger accounts looking for discrepancies, variances and anomalies; report findings to Controller</p><p>· Oversee the transactional accounting performed by the staff</p><p>Requirements:</p><p>· Bachelors Degree in Accounting or related field</p><p>· 2+ years General Ledger Accounting experience</p><p>· Strong Excel skills; Quickbooks experience a plus</p><p>Job Type: Full-time</p><p>Salary: $40,000.00 to $45,000.00 /year</p><p>Required education:</p><ul><li>Bachelor''s</li></ul><p>Required experience:</p><ul><li>General Ledger: 1 year</li><li>Accounting: 1 year</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'295cefd9-eea6-4984-a57c-ffbb3405d157', N'<p><b>Accountant - Level 2</b></p><p>This position will analyze financial information and prepare financial reports to determine or maintain record of assets, liabilities, profit and loss, tax liability, or other financial activities within the organization.</p><p><b>Visit our website at: www.avadimtechnologies.com</b></p><p><b>Responsibilities: </b></p><p>· Validate payer claims and compliance with existing contracted terms and conditions</p><p>· Process rebate invoices and reconciliation with finance</p><p>· Full service rebate administration and reporting including vendor management for rebate aggregation services</p><p>· Assist in the preparation of monthly financial close activities including update and maintenance of the General Ledger, analysis of account variances and reporting of results to management</p><p>· Complete account reconciliations and resolve reconciling items timely and independently</p><p>· Ensure accuracy and reliability of general ledger/trial balance</p><p>· Coordinate and maintain monthly recurring and ad-hoc journal entries supported by adequate documentation</p><p>· Perform monthly analysis of general ledger account variances and reconcile changes</p><p>· Assist on key efficiency metrics to improve performance</p><p>· Prepare for and participate in internal and external audits</p><p>· Assist or lead process improvement teams</p><p>· Adherence to GAAP and Corporate Accounting Policies and Procedures</p><p><b>Qualifications and requirements: </b></p><p>· Associates degree in Accounting or Finance required with a minimum 3 years related work experience; Bachelor’s degree preferred</p><p>· Must be flexible, detail oriented and able to work under pressure to meet deadlines</p><p>· Ability to work independently; self-motivated.</p><p>· Ability to multi-task in a fast paced environment and demonstrate good organizational and time management skills</p><p>· Able to communicate effectively with internal and external customers across all levels of the organization, both verbally and in writing</p><p>· Excel skills at Intermediate/Advanced level, including use of pivot tables and VLOOKUP</p><p>· Knowledge of Microsoft Systems, including Office and Windows and previous experience with accounting systems (ex. Quickbooks, Microsoft NAV, Oracle, SAP)</p><p>· Adherence to laws and confidentiality guidelines</p><p><b>To apply, copy and paste URL into browser: </b></p><p><b>https://recruiting.ultipro.com/AVA1002AVATI/JobBoard/44d0ebaf-6222-5894-8610-e989d05af9c6</b></p><p>Job Type: Full-time</p>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'a129cfde-e630-42a9-8fa2-0f9ea903cace', N'<p>Our Soho, NYC-based company is seeking a talented, self-motivated candidate for a full-time, in-house staff accountant position that will work in a team with our other accounting managers. We are a small family-owned wine & spirits company – which means we create all of our own brands and partner with like-minded wineries and distilleries to make the brands a reality. Our focus is on high-end, hip products that fill a niche in the crowded wine & spirits market.</p><p>Candidates must have a bachelor’s degree in accounting, a minimum of 1-3 years’ accounting work experience, be well spoken, have a professional appearance, be organized, computer-literate (with a focus on Microsoft Office programs, especially (Excel and Outlook) and have exceptional written & oral communication skills.</p><p>The position’s responsibilities include:</p><ul><li>Accurately process incoming distributor bills & communicate with vendors regarding any errors/missing bills. Assist with weekly remittance.</li><li>Prepare monthly state shipment reports.</li><li>Record monthly depreciation for all entities.</li><li>Perform monthly high volume inventory reconciliation</li><li>Assist with state and federal level licensing compliance</li><li>Assist with monthly closures and yearly audit.</li><li>Handle filing and physical record keeping</li></ul><p>There is a tremendous opportunity for advancement and growth within this role. Our company has a portfolio of some of the most exciting and sought-after brands in the industry. The environment is entrepreneurial and fast-paced with the opportunity to make an immediate impact within the company.</p><p>If you are interested in applying for this position, please submit a 1) Cover Letter, 2) Resume and 3) Salary History. Please note that only those candidates that submit all three required pieces of information will be considered.</p><p>Job Type: Full-time</p><p>Salary: $45,000.00 to $60,000.00 /year</p><p>Job Location:</p><ul><li>New York, NY</li></ul><p>Required education:</p><ul><li>Bachelor''s</li></ul><p>Required experience:</p><ul><li>accounting: 1 year</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'fa13d916-2cb6-45d4-a3c1-781ebefa28b9', N'<p>Perform all aspects of accounting support, including but not limited to: accounts receivables, payables, deposits, merchant services, credits.</p><ul><li>Prepare & fact check invoices before sending them to customers, apply customer payments & answer all customer inquiries regarding invoices & payments.</li><li>Audit & approve vendor bills, process vendor payments & answer all vendor inquiries.</li><li>Research & solve payment discrepancies.</li><li>Research & solve invoice discrepancies.</li><li>Process & apply customer check, credit card payments & credits.</li><li>Process credit memos for both vendors & customers.</li><li>Prepare bank deposits.</li></ul><p>Must be proficient with Quickbooks and have experience with Excel and Outlook.</p><p>If you have 2 - 5 years accounting experience, great communication skills, are extremely detail oriented, organized and a quick learner, this is the position for you. We are a growing tech company in the northern peninsula area looking for someone with experience and a desire to make an immediate contribution and grow with us.</p><p>This position is full-time, Monday through Friday, 8:00 AM - 5:00 PM.</p><p>Please send a cover letter with your salary requirements in your response.</p><p>Job Type: Full-time</p><p>Salary: $55,000.00 /year</p><p>Required experience:</p><ul><li>accounting: 2 years</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'6e4d5b1e-6341-481e-9956-d2d6969a3862', N'<p>A growing e-commerce/retail company based in Miami Lakes, FL is looking to hire a Senior Accountant. This position will transition into an Assistant Controller role in a short-time frame. Company has a very laid-back, friendly, family culture.</p><p><b>Why Take This Great Opportunity</b> <b>?</b></p><ul><li>Company has experienced 25% growth in revenue from last year</li><li>Company will be going international in Q2 of this year</li><li>Casual, laid-back work environment</li><li>Young, entrepreneur atmosphere</li><li>Medical, dental and vision coverage</li><li>10 PTO days</li><li>8 paid holidays</li><li>401(k)</li></ul><p><b>Responsibilities</b> <b>: </b></p><ul><li>Perform monthly, quarterly and year-end close functions</li><li>Prepare and maintain monthly recurring journal entries</li><li>Prepare monthly bank reconciliations</li><li>Prepare balance sheet and inter-company account reconciliations</li><li>Prepare cash flow statements and forecasts</li><li>Analyze monthly variances actual to budget</li><li>Assist with accounting research and process improvement opportunities</li></ul><p><b>Requirements</b> <b>: </b></p><ul><li>Bachelor’s degree in Accounting</li><li>3-5 years of full-cycle accounting experience including audit experience from a large CPA firm</li><li>GAAP Knowledge</li></ul><p>To be considered, click Apply or for more information, contact us at <b>(888) 582-4791</b> .</p><p>Job Type: Full-time</p><p>Salary: $80,000.00 /year</p>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'af9a8366-0c02-458a-be3e-47cc038e3414', N'<p><b>“A Positive, Exemplary Community”</b></p><p><b>Accountant</b></p><p><b>Salary Range: $55,000 - $65,000</b></p><p><b>Hours Per Week 37.5</b></p><p><b>**PENDING COUNCIL APPROVAL**</b></p><p><b>Pending Council Approval</b></p><p>This position is pending council approval for the 2017 – 2018 budget.</p><p><b>Overview</b></p><p>The Town of Westerly is accepting applications for the position of Accountant. This position is responsible for performing complex accounting duties and maintenance of accounting records.</p><p>This position is under the general supervision of the Director of Finance.</p><p><b>What You Should Bring</b></p><p>The ideal candidate will have at least three years of experience in accounting along with an Bachelor’s Degree in Business/Public Administration, Accounting or related field. Certified Public Accountant (CPA) is highly preferred.</p><p>You should be able to explain routine concepts to lay people and to resolve issues with a diverse group of individuals.</p><p><b>The Opportunity</b></p><p>The Accountant works in the Finance Department and is located at Westerly Town Hall. Current hours are typically 8:00 AM to 4:30 PM; however, flexibility is expected for this position, as this position’s workload changes based on operational demand. This position is responsible for performing complex accounting duties and maintenance of accounting records. Some of the responsibilities are as follows:</p><ul><li>Applies Generally Accepted Accounting Principles to a variety of problems, and considerable judgment in allocating charges and credits to proper accounts and funds.</li><li>Prepares and maintains general ledger details and accounting records of all funds.</li><li>Prepares and enters journal entries to general ledgers and maintains journal entries.</li><li>Reviews monthly balance sheets and revenues/expenditures statements and periodically preforms balance sheet account analysis.</li><li>Coordinates monthly closing and production/distribution of financial statements to guarantee timely reporting.</li><li>Prepares regular and special financial and statistical reports for management review and use.</li><li>Reviews cost and operating information to insure compliance with budget.</li><li>Complies cost data for development budget.</li><li>Prepares state reimbursement claims, supporting documentation, and all other governmental reports.</li><li>Responsible for accounting of all grants.</li><li>Prepares system update of daily cash receipts, annual budget, supplemental/transfers, ordinances, resolutions, and year-end appropriation transfer and/or supplemental appropriation.</li><li>Performs monthly bank reconciliation.</li><li>Reconciles all receivables monthly, including sewer assessment taxes, solid waste receipts, and water/sewer usage charges.</li><li>Maintains all required documentation for auditors and for adjusting entries upon completion.</li><li>Performs similar or related work as required, directed or as situation dictates.</li></ul><p><b>About the Department</b></p><p>The Finance department provides a quality, comprehensive, proactive financial management program for the Town of Westerly. The focus of the department is on excellence in customer service delivery with professional, courteous, and knowledgeable staff. The Finance Department''s primary responsibilities include: maintaining accounting and budget systems for the Town Government, receiving taxes and all other revenues, disbursing all expenditures / payments, issuing any authorized debts, and cash management functions.</p><p><b>About the Town</b></p><p>Westerly is a beachfront community on the southwestern shoreline of Rhode Island. The Town has approximately 23,000 residents. Recognized as the having the most beautiful beaches on the east coast, Westerly is the perfect place to enjoy a relaxing or action-packed vacation. Misquamicut State Beach is the largest beach in Rhode Island and offers a wide array of attractions, exciting nightlife and events. It is the ideal family destination, offering water slides, mini golf courses, free movies on the beach and fun filled hours in the waves of the Atlantic Ocean.</p><p>Charming downtown Westerly, with its wonderful Victorian architecture, examples of fine granite work, and beautifully landscaped Wilcox Park, earned the designation ‘one of the twelve most distinctive destinations in the country’ by the National Trust for Historic Preservation. Shops and eateries have outstanding views and there are several outdoor dining options. Downtown is a hip arts scene and has earned a reputation as Southern Rhode Island''s dining and nightlife destination. The eclectic shops feature furniture, trendy apparel and unique gifts from antiques to designer wedding gowns. Visit the Granite Theatre, for a show or enjoy ice skating at the outdoor rink.</p><p>For additional information about the Town of Westerly, please visit the Ocean Community Chamber of Commerce.</p><p><b>Selection Process</b></p><p>The selection process is anticipated to include two panel interviews. The candidate offered the position will be required to successfully pass a background investigation.</p><p>A complete job description is available on-line at www.westerlyri.gov or at the Human Resources Department.</p><p>Interested applicants must submit a resume with salary requirements to the e-mail address on the Town of Westerly''s HR website.</p><p>All resumes must be received by 4:30 pm on or before April 5, 2017. AA/EOE</p><p>Job Type: Full-time</p><p>Salary: $65,000.00 /year</p><p>Required education:</p><ul><li>Bachelor''s</li></ul><p>Required experience:</p><ul><li>Accounting: 3 years</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'242b6005-572e-410f-bae6-dba565905d6f', N'<p>Accountant: National Soap & Det Mfg looking for Accountant for Chambersburg, PA (world headquarters). Responsibilities include, but not limited to, accounting liaison with our different manufacturing locations. This role is responsible for all daily accounting functions. We are looking for a candidate looking to grow with the company. We offer a unique opportunity to get involved in all phases of the accounting and operations of the company. Applicant must have 4yr degree in Accounting and 1-3 years experience. Knowledge of Microsoft Dynamics-NAV preferred. Company offers competitive wages, benefits, and 401k.</p><p>Visit our website at www.afcocare.com</p><p>Job Type: Full-time</p>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'efb23390-79f5-46f8-b3db-9236becb312f', N'<p>Stellartech is in search of an Accountant to join our Finance Team.</p><p><b>Responsibilities: </b></p><ul><li>Project Administration:</li><li>Setup project folders based on customer purchase ordersreceived</li><li>Complete Contract Review Records</li><li>Setup Excel spreadsheets for project tracking</li><li>Send approved Sales Orders to customers</li><li>Invoicing and Billing:</li><li>Utilize Great Plains to manage invoice and billing for Manufacturing and Service</li><li>Reconcile with Materials Planning and Service on a monthly basis</li><li>Manage timesheet entries to ensure accurate tracking for project charges</li><li>Utilize Great Plains to manage invoice and billing for Research and Development</li><li>Track project expenditures and run reports in MAX to obtain materials charged to projects</li><li>Prepare preliminary invoices and distribute to project managers for review</li><li>Retrieve preliminary invoices from project managers; make adjustments and prepare final invoices</li><li>Prepare schedule to track invoice status; send final invoices to President for signature and send invoices to customers</li><li>Update standard cost rows as needed</li><li>Analyze inventory and cost of goods sold</li><li>Reconcile customer advance accounts to G/L</li><li>Reconcile all revenue to MAX shipment reports and Great Plains</li><li>Assist in A/R collection</li></ul><p><b>Skills and Qualifications: </b></p><ul><li>AA degree in Accounting or equivalent required; BA degree preferred</li><li>Minimum of 4-6 years’ relevant experience with contracts, AR, cost accounting, invoicing, billing, and month-end closing</li><li>Ability to analyze financial data and prepare financial reports</li><li>Proven computer proficiency with the Microsoft Office applications, especially Excel</li><li>Strong written and verbal communications skills</li><li>Strong attention to detail and ability to prioritize duties effectively</li><li>Strong interpersonal skills and the ability to work effectively in a fast-paced environment</li></ul><p><b>About Us: </b></p><p>Founded in 1988, Stellartech Research Corporation (SRC) is a world leader in the development of innovative devices for both large, established companies and early stage start-ups in the medical industry. The medical systems we develop and manufacture typically combine a complex electronic microprocessor-controlled device and a “smart” disposable. They employ cutting edge technology suchas highly sophisticated energy delivery modalities, cloud-based wireless communication and advanced imaging capability. Our commitment to a “Multiphysics” approach and the mastery of scientific principles has allowed us to achieve medical breakthroughs and pioneer many “firsts” in the industry. These include the first temperature controlled RF generator for cardiac ablation, the first monopolar capacitive RF tissue remodeling system for cosmetic use, and the first balloon-based system for esophageal ablation. With over 25 years of success, we’re continually developing new ideas to serve specialized markets in the medical industry.</p><p>SRC is headquartered in Milpitas, CA and employs a staff with broad and diverse experience in key areas of medical device product development and clinical applications. We’re looking for top-notch Software Engineers, Hardware Engineers, Software Quality Engineers, Assemblers, and Technicians. If you’re interested in being a part of our journey to help save lives with sophisticated medical equipment, we definitely want to hear from you.</p><p><b>Benefits: </b></p><p>We offer a competitive benefits package to our full-time employees. These benefits include:</p><ul><li>Medical, Dental, EAP, Life Insurance, AD&D, STD, and LTD</li><li>401(k) and a stock equity plan</li><li>15 days of paid time off and 10 paid holidays</li></ul><p><b>Stellartech Research Corporation</b> is an equal opportunity employer, dedicated to promoting a culturally diverse workforce.</p><p>Job Type: Full-time</p><p>Job Location:</p><ul><li>Milpitas, CA 95035</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'6bd483db-3773-46c8-abd7-d63dd718bf1d', N'<p>Four Season Travel/Vacation is an Inbound Tour Operator serving primarily the Asian market. We are currently operating a fleet of 22 brand new full size luxury coaches, 4 mini coaches, as well as 2 Mercedes Sprinter vans. We will be expanding into bus maintenance and services in the near future. We are seeking an Accountant to provide financial support and manage our daily accounting tasks. The successful candidate will be responsible for a variety of accounting duties which include, but are not limited to, those listed below:</p><p><b>Responsibilities</b> :</p><ul><li>Responsible for accounting activities relating to the maintenance of a complete and accurate general ledger and financial statement</li><li>Maintain an organized and efficient reconciliation process and resolves account discrepancies</li><li>Preparation and processing of daily bill entries and invoices</li><li>Assist with all of processes relating to A/P and bank transactions</li><li>Maintains financial security by following internal controls</li><li>Prepares payments by verifying documentation, and requesting disbursements</li><li>Other duties may be assigned</li></ul><p><b>Qualifications and Requirements</b></p><ul><li>Bachelor degree in accounting required</li><li>Minimum 3 years of accounting experience required</li><li>Ability to multi-task and attention to detail and accuracy</li><li>Strong accounting skill desired</li><li>Advanced computer skills in MS office and accounting software</li></ul><p><b>Desired Characteristics: </b></p><ul><li>Must be detailed and results-oriented</li><li>Bilingual in Mandarin and English - exceptional verbal and written communication is a plus.</li><li>Great problem-solving skills</li><li>Able to multi-task, prioritized and work on several projects at the same time</li><li>Able to follow-through tasks without supervision</li><li>Willing to respond to emergency calls and emails after hours or weekends</li></ul><p><b>Salary: </b> $2,500.00 to $3,100.00 /month</p><p>Job Type: Full-time</p><p>Required education:</p><ul><li>Bachelor''s</li></ul><p>Required experience:</p><ul><li>Accounting: 3 years</li></ul><p>Required language:</p><ul><li>Mandarin</li></ul>')
INSERT [dbo].[JobDetail] ([JobId], [JobDetailContent]) VALUES (N'44d0c526-387b-4360-bf14-14827914a7cd', N'<p>Systems Products and Solutions, Inc. is seeking a Staff Accountant with a focus in payroll to join our Corporate office in Huntsville, AL.</p><p><b>Description of Duties: </b> Responsible for performing professional accounting activities within a corporate organization supporting a variety government contracts. The Accountant position functions as a member of the Corporate team, that reports to the Accounting Manager and will have the following responsibilities:</p><ul><li>PAYROLL: Individual will serve as the primary point of contact for SPS payroll processing to include reviewing timesheets, processing and submitting payroll, submitting applicable taxes and 401k payments, and end of year responsibilities to include W2’s and 1095-Cs, Will work closely with ADP to ensure accuracy of all payroll transactions. ACCOUNTS PAYABLE: Process all company invoices pursuant to company policies and procedures using CostPoint 7.1.</li><li>EXPENSE REPORTS: Will be responsible for ensuring all expense reports are reviewed and processed timely according to company policies and procedures.</li><li>INVOICING: Will assist the Accounting Manager with monthly reporting, reconciliations and invoicing for government contracts.</li><li>ACCOUNTS RECEIVABLE: Process all company deposits pursuant to company policies and procedures using CostPoint 7.1. May be responsible for assisting with investigations on past due accounts. The Staff Accountant will be perform other accounting related duties as assigned. The Company reserves the right to change duties as requirements dictate.</li></ul><p><b>Education and Experience: </b> Individual will possess a Bachelor’s degree from an accredited college or university in Accounting, Finance or other business related major and a minimum of five (5) years of solid Staff Account experience with a minimum of three (3) years in a government contracting environment.</p><p><b>Required Skills: </b> Individual will possess strong Deltek Time and Expense, CostPoint 7, ADP or Payroll Processing, and advanced knowledge of Microsoft Office products.</p><p><b>Physical Requirements: </b> While performing the duties of the position, the individual is required to stand, bend, lift, walk and sit repeatedly and/or for extended periods of time. Individual must be able to operate computer keyboards and mouse and lift up to 40 pounds.</p><p><b>Background Investigation and Security Clearance: </b> Selected candidate will be subject to a criminal and financial background investigation. Position may require the candidate to obtain and maintain a DoD security clearance.</p><p>Job Type: Full-time</p><p>Job Location:</p><ul><li>Huntsville, AL</li></ul><p>Required education:</p><ul><li>Bachelor''s</li></ul><p>Required experience:</p><ul><li>Accounting: 5 years</li><li>Government Accounting: 3 years</li><li>Payroll: 3 years</li></ul>')
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'abbd20e2-7a3e-4c97-8952-e791a790be5b', N'Finance Analyst', N'Rolls-Royce', N'Indianapolis, IN', N'OR Masters Degree in Accounting, Finance or Business. Must have a Bachelors Degree in Accounting, Finance or Business and at least 2+ years of experience....', CAST(N'2017-03-25T11:53:56.680' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://rolls-royce.taleo.net/careersection/2/jobdetail.ftl?lang=en_GB&job=809865&src=JB-10260', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'000a38eb-90b4-4d35-a86b-7a8c59ca3e98', N'Sr. Specialist, IT - Projects', N'Anheuser-Busch', N'St. Louis, MO', N'Bachelor’s degree in Accounting, Finance, Business Management or related field. Collaborate with Integrations Finance Manager to identify, document, and...', CAST(N'2017-03-25T11:53:59.450' AS DateTime), N'$95,270 - $119,088 a year', N'Accounting/Finance', N'Accountant', N'https://abinbev.taleo.net/careersection/27/jobdetail.ftl?job=17004082&tz=GMT-05:00&src=%20JB-11021', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'39a243ea-2021-40f3-bfcc-80b67b046e86', N'Financial/Cost Control Ananlyst 1', N'Northrop Grumman', N'Huntsville, AL 35805', N'Bachelor''s degree in Business, Accounting, Finance, Economics or related area. Northrop Grumman is seeking a Program Cost Schedule Analyst 1 to join our team of...', CAST(N'2017-03-25T11:54:01.057' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://ngc.taleo.net/careersection/ngc_pro/jobdetail.ftl?job=1187946&src=JB-10200', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'4fd5730a-afca-4608-98f4-57e68ee4fee5', N'Financial Analyst', N'Stone Brewing Co.', N'Escondido, CA 92029', N'Bachelor’s degree in Accounting, Finance or equivalent, and at least 2 years related experience. Must have knowledge and experience using accounting software,...', CAST(N'2017-03-25T11:54:02.707' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'http://stonebrewing.atsondemand.com/index.cfm?fuseaction=512347.viewjobdetail&CID=512347&JID=567643&source=Indeed&utm_source=Indeed&utm_medium=IndeedFreePost', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'36ea4640-8b43-482c-a579-b8141ec8c851', N'Assistant Financial Manager', N'Allegheny County', N'Allegheny County, PA', N'Bachelor’s degree in Accounting, Finance,. Finance and accounting processes, procedures and techniques used in budget preparation and control....', CAST(N'2017-03-25T11:54:04.180' AS DateTime), N'$3,750 - $4,583 a month', N'Accounting/Finance', N'Accountant', N'http://alleghenycounty.us/Careers/Public-Works/Assistant-Financial-Manager.aspx', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'94876ba2-3fb5-4465-bd5f-46b5f389e54a', N'Budget Analyst', N'Harris County', N'Houston, TX', N'Bachelor''s degree in Business Administration, Accounting, Finance or related field; Knowledge of governmental accounting, statistics and management analysis....', CAST(N'2017-03-25T11:54:12.243' AS DateTime), N'$31.25 - $33.65 an hour', N'Accounting/Finance', N'Accountant', N'http://agency.governmentjobs.com/harriscountytx/default.cfm?action=viewJob&jobID=1694284', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'95d087df-4e62-4f33-836e-6afbc0f91a9d', N'Manager, Financial Planning', N'Lord', N'Cary, NC', N'BS/BA Degree in Accounting, Finance or equivalent field. MBA or Masters in Accounting or Finance or equivalent field....', CAST(N'2017-03-25T11:54:13.620' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://lord.wd1.myworkdayjobs.com/en-US/Lord_careers/job/USA-Cary-NC-World-Headquarters/Manager--Financial-Planning_REQ-17-83-1', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'0afe22c5-6b6a-450d-bc14-6f26591ef812', N'Accountant I, CFS', N'Make A Wish Foundation of America', N'Phoenix, AZ 85012 (Alhambra area)', N'Bachelor’s degree in Accounting, Finance or related field required. Knowledge of financial accounting including generally accepted accounting principles (GAAP)...', CAST(N'2017-03-25T11:54:16.117' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://jobs.wish.org/epostings/index.cfm?fuseaction=app.jobinfo&jobid=426&source=ONLINE&JobOwner=992435&company_id=16493&version=1&byBusinessUnit=&bycountry=&bystate=&byRegion=&bylocation=&keywords=&byCat=&proximityCountry=&postalCode=&radiusDistance=&isKilometers=&tosearch=no&city=', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'b61026b0-8d03-44d0-9ed8-d01407a60324', N'Associate Accountant', N'UnitedHealth Group', N'Minnetonka, MN 55345', N'Bachelor’s Degree (or higher) in Accounting, Finance or HS Diploma/GED with 2+ years professional accounting experience....', CAST(N'2017-03-25T11:54:17.760' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://click.appcast.io/track/9hbcb6?cs=4j&utm_source=indeed.com&utm_medium=job_posting&utm_campaign=branding&utm_term=&utm_content=na_na_enterprise_na&Taleo_ID=JB-19908', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'efcbd644-42dd-44a7-ae27-09c718daef42', N'General Accountant I', N'Raytheon', N'Greenville, TX', N'Job Description Raytheon Finance Shared Services in Greenville, Texas is looking for an entry level General Accountant to support and improve processes within...', CAST(N'2017-03-25T11:54:19.333' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://jobs.raytheon.com/job/-/-/4679/4295003?codes=3640', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'81635e2f-365d-459c-82c4-5a8c5c08ea76', N'Senior Accountant', N'Summit Medical Center', N'Hermitage, TN 37076', N'Department business hours are Monday. The Senior Accountant is responsible. The Senior Accountant must also work to....', CAST(N'2017-03-25T11:54:29.193' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://hca.taleo.net/careersection/0hca/jobdetail.ftl?job=2151767&src=JB-11444', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'1edbc31d-7019-4808-bb22-8b4b2bcf4f26', N'ACCOUNTANT 1-2', N'Louisiana State Government', N'Natchitoches, LA', N'A certified public accountant (CPA) certificate will substitute for the baccalaureate degree with twenty-four semester hours in accounting....', CAST(N'2017-03-25T11:54:30.773' AS DateTime), N'$2,155 - $4,536 a month', N'Accounting/Finance', N'Accountant', N'https://www.governmentjobs.com/careers/louisiana/jobs/1695946/accountant-1-2', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'e7dbfc16-3d2a-4594-87c7-16bfec3240b4', N'Accounting Financial Analyst II', N'Frost', N'San Antonio, TX', N'Certified Public Accountant (CPA). Analysis, including budgeting, forecasting, and actual performance of given business segments....', CAST(N'2017-03-25T11:54:32.440' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://frostbank.taleo.net/careersection/2/jobdetail.ftl?job=209220', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'b3f70c2a-c1a0-4234-a348-b0990dac91e8', N'ACCOUNTANT', N'State of Tennessee', N'Davidson County, TN', N'Graduation from an accredited college or university with a bachelor''s degree including thirty-six quarter hours in accounting and experience equivalent to three...', CAST(N'2017-03-25T11:54:34.087' AS DateTime), N'$3,366 a month', N'Accounting/Finance', N'Accountant', N'http://agency.governmentjobs.com/tennessee/default.cfm?action=viewJob&jobID=1692513', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'92c4a9b0-1072-49cb-9390-d67819a720d6', N'Senior Accountant', N'10x Genomics', N'Pleasanton, CA', N'Monthly, quarterly and annual close process including account reconciliations and account review. The Senior Accountant will be responsible for major areas of...', CAST(N'2017-03-25T11:54:35.377' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://boards.greenhouse.io/10xgenomics/jobs/636255?gh_jid=636255&gh_src=pl1fst1', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'ac839033-5415-4650-aa67-4693fab54e17', N'Accountant', N'DEPT OF DESIGN &amp; CONSTRUCTION', N'Queens, NY', N'A valid New York State Certified Public Accountant license. New York City residency is generally required within 90 days of appointment....', CAST(N'2017-03-25T11:54:37.270' AS DateTime), N'$46,747 - $63,519 a year', N'Accounting/Finance', N'Accountant', N'https://a127-jobs.nyc.gov/psc/nycjobs/EMPLOYEE/HRMS/c/HRS_HRAM.HRS_APP_SCHJOB.GBL?Page=HRS_APP_JBPST&Action=U&FOCUS=Applicant&SiteId=1&JobOpeningId=279007&PostingSeq=1', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'36913dac-f0b4-448c-a4e8-d6e62dbe5d83', N'Accountant', N'NYC HOUSING AUTHORITY', N'Manhattan, NY', N'A valid New York State Certified Public Accountant license. Identify efficiencies in the monthly closing process through an in-depth review of manual journal...', CAST(N'2017-03-25T11:54:39.087' AS DateTime), N'$46,747 - $63,519 a year', N'Accounting/Finance', N'Accountant', N'https://a127-jobs.nyc.gov/psc/nycjobs/EMPLOYEE/HRMS/c/HRS_HRAM.HRS_APP_SCHJOB.GBL?Page=HRS_APP_JBPST&Action=U&FOCUS=Applicant&SiteId=1&JobOpeningId=285389&PostingSeq=1', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'f0ffa345-d16a-44e4-a25d-2a683b546689', N'Tax Accountant', N'Shelter Insurance', N'Columbia, MO', N'Performs General Ledger account reconciliations. Processes tax levies for agents, corresponding with the IRS as needed. A company built to serve you....', CAST(N'2017-03-25T11:59:40.500' AS DateTime), N'$39,372 a year', N'Accounting/Finance', N'Accountant', N'https://shelterinsurance.wd5.myworkdayjobs.com/en-US/careers/job/Columbia-MO---Home-Office/Tax-Accountant_R0000248', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'428bb71d-fdc9-4951-b845-fcac36ee2330', N'Staff and Senior Accountant', N'Pillar LLC', N'Cincinnati, OH', N'Responsible for preparation of detail account analysis, journal entries, G/L account reconciliations, account roll- forwards, budget vs. actual analysis, system...', CAST(N'2017-03-25T11:54:40.293' AS DateTime), N'$55,000 - $75,000 a year', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/Pillar-LLC/jobs/Staff-Senior-Accountant-632b4f38ac5ba4bf?fccid=4a02dc8bc7f59ff2', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'9b3c5979-a9d3-404a-b981-56c0188b6f7c', N'Financial Accountant', N'Whatcom County, WA', N'Bellingham, WA', N'8:00 am - 4:30 pm Monday - Friday. Hours of work:. The Financial Accountant position works as an integral part of the Sheriff&quot;s Office Administration team with...', CAST(N'2017-03-25T11:58:54.683' AS DateTime), N'$18.78 - $28.00 an hour', N'Accounting/Finance', N'Accountant', N'https://wa-whatcomcounty.civicplushrms.com/CareerPortal/JobDetail.aspx?enc=QPQDKqwXNuJybHyCBjvzpwIssFMY/hmhm20aQUbaZ5vGWlD4Gq3MOf6ur/CwMraKFNEP6oQ6pQM8OGf+vLP3+dGDd9v51dM19TSTv/V0vwc=', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'7a6d2e4e-9503-4f47-88f9-4b559e057a42', N'Senior Accountant (WCU Foundation)', N'West Chester University Foundation', N'West Chester, PA 19382', N'Account and bank reconciliations and resolution of discrepancies. The *Senior Accountant*. Month-end close activities and journal entries....', CAST(N'2017-03-25T11:58:57.283' AS DateTime), N'$55,000 - $60,000 a year', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/West-Chester-University-Foundation/jobs/Senior-Accountant-694371c055d419f0?fccid=ab77689ad59fe572', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'295cefd9-eea6-4984-a57c-ffbb3405d157', N'Accountant - Level 2', N'Avadim Technologies Inc', N'Asheville, NC 28803', N'Coordinate and maintain monthly recurring and ad-hoc journal entries supported by adequate documentation....', CAST(N'2017-03-25T11:59:06.550' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/AVADIM-TECHNOLOGIES-INC/jobs/Accountant-c75a0fb7d1df2199?fccid=5bcac1e49905297f', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'c57ed249-d20c-40e1-84cb-89799191613a', N'Accountant', N'zoom', N'San Jose, CA 95113 (Downtown area)', N'Perform duties in Accounts Receivables/Cash, Accounts Payable, deposits, bill payments, bank wires, statement reconciliations,....', CAST(N'2017-03-25T11:59:07.853' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://www.comeet.co/jobs/zoom/41.006/accountant/BE.307?coref=1.11.p83_20C', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'a129cfde-e630-42a9-8fa2-0f9ea903cace', N'Staff Accountant', N'Sovereign Brands, LLC', N'New York, NY 10012 (Little Italy area)', N'New York, NY. Our Soho, NYC-based company is seeking a talented, self-motivated candidate for a full-time, in-house staff accountant position that will work in...', CAST(N'2017-03-25T11:59:09.917' AS DateTime), N'$45,000 - $60,000 a year', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/Sovereign-Brands,-LLC/jobs/Staff-Accountant-24f7a3153a570dfe?fccid=605cda2e495a8d0d', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'7c6d8f37-6352-427b-98e0-d9c2a0053762', N'Accountant II', N'County of Riverside', N'Riverside, CA', N'The Accountant II will be responsible for preparing reconciliations and analyzing accounting data related to the fiscal recordkeeping functions of the Deposit...', CAST(N'2017-03-25T11:59:11.443' AS DateTime), N'$45,299 - $71,455 a year', N'Accounting/Finance', N'Accountant', N'http://post.talemetry.com/respond.cfm?posting=1000164772&bid=326', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'a5d5f24e-e583-4473-b575-961749d65cc1', N'ACCOUNTANT', N'The State of Rhode Island', N'Cranston, RI 02920', N'The Accountant would assist in overseeing reconciliations related to several accounting areas, including imprest cash, petty cash and clearing accounts....', CAST(N'2017-03-25T11:59:12.730' AS DateTime), N'$40,895 - $45,747 a year', N'Accounting/Finance', N'Accountant', N'http://agency.governmentjobs.com/rhodeisland/default.cfm?action=viewJob&jobID=1693845', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'38ff021c-2855-4134-a0de-2c9c51b25c8c', N'Accountant III ', N'San Francisco Department of Public Health', N'San Francisco, CA', N'1654 Accountant III. City and County of San Francisco Employees with four (4) years (equivalent to 8,000 hours) of professional accounting experience including...', CAST(N'2017-03-25T11:59:14.253' AS DateTime), N'$85,514 - $103,948 a year', N'Accounting/Finance', N'Accountant', N'https://www.jobaps.com/SF/SUP/BulPreview.asp?R1=TPV&R2=1654&R3=075280', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'49f468c1-b8f4-42a7-b5eb-f7d81245a41b', N'Accountant III', N'University of Florida', N'Gainesville, FL 32611', N'Specific duties will include review of Notices of Awards, process journal entries when needed to correct grant expenditures, assist Principal Investigators with...', CAST(N'2017-03-25T11:59:16.253' AS DateTime), N'$50,000 - $58,500 a year', N'Accounting/Finance', N'Accountant', N'http://explore.jobs.ufl.edu/cw/en-us/job/501780/accountant-iii?utm_source=Indeed&utm_medium=organic&utm_campaign=Indeed', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'39d43373-e4ed-4534-a599-8eacd6bcc935', N'Accountant III', N'City of Chesapeake', N'Chesapeake, VA', N'Certified Public Accountant (CPA) certification desired. Strong team player, extensive experience with year end closing, capital budgeting, revenue bonds,...', CAST(N'2017-03-25T11:59:17.923' AS DateTime), N'$53,153 a year', N'Accounting/Finance', N'Accountant', N'https://www.jobs.cityofchesapeake.net/applicants/jsp/shared/DefaultContent.jsp', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'30321149-c25c-473b-9cf7-34a847b9d66e', N'Accountant II', N'County of Monterey, CA', N'Monterey County, CA', N'The Department of Social Services, is currently recruiting to fill an Accountant II position. This position is non-exempt from the Fair Labor Standards Act ...', CAST(N'2017-03-25T11:59:19.490' AS DateTime), N'$4,590 - $6,268 a month', N'Accounting/Finance', N'Accountant', N'https://www.governmentjobs.com/careers/montereycounty/jobs/1698735/accountant-ii', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'faa23b9e-17e1-4976-aad4-42d25d4ccfda', N'General Ledger Accountant', N'MFA - Talent Management', N'Westborough, MA', N'Prepare and post all related journal entries and prepare trial balance. Perform account reconciliations. MFA Talent Management has an excellent opportunity for...', CAST(N'2017-03-25T11:59:20.987' AS DateTime), N'$40,000 - $45,000 a year', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/MFA---Talent-Managemetn/jobs/General-Ledger-Accountant-a7e9cfb45c04961b?fccid=aa3092bc38bff233', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'af9a8366-0c02-458a-be3e-47cc038e3414', N'Accountant', N'Town of Westerly', N'Westerly, RI 02891', N'Prepares and enters journal entries to general ledgers and maintains journal entries. Hours Per Week 37.5*....', CAST(N'2017-03-25T11:59:28.840' AS DateTime), N'$65,000 a year', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/Town-of-Westerly/jobs/Accountant-1a7f70c507a8739e?fccid=0a22aa41b939c5bd', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'd8af0881-ce61-42bd-87d7-322dfc638c33', N'Accountant', N'Bosch Group', N'Farmington Hills, MI', N'Calculate / prepare journal entries. General Ledger Analysis / Account Reconciliations. We are seeking a full time associate to assist with various accounting...', CAST(N'2017-03-25T11:59:30.180' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://www.smartrecruiters.com/BoschGroup/111248924-accountant', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'fa13d916-2cb6-45d4-a3c1-781ebefa28b9', N'Jr Staff Accountant/Bookeeper', N'Trivad, Inc.', N'Burlingame, CA', N'This position is full-time, Monday through Friday, 8:00 AM - 5:00 PM. Prepare bank deposits. Process &amp; apply customer check, credit card payments &amp; credits....', CAST(N'2017-03-25T11:59:32.090' AS DateTime), N'$55,000 a year', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/Trivad,-inc/jobs/Junior-Staff-Accountant-Bookeeper-16b8d681439ba132?fccid=e0a0ea06a7bd9b64', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'a23093b7-1ace-4f88-9c0b-d6ed9856da4f', N'Accountant', N'GAN Corp', N'Huntsville, AL', N'Ensure that periodic bank reconciliations are completed. GaN Corporation is now accepting resumes for an Accountant....', CAST(N'2017-03-25T11:59:33.400' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://careers-geeksandnerds.icims.com/jobs/1086/accountant/job?in_iframe=1', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'6e4d5b1e-6341-481e-9956-d2d6969a3862', N'Senior Accountant', N'Global Advisory Solutions, LLC', N'Miami Lakes, FL', N'Prepare monthly bank reconciliations. Prepare and maintain monthly recurring journal entries. Prepare balance sheet and inter-company account reconciliations....', CAST(N'2017-03-25T11:59:35.033' AS DateTime), N'$80,000 a year', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/Global-Advisory-Solutions,-LLC/jobs/Senior-Accountant-19771ab7647cbed1?fccid=6932fc7ca82f47c3', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'1039814a-26cc-476b-9dd2-eb739ad7cd75', N'Accountant I', N'Horace Mann Service Corp', N'Springfield, IL 62715', N'Description Under general direction, the incumbent will assist in preparation and analytical review of various presentations to senior management, as well as', CAST(N'2017-03-25T11:59:36.317' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://recruiting.adp.com/srccar/public/RTI.home?c=1138841&d=ExternalCareerSite&rb=INDEED&r=5000193562206', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'70258373-5f4d-44ab-aa9d-85d8b407795d', N'Accountant I/II/III', N'Auburn University', N'Auburn, AL', N'Prepares and reviews expense vouchers, invoices, purchase requisitions or other transactions for one or more departments, in compliance with approved budgets...', CAST(N'2017-03-25T11:59:37.763' AS DateTime), N'$28,000 - $58,400 a year', N'Accounting/Finance', N'Accountant', N'https://www.auemployment.com/applicants/Central?quickFind=191040', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'eafd5561-0668-4424-8dcc-d488e19b565c', N'Accountant', N'Fiserv, Inc.', N'Stafford, TX', N'Prepare and upload journal entries in both localized and SAP general ledger accounting systems and manage the process to ensure completeness, accuracy,...', CAST(N'2017-03-25T11:59:39.157' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://www.careers.fiserv.com/job/-/-/1758/4281846', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'efb23390-79f5-46f8-b3db-9236becb312f', N'Accountant', N'Stellartech Research Corporation', N'Milpitas, CA 95035', N'Stellartech is in search of an Accountant to join our Finance Team. Founded in 1988, Stellartech Research Corporation (SRC) is a world leader in the development...', CAST(N'2017-03-25T11:59:42.993' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/Stellartech-Research-Corporation/jobs/Accountant-5ca0c1e3754086e4?fccid=c36b9b08b74a9645', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'6bd483db-3773-46c8-abd7-d63dd718bf1d', N'Accountant', N'Four Season Travel', N'Irwindale, CA', N'Willing to respond to emergency calls and emails after hours or weekends. Assist with all of processes relating to A/P and bank transactions....', CAST(N'2017-03-25T11:59:52.813' AS DateTime), N'$2,500 - $3,100 a month', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/Four-Season-Travel/jobs/Accountant-32a0be88efa4d1ba?fccid=4d63cb7834b99bd9', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'637f1b4f-d2f8-4fd2-88b0-f5f4edd2de60', N'Accountant I', N'CHRISTUS Trinity Mother Frances Health System--Tyl...', N'Tyler, TX', N'Responsible for general ledger postings, assisting with financial statement preparations, maintaining general ledger accounts in accordance with GAAP guidelines...', CAST(N'2017-03-25T11:59:54.603' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://www.healthcaresource.com/tmf/index.cfm?fuseaction=search.jobDetails&template=dsp_job_details.cfm&cJobId=10103306', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'd1e5667f-b116-4bfb-8d11-83087d638604', N'Staff Accountant', N'Appian Corporation', N'Reston, VA', N'Accurately and promptly prepare monthly customer invoices related to Time &amp; Materials consulting projects (and work with project managers to ensure accurate...', CAST(N'2017-03-25T11:59:56.197' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://boards.greenhouse.io/appian/jobs/641469?gh_src=ghxb031', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'242b6005-572e-410f-bae6-dba565905d6f', N'STAFF ACCOUNTANT NEEDED', N'AFCO', N'Chambersburg, PA 17201', N'National Soap &amp; Det Mfg looking for Accountant for Chambersburg, PA (world headquarters). Responsibilities include, but not limited to, accounting liaison with...', CAST(N'2017-03-25T11:59:58.090' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/AFCO/jobs/Staff-Accountant-7fc175527c04c2a2?fccid=b9e31007e611f457', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'44d0c526-387b-4360-bf14-14827914a7cd', N'Staff/Payroll Accountant', N'Systems Products and Solutions, Inc.', N'Huntsville, AL 35805', N'Will assist the Accounting Manager with monthly reporting, reconciliations and invoicing for government contracts....', CAST(N'2017-03-25T11:59:59.793' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'http://www.indeed.com/company/MSSI/jobs/Staff-Payroll-Accountant-bc0a55f950412953?fccid=bca18920a5b6c914', 1)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'393bf64c-52c5-4c7e-b2b2-9310963e9d16', N'Staff Accountant', N'JWP Strategic, Inc.', N'Quincy, IL', N'The Staff Accountant will assist with the preparation of the month-end close process, journal entries, expense accruals, balance sheet reconciliations,...', CAST(N'2017-03-25T12:00:01.190' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'http://jobs.ourcareerpages.com/job/215666~Primary~923413?source=Indeed', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'6fcc6f22-aa14-4f15-b1f5-6d5a3923befe', N'Staff Accountant II', N'Medsynergies', N'San Francisco, CA', N'Prepare and post standard journal entries in preparation for month-end close outs. Fund petty cash requests and reconcile petty cash bank accounts....', CAST(N'2017-03-25T12:00:02.677' AS DateTime), N'$45,000 - $50,000 a year', N'Accounting/Finance', N'Accountant', N'https://medsynergies.catsone.com/careers/index.php?m=portal&a=details&jobOrderID=9115119&portalID=64410&ref=indeed', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'ead4d40a-2698-4260-9556-189943a6ecad', N'Factory Costing Analyst', N'Nestle USA', N'Freehold, NJ 07728', N'We are currently seeking a Cost Accountant for our Beverage Factory in Freehold, NJ! The Nestlé Beverage Division stands for delighting consumers, whenever and...', CAST(N'2017-03-25T12:00:04.910' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://www.nestleusacareers.com/job/-/-/1823/3307370?src=JB-10172', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'1e003ec2-7068-4b30-bf51-30c1a5f3dc56', N'Accounting &amp; Finance Accountant', N'Santander Bank', N'Wyomissing, PA', N'Responsibilities • Assist in the monthly closing and reporting activities, as well as the quarterly and annual testing of the financial close’s controls •...', CAST(N'2017-03-25T12:00:06.770' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'https://jobs.santanderbank.com/job/-/-/5842/3495093?src=JB-10122', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'6362ea32-8376-4556-8859-e01acdc21326', N'Accountant', N'Hamilton Telecommunications', N'Aurora, NE 68818', N'Prepares monthly adjusting, recurring, correcting and closing journal entries; Prepares general ledger account reconciliations;...', CAST(N'2017-03-25T12:00:08.653' AS DateTime), N'', N'Accounting/Finance', N'Accountant', N'http://careers.workforhamilton.com/x/detail/a2dtzoxjff9n/aaac', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'bf38dc89-484e-41df-8d84-fc52cfc807f4', N'Finance Analyst', N'Rolls-Royce', N'Indianapolis, IN', N'OR Masters Degree in Accounting, Finance or Business. Must have a Bachelors Degree in Accounting, Finance or Business and at least 2+ years of experience....', CAST(N'2017-03-25T12:00:18.113' AS DateTime), N'', N'Accounting/Finance', N'Director Of Finance', N'https://rolls-royce.taleo.net/careersection/2/jobdetail.ftl?lang=en_GB&job=809865&src=JB-10260', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'b2ba04b4-473a-4865-be32-b9c347869016', N'Sr. Specialist, IT - Projects', N'Anheuser-Busch', N'St. Louis, MO', N'Bachelor’s degree in Accounting, Finance, Business Management or related field. Collaborate with Integrations Finance Manager to identify, document, and...', CAST(N'2017-03-25T12:00:20.637' AS DateTime), N'$95,270 - $119,088 a year', N'Accounting/Finance', N'Director Of Finance', N'https://abinbev.taleo.net/careersection/27/jobdetail.ftl?job=17004082&tz=GMT-05:00&src=%20JB-11021', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'0056185b-4921-4479-85ea-b333155f6904', N'Financial/Cost Control Ananlyst 1', N'Northrop Grumman', N'Huntsville, AL 35805', N'Bachelor''s degree in Business, Accounting, Finance, Economics or related area. Northrop Grumman is seeking a Program Cost Schedule Analyst 1 to join our team of...', CAST(N'2017-03-25T12:00:22.217' AS DateTime), N'', N'Accounting/Finance', N'Director Of Finance', N'https://ngc.taleo.net/careersection/ngc_pro/jobdetail.ftl?job=1187946&src=JB-10200', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'c2ead286-9e67-43aa-98f5-b2b64aebb117', N'Financial Analyst', N'Stone Brewing Co.', N'Escondido, CA 92029', N'Bachelor’s degree in Accounting, Finance or equivalent, and at least 2 years related experience. Must have knowledge and experience using accounting software,...', CAST(N'2017-03-25T12:00:23.853' AS DateTime), N'', N'Accounting/Finance', N'Director Of Finance', N'http://stonebrewing.atsondemand.com/index.cfm?fuseaction=512347.viewjobdetail&CID=512347&JID=567643&source=Indeed&utm_source=Indeed&utm_medium=IndeedFreePost', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'af17d702-db17-43e0-89d6-c79ce3995254', N'Budget Analyst', N'Harris County', N'Houston, TX', N'Bachelor''s degree in Business Administration, Accounting, Finance or related field; Knowledge of governmental accounting, statistics and management analysis....', CAST(N'2017-03-25T12:00:25.260' AS DateTime), N'$31.25 - $33.65 an hour', N'Accounting/Finance', N'Director Of Finance', N'http://agency.governmentjobs.com/harriscountytx/default.cfm?action=viewJob&jobID=1694284', 0)
INSERT [dbo].[JobPost] ([Id], [JobName], [CompanyName], [JobLocation], [JobDescription], [JobPostDate], [Salary], [Category], [Title], [Url], [IsIndeed]) VALUES (N'95e5e541-4a0d-419e-8a7a-f888a225d1ae', N'Assistant Financial Manager', N'Allegheny County', N'Allegheny County, PA', N'Bachelor’s degree in Accounting, Finance,. Finance and accounting processes, procedures and techniques used in budget preparation and control....', CAST(N'2017-03-25T12:00:26.560' AS DateTime), N'$3,750 - $4,583 a month', N'Accounting/Finance', N'Director Of Finance', N'http://alleghenycounty.us/Careers/Public-Works/Assistant-Financial-Manager.aspx', 0)
ALTER TABLE [dbo].[JobDetail] ADD  DEFAULT (newid()) FOR [JobId]
GO
ALTER TABLE [dbo].[JobPost] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WebData] ADD  DEFAULT (newid()) FOR [linkUID]
GO
USE [master]
GO
ALTER DATABASE [Siena_Dev] SET  READ_WRITE 
GO
