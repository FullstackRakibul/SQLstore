
------------ Account Number and Bank details Set -----------------

select * from emp_basic_salary where emp_no = ( select emp_no from emp_basic where emp_id = 'TTEB-353' )

--update emp_basic_salary set Bank_Account='01607348499' , BankId='24' , Bank_Name='bKash' 
where emp_no = ( select emp_no from emp_basic where emp_id = 'TTEB-531' )

--select * from b_Bank

------------------Holiday Setup

--select * from B_Holiday order by From_date desc --

--insert into B_Holiday (holiday_code, From_date,festival_date,Till_date,Reason,bonus,con,HoliType,category)
--values (218,'2024-05-01 00:00:00.000','2024-05-01 00:00:00.000','2024-05-01 00:00:00.000','Labour day',0,0,'All','0,1,2,3,4')



---- force weekoff ----

--INSERT INTO empForceWO (emp_no, CurrentHoliday, CurrentHolidayRemarks, AlterHoliday, AlterHolidayRemarks, IsActive)
SELECT emp_no, '2024-04-26', 'WOadjustment2024-aminul', '1900-01-01', 'WOadjustment2024-aminul', 0
FROM emp_basic where emp_id in (
'TSL-O IE04079'
)


select *   from  empForceWO where emp_no = ( select emp_no from emp_basic where emp_id = 'NCL2-37618' ) and CurrentHoliday='2024-05-03' --and AlterHolidayRemarks='WOadjustment2024-JA'
select * from emp_basic where emp_id = 'NCL1-155906'


---- froce GENERAL Duty --------

--INSERT INTO empForceWO (emp_no, CurrentHoliday, CurrentHolidayRemarks, AlterHoliday, AlterHolidayRemarks, IsActive)
SELECT emp_no, '2024-05-03', 'WOadjustment2024-JA', '2024-05-18', 'WOadjustment2024-JA', 1
FROM emp_basic where emp_id in (
'NCL-OP02093357'
)


--DELETE FROM empForceWO WHERE emp_no = ( SELECT emp_no FROM emp_basic WHERE emp_id='ADL110137') AND CurrentHoliday='2024-04-26' AND CurrentHolidayRemarks='NEONweekoffAdjustment--'
select * from empForceWO where emp_no = ( select emp_no from emp_basic where emp_id = 'TSL-O IE04079' )

--- 

select * from emp_basic_weekoff where emp_no = ( select emp_no from emp_basic where emp_id = 'NCL1-155906' )


--- GENERAL DUTY BY UNIT -----------

--INSERT INTO empForceWObybranch (branch_code, CurrentHoliday, CurrentHolidayRemarks, AlterHoliday, AlterHolidayRemarks, IsActive, Bholiday)
SELECT branch_code, '2024-05-10', 'General Duty-aswad', '1900-01-01', 'General Duty-aswad', 1, 1
FROM B_branch;

select * from empForceWObybranch where AlterHoliday='2024-05-14'

select * from emp_basic_info where card_no like '1057'

select * from emp_basic_salary where emp_no=(select emp_no from emp_basic where emp_id='')

select * from emp_basic where emp_no='130409'


SELECT * FROM  B_designation  WHERE designation_name LIKE '%Assistant Belt Size %'


----------- correct card number ---------


select * from update emp_basic_info set card_no='29932616'  where emp_no = ( select emp_no from emp_basic where emp_id = 'ADL199393' )

select * from  emp_basic_info  where emp_no = ( select emp_no from emp_basic where emp_id = 'ADL-1-FA190072' )


select * from emp_basic where emp_id = 'TSL-FA70063' 

update  emp_basic set emp_id='RGL-SQ035916' where emp_id = 'RGL-SQ036916' 


select * from B_Shift where Shift_Code=111 Shift_In = '1900-01-01 19:30:00.000'



select * from B_Shift where  shift_short like '%N' and shift_in between '1900-01-01 19:00:00.000' and '1900-01-01 21:00:00.000'



select * from emp_Attendance

-------  Emp Transfer -----------
 
select * from  emp_basic_info  where emp_no = ( select emp_no from emp_basic where emp_id = 'AGL-FPK02866') 



--update  emp_basic_info set company_code=11 , branch_code=35  where emp_no = ( select emp_no from emp_basic where emp_id = 'AGL-FPK02866') 


select * from b_company_branch
select * from B_branch

--update B_branch set ShortName='AGL-Floor 3' where branch_code =26



select * from  emp_basic  where emp_id = 'AGL-FFL06853'


----------------------------- Wrong punch - fix punch

select * from  emp_basic_info  where emp_no = ( select emp_no from emp_basic where emp_id = 'TSL-SO02017140') 
--update emp_basic_info set card_no='209349'  where emp_no = ( select emp_no from emp_basic where emp_id = 'TSL-SO02017140') 





