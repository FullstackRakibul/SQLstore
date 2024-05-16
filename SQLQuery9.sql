--select * from  Payroll_FestivalBonus order by BonusAmount desc

select * from HumanResource_EmployeeBasic where EmpCode='066576'

select * from Attendance_DailyAttendance where EmpID ='215376' (select EmpID from HumanResource_EmployeeBasic where EmpCode='66576') order by WorkDay desc
 select * from Common_JobLocation where JobLocationId = '6'





select top 2 * from Attendance_DailyAttendance where SectionID=238 order by InTime desc

select * from Common_Department


select * from Attendance_DailyAttendance where UnitID=75 order by InTime desc

SELECT COUNT(*) AS TotalPresentCount 
FROM Attendance_DailyAttendance 
WHERE UnitID = (select UnitId from Common_Unit where UnitName  like '%lab%') 
	AND InTime >= '2023-11-01';


SELECT COUNT(*) AS TotalPresentCount FROM Attendance_DailyAttendance 
WHERE DepartmentID = (select  DepartmentID from Common_Department where DepartmentID=1) 
	AND InTime >= '2023-11-08' 
	AND InTime <= '2023-11-05'

SELECT top 5 * FROM Attendance_DailyAttendance 
WHERE DepartmentID = (select  DepartmentID from Common_Department where DepartmentID=1) 
	AND InTime >= '2023-11-04' 
	AND InTime <= '2023-11-06'



SELECT * FROM Attendance_DailyAttendance 
WHERE EmpID = (select  EmpID from HumanResource_EmployeeBasic where EmpCode='053324') 
	AND WorkDay='2023-11-11'


SELECT base.Name , * FROM Attendance_DailyAttendance dat
left join HumanResource_EmployeeBasic base on dat.EmpID = base.EmpID
WHERE dat.DepartmentID = (select  DepartmentID from Common_Department where DepartmentID=1) 
	AND InTime >= '2023-11-08' order by InTime desc


--select * from HumanResource_EmployeeBasic where EmpID =( select EmpID from HumanResource_EmployeeBasic where EmpCode= '066576')

SELECT 
  base.Name, 
  base.EmpID, 
  base.EmpCode as ID_Number, 
  base.NationalityID, 
  base.JoiningDate, 
  dept.DepartmentName, 
  desig.DesignationName, 
  unit.UnitName, 
  jobloc.JobLocationName, 
  base.FathersName, 
  base.MothersName, 
  religion.ReligionName, 
  blood.BloodGroupName, 
  contact.Phone, 
  contact.Email, 
  contact.PreVillage as Address, 
  salary.CurrentSalary, 
  Bsalary.Amount as Basic_Salary, 
  paymode.PaymentModeName, 
  salary.BankAccountNo, 
  bank.BankName, 
  bonus.BonusAmount, 
  bonus.GrossSalary, 
  passport.PassportNo 
FROM 
  HumanResource_EmployeeBasic base 
  LEFT JOIN Common_Department dept ON base.DepartmentID = dept.DepartmentID 
  LEFT JOIN Common_Designation desig ON base.DesignationID = desig.DesignationID 
  left join Common_Unit unit on base.UnitID = unit.UnitId 
  left join Common_JobLocation jobloc on base.JobLocationId = jobloc.JobLocationId 
  left join Common_Religion religion on base.ReligionID = religion.ReligionID 
  left join Common_BloodGroup blood on base.BloodGroupID = blood.BloodGroupID 
  left join HumanResource_EmployeeContact contact on base.EmpID = contact.EmpID 
  left join Payroll_BasicSalaryInfo_Log salaryLog on base.EmpID = salaryLog.EmpId 
  left join GetBasicSalary Bsalary on base.EmpID = Bsalary.EmpId 
  left join Payroll_Employee_BasicSalary salary on base.EmpID = salary.EmpID 
  left join Common_Bank bank on salary.BankId = bank.BankId 
  left join Common_PaymentMode paymode on salary.PaymentModeId = paymode.PaymentModeId 
  left join HumanResource_EmployeePassport passport on base.EmpID = passport.EmpID 
  left join Payroll_FestivalBonus bonus on base.EmpID = bonus.EmpId 
WHERE 
  base.EmpCode = '066576';




