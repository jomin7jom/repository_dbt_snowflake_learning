
{{
    config(
        materialized='incremental',
        unique_key='SALE_ID',
        incremental_strategy='merge'
    )
}}

SELECT
    SALE_ID,
    AMOUNT,
    CASE
        WHEN AMOUNT >= 500 THEN 'HIGH'
        ELSE 'LOW'
    END AS CATEGORY
FROM DEV_DB_DBT.TEST_DATA.INCREMENTAL_SALES

{% if is_incremental() %}

WHERE SALE_ID NOT IN (
    SELECT SALE_ID FROM {{ this }}
)

{% endif %}
