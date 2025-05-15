select ra.movie_id, ra.rating_date, ta.tag_date
from {{ref('stg_ratings')}} ra
full join {{ref('stg_tag')}} ta
on ra.user_id = ta.user_id
where date_diff(timestamp(ta.tag_date), current_timestamp(), day) >0
or date_diff(timestamp(ra.rating_date), current_timestamp(), day) >0