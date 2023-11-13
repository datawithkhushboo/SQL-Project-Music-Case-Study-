
'''EASY'''

''' Who is the senior most employee based on job title'''
select employee_id , first_name || ' '|| last_name as full_name , levels,  title , email from employee
order by levels desc 
limit 1


''' Which Countries have the most invoices? '''
 select count(total) as c,billing_country from invoice
group by billing_country
order by c desc limit 5

''' What are top 3 values of total invoice ?'''


select total from invoice 
order by total desc
limit 3

''' Which city has the best customers ? We would like to throw a promotional Music
 festival in the city we made the most money. Write a query that returns one city that has the
  highest sum of invoice totals. Return both the city name and sum of all invoice totals.'''
  
 select sum(total) as total , billing_city from invoice
 group by billing_city
 order by total desc
 limit 5
 
 
 ''' Who is the best customer ? The customer who has spent the most money will be declared the best 
 customer. Write a query that returns the person who has spent the most money.'''
 
 with cte as 
 (select a.first_name || ' ' || a.last_name as full_name , a.email , b.total from customer a 
 join invoice b using(customer_id))
 
  select full_name , sum(total) as total 
  from cte
  group by full_name
  order by total desc
  limit 1
  
  
  
  
  '''MODERATE'''
  
  
  '''Write query to return email , first_name, last_name, and Genre of all
  Rock Music listeners. Return your list ordered alphabetically by emnail starting with A'''
  

  
  SELECT a.email , a.first_name || ' ' || a.last_name as full_name  from customer a join invoice b 
on a.customer_id = b.customer_id
join Invoice_line c
on b.Invoice_id = c.invoice_id
join
track d
on c.track_id = d.track_id
join genre e
on d.Genre_id = e.genre_id
where e.name='Rock' 
ORDER BY EMAIL


''' Let invite the artist who have written the most rock music in our dataset.
Write a query that returns the artist name and total track count of top 10
rock bands '''



select a.name , count(
c.track_id ) as Number_of_track
from artist a join album b on 
a.artist_id =b.artist_id
join track c
on b.album_id=c.album_id
join genre d on 
c.genre_id = d.genre_id
where d.name ='Rock'
group by a.name
order by Number_of_track desc
limit 10 


''' Return all the track names that have a song length longer than the average song length.
Return the name and miliseconds for each track. Order by the song length with the longest songs listed first
'''


 select name , milliseconds from track
 where milliseconds > ( select avg(milliseconds) from track )
 order by milliseconds desc













  