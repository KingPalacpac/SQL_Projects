-- View all data from table

SELECT * FROM SQLProject..MCUMovieEarnings

-- Sort data from date release and its budget

SELECT film, year, budget 
FROM SQLProject..MCUMovieEarnings AS MCUEarn
ORDER BY year DESC

-- Show the MCU movie with the highest budget

SELECT film, budget
FROM SQLProject..MCUMovieEarnings AS MCUEarn
ORDER BY budget DESC

-- This shows that all the Avenger's movie have the highest budget given that this movie is a collection of
--all marvel characters in one screen and also the conclusion of every phase in MCU

-----------------------------------------------------------------------------------------------------------

-- View the worldwide gross income of all the movies

SELECT film, year, worldwide_gross_m
FROM SQLProject..MCUMovieEarnings AS MCUEarn
ORDER BY worldwide_gross_m DESC

-- This shows that still last installment of avengers in infinity saga tops the worldwide gross but spider-man
-- No way home holds in 3rd place as this movie is the most anticipated crossovers of three spiderman in different eras

-----------------------------------------------------------------------------------------------------------

-- View Domestic gross compare to its budget

SELECT film, domestic_gross_m, budget, IncomeStatus
FROM ( SELECT film, domestic_gross_m, budget, 
	CASE
		WHEN domestic_gross_m > budget THEN 'Gain'
		WHEN domestic_gross_m = budget THEN 'Equal'
		WHEN domestic_gross_m < budget THEN 'Loss'
	END AS IncomeStatus
FROM SQLProject..MCUMovieEarnings 
) AS McuGross
WHERE IncomeStatus = 'Loss'

-- This shows that only 3 MCU films (Eternals, Black Widow, Incredible Hulk) will be considered to have a 
-- loss domestically, although one if this is close to the movie budget, a loss is a loss even it's a difference in penny

-----------------------------------------------------------------------------------------------------------

-- View International gross compare to its budget

SELECT film, international_gross_m, budget, IncomeStatus
FROM ( SELECT film, international_gross_m, budget, 
	CASE
		WHEN international_gross_m > budget THEN 'Gain'
		WHEN international_gross_m = budget THEN 'Equal'
		WHEN international_gross_m < budget THEN 'Loss'
	END AS IncomeStatus
FROM SQLProject..MCUMovieEarnings 
) AS McuGross
WHERE IncomeStatus = 'Gain'

-- Although Eternals has an income loss domestically, it surprass its movie budget international with an income gross of
-- 37 million. This proves that movies might not work locally, but still in some country they still watch and love it.

-----------------------------------------------------------------------------------------------------------

-- View worldwide gross income compare to its budget

SELECT film, worldwide_gross_m, budget, IncomeStatus
FROM ( SELECT film, worldwide_gross_m, budget, 
	CASE
		WHEN worldwide_gross_m > budget THEN 'Gain'
		WHEN worldwide_gross_m = budget THEN 'Equal'
		WHEN worldwide_gross_m < budget THEN 'Loss'
	END AS IncomeStatus
FROM SQLProject..MCUMovieEarnings 
) AS McuGross
WHERE IncomeStatus = 'Loss'

-- This shows that MCU films income wise, all gain to their films. Some have loss in domestic or international, still Marvel
-- Studios gain a lot of income worldwide

-----------------------------------------------------------------------------------------------------------

-- To figure out if moview reviews affect the income of the movie

SELECT Earn.film, worldwide_gross_m, budget,
		(worldwide_gross_m - budget) AS Income,
		(critics_score + audience_score) / 2 AS AvgScore
FROM SQLProject..MCUMovieEarnings AS Earn
JOIN SQLProject..MCUMovieReview AS Rev
	ON Earn.film = Rev.film
ORDER BY AvgScore 

-- This shows that critics and audience score have less impact on MCU movies income, some movies have a high movie score but less
-- income gain while others have low movie score but have high income gain. To summarize this table, MCU movies already establish
-- their reputation when it comes to superhero movies, so it doesn't matter how good or bad the review is, if it's marvel movie,
-- fans or normal movie goers are always curious what movie will brings them and how this movie affects the next film.
