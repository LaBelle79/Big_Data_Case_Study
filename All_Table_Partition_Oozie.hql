SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT INTO TABLE CDW_SAPP_D_BRANCH
PARTITION (BRANCH_ZIP)

Select	BRANCH_CODE, BRANCH_NAME, BRANCH_STREET, BRANCH_CITY,
	BRANCH_STATE, BRANCH_PHONE, LAST_UPDATED, BRANCH_ZIP 		
FROM	BRANCH_Inre_Oozie;

SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT INTO TABLE CDW_SAPP_D_CUSTOMER 
PARTITION (CUST_STATE)
Select 	CUST_SSN, CUST_F_NAME, CUST_M_NAME, CUST_L_NAME, CUST_CC_NO,	
	CUST_STREET, CUST_CITY, CUST_COUNTRY, CUST_ZIP, CUST_PHONE,		
	CUST_EMAIL, LAST_UPDATED, CUST_STATE
FROM	CUSTOMER_Incre_Oozie;

SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT INTO TABLE CDW_SAPP_F_CREDIT
PARTITION (TRANSACTION_TYPE)

Select		CUST_CC_NO, TIMEID, CUST_SSN, BRANCH_CODE,
		TRANSACTION_VALUE, TRANSACTION_ID, TRANSACTION_TYPE
FROM		CREDIT_CARD_Incre_Oozie;



SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT INTO TABLE CDW_SAPP_D_TIME 
PARTITION	(QUARTER)

SELECT		TRANSACTION_ID, TIMEID, DAY, MONTH, 
		YEAR, QUARTER	
FROM		TIMEID_Incre_Oozie;
