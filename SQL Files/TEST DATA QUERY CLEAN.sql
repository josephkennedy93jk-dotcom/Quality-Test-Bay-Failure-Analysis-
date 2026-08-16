--Select Database Schema
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

ALTER TABLE `manufacture appliance test results`
DROP COLUMN QualityAudit;
--Remove another column not needed 
ALTER TABLE `manufacture appliance test results`
DROP COLUMN AssEmpNumber;
--Remove another column not needed 
ALTER TABLE `manufacture appliance test results`
DROP COLUMN StartTime,
DROP COLUMN FinishTime;
--Check what we are left with
SHOW COLUMNS FROM `manufacture appliance test results`
