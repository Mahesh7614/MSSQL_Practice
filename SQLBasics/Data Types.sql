-- numeric Data types
		--	Lower Limit      Higher Limit
bigint --    -2^63        to    2^63-1
int    --    -2^31        to    2^31-1 
smallint --  -2^15        to    2^15
tinyint  --    0          to    255
bit      --    0          or     1
decimal  --  -10^381      to    10^381-1
numeric  --  -10^381       to    10^381-1   it has more precision than decimal after point 
smallmoney--  −214,478.3648 to    +214478.3647
money     --   −922,337, 203, 685,477.5808 to +922,337, 203, 685,477.5807
float     --    -1.79E+308    to  1.79E+308 -- 7 digit precision
real      --    -3.40E+38     to  3.40E+38  -- 15 digit precision


-- Date and Time Data Types
datetime --   1753-01-01 to 9999-12-31   -- Rounded to increments of 0.000,.003,.007
smalldatetime -- 1900-01-01   to 2079-06-06   -- accuracy 1 min
date        --   0001-01-01    to 9999-12-31   -- accuracy 1 day
time        --   00:00:00.0000000   to  23:59:59.9999999  -- accuracy 100 nanoseconds
datetimeoffset -- 0001-01-01       to   9999-12-31 -- accuracy 100 nanoseconds  it has time zone offset
datetime2     -- 0001-01-01        to   9999-12-31   -- accuracy 100 nanoseconds


-- Character strings data types
char -- 0    to 8000 chars  -- used when fixed length of string we have to use, it is faster 
varchar -- 0  to 8000 chars -- use when variable length of string , it is slower than chars, it has 2 byte extra memory than chars
varchar(max) -- 0 to 	2^31 chars 
text --   0   to    2,147,483,647 chars

-- unicode character string data types
nchar -- 0 to 4000 chars
nvarchar -- 0 to 4000 chars
ntext    -- 0 to 1,073,741,823 char
