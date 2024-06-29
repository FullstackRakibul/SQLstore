
DECLARE @ToEmpId INT=dbo.RempId('057323')
DECLARE @NewToEmpId INT=dbo.RempId('008540')
DECLARE @FromDate DATE='2024-06-15'

SELECT * FROM ApprovalProcess_LeaveRegister WHERE LRId IN (SELECT LRId FROM Attendance_LeaveRegister WHERE SubmissionDate>@FromDate) AND ActionStatus=0 AND ToEmpId=@ToEmpId
UPDATE ApprovalProcess_LeaveRegister SET ToEmpId=@NewToEmpId WHERE LRId IN (SELECT LRId FROM Attendance_LeaveRegister WHERE SubmissionDate>@FromDate) AND ActionStatus=0 AND ToEmpId=@ToEmpId

SELECT * FROM ApprovalProcess_EmployeeTour WHERE SDId IN (SELECT SDId FROM Attendance_EmployeeTour WHERE SubmissionDate>@FromDate) AND ActionStatus=0 AND ToEmpId=@ToEmpId
UPDATE ApprovalProcess_EmployeeTour SET ToEmpId=@NewToEmpId WHERE SDId IN (SELECT SDId FROM Attendance_EmployeeTour WHERE SubmissionDate>@FromDate) AND ActionStatus=0 AND ToEmpId=@ToEmpId

SELECT * FROM ApprovalProcess_OfficialInOut WHERE IOId IN (SELECT IOId FROM Attendance_OfficialInOut WHERE SubmissionDate>@FromDate) AND ActionStatus=0 AND ToEmpId=@ToEmpId
UPDATE ApprovalProcess_OfficialInOut SET ToEmpId=@NewToEmpId WHERE IOId IN (SELECT IOId FROM Attendance_OfficialInOut WHERE SubmissionDate>@FromDate) AND ActionStatus=0 AND ToEmpId=@ToEmpId



