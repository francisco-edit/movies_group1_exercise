select count(user_id) as active_users
from (select distinct user_id from {{ref('stg_ratings')}})