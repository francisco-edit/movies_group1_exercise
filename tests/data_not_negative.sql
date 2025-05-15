select ra.movie_id, ra.rating, re.relevance
from {{ref('stg_ratings')}} ra
full join {{ref('stg_relevancy')}} re
on ra.movie_id = re.movie_id
where ra.rating < 0
or re.relevance < 0