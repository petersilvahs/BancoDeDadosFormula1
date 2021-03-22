/* Qual companhia ganhou mais vezes, ou mais prêmios? */
SELECT constructors.name, SUM(wins) vitorias
FROM constructors
INNER JOIN constructorStandings ON 
constructorStandings.constructorId = constructors.constructorId
INNER JOIN races ON
constructorStandings.raceId = races.raceId
INNER JOIN seasons ON 
races.year = seasons.year
GROUP BY constructors.name
ORDER BY vitorias DESC;