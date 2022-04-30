SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [Data].[LoadMarketingCategories] @UserAuthorizationKey AS INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @StartTime DATETIME2 = SYSDATETIME();
EXEC('
CREATE VIEW [Reference].[uvw_MarketingCategories]
AS
WITH C1
AS (
   SELECT DISTINCT
          MK.MakeID,
          MD.ModelID,
          MK.MakeName,
          MD.ModelName,
          CONCAT(''Family'', '''') AS MarketingType,
          MK.MakeCountry
   FROM Data.Model AS MD
       INNER JOIN Data.Make AS MK
           ON MD.MakeID = MK.MakeID
   WHERE MK.MakeName = ''Citroen''
         OR MK.MakeName = ''Delahaye''),
     C2
AS (SELECT DISTINCT
           MK.MakeID,
           MD.ModelID,
           MK.MakeName,
           MD.ModelName,
           CONCAT(''Sports,'', ''Family'') AS MarketingType,
           MK.MakeCountry
    FROM Data.Model AS MD
        INNER JOIN Data.Make AS MK
            ON MD.MakeID = MK.MakeID
    WHERE MK.MakeName = ''Delorean''
          OR MK.MakeName = ''Jaguar''),
     C3
AS (SELECT DISTINCT
           MK.MakeID,
           MD.ModelID,
           MK.MakeName,
           MD.ModelName,
           CONCAT(''Sports'', '''') AS MarketingType,
           MK.MakeCountry
    FROM Data.Model AS MD
        INNER JOIN Data.Make AS MK
            ON MD.MakeID = MK.MakeID
    WHERE MK.MakeName = ''Ferrari''
          OR MK.MakeName = ''Lamborghini''
          OR MK.MakeName = ''Alfa Romeo''
          OR MK.MakeName = ''Alfa Romeo''
          OR MK.MakeName = ''Bugatti''
          OR MK.MakeName = ''Lagonda''
          OR MK.MakeName = ''McLaren''
          OR MK.MakeName = ''Morgan''
          OR MK.MakeName = ''Noble''
          OR MK.MakeName = ''Triumph''
          OR MK.MakeName = ''Trabant''
          OR MK.MakeName = ''Peugeot''
          OR MK.MakeName = ''Reliant''
          OR MK.MakeName = ''Riley''
          OR MK.MakeName = ''Cadillac''),
     C4
AS (SELECT DISTINCT
           MK.MakeID,
           MD.ModelID,
           MK.MakeName,
           MD.ModelName,
           CONCAT(''Sports,'', ''Tourer'') AS MarketingType,
           MK.MakeCountry
    FROM Data.Model AS MD
        INNER JOIN Data.Make AS MK
            ON MD.MakeID = MK.MakeID
    WHERE MK.MakeName = ''Porsche''
          OR MK.MakeName = ''Aston Martin''
          OR MK.MakeName = ''Mercedes''
          OR MK.MakeName = ''BMW''),
     C5
AS (SELECT DISTINCT
           MK.MakeID,
           MD.ModelID,
           MK.MakeName,
           MD.ModelName,
           CONCAT(''Chauffer,'', ''Prestige'') AS MarketingType,
           MK.MakeCountry
    FROM Data.Model AS MD
        INNER JOIN Data.Make AS MK
            ON MD.MakeID = MK.MakeID
    WHERE MK.MakeName = ''Maybach''
          OR MK.MakeName = ''Rolls Royce''
          OR MK.MakeName = ''Mercedes''
          OR MK.MakeName = ''BMW''),
     C6
AS (SELECT DISTINCT
           MK.MakeID,
           MD.ModelID,
           MK.MakeName,
           MD.ModelName,
           CONCAT(''Tourer,'', ''Chauffer,'', ''Prestige'') AS MarketingType,
           MK.MakeCountry
    FROM Data.Model AS MD
        INNER JOIN Data.Make AS MK
            ON MD.MakeID = MK.MakeID
    WHERE MK.MakeName = ''Bentley'')
SELECT *
FROM C1
UNION ALL
SELECT *
FROM C2
UNION ALL
SELECT *
FROM C3
UNION ALL
SELECT *
FROM C4
UNION ALL
SELECT *
FROM C5
UNION ALL
SELECT *
FROM C6;

')


    DECLARE @RowCount INT =
            (
                SELECT COUNT(*)FROM Reference.uvw_MarketingCategories
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Reference.MarketingCategories View',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END
GO
