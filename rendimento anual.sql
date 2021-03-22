
SELECT constructors.name, SUM(wins) vitorias, seasons.year
FROM constructors

INNER JOIN constructorStandings ON 
constructorStandings.constructorId = constructors.constructorId

INNER JOIN races ON
constructorStandings.raceId = races.raceId

INNER JOIN seasons ON 
races.year = seasons.year

GROUP BY seasons.year, constructors.name
ORDER BY vitorias DESC;

