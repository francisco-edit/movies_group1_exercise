select *
from (select user_id, avg(rating) as avg_rating
from {{ref('stg_ratings')}}
group by user_id)
where avg_rating = 0