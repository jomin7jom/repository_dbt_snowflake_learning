
{{ config(materialized='view') }}

SELECT
    SALE_ID,
    AMOUNT,
    CASE
        WHEN AMOUNT >= 500 THEN 'HIGH'
        ELSE 'LOW'
    END AS CATEGORY
FROM DEV_DB_DBT.TEST_DATA.INCREMENTAL_SALES
