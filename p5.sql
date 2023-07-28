select distinct albums.Title as AlbumTitle, artists.Name as ArtistName
from albums inner join tracks on albums.AlbumId = tracks.AlbumId
inner join artists on albums.ArtistId = artists.ArtistId
where albums.AlbumId in (select tracks.AlbumId
                         from tracks
                         group by tracks.AlbumId
                         having
                             sum(Milliseconds)
                                 > (select avg(timeAlbum)
                                    from (select sum(Milliseconds) as timeAlbum
                                    from albums
                                        inner join tracks on
                                            albums.AlbumId = tracks.AlbumId
                                    group by albums.Title)))
order by albums.Title;