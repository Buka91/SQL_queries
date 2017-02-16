-- 1. Homework

-- This database has many tables. Write an SQL command that will print Name from the table Artist (for all the database entries)
SELECT Artist.Name FROM Artist;

-- Print all data from the table Invoice where BillingCountry is Germany
SELECT * FROM Invoice
WHERE Invoice.BillingCountry = 'Germany';

-- Count how many albums are in the database.
SELECT COUNT(*) FROM Album;

-- How many customers are from France?
SELECT COUNT(*) FROM Customer
WHERE Customer.Country = 'France';

-- 2. Homework

-- What order (Invoice) was the most expensive? Which one was the cheapest?
SELECT MAX(Invoice.Total) FROM Invoice;

SELECT MIN(Invoice.Total) FROM Invoice;

-- Which city (BillingCity) has the most orders?
SELECT COUNT(*), Invoice.BillingCity FROM Invoice
GROUP BY Invoice.BillingCity
ORDER BY COUNT(*) DESC;

-- Calculate (or count) how many tracks have this MediaType: Protected AAC audio file.
SELECT COUNT(*) FROM MediaType JOIN Track ON MediaType.MediaTypeId = Track.MediaTypeId
WHERE MediaType.Name = 'Protected AAC audio file';

-- Find out what Artist has the most albums? (hint: check ORDER BY)
SELECT Artist.Name, COUNT(*) FROM Artist JOIN Album ON (Artist.ArtistId = Album.ArtistId)
GROUP BY Artist.Name
ORDER BY COUNT(*) DESC;

-- What genre has the most tracks?
SELECT Genre.Name, COUNT(*) FROM Genre JOIN Track ON (Genre.GenreId = Track.GenreId)
GROUP BY Genre.Name
ORDER BY COUNT(*) DESC;

-- Which customer spent the most money so far?
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) FROM Customer JOIN Invoice ON (Customer.CustomerId = Invoice.CustomerId)
GROUP BY Customer.FirstName, Customer.LastName
ORDER BY SUM(Invoice.Total) DESC;

-- What songs were bought with each order?
SELECT Invoice.InvoiceId, Track.Name FROM Invoice JOIN InvoiceLine ON (Invoice.InvoiceId = InvoiceLine.InvoiceId)
JOIN Track ON (InvoiceLine.TrackId = Track.TrackId);