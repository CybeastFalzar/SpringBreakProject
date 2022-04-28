SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [Data].[GetEmployee]
(
    @EmployeeId AS INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT o.StaffID,
           o.StaffName,
           o.ManagerID,
           o.Department
    FROM Data.Employee AS o
    WHERE o.StaffID = @EmployeeId
);
GO
