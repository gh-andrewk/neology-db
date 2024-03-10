select * from tracks
where duration = (select max(duration) from tracks);
select * from tracks
where duration > 210;
select * from digests
where year <= 2020 and year >= 2018;
select * from tracks
where title like '%my%';

select count(styles.id), title
from styles
left join styles_artists on styles_artists.style_id = styles.id
left join artists on artists.id = styles_artists.artist_id
group by styles.id;

select count(DISTINCT tracks.id)
from 
  digests
left join digests_tracks 
  on digests_tracks.digest_id = digests.id
left join tracks
  on digests_tracks.track_id = tracks.id
where
  digests.year between 2019 and 2020;

select avg(tracks.duration)
from 
  tracks
left join albums
  on albums.id = tracks.album_id
group by albums.id;

select distinct artists.name
from 
  albums
left join albums_artists
  on albums_artists.album_id = albums.id
left join artists
  on albums_artists.artist_id = artists.id
where 
  albums.year <> 2020
group by
  artists.id;

select distinct digests.title
from 
  artists
left join albums_artists
  on albums_artists.artist_id = artists.id
left join albums
  on albums_artists.album_id = albums.id
left join tracks
  on tracks.album_id = albums.id
left join digests_tracks
  on digests_tracks.track_id = tracks.id
left join digests
  on digests_tracks.digest_id = digests.id
where artists.name = 'Eminem';







