
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
SELECT emp_no, '2024-05-10', 'RWOadjustment2024-Ahanif', '1900-01-01', 'RWOadjustment2024-Ahanif', 0
FROM emp_basic where emp_id in (
'TIKL-183505'
)


--INSERT INTO empForceWO (emp_no, CurrentHoliday, CurrentHolidayRemarks, AlterHoliday, AlterHolidayRemarks, IsActive)
SELECT emp_no, '",EffectDate,"', 'WOAdjustment2024-hanif', '1900-01-01', 'WOAdjustment2024-hanif', 0 FROM emp_basic where emp_id='",EmployeeID,"' union all


select * delete from   empForceWO  where emp_no = ( select emp_no from emp_basic where emp_id = 'AGL-SO13749') and CurrentHoliday = '2024-05-03' 

select *  from   empForceWO where emp_no = ( select emp_no from emp_basic where emp_id = 'AGL-SO15015273') and CurrentHoliday='2024-05-05' and CurrentHolidayRemarks='MTLWOadjustment2024-test'
select * from emp_basic where emp_id = 'NCL1-155906'


---- froce GENERAL Duty --------

--INSERT INTO empForceWO (emp_no, CurrentHoliday, CurrentHolidayRemarks, AlterHoliday, AlterHolidayRemarks, IsActive)
SELECT emp_no, '2024-05-17', 'WOadjustment2024-pia', '1900-01-01', 'WOadjustment2024-pia', 1
FROM emp_basic where emp_id in (
'AGL-SO13749'
,'AGL-SO15015273'

)

--INSERT INTO empForceWO (emp_no, CurrentHoliday, CurrentHolidayRemarks, AlterHoliday, AlterHolidayRemarks, IsActive)
SELECT emp_no, '",EffectDate,"', 'GDayAdjustment2024-Ahanif', '1900-01-01', 'GDayAdjustment2024-Ahanif', 1 FROM emp_basic where emp_id='",EmployeeID,"' union all, 







--DELETE FROM empForceWO WHERE emp_no = ( SELECT emp_no FROM emp_basic WHERE emp_id='RGL-BSO013285') AND CurrentHoliday='2024-05-17' AND CurrentHolidayRemarks='NEONweekoffAdjustment--'
select * from empForceWO where emp_no = ( select emp_no from emp_basic where emp_id = 'TSL-COF416' )

--- 

select * from emp_basic_weekoff where emp_no = ( select emp_no from emp_basic where emp_id = 'NCL1-155906' )


--- GENERAL DUTY BY UNIT -----------


--INSERT INTO empForceWObybranch (branch_code, CurrentHoliday, CurrentHolidayRemarks, AlterHoliday, AlterHolidayRemarks, IsActive, Bholiday)
SELECT branch_code, '2024-06-14', 'General Duty Nion //', '1900-01-01', 'General Duty Nion //', 1, 1
FROM B_branch where branch_code in (16,
39,
40,
95);





select * from B_branch


select *  from  empForceWObybranch where CurrentHoliday='2024-05-31' and  branch_code in ( 19 )

select * from emp_basic_info where card_no like '1057'

select * from emp_basic_info where card_no='511984' emp_no=(select emp_no from emp_basic where emp_id='511984')

select * from  emp_basic where emp_id='ADL367278'


SELECT * FROM  B_designation  WHERE designation_name LIKE '%Assistant Belt Size %'


----------- correct card number ---------


update emp_basic_info set card_no='80036528'  where emp_no = (select emp_no from emp_basic where emp_id = 'ADL299765')



select * from  emp_basic_info  where emp_no = ( select emp_no from emp_basic where emp_id = 'RGL-CL0305079' )


select * from emp_basic where emp_id = 'TSL-FA70063' 

update  emp_basic set emp_id='RGL-SQ035916' where emp_id = 'ADL-1-FA190070' 


select * from B_Shift where Shift_Code=111 AND Shift_In = '1900-01-01 19:30:00.000'



select * from B_Shift where  shift_short like '%N' and shift_in between '1900-01-01 19:00:00.000' and '1900-01-01 21:00:00.000'



select * from emp_Attendance

-------  Emp Transfer -----------
 
select * from  emp_basic_info  where emp_no = ( select emp_no from emp_basic where emp_id = 'AGL-FSV084') 



--update  emp_basic_info set company_code=13 , branch_code=26  where emp_no = ( select emp_no from emp_basic where emp_id = 'AGL-FO0203035') 


select * from b_company_branch
select * from B_branch

--update B_branch set ShortName='AGL-Floor 3' where branch_code =26



select * from  emp_basic  where emp_id = 'AGL-FFL06853'


----------------------------- Wrong punch - fix punch

select * from  emp_basic_info  where emp_no = ( select emp_no from emp_basic where emp_id = 'TSL-SO02017140') 
--update emp_basic_info set card_no='209349'  where emp_no = ( select emp_no from emp_basic where emp_id = 'TSL-SO02017140') 


 select * from emp_basic where emp_id = 'RGL-SO032204'
update  emp_basic set emp_id='RGL-SO022204' where emp_id = 'RGL-SO032204'


select * from   b_designation where  designation_name like '%Supervisor (Needle)%'

--update b_designation set designation_name='Plumber' where designation_name like '%Plumber (G-2)%'


select * from UPDATE B_Holiday SET bonus=1 WHERE holiday_code=218 


SELECT * FROM B_Holiday_PaymentMode

-------------- account change 
select * from  emp_basic_salary  where emp_no =( select emp_no from emp_basic where emp_id='TTEB-317')
select * from b_Bank
update  emp_basic_salary set BankId=24,Bank_Name='Bkash', Bank_Account='01962617086'  where emp_no =( select emp_no from emp_basic where emp_id='RGL-SA101540')


--update B_Holiday set bonus=1 where holiday_code=218
--insert into B_Holiday_PaymentMode 
select '2024-05-01 00:00:00.000' , '2024-05-01 00:00:00.000',2,1


select * from B_Holiday order by From_date desc
select * from B_Holiday_PaymentMode order by HolidayFromDate desc


select * from b_dep_sec where department_code =5
select * from B_department where department_name like '%Office Staff%'

select * from B_section where section_code in (1013,
)

--update B_section set section_name='Electrical' , section_bangla='B‡jKwU«Kvj'  where section_code=1043



select * from B_Holiday order by From_date desc


SELECT * FROM B_department



select * from B_branch where branch_code=52

select * from  GeneralDutyDay where Branch_code=52 order by WorkDate desc



DECLARE @Dates TABLE (WorkDay DATE);
INSERT INTO @Dates (WorkDay)
VALUES ('2024-06-14');


INSERT INTO GeneralDutyDay (WorkDate, IsActive, branch_code)
SELECT d.WorkDay, 1, b.branch_code
FROM @Dates d
CROSS JOIN B_branch b
WHERE b.branch_code  in (
16,
39,
40,
95
) 



-- Holiday Changes 




select * from B_Holiday_PaymentMode order by HolidayFromDate desc
select * from B_Holiday order by From_date desc



update B_Holiday_PaymentMode set HolidayTillDate='2024-06-25 00:00:00.000' where HolidayFromDate='2024-06-16 00:00:00.000' and HolidayTillDate='2024-06-18 00:00:00.000'