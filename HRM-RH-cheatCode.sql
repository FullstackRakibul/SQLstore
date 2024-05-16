

------------ Punch Transfer ---------------------

select * from Attendance_DailyPunchRecord2024 where PunchNo='081776' and PunchTime between '2024-05-09' and '2024-05-15' and DeviceNo='60007003' and InActive=1

update Attendance_DailyPunchRecord2024 set InActive=0 , InActiveBy=NULL , InActiveDate=NULL , PunchNo='81776' , Remarks='wrong punch from 64021' where PunchNo='064021' and PunchTime between '2024-05-09' and '2024-05-15' and DeviceNo='60007003' and InActive=1
--update Attendance_DailyPunchRecord2024 set Remarks='transfer to 79936 (right ID)' , InActive=1 
where PunchNo='79899' and PunchTime between '2024-05-04' and '2024-05-12' and DeviceNo='60007042'



--insert into Attendance_DailyPunchRecord2024 ( PunchNo , PunchTime , DeviceNo, DoorMode , UserID , ActionTime , InActive , Remarks )
select '79936' ,PunchTime , DeviceNo, DoorMode , UserID , ActionTime , InActive , 'transfer from 79899 (wrong ID)' 
from  Attendance_DailyPunchRecord2024 where PunchNo='79899' and PunchTime between '2024-05-04' and '2024-05-12' and DeviceNo='60007042'



----------------- Holidaywise allowance set up -------------


--MERGE INTO Payroll_EmployeeWiseAllowance AS target
--USING (
--    VALUES
--        (dbo.REmpId(',empId,'), ',costheadId,', ',effectDate,', FLOOR(',allowanceRate,'), 1, 'SERVER_', GETDATE())


--) AS source (EmpId , CostHeadId , EffectiveDate , AllowanceRate , EntryUserId , TerminalId , EntryDate )
--ON target.EmpId = source.EmpId AND target.CostHeadId = source.CostHeadId
--WHEN MATCHED THEN
--    UPDATE SET 
--        target.EmpId = source.EmpId,
--        target.CostHeadId = source.CostHeadId,
--        target.EffectiveDate = source.EffectiveDate,
--        target.AllowanceRate = source.AllowanceRate,
--        target.EntryUserId = source.EntryUserId,
--		target.TerminalId = source.TerminalId,
--        target.EntryDate = source.EntryDate

--WHEN NOT MATCHED THEN
--    INSERT (EmpId , CostHeadId , EffectiveDate , AllowanceRate , EntryUserId , TerminalId , EntryDate )
--    VALUES (source.EmpId, source.CostHeadId, source.EffectiveDate, source.AllowanceRate, source.EntryUserId, source.TerminalId, source.EntryDate);


------------

select * from common_Unit where UnitName like '%Rotor%'
select * from Common_UnitType

select * from Holidays order by DateFrom desc



select * from Payroll_EmployeePF where EmpId=dbo.REmpId('057489') and SalaryMonth=3 and SalaryYear=2024


select * from Payroll_Employee_BasicSalary where EmpID=dbo.REmpId('078900')
select * from Payroll_Employee_BasicSalary_B where EmpID=dbo.REmpId('078900')


--update Payroll_Employee_BasicSalary   set GrossSalary='48000' , CurrentSalary='48000' where EmpID=dbo.REmpId('078900')
--update Payroll_Employee_BasicSalary_B set GrossSalary='48000' , CurrentSalary='48000'  where EmpID=dbo.REmpId('078900')

select * from HumanResource_EmployeeBasic where EmpCode='005010'


--select DATEADD(MONTH ,6, JoiningDate) as probationDate ,* from HumanResource_EmployeeBasic where EmpCode='015961'

 select * from update Payroll_EmployeePF set IsClosed=1 where EmpId=dbo.REmpId('074127')


 SELECT * FROM Common_Unit WHERE UnitName LIKE '%BECL%'
 select * from Common_UnitType
 select * from Payroll_MonthlyArear where EmpId=dbo.REmpId('063720')

 SELECT * FROM Payroll_MonthlyPayrollStop WHERE EmpID=DBO.REmpId('065182')

SELECT * FROM HumanResource_EmployeeBasic where EmpCode='043222'








------------------------- AL - final --------------------------------------



declare @empCode varchar(50) ,@empId varchar(50),@leaveUsed float,@leaveAll float, @UnitId int, @WorkingDay int, @SeparationEffectDate date

set @empCode = '047657'
set @leaveAll = 0.89
set @leaveUsed = 2

select @empId = EmpID, @UnitId = UnitID from HumanResource_EmployeeBasic where EmpCode=@empCode

update LeaveAllocation
set LeaveEarned=0,
LeaveAllocated=@leaveAll,
LeaveUsed=@leaveUsed,
CarriedDays=@leaveAll
where EmpId = @empId and LeaveId=3 AND LeaveYear= YEAR(GETDATE())



set @SeparationEffectDate = (select EffectDate from HumanResource_EmployeeSeparation where EmpID=@empId)

if @SeparationEffectDate is null begin raiserror('Leave Allocation Set, But Id Not in Separation',16,1) return end

IF @UnitId IN (2,3,4,5,6,20,34,43)
	BEGIN
		SET @WorkingDay=(SELECT COUNT (*) FROM Attendance_DailyAttendance WHERE YEAR(WorkDay)=YEAR(@SeparationEffectDate) 
			AND EmpID=@EmpId AND AttStatus IN ('P','LT','LTP','SD','TL','EE','NOP','EXL')) + (SELECT WorkDays FROM Attendance_MigratedEmployee WHERE EmpID=@EmpID)
	END
	ELSE
	BEGIN
		SET @WorkingDay=(SELECT COUNT (*) FROM Attendance_DailyAttendance WHERE YEAR(WorkDay)=YEAR(@SeparationEffectDate) AND EmpID=@EmpId AND AttStatus IN ('P','LT','LTP','SD','TL','EE','NOP','EXL'))
	END

exec ProcessFinalSettelment @EmpID=@empId,@p_UserId=1
select * from LeaveAllocation where EmpId = @empId and LeaveId=3 and LeaveYear between 2022 and YEAR(GETDATE())
select @WorkingDay WorkingDay, @WorkingDay/18.00 RunningEl
SELECT * FROM FinalSattlementPayable WHERE EmpID=@empId
UPDATE FinalSattlementPayable SET PrintQty = 0 WHERE EmpID=@empId





select * from LeaveAllocation where EmpId=dbo.REmpId('041412') and LeaveYear=YEAR(GETDATE()) 


SELECT * FROM Common_Unit WHERE UnitName LIKE '%cgl%'


----------------------------------------------------------------------------------


select * from HumanResource_EmployeeBasic  where EmpCode='027437'

--update HumanResource_EmployeeBasic set PrevPunchNo=NULL  where EmpCode='027437'

select * from Common_Shift_Dtl where ShiftID=1  order by EffectDate desc 


select SectionName,SectionID  from Common_Section where SectionName like '%Peace%'


--update HumanResource_EmployeeBasic set SectionID='",,"' where EmpCode='",,"'









select DATEADD(MONTH ,3, JoiningDate) as probationDate ,* from HumanResource_EmployeeBasic where EmpCode='079356'

--update HumanResource_EmployeeBasic set ProbationDate=DATEADD(MONTH ,3, JoiningDate) where EmpCode='",,"'



---------------------------------------------
select * from Payroll_EmployeeWiseAllowance where EmpId=dbo.REmpId('049527');

----------------- Holidaywise allowance set up -------------


select max(EmpCode) from HumanResource_EmployeeBasic

------------


select * from Payroll_CostHead


SELECT * FROM Attendance_DailyPunchRecord2024 WHERE DeviceNo='8149' AND PunchTime >='2024-05-09'


------- job location add ------------------

select * from HumanResource_EmployeeBasic where EmpCode='066576' --2 

update  HumanResource_EmployeeBasic set DesignationID=309 where EmpCode='081907'


select * from Common_JobLocation


------------ repunch -----------------

--update HumanResource_EmployeeBasic set PrevPunchNo=null where EmpCode='048547'


select * from Common_Designation where DesignationName like 'Assistant Production Reporter'



------------------- HRM Menu Permission ----------------------




--INSERT INTO ERPUSERDB.dbo.MenuPermission (UserId, MenuId, EntryDate)

select *, getdate() from 
(
Select (select UserId from ERPUSERDB.dbo.UserInfo where EmpId='076401') as UserId, MenuId as MenuId 
from ERPUSERDB.dbo.MenuPermission Where UserId = (select UserId from ERPUSERDB.dbo.UserInfo where EmpId='040410')
except select UserId, MenuId from ERPUSERDB.dbo.MenuPermission
) as NewMenu


select * from  attendance_dailypunchrecord2024  where DeviceNo='60003043' and PunchTime >='2024-05-04' 

select * from Holidays where HolidayName like '%Buddha Purnima%'

select * from HolidayDetails where HolidayId=1071



select * from Common_Unit WHERE UnitName LIKE '%CCL%'

select * from Common_Religion
select * from Common_Unit where UnitName like '%ADL%'
select * from Common_Unit where UnitId in (1,27,45)

select * from HumanResource_EmployeeBasic where ReligionID=3 and UnitID in (1 ,27,45) and IsApproved=1 and EmpCategoryID=1 

select * from Common_EmploymentType

select * from Payroll_MonthlySalary  where EmpID=dbo.REmpId('041902')  and SalaryYear=2024

select * from Attendance_DailyPunchRecord2024 where DeviceNo='60007012' AND PunchTime < '2024-05-11' order by PunchTime desc

--update Attendance_DailyPunchRecord2024 set Remarks='new Dev ID:7549' where DeviceNo='60007012' AND PunchTime < '2024-05-11'

select * from HumanResource_EmployeeEducation where Institute like '%%' order by PassingYear desc


006419

select * from update  HumanResource_EmployeeBasic set IsApproved=1 where EmpCode='039054'


select * from Attendance_DailyPunchRecord2024 where PunchNo='55362' and PunchTime between '2024-05-01' and '2024-05-07' and InActive=1

update Attendance_DailyPunchRecord2024 set InActive=0 , Remarks='punch recover on request rasel HTL' where PunchNo='55362' and PunchTime between '2024-05-01' and '2024-05-07' and InActive=1

select * from ERPUSERDB.dbo.UserInfo where UserId=211384


