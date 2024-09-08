Quickstart:   Credit Card Fraud Detection using Snowflake ML
Version:      v1     
Author:       Kala Govindarajan
Copyright(c): 2024 Snowflake Inc. All rights reserved.
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              Comments
------------------- ------------------- ------------------------------------------------------------
2024-08-05          Kala Govindarajan     Initial Release
***************************************************************************************************/

USE ROLE sysadmin;


CREATE DATABASE CC_FINS_DB;

USE DATABASE CC_FINS_DB;

CREATE SCHEMA ANALYTICS;

CREATE OR REPLACE WAREHOUSE FD_WH WITH WAREHOUSE_SIZE=’XSMALL’;

CREATE OR REPLACE STAGE CC_FINS_DB.ANALYTICS.FRAUD_DETECTION_APP 
DIRECTORY = (ENABLE = TRUE) 
ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');




-- Create Streamlit App
USE ROLE sysadmin;
CREATE OR REPLACE STREAMLIT CC_FINS_DB.ANALYTICS.FRAUDDETECTION_APP
ROOT_LOCATION = '@CC_FINS_DB.ANALYTICS.FRAUD_DETECTION_APP'
MAIN_FILE = 'Fraud_Detection.py'
QUERY_WAREHOUSE = 'CC_FINS_WH';
