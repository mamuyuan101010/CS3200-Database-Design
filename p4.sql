select tracks.Name as TrackName,albums.Title as AlbumTitle, tracks.Composer as ComposerList
from tracks inner join albums on tracks.AlbumId = albums.AlbumId
where tracks.Composer like '%Steven Tyler%'
  and (not tracks.Composer like '%Joe Perry%')
order by tracks.Name;