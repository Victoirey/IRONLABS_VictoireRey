use publications2;

select * from publishers;
select * from titles;
select * from authors;
select * from titleauthor;

#CHALLENGE 1
create table xyz(
SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, title AS TITLE, publishers.pub_name AS PUBLISHER
FROM
(SELECT au_id, au_lname, au_fname, titles.title, titles.pub_id
FROM
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
ORDER BY B.au_id ASC, B.title DESC);

#CHALLENGE 2
select * from xyz;

select AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, count(TITLE) from xyz
group by AUTHOR_ID, PUBLISHER
order by count(TITLE) desc;

SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, COUNT(B.title) AS NUMTITLE, publishers.pub_name AS PUBLISHER
FROM
(SELECT au_id, au_lname, au_fname, titles.title, titles.pub_id
FROM
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
group by AUTHOR_ID, PUBLISHER
ORDER BY AUTHOR_ID DESC, PUBLISHER DESC;

#CHALLENGE 3
select AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, count(TITLE) from xyz
group by AUTHOR_ID
order by count(TITLE) desc
limit 3;

#CHALLENGE 4
# Table with all authors including those with no titles
SELECT authors.au_id, authors.au_lname, authors.au_fname, count(titleauthor.title_id)
FROM authors
left join titleauthor
ON authors.au_id = titleauthor.au_id
group by authors.au_id
order by count(titleauthor.title_id) desc;