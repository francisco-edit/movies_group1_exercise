select user_id, avaliacao_media
from {{ref('dim_user_fidelity')}}
where avaliacao_media < (select avg(avaliacao_media) from {{ref('dim_user_fidelity')}})