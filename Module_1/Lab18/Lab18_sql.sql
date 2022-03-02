create database lab18_apple;
use lab18_apple;
CREATE TABLE lab18_apple ( id INTEGER PRIMARY KEY, track_name TEXT, size_bytes Integer,
currency TEXT, price FLOAT,
rating_count_tot FLOAT,
rating_count_ver FLOAT,
user_rating FLOAT,
user_rating_ver FLOAT,
ver TEXT,
cont_rating FLOAT,
prime_genre TEXT,
sup_devices_num Integer,
ipadSc_urls_num Integer,
lang_num Integer,
vpp_lic			Integer);

select * from lab18_apple;
SELECT * FROM lab18_apple.applestore;
select Count("id"), prime_genre from lab18_apple.applestore
group by prime_genre;

#1. What are the different genres?
select prime_genre from lab18_apple.applestore;

#2. Which is the genre with the most apps rated?
select track_name, rating_count_tot, prime_genre from lab18_apple.applestore
order by rating_count_tot desc;

# 3. Which is the genre with most apps?
select prime_genre, Count("id") from lab18_apple.applestore
group by prime_genre
order by count("id") desc;

#4. Which is the one with least?
select prime_genre, Count("id") from lab18_apple.applestore
group by prime_genre
order by count("id")
limit 1;

#5. Find the top 10 apps most rated.
select track_name, rating_count_tot from lab18_apple.applestore
order by rating_count_tot desc
limit 10;

# 6. Find the top 10 apps best rated by users.
select track_name, user_rating from lab18_apple.applestore
order by user_rating desc
limit 10;

#7. Take a look at the data you retrieved in question 5. Give some insights.
select track_name, rating_count_tot, user_rating, prime_genre from lab18_apple.applestore
order by rating_count_tot desc
limit 10;
#Insights #7: There is no correlation between the number of rates per app and the rating associated. 
#We see here that most rated apps don't have the best ratings

#8. Take a look at the data you retrieved in question 6. Give some insights.
select track_name, user_rating, rating_count_tot, prime_genre from lab18_apple.applestore
order by user_rating desc
limit 10;
#Insights #8: We clearly see that the top rated apps are not the most rated ones.
#In fact, some best rated apps have less than 1000 ratings which is not comparable for one to another.

#9. Now compare the data from questions 5 and 6. What do you see?
#Cf question 7 and 8 for insights. 

#10. How could you take the top 3 regarding both user ratings and number of votes?
select track_name, user_rating, rating_count_tot, prime_genre from lab18_apple.applestore
where user_rating="5"
order by rating_count_tot desc
limit 3;

#11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
select track_name, user_rating, rating_count_tot, price from lab18_apple.applestore
where user_rating="5"
order by rating_count_tot desc
limit 10;

select track_name, rating_count_tot, user_rating, price from lab18_apple.applestore
order by rating_count_tot desc
limit 10;

select track_name, rating_count_tot, user_rating, price from lab18_apple.applestore
order by price desc
limit 10;

#Insights question 11: most rated apps are free apps (9 out of 10).
# However, apps with highest rankings can be free or not - price seems not to be the first parameter for customers.

select avg(price) from lab18_apple.applestore;
