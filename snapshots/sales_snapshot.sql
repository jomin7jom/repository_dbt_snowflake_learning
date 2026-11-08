
{% snapshot sales_snapshot %}

{{
    config(
        target_schema='DBT_JVARGHESE',
        unique_key='SALE_ID',
        strategy='check',
        check_cols=['AMOUNT']
    )
}}

SELECT
    SALE_ID,
    AMOUNT
FROM DEV_DB_DBT.TEST_DATA.INCREMENTAL_SALES

{% endsnapshot %}
