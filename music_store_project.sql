-- Top 5 customer who spend the most.
 
SELECT customer.customer_id, first_name, last_name, SUM(total) AS total_spend FROM customer
INNER JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY SUM(total) DESC
LIMIT 5;

-- Top 5 country who spend the most.

SELECT billing_country, SUM(total) FROM invoice
GROUP BY billing_country
ORDER BY SUM(total) DESC
LIMIT 5;

-- Top 5 track sold.

SELECT name, COUNT(quantity) FROM invoice_line
INNER JOIN track
ON invoice_line.track_id = track.track_id
GROUP BY name
ORDER BY COUNT(quantity) DESC
LIMIT 5;

-- Top 5 most orders

SELECT invoice.customer_id, customer.first_name, customer.last_name, 
COUNT(invoice_id) as total_invoice_id 
FROM invoice
INNER JOIN customer
ON customer.customer_id = invoice.customer_id
GROUP BY invoice.customer_id, customer.first_name, customer.last_name
ORDER BY COUNT(invoice_id)DESC
LIMIT 5;

-- No. of album by artist (top 5)

SELECT album.artist_id,artist.name, COUNT(album_id) AS total_albums FROM album
INNER JOIN artist
ON album.artist_id = artist.artist_id
GROUP BY album.artist_id,artist.name
ORDER BY COUNT(album_id) DESC
LIMIT 5;

-- Customer clasified by there total spend in three category Premium, Plus and Average

SELECT invoice.customer_id ,first_name, last_name, SUM(total) as total_spend,
 CASE 
 WHEN (SUM(total) >= 100) THEN 'Premium'
 WHEN (SUM(total) >= 75) THEN 'Plus'
 Else   'Average'
 END as customer_category
 FROM invoice
 INNER JOIN customer
 ON customer.customer_id = invoice.customer_id
GROUP BY invoice.customer_id ,first_name, last_name
ORDER BY customer_id;





















 


