create database digital_musicstore;

#Q1: Who is the senior most employee based on job title?
select * from employee;
select * from employee order by levels desc limit 1;
#1	Adams	Andrew	General Manager	9	L6	18-02-1962 00:00	14-08-2016 00:00	11120 Jasper Ave NW	Edmonton	AB	Canada	T5K 2N1	+1 (780) 428-9482

#Q2: What is total invoice?
select * from invoice;
select sum(total) as Total_invoice from invoice;
# Total_invoice=4709.429999999994

#Q3: Which Countries have the most Invoices?
select * from invoice;
select count(*) as count,billing_country from invoice group by billing_country order by count desc;

#Q4: What are top 10 values of total invoices?
select * from invoice;
select * from invoice order by total desc;
select * from invoice order by total desc limit 10;

#Q5: Which city has the best customers?
select * from invoice;
select sum(total) as total,billing_city from invoice group by billing_city order by total desc;

#Q6: Who is the customer who has spent the most money?
select * from customer;
select customer.customer_id , customer.first_name, customer.last_name, sum(invoice.total) as total
from customer 
join invoice on customer.customer_id = invoice.customer_id 
group by customer.customer_id order by total desc limit 1; 

#Q7: Write query to return the email, first name, last name and genre of all rock music listners?
select distinct email, first_name, last_name from customer;
select * from track;
select * from genre;
select distinct email, first_name, last_name from customer 
join invoice on customer.customer_id= invoice.customer_id
join invoice_line on invoice.invoice_id= invoice_line.invoice_id
where track_id in(select track_id from track join genre on track.genre_id = genre.genre_id where genre.name like 'Rock')
order by email;

#Q8: Return the name and millisec for all track names tht have a song lenght longer than avg song length?
select * from track;
select name, milliseconds from track where milliseconds>(select avg(milliseconds) as avg_length from track)
order by milliseconds desc;

