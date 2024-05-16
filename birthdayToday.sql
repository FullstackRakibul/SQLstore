-- =============================================
-- Author:		<Author,,Rakibul Hasan>
-- Create date: <Create Date,,26 Nov 2023>
-- Description:	<Description,,Wish an individual who has a birthday on this particular date time>
-- =============================================

-- PROCEDURE CODE START FROM HERE ..................
create procedure BIRTHDAYGREETING 
as begin 
-- create a temp table
create table #BirthdayToday(
EmpName nvarchar(50), 
EmpEmail nvarchar(50), 
EmpBirthday date
);
-- insert data into temp table
insert into #BirthdayToday (EmpName, EmpEmail,EmpBirthday)
select 
  Name as EmpName, 
  COALESCE(EmailOffice, Email) as email, 
  DateOfBirth 
FROM 
  HumanResource_EmployeeBasic base 
  inner join HumanResource_EmployeeContact ct on base.EmpID = ct.EmpID 
WHERE 
  (
    ct.Email IS NOT NULL 
    and len(ct.Email) > 5 
    OR ct.EmailOffice IS NOT NULL 
    AND len(ct.EmailOffice)> 5
  ) 
  and MONTH(DateOfBirth) = MONTH(
    GETDATE()
  ) 
  AND DAY(DateOfBirth) = DAY(
    GETDATE()
  ) 
  and base.EmpStatusID = 1;

  -- declare variables
declare @subject nvarchar(50) = 'Happy Birthday!', 
@body nvarchar(MAX), 
@employeeName nvarchar(50), 
@email nvarchar(50);

-- declare a cursor for temp table
declare BirthdayCursor cursor for 
select 
  EmpName, 
  EmpEmail 
from 
  #BirthdayToday;
  -- now open the cursor and fetch the data 
  open BirthdayCursor;
fetch next 
from 
  BirthdayCursor into @employeeName, 
  @email;
while @@FETCH_STATUS = 0 begin -- setting html message body.........
set 
  @body = '
    <body style="font-family: Arial, sans-serif; text-align: center; background-color: #d8d8d8; margin: 0; padding: 0;">

    <table style=" box-shadow: 5px 5px #274358; cellpadding="0" cellspacing="0" width="400" margin: 20px auto; background-color: #fff; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <tr style="background-color: #274358; color: #fff; padding: 20px;">
            <td >
                <h1 style="font-weight: 600;font-family:Verdana, sans-serif;"> Happy Birthday!</h1>
            </td>
        </tr>
        <tr>
            <td style="padding: 20px;">
                <p style="font-size: 16px; font-weight: 600; color: #274358;">Dear' +' '+@employeeName + ',</p>
                <p>Wishing you a day filled with love, joy, and all your heart desires. May this year bring you closer to your dreams and aspirations.</p>
                <p>Enjoy your special day to the fullest!</p>
                <img src="https://media.istockphoto.com/id/1127446391/vector/paper-art-of-happy-birthday-calligraphy-hand-lettering-hanging-with-colorful-balloon.jpg?s=612x612&w=0&k=20&c=c-ymBtmkmhwns95pMKmpwTk1NwlCMzZcuSH9hz1KT2o=" alt="Birthday Greetings Image" style="max-width: 100%; height: auto;">
            </td>
        </tr>
        <tr>
            <td style="background-color: #f1f1f1; color: #274358; padding: 20px;">
                <p style="font-weight: 600;">Best Wishes,</p>
                <img src="https://textilepages.com/public/profile/1593836298-img1-logo.png" width="120" height="80" />
            </td>
        </tr>
    </table>

</body>
  ';
-- html body ends....................
-- Send email
exec msdb.dbo.sp_send_dbmail @profile_name = 'ITSupport', 
@recipients = @email, 
--@recipients = 'rakibul.it@hameemgroup.com;', 
@blind_copy_recipients='shuvo.it@hameemgroup.com;',
@reply_to = 'noreply@hameemgroup.com',
@subject = @subject, 
@body = @body, 
@body_format = 'HTML';
print @body;
FETCH NEXT 
FROM 
  BirthdayCursor INTO @employeeName, 
  @email;
END CLOSE BirthdayCursor;
DEALLOCATE BirthdayCursor;
DROP 
  TABLE #BirthdayToday;
  END;


--exec BIRTHDAYGREETING;
--drop procedure BIRTHDAYGREETING;
--SELECT * FROM msdb.dbo.sysmail_account;

