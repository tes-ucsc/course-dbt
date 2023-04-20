with source as (
    select * from {{source('postgres', 'addresses')}}
)

, recast as (
    select address_id as address_guid,
    state,
    lpad(zipcode, 5, 0) as zip_code,
    country
    from source

)

select * from recast