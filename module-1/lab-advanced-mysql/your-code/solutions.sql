/*challenge 1 : liste des titres publiés pour chacun des auteurs avec le nom de la maison d'édition*/
	/*step 1*/
CREATE TEMPORARY TABLE publications.royalties_sales
SELECT titles.title_id AS `Title ID`, authors.au_id AS `AUTHOR ID`, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS `sales_royalty`
FROM publications.titles
LEFT JOIN publications.titleauthor ON titleauthor.title_id= titles.title_id
LEFT JOIN publications.authors ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.sales ON titles.title_id=sales.title_id

	/*step 2*/
CREATE TEMPORARY TABLE publications.aggregate_royalties
SELECT `Title ID`, `AUTHOR ID`, SUM(`sales_royalty`) AS sale_royalty
FROM publications.royalties_sales
GROUP BY `AUTHOR ID`, `Title ID`

	/*step 3*/
SELECT `Title ID`,`AUTHOR ID`, (sale_royalty+titles.advance) AS `total_profit`
FROM publications.aggregate_royalties
LEFT JOIN publications.titles ON `Title ID` = titles.title_id
GROUP BY `AUTHOR ID`, `Title ID`,`total_profit`
ORDER BY `total_profit` DESC
limit 3;


/*challenge 2*/
SELECT `Title ID`,`AUTHOR ID`, (sale_royalty+titles.advance) AS `total_profit`
FROM (
	SELECT `Title ID`,`AUTHOR ID`,SUM(`sales_royalty`) AS sale_royalty 
	FROM
	 (
	 SELECT titles.title_id AS `Title ID`, authors.au_id AS `AUTHOR ID`, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS `sales_royalty`
		FROM publications.titles
		LEFT JOIN publications.titleauthor ON titleauthor.title_id= titles.title_id
		LEFT JOIN publications.authors ON authors.au_id = titleauthor.au_id
		LEFT JOIN publications.sales ON titles.title_id=sales.title_id
		) t2
	GROUP BY `Title ID`,`AUTHOR ID`
		)t1
	
LEFT JOIN publications.titles ON `Title ID` = titles.title_id
GROUP BY `AUTHOR ID`, `Title ID`,`total_profit`
ORDER BY `total_profit` DESC
limit 3;

/*challenge 3*/
DROP TABLE IF EXISTS `most_profiting_authors`;
CREATE TABLE `most_profiting_authors` (
  `au_id` char(11) DEFAULT NULL,
  `profits` decimal(19,4) DEFAULT NULL,
  CONSTRAINT `tmost_profiting_authors_ibfk_1` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `most_profiting_authors`(`au_id`,`profits`)
SELECT `au_id`, (sale_royalty+titles.advance) AS `profits`
FROM (
	SELECT `Title ID`,`au_id`,SUM(`sales_royalty`) AS sale_royalty 
	FROM
	 (
	 SELECT titles.title_id AS `Title ID`, authors.au_id AS `au_id`, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS `sales_royalty`
		FROM publications.titles
		LEFT JOIN publications.titleauthor ON titleauthor.title_id= titles.title_id
		LEFT JOIN publications.authors ON authors.au_id = titleauthor.au_id
		LEFT JOIN publications.sales ON titles.title_id=sales.title_id
		) t2
	GROUP BY `Title ID`,`au_id`
		)t1
	
LEFT JOIN publications.titles ON `Title ID` = titles.title_id
GROUP BY `au_id`,`profits`





