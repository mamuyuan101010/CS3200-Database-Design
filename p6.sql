select distinct Composer as forgotComposer
from tracks
where Composer is not null
and GenreId in (select genres.GenreId
                  from genres
                  where genres.Name = 'Jazz'
                  or genres.Name = 'Classical')
and TrackId in (select invoice_items.TrackId
                  from invoice_items
                  where InvoiceId in (select invoices.InvoiceId
                                      from invoices
                                      where CustomerId in (select customers.CustomerId
                                                           from customers
                                                           where Country = 'France'
                                                           and SupportRepId
                                                                   in (select employees.EmployeeId
                                                                       from employees
                                                                       where employees.FirstName='Margaret'
                                                                       and employees.LastName='Park'))
                                      and Total > 10))