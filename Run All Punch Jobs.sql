

DECLARE @job_id UNIQUEIDENTIFIER;
DECLARE @job_name NVARCHAR(128);
DECLARE @execute_job_command NVARCHAR(4000);

DECLARE job_cursor CURSOR FOR
SELECT job_id, name
FROM msdb.dbo.sysjobs
WHERE enabled = 1
AND (name LIKE '%CORE%' OR name LIKE '%SUPR%')
;

OPEN job_cursor;

FETCH NEXT FROM job_cursor INTO @job_id, @job_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Executing job: ' + @job_name;
    SET @execute_job_command = 'EXEC msdb.dbo.sp_start_job @job_id = ''' + CAST(@job_id AS NVARCHAR(36)) + '''';
    EXEC sp_executesql @execute_job_command;

    FETCH NEXT FROM job_cursor INTO @job_id, @job_name;
END;

CLOSE job_cursor;
DEALLOCATE job_cursor;

GO

DECLARE @job_id UNIQUEIDENTIFIER;
DECLARE @job_name NVARCHAR(128);
DECLARE @execute_job_command NVARCHAR(4000);

-- Define the linked server name
DECLARE @LinkedServerName NVARCHAR(128) = '[192.168.20.100,4368]';

DECLARE @SqlRPC NVARCHAR(200)='

EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc'', @optvalue = ''true'';
EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc out'', @optvalue = ''true'';
'
EXEC sp_executesql @SqlRPC

-- Query to retrieve all active jobs on the linked server
DECLARE job_cursor CURSOR FOR
SELECT job_id, name
FROM OPENQUERY([192.168.20.100,4368], '
    SELECT job_id, name 
    FROM msdb.dbo.sysjobs 
    WHERE enabled = 1
	AND (name LIKE ''%CORE%'' OR name LIKE ''%SUPR%'')
');

OPEN job_cursor;

FETCH NEXT FROM job_cursor INTO @job_id, @job_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Executing job: ' + @job_name;
    SET @execute_job_command = '
        EXEC ' + @LinkedServerName + '.msdb.dbo.sp_start_job @job_id = ''' + CAST(@job_id AS NVARCHAR(36)) + '''
    ';

	PRINT @execute_job_command
    EXEC sp_executesql @execute_job_command;

    FETCH NEXT FROM job_cursor INTO @job_id, @job_name;
END;

CLOSE job_cursor;
DEALLOCATE job_cursor;

GO

DECLARE @job_id UNIQUEIDENTIFIER;
DECLARE @job_name NVARCHAR(128);
DECLARE @execute_job_command NVARCHAR(4000);

-- Define the linked server name
DECLARE @LinkedServerName NVARCHAR(128) = '[192.168.40.100,4368]';

DECLARE @SqlRPC NVARCHAR(200)='

EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc'', @optvalue = ''true'';
EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc out'', @optvalue = ''true'';
'
EXEC sp_executesql @SqlRPC

-- Query to retrieve all active jobs on the linked server
DECLARE job_cursor CURSOR FOR
SELECT job_id, name
FROM OPENQUERY([192.168.40.100,4368], '
    SELECT job_id, name 
    FROM msdb.dbo.sysjobs 
    WHERE enabled = 1
	AND (name LIKE ''%CORE%'' OR name LIKE ''%SUPR%'')
');

OPEN job_cursor;

FETCH NEXT FROM job_cursor INTO @job_id, @job_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Executing job: ' + @job_name;
    SET @execute_job_command = '
        EXEC ' + @LinkedServerName + '.msdb.dbo.sp_start_job @job_id = ''' + CAST(@job_id AS NVARCHAR(36)) + '''
    ';

	PRINT @execute_job_command
    EXEC sp_executesql @execute_job_command;

    FETCH NEXT FROM job_cursor INTO @job_id, @job_name;
END;

CLOSE job_cursor;
DEALLOCATE job_cursor;

GO

DECLARE @job_id UNIQUEIDENTIFIER;
DECLARE @job_name NVARCHAR(128);
DECLARE @execute_job_command NVARCHAR(4000);

-- Define the linked server name
DECLARE @LinkedServerName NVARCHAR(128) = '[192.168.10.3,4368]';

DECLARE @SqlRPC NVARCHAR(200)='

EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc'', @optvalue = ''true'';
EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc out'', @optvalue = ''true'';
'
EXEC sp_executesql @SqlRPC

-- Query to retrieve all active jobs on the linked server
DECLARE job_cursor CURSOR FOR
SELECT job_id, name
FROM OPENQUERY([192.168.10.3,4368], '
    SELECT job_id, name 
    FROM msdb.dbo.sysjobs 
    WHERE enabled = 1
	AND (name LIKE ''%CORE%'' OR name LIKE ''%SUPR%'')
');

OPEN job_cursor;

FETCH NEXT FROM job_cursor INTO @job_id, @job_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Executing job: ' + @job_name;
    SET @execute_job_command = '
        EXEC ' + @LinkedServerName + '.msdb.dbo.sp_start_job @job_id = ''' + CAST(@job_id AS NVARCHAR(36)) + '''
    ';

	PRINT @execute_job_command
    EXEC sp_executesql @execute_job_command;

    FETCH NEXT FROM job_cursor INTO @job_id, @job_name;
END;

CLOSE job_cursor;
DEALLOCATE job_cursor;


GO

DECLARE @job_id UNIQUEIDENTIFIER;
DECLARE @job_name NVARCHAR(128);
DECLARE @execute_job_command NVARCHAR(4000);

-- Define the linked server name
DECLARE @LinkedServerName NVARCHAR(128) = '[192.168.10.4,4368]';

DECLARE @SqlRPC NVARCHAR(200)='

EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc'', @optvalue = ''true'';
EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc out'', @optvalue = ''true'';
'
EXEC sp_executesql @SqlRPC

-- Query to retrieve all active jobs on the linked server
DECLARE job_cursor CURSOR FOR
SELECT job_id, name
FROM OPENQUERY([192.168.10.4,4368], '
    SELECT job_id, name 
    FROM msdb.dbo.sysjobs 
    WHERE enabled = 1
	AND (name LIKE ''%CORE%'' OR name LIKE ''%SUPR%'')
');

OPEN job_cursor;

FETCH NEXT FROM job_cursor INTO @job_id, @job_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Executing job: ' + @job_name;
    SET @execute_job_command = '
        EXEC ' + @LinkedServerName + '.msdb.dbo.sp_start_job @job_id = ''' + CAST(@job_id AS NVARCHAR(36)) + '''
    ';

	PRINT @execute_job_command
    EXEC sp_executesql @execute_job_command;

    FETCH NEXT FROM job_cursor INTO @job_id, @job_name;
END;

CLOSE job_cursor;
DEALLOCATE job_cursor;

GO


DECLARE @job_id UNIQUEIDENTIFIER;
DECLARE @job_name NVARCHAR(128);
DECLARE @execute_job_command NVARCHAR(4000);

-- Define the linked server name
DECLARE @LinkedServerName NVARCHAR(128) = '[192.168.14.246,4368]';

DECLARE @SqlRPC NVARCHAR(200)='

EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc'', @optvalue = ''true'';
EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc out'', @optvalue = ''true'';
'
EXEC sp_executesql @SqlRPC

-- Query to retrieve all active jobs on the linked server
DECLARE job_cursor CURSOR FOR
SELECT job_id, name
FROM OPENQUERY([192.168.14.246,4368], '
    SELECT job_id, name 
    FROM msdb.dbo.sysjobs 
    WHERE enabled = 1
	AND (name LIKE ''%CORE%'' OR name LIKE ''%SUPR%'')
');

OPEN job_cursor;

FETCH NEXT FROM job_cursor INTO @job_id, @job_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Executing job: ' + @job_name;
    SET @execute_job_command = '
        EXEC ' + @LinkedServerName + '.msdb.dbo.sp_start_job @job_id = ''' + CAST(@job_id AS NVARCHAR(36)) + '''
    ';

	PRINT @execute_job_command
    EXEC sp_executesql @execute_job_command;

    FETCH NEXT FROM job_cursor INTO @job_id, @job_name;
END;

CLOSE job_cursor;
DEALLOCATE job_cursor;

GO


DECLARE @job_id UNIQUEIDENTIFIER;
DECLARE @job_name NVARCHAR(128);
DECLARE @execute_job_command NVARCHAR(4000);

-- Define the linked server name
DECLARE @LinkedServerName NVARCHAR(128) = '[192.168.14.2,4368]';

DECLARE @SqlRPC NVARCHAR(200)='

EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc'', @optvalue = ''true'';
EXEC sp_serveroption @server = '+@LinkedServerName+', @optname = ''rpc out'', @optvalue = ''true'';
'
EXEC sp_executesql @SqlRPC

-- Query to retrieve all active jobs on the linked server
DECLARE job_cursor CURSOR FOR
SELECT job_id, name
FROM OPENQUERY([192.168.14.2,4368], '
    SELECT job_id, name 
    FROM msdb.dbo.sysjobs 
    WHERE enabled = 1
	AND (name LIKE ''%CORE%'' OR name LIKE ''%SUPR%'')
');

OPEN job_cursor;

FETCH NEXT FROM job_cursor INTO @job_id, @job_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Executing job: ' + @job_name;
    SET @execute_job_command = '
        EXEC ' + @LinkedServerName + '.msdb.dbo.sp_start_job @job_id = ''' + CAST(@job_id AS NVARCHAR(36)) + '''
    ';

	PRINT @execute_job_command
    EXEC sp_executesql @execute_job_command;

    FETCH NEXT FROM job_cursor INTO @job_id, @job_name;
END;

CLOSE job_cursor;
DEALLOCATE job_cursor;

