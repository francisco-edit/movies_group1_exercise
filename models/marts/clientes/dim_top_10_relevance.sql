with ranked_data as (
    select t.user_id, avg(a.relevance) as avg_relevance,
           row_number() over (order by avg(a.relevance) desc) as row_num
    from {{ref('stg_tag')}} t
    inner join {{ref('stg_relevancy')}} a
    on t.movie_id = a.movie_id
    group by t.user_id
)
select user_id, avg_relevance
from ranked_data
where row_num <= 10