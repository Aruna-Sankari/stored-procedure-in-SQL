Delimiter //
create procedure getbranches()
BEGIN
select * from branch;
END //
Delimiter ;

call getbranches();

-- VARIABLES --
Delimiter $$
create procedure employeecnt()
BEGIN
Declare total int default 0;
select count(empid) into total from employee;
select total;
END $$
Delimiter ;

call employeecnt();

-- TYPES OF PARAMETERS IN STORED PROCEDURE --

-- IN PARAMETER --
Delimiter $$
create procedure employeecnt1(
IN jdesc varchar(10)
)
BEGIN
Declare total int default 0;
select count(empid) into total from employee where job_desc=jdesc;
select total;
END $$
Delimiter ;

call employeecnt1('HR');

-- OUT PARAMETER --
Delimiter $$
create procedure employeecnt2(
IN jdesc varchar(10),
OUT total int
)
BEGIN
select count(empid) into total from employee where job_desc=jdesc;
END $$
Delimiter ;

call employeecnt2('Sales',@tot);
select @tot;

-- INOUT PARAMETER --
Delimiter $$
create procedure Incrcounter(
INOUT counter int,
IN incr int
)
BEGIN
set counter=counter+ incr;
END $$
Delimiter ;

set @counter=4;
call Incrcounter(@counter,5);
select @counter;