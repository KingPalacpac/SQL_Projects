--View all data on MCUMovieReview table

SELECT * FROM SQLProject..MCUMovieReview

----------------------------------------------------------------------------------------------------------------

--Sort by date from newest to oldest

SELECT * FROM SQLProject..MCUMovieReview
ORDER BY year DESC

----------------------------------------------------------------------------------------------------------------

--Sort by year release and has the highest critic score

SELECT MCURev.film, MCURev.year, MCURev.critics_score
FROM SQLProject..MCUMovieReview AS MCURev
ORDER BY MCURev.critics_score DESC

--Avengers : End Game is the biggest project done by MCU but still Black Panther have the highest critic score
--with 96%, for the reason that this movie presents the culture, politics and race that caught many critics attention.

-----------------------------------------------------------------------------------------------------------------

--Sort by year release and has the highest audience score

SELECT MCURev.film, MCURev.year, MCURev.audience_score
FROM SQLProject..MCUMovieReview AS MCURev
ORDER BY MCURev.audience_score DESC

--Everyone love's Spiderman ever since, from Toby to Andrew, and now Tom. So many fans love every spiderman movie
--and everyone blows their mind when they see all of spiderman in one screen, it's a no brainer that audience will
--love this movie crossovers that they didn't expect to see

-------------------------------------------------------------------------------------------------------------------

--MCU Films grouped by year release with rotten tomato "Fresh" rating (60% and above) by critics

SELECT MCURev.film, MCURev.year, MCURev.critics_score
FROM SQLProject..MCUMovieReview AS MCURev
WHERE MCURev.critics_score >= 0.60
ORDER BY MCURev.critics_score DESC

--Almost all of the MCU have a "Fresh" rating score, with black panther with 96% the highest and Thor: Love and 
--Thunder with the lowest "Fresh" rating with 64%

-------------------------------------------------------------------------------------------------------------------

--MCU Films grouped by year release with rotten tomato "Fresh" rating (60% and above) by audience

SELECT MCURev.film, MCURev.year, MCURev.audience_score
FROM SQLProject..MCUMovieReview AS MCURev
WHERE MCURev.audience_score >= 0.60
ORDER BY MCURev.audience_score DESC

--Almost all of the MCU have a "Fresh" rating score, the audience loved the most is Spider-man: No Way Home and
--still Thor: Love and Thunder has the lowest "Fresh" audience rating with 63%

-------------------------------------------------------------------------------------------------------------------

--MCU Films grouped by year release with rotten tomato "Rotten" rating (Below 60%) by critics

SELECT MCURev.film, MCURev.year, MCURev.critics_score
FROM SQLProject..MCUMovieReview AS MCURev
WHERE MCURev.critics_score < 0.60
ORDER BY MCURev.critics_score DESC

-- Eternals is the most ambitious film on MCU with a wide variety of characters, but critics seems to see the film as
--"Confounding" and 'Strains"

-------------------------------------------------------------------------------------------------------------------

--MCU Films grouped by year release with rotten tomato "Rotten" rating (Below 60%) by audience

SELECT MCURev.film, MCURev.year, MCURev.audience_score
FROM SQLProject..MCUMovieReview AS MCURev
WHERE MCURev.audience_score < 0.60
ORDER BY MCURev.audience_score DESC

--Surprisingly, Captain Marvel has the lowest rating in all MCU films with only 45% rating and it is considered "Rotten"
--by rotten tomato

-------------------------------------------------------------------------------------------------------------------

--All MCU films averaged score by critic

SELECT AVG(MCURev.critics_score) AS AvgCriticScore
FROM SQLProject..MCUMovieReview AS MCURev
ORDER BY AVG(MCURev.critics_score) DESC

--The average score of all MCU films (Iron man to Black Panther 2) is 83%, like all the franchise, it is normal to
--have a bad, mid and awesome movies, MCU films proves that superhero films can be loved even in the eyes of the critic.

-------------------------------------------------------------------------------------------------------------------

--All MCU films averaged score by audience

SELECT AVG(MCURev.audience_score) AS AvgAudienceScore
FROM SQLProject..MCUMovieReview AS MCURev
ORDER BY AVG(MCURev.audience_score) DESC

--The average score of all MCU films (Iron man to Black Panther 2) is 82%, although it seems some people have a 
--"Superhero fatigue", still so many movie goers love to see MCU films as it's storytelling expands and interesting
--character.
