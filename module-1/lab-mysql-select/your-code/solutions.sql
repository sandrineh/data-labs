/*challenge 1 : liste des titres publiés pour chacun des auteurs avec le nom de la maison d'édition*/
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, titles.title AS TITLE, publishers.pub_name AS PUBLISHER 
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles ON titleauthor.title_id= titles.title_id
LEFT JOIN publications.publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC;

/*challenge 2 : liste du nombre de titres publiés pour chacun des auteurs par maison d'édition*/
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, publishers.pub_name AS PUBLISHER, COUNT(titles.title) AS `TITLE COUNT` 
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles ON titleauthor.title_id= titles.title_id
LEFT JOIN publications.publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, PUBLISHER
ORDER BY `TITLE COUNT` DESC;

/*challenge 3 : top 3 des auteurs qui ont le plus vendus*/
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, SUM(titles.ytd_sales) AS TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles ON titleauthor.title_id= titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/*challenge 4 : top 3 des auteurs qui ont le plus vendus*/
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, IFNULL(SUM(titles.ytd_sales),0)AS TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles ON titleauthor.title_id= titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC

/*Bonus challenge: top 3 des auteurs qui ont le plus de profit A FINIR*/
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, (SUM(titles.advance*titleauthor.royaltyper/100)+SUM(titles.royalty*titleauthor.royaltyper/100)) AS PROFIT/*, titleauthor.royaltyper, titles.title_id,titles.advance,titles.royalty*/
FROM publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles ON titleauthor.title_id= titles.title_id
GROUP BY authors.au_id/*, titleauthor.royaltyper,titles.title_id*/
ORDER BY PROFIT DESC
LIMIT 3;
