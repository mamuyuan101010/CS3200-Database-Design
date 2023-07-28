select distinct BillingCountry as CountryName
from invoices
where InvoiceId in (select invoice_items.InvoiceId
                    from invoice_items
                    where TrackId in (select tracks.TrackId
                                      from tracks
                                      where MediaTypeId in(select media_types.MediaTypeId
                                                           from media_types
                                                           where media_types.Name = 'Protected MPEG-4 video file')
                                      and GenreId in (select genres.GenreId
                                                      from genres
                                                      where genres.Name = 'Drama')))
order by CountryName;