select albums.Title as AlbumTitle, artists.Name as ArtistName
from albums inner join artists on albums.ArtistId = artists.ArtistId
where AlbumId in (select AlbumId
                  from tracks
                  group by AlbumId
                  having count(distinct GenreId) > 1)
order by ArtistName;