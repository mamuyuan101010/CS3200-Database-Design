select distinct genres.Name as GenreName, count(TrackId) as NumberOfTracks
from genres inner join tracks on genres.GenreId = tracks.GenreId
group by genres.Name
order by count(TrackId) DESC;