USE datamanufacturing;
SELECT
*
FROM
`manufacture appliance test results`;
ALTER TABLE `manufacture appliance test results`
DROP COLUMN FaultCode2,
DROP COLUMN FaultCode3,
DROP COLUMN FaultCode4,
DROP COLUMN FaultCode5;

SELECT *
INTO OUTFILE 'C:\Users\guest1\OneDrive\Desktop\data analytics portfolio projects\Quality analysis project'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM `manufacture appliance test results`;
