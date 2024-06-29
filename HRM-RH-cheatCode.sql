
--860702 Attendance  Transfer 46391
------------ Punch Transfer ---------------------

select * from Attendance_DailyPunchRecord2024 where PunchNo ='30988' and InActiveBy='637253' order by PunchTime desc  and PunchTime = cast(  '2024-05-17') -- and '2024-05-15' and DeviceNo='60007003' and InActive=1



select * from Attendance_DailyPunchRecord2024  where PunchNo ='30988' and InActive=1 and InActiveBy='637253' 

SELECT * FROM Attendance_DailyPunchRecord2024 where DeviceNo='8404' order by PunchTime desc


select * from HumanResource_EmployeeBasic where PrevPunchNo='860702'

--update Attendance_DailyPunchRecord2024 set InActive=0 , InActiveBy=NULL , InActiveDate=NULL , PunchNo='82587' , Remarks='wrong punch from 82230' where PunchNo='064021' and PunchTime between '2024-05-09' and '2024-05-15' and DeviceNo='60007003' and InActive=1


--update Attendance_DailyPunchRecord2024 set Remarks='transfer to 82330 (right punch)' , InActive=1 
where PunchNo='82230' --and PunchTime between '2024-05-04' and '2024-05-12' and DeviceNo='60007042'



--insert into Attendance_DailyPunchRecord2024 ( PunchNo , PunchTime , DeviceNo, DoorMode , UserID , ActionTime , InActive , Remarks )
select '82330' ,PunchTime , DeviceNo, DoorMode , UserID , ActionTime , InActive , 'transfer from 82230 (wrong punch)' 
from  Attendance_DailyPunchRecord2024 where PunchNo='60658' and PunchTime between '2024-05-04' and '2024-05-12' and DeviceNo='60007042'



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

select * from  common_Unit  where  UnitName like '%Rotor%' 

select * from Common_UnitType

select * from Attendance_DailyPunchRecord2024 where try_cast( DeviceNo as int )in (9156,9157) and PunchTime >='2024-05-24'

select * from 


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

set @empCode = '018851'
set @leaveAll = 12.56
set @leaveUsed = 6

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

SELECT * FROM Common_Shift where ShiftID=2 WHERE ShiftShort LIKE '%MGT%'


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

--update  HumanResource_EmployeeBasic set DesignationID=309 where EmpCode='081907'


select * from Common_JobLocation


------------ repunch -----------------

--update HumanResource_EmployeeBasic set PrevPunchNo=null where EmpCode='044835'


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

--update Attendance_DailyPunchRecord2024 set InActive=0 , Remarks='punch recover on request rasel HTL' where PunchNo='55362' and PunchTime between '2024-05-01' and '2024-05-07' and InActive=1

select * from ERPUSERDB.dbo.UserInfo where UserId=211384

--:::::::::::::::::::::::::::::::::::: EL Deduction :::::::::::::::::::::



SELECT * INTO #TBL FROM

(


SELECT dbo.RempId('077208') EmpId, 2 DLeave UNION ALL


) TBL

DECLARE EmpCursor CURSOR FOR
SELECT EmpId FROM #TBL

DECLARE @EmpId INT,
		@C INT=1

OPEN EmpCursor
FETCH NEXT FROM EmpCursor INTO @EmpId

WHILE @@FETCH_STATUS=0
BEGIN
	
	DECLARE @DLeave INT=(SELECT DLEAVE FROM #TBL WHERE EmpId=@EmpId)
	
	INSERT INTO LeaveDeduction(LeaveID,EmpID,DMonth,DYear,LateDays,DLeave,IsElPaid,DTypeId,Remarks,EntryDate)
	SELECT 3,@EmpId,4,2024,0,@DLeave,1,1,'EL Deduction For EID-UL-FITR 2024',GETDATE()

	UPDATE LeaveAllocation SET LeaveUsed=LeaveUsed+@DLeave WHERE EmpId=@EmpId AND LeaveYear=2024 AND LeaveId=3

	PRINT @C
	SET @C=@C+1
	FETCH NEXT FROM EmpCursor INTO @EmpId
END
CLOSE EmpCursor
DEALLOCATE EmpCursor

DROP TABLE #TBL



--:::::::::::::::::::::::::::::::::::::::

select * from Common_Shift where ShiftIn ='1900-01-01 07:00:00.000' and ChangeOverShiftID is NULL --63 -- 10
select * from Common_Shift where ShiftIn ='1900-01-01 15:00:00.000' and ChangeOverShiftID is null --63 -- 18

select * from Common_Unit where UnitName Like '%SP%'



-- :::::::::::: Leave Rollback

 --update ApprovalProcess_LeaveRegister set Remarks='rollback on request'  where FromEmpId=dbo.REmpId('006866') and LRId='1241352'
 --update ApprovalProcess_LeaveRegister set Remarks='rollback on request'  where FromEmpId=dbo.REmpId('053748') and LRId='1241352'
 --update ApprovalProcess_LeaveRegister set Remarks='rollback on request'  where FromEmpId=dbo.REmpId('040430') and LRId='1241352'
 --update Attendance_LeaveRegister      set where EmpId=dbo.REmpId('006866') and StartDate='2024-05-26'


 select * from  LeaveAllocation  LeaveAllocation where EmpId = dbo.REmpId('016588') and LeaveYear=2024 and LeaveId=1 
 select * from Common_LeaveType


 update LeaveAllocation set LeaveUsed=0 where EmpId = dbo.REmpId('016588') and LeaveYear=2024 and LeaveId=1


select * from ApprovalProcess_LeaveRegister where FromEmpId=dbo.REmpId('072783') and LRId=1250922   -- and LRPId='918229'


update ApprovalProcess_LeaveRegister set ActionStatus=4 where FromEmpId=dbo.REmpId('016588') and LRId=1250922 

--update ApprovalProcess_LeaveRegister set ActionStatus=2 where FromEmpId=dbo.REmpId('006866') and ActionDate>'2024-05-22' and Id=918229

select * from Attendance_ActionStatus


select * from Attendance_LeaveRegister where EmpId=dbo.REmpId('072783') and LRId='1250922' --StartDate='2024-05-21'

--update Attendance_LeaveRegister set StartDate='2024-05-20' , EndDate='2024-05-28' where EmpId=dbo.REmpId('072783') and LRId='1250922'

--update Attendance_LeaveRegister set Status=4 where EmpId=dbo.REmpId('016588') and StartDate='2024-05-21'


--update HumanResource_EmployeeBasic set PrevPunchNo=NULL where EmpCode in (043107, 058030 )


 SELECT * FROM Attendance_EmployeeRosterDetails


 --INSERT INTO Attendance_EmployeeRosterDetails ( EmpID , WorkDay , ShiftID , EntryUserId , EntryDate)
 SELECT DBO.REmpId('066576') , '"MULTIPLE DATE NEED TO SELECT"' , 35 , 1, GETDATE()



 --::::::::::::::::::::::::::::::::::::::: BULK ROSTER SETUP



DECLARE @Dates TABLE (WorkDay DATE);

--INSERT INTO @Dates (WorkDay)
VALUES ('2023-05-25'), ('2023-05-26'), ('2023-05-27'), ('2023-05-28'), ('2023-05-29'), ('2023-05-30'), ('2023-05-31');

--INSERT INTO Attendance_EmployeeRosterDetails (EmpID, WorkDay, ShiftID, EntryUserId, EntryDate)
SELECT e.EmpID, d.WorkDay, 35, 1, GETDATE()
FROM HumanResource_EmployeeBasic e
JOIN @Dates d ON 1=1 
WHERE e.EmpCode IN (

'041606'
,'075447'

);


-----------------

Select * from Common_Unit where UnitName like '%ADL%'
SELECT * FROM Common_Designation

---------------------


select * from  Attendance_DailyPunchRecord2024  where PunchNo='59859' and Id in (
'24231012'
,'24231035'
,'24232260'
,'24232265'

) and PunchTime>='2024-05-30' --between '2024-05-17' and '2024-05-23'


select * from Common_Unit where UnitName like '%CWDL%' -- 70 , 1

select * from 

select * from Common_UnitType

select * from Common_Shift_Dtl where UnitId=56 and  NightTime='1900-01-01 22:00:00.000'

select * from Common_Currency
select * from Payroll_CurrencyConversion where SalaryYear=2024 and SalaryMonth=5
 

select * from  Payroll_Employee_BasicSalary where EmpID=dbo.REmpId('079591')
select * from  Payroll_Employee_BasicSalary_B  where EmpID=dbo.REmpId('079591')



--update  Payroll_Employee_BasicSalary set GrossSalary='",####,"' where EmpID=dbo.REmpId('",####,"'); 

update  Payroll_Employee_BasicSalary set GrossSalary='18800', CurrentSalary='18800' where EmpID=dbo.REmpId('079591'); 
update  Payroll_Employee_BasicSalary_B set GrossSalary='18800' , CurrentSalary='18800' where EmpID=dbo.REmpId('079591')


select * from Payroll_EmployeePFDeduction where EmpId=dbo.REmpId('022779') and SalaryYear=2024

select * from Payroll_MonthlySalary  where EmpId=dbo.REmpId('022779') and SalaryYear=2024

select * from Payroll_EmployeeWiseAllowance where EmpId=dbo.REmpId('081030') and CostHeadId in (2,4,7)  --and IsDeleted=0  --and CostHeadId in (2,4,7)  --order by CostHeadId desc

select * from Payroll_CostHead 


--UPDATE FinalSattlementPayable SET PrintQty = 0 WHERE EmpID=dbo.REmpId('042745')


select * from Attendance_EmployeeWeekOff where EmpID=dbo.REmpId('066576')


select * from Attendance_EmployeeWeekOff where EmpID=dbo.REmpId('006112')

insert into Attendance_EmployeeWeekOff ( EmpID , DayID , StartDate ,EntryUserId , EntryDate )
select dbo.REmpId('006112') , 6, '2024-05-01',dbo.REmpId('003443') , GETDATE()



select * from Ogranogram_ApplicationsApproval where EmpID=dbo.REmpId('066576')


--insert into Ogranogram_ApplicationsApproval ( EmpID , SupervisorEmpId , EffectDate , IsActive , EntryUserId , EntryDate , ProjectId  )
select dbo.REmpId('081365') , 


select * from HumanResource_EmployeeBasic where Name like '%Homayun Kabir%'

select * form 


select * from update HumanResource_EmployeeBasic set EmpStatusID=1 where EmpCode='042745'

select * from Common_EmploymentStatus


---------------------------------- Application Transfer 
-- HR	057323
-- DGM 	068084
-- Taifur 008540

select * from HumanResource_EmployeeBasic where EmpID=215342  
select * from HumanResource_EmployeeBasic where EmpID=2824  

select * from Attendance_ActionStatus
select * from  ApprovalProcess_LeaveRegister where ActionStatus =0 and FromEmpId=dbo.REmpId('057323')


select * from ApprovalProcess_LeaveRegister where  ToEmpId=dbo.REmpId('057323') and ActionStatus=0     --and FromEmpId=dbo.REmpId('014274') 
select * from ApprovalProcess_EmployeeTour where ToEmpId=dbo.REmpId('057323') and ActionStatus=0


update ApprovalProcess_LeaveRegister set ToEmpId=dbo.REmpId('008540') , Remarks='application transfer from 057323' where  ToEmpId=dbo.REmpId('057323') and ActionStatus=0 
update  ApprovalProcess_EmployeeTour set ToEmpId=dbo.REmpId('008540') , Remarks='application transfer from 057323'  where ToEmpId=dbo.REmpId('057323') and ActionStatus=0

select * from Attendance_LeaveRegister where EmpId=dbo.REmpId('014274') 




------------------ Holiday add
--insert into Holidays (HolidayYear , HolidayName , DateFrom , DateTo , NoOfDays , IsActive , EntryUserId , TerminalId , EntryDate)
select  '2024' , 'Eid ul-Adha 2024 TEXTILE ZONE' ,'2024-06-16' , '2024-06-20' , 1,1,1,'Server``' ,getdate()


select * from Common_Unit where UnitName like '%Humana%'
select * from Common_UnitType

select * from Holidays order by DateFrom desc


--insert into HolidayDetails ( HolidayId , HolidayDate , UnitId , EmpTypeId )



select * from Payroll_MonthlySalaryAdvanceCompliance where EmpId=dbo.REmpId('075984')

select *  delete from Payroll_MonthlySalaryAdvance where EmpId=dbo.REmpId('075984')


select * from  Payroll_MonthlySalary  where SalaryMonth=5 and SalaryYear=2024 and EmpId=dbo.REmpId('008549')


select * from HolidayAllocateReligionWise where  HolidayId=1105 and UnitId in (50,60)

select * from Common_Unit where UnitName like '%SZW%'  -- 50,60


select * from Common_Shift where ShiftShort like '%ABN%'

select * from Holidays order by DateFrom desc



select * from Attendance_DailyPunchRecord2024 where PunchNo='45149'

select * from update HumanResource_EmployeeBasic set SectionID=408 where EmpCode in ('094361' , '094362') 


--select * from NewUserFinalSubmit

select * from Common_Section where SectionName like '%Struct%'



SELECT * FROM  Attendance_OTAdjustment 



--------------- EID OT ADJUSTMENT ------------- OT DEDUCT

--INSERT INTO Attendance_OTAdjustment ( EmpCode , EmpId , WorkDate , AdjustmentTo , OTHour , Remarks )
SELECT '",EmpCode,"',DBO.REmpId('",EmpCode,"'),'",WORKDATE,"' , '",ADJUSTMENTDATE,"' , '",OTHOURS,"' , 'OTADJUSTFORADHA``' UNION ALL


select * from Common_Unit where UnitId=56 itName like '%SPIL%'

select * from Common_Shift where ShiftID in (49,51,34,35 )

select * from Common_Shift_Dtl where UnitId in (51,64,65) and ShiftID=35 order by EffectDate  desc

SELECT * FROM  Holidays where HolidayId='1106'


select WingName , WingID from Common_Wing



select * from Attendance_DailyAttendance where ShiftID=35 and WorkDay='2024-06-15'

--update HumanResource_EmployeeBasic set WingID ='",wingId,"' where EmpCode='",empCode,"'


select * from Attendance_TerminalInformation where ControllerID='635'



-- Holiday Changes 


select * from  HolidayDetails where HolidayId=1106 and UnitId in (39,31) --1106

select *    from HolidayAllocateReligionWise  where HolidayId=1106 and UnitId in ( 39,31 )

select * from Common_Religion

select * from HolidayAllocateEmployeeWise

insert into HolidayAllocateEmployeeWise ( HolidayId , EmpID , EntryDate , EntryUserId , OverrideHolidayId )
select '1106' , EmpID , getDate() , '1' ,'1091'  from HumanResource_EmployeeBasic where EmpCode in (
'053348'

)

select * from Attendance_TerminalInformation where Location like '%Spinning%'


select * from Attendance_DailyPunchRecord2024 where PunchNo='18895' order by PunchTime desc
select * from ERPUSERDB.dbo.UserInfo where UserId='211894'