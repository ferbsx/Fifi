
CREATE TABLE dog_number_of_races (  -- neue Tabelle mit allen Hunden unt der Anzahl der rennen die sie gelaufen sind
  name_of_dog VARCHAR(255),
  number_of_races int
);
INSERT INTO dog_number_of_races(name_of_dog, number_of_races)  -- da importiere ich jetzt die daten
  SELECT dog_name, count(*) AS test FROM participated_in GROUP BY dog_name;


DELETE FROM dog_number_of_races WHERE number_of_races = 1;  -- und lösche alle hunde, die nur ein einziges rennen gelaufen sind, da die nichts zur Leistungskurve beitragen können!






-- ok wir haben gerade eine neue Idee ... und zwar die Jahre nicht über das Startjahr zu nehmen sondern über das Alter. Das ist dann vermutlich auch eleganter als mein Weg über min(..)

-- nachdem ich gesehen habe, dass rank5, rank6 und rank7 leer sind, werde ich die in der eleganteren version einfach ignorieren!

CREATE TABLE Leistungskurve_alter( -- Hunde können mit 15 Monaten an Rennen teilnehmen. Das runde ich hier einfach auf Jahr 1 ab
  la_name varchar(255),
  la_jahr1 int,  -- ab 15 Monate
  la_jahr2 int,  -- ab 2 Jahre
  la_jahr3 int,  -- ..
  la_jahr4 INT,
  la_jahr5 int,
  la_jahr6 int,
  la_jahr7 int    -- mit 96 Monaten also zu 8. Geburtstag scheiden sie aus dem Rennalltag aus!
);

INSERT INTO Leistungskurve_alter(la_name, la_jahr1, la_jahr2, la_jahr3, la_jahr4, la_jahr5, la_jahr6, la_jahr7)
  SELECT name,
    year_of_birth+1,  -- Jahre in denen die Hunde alt genug für das Rennen sind
    year_of_birth+2,
    year_of_birth+3,
    year_of_birth+4,
    year_of_birth+5,
    year_of_birth+6,
    year_of_birth+7
  FROM dog;

CREATE TABLE Leistungskurve_Punkte(
  lp_name VARCHAR(255),
  lp_punkte1 DOUBLE PRECISION,
  lp_punkte2 DOUBLE PRECISION,
  lp_punkte3 DOUBLE PRECISION,
  lp_punkte4 DOUBLE PRECISION,
  lp_punkte5 DOUBLE PRECISION,
  lp_punkte6 DOUBLE PRECISION,
  lp_punkte7 DOUBLE PRECISION
);



CREATE TABLE Leistungskurve_Jahr1(
  l1_name VARCHAR(255),
  l1_punkte DOUBLE PRECISION
);
CREATE TABLE Leistungskurve_Jahr2(
  l2_name VARCHAR(255),
  l2_punkte DOUBLE PRECISION
);
CREATE TABLE Leistungskurve_Jahr3(
  l3_name VARCHAR(255),
  l3_punkte DOUBLE PRECISION
);
CREATE TABLE Leistungskurve_Jahr4(
  l4_name VARCHAR(255),
  l4_punkte DOUBLE PRECISION
);
CREATE TABLE Leistungskurve_Jahr5(
  l5_name varchar(255),
  l5_punkte DOUBLE PRECISION
);
CREATE TABLE Leistungskurve_Jahr6(
  l6_name varchar(255),
  l6_punkte DOUBLE PRECISION
);
CREATE TABLE Leistungskurve_Jahr7(
  l7_name varchar(255),
  l7_punkte DOUBLE PRECISION
);

INSERT INTO Leistungskurve_Jahr1(l1_name, l1_punkte)
  SELECT la_name, score
  FROM leistungskurve_alter la, participated_in p
  WHERE la.la_name = p.dog_name AND la.la_jahr1 = p.race_year;

INSERT INTO Leistungskurve_Jahr2(l2_name, l2_punkte)
  SELECT la_name, score
  FROM leistungskurve_alter la, participated_in p
  WHERE la.la_name = p.dog_name AND la.la_jahr2 = p.race_year;

INSERT INTO Leistungskurve_Jahr3(l3_name, l3_punkte)
  SELECT la_name, score
  FROM leistungskurve_alter la, participated_in p
  WHERE la.la_name = p.dog_name AND la.la_jahr3 = p.race_year;

INSERT INTO Leistungskurve_Jahr4(l4_name, l4_punkte)
  SELECT la_name, score
  FROM leistungskurve_alter la, participated_in p
  WHERE la.la_name = p.dog_name AND la.la_jahr4 = p.race_year;

INSERT INTO Leistungskurve_Jahr5(l5_name, l5_punkte)
  SELECT la_name, score
  FROM leistungskurve_alter la, participated_in p
  WHERE la.la_name = p.dog_name AND la.la_jahr5 = p.race_year;


INSERT INTO Leistungskurve_Jahr6(l6_name, l6_punkte)
  SELECT la_name, score
  FROM leistungskurve_alter la, participated_in p
  WHERE la.la_name = p.dog_name AND la.la_jahr6 = p.race_year;


INSERT INTO Leistungskurve_Jahr7(l7_name, l7_punkte)
  SELECT la_name, score
  FROM leistungskurve_alter la, participated_in p
  WHERE la.la_name = p.dog_name AND la.la_jahr7 = p.race_year;

INSERT INTO Leistungskurve_Punkte(lp_name, lp_punkte1, lp_punkte2, lp_punkte3, lp_punkte4, lp_punkte5, lp_punkte6, lp_punkte7)
  SELECT DISTINCT la_name, l1_punkte, l2_punkte, l3_punkte, l4_punkte, l5_punkte, l6_punkte, l7_punkte
  FROM Leistungskurve_alter
    LEFT OUTER JOIN Leistungskurve_Jahr1 ON (la_name = l1_name)
    LEFT OUTER JOIN Leistungskurve_Jahr2 ON (la_name = l2_name)
    LEFT OUTER JOIN Leistungskurve_Jahr3 ON (la_name = l3_name)
    LEFT OUTER JOIN Leistungskurve_Jahr4 ON (la_name = l4_name)
    LEFT OUTER JOIN Leistungskurve_Jahr5 ON (la_name = l5_name)
    LEFT OUTER JOIN Leistungskurve_Jahr6 ON (la_name = l6_name)
    LEFT OUTER JOIN Leistungskurve_Jahr7 ON (la_name = l7_name);

CREATE TABLE Leistungskurve_verlauf(
  year_since_birth INT,
  durchschnitt_punkte DOUBLE PRECISION
);

INSERT INTO Leistungskurve_verlauf(year_since_birth, durchschnitt_punkte)
  SELECT 1, 1;
INSERT INTO Leistungskurve_verlauf(year_since_birth, durchschnitt_punkte)
  SELECT 2, sum(lp_punkte2)/count(lp_punkte2)/(sum(lp_punkte1)/count(lp_punkte1))
  FROM Leistungskurve_Punkte;
INSERT INTO Leistungskurve_verlauf(year_since_birth, durchschnitt_punkte)
  SELECT 3,  sum(lp_punkte3)/count(lp_punkte3)/(sum(lp_punkte1)/count(lp_punkte1))
  FROM Leistungskurve_Punkte;
INSERT INTO Leistungskurve_verlauf(year_since_birth, durchschnitt_punkte)
  SELECT 4,  sum(lp_punkte4)/count(lp_punkte4)/(sum(lp_punkte1)/count(lp_punkte1))
  FROM Leistungskurve_Punkte;
INSERT INTO Leistungskurve_verlauf(year_since_birth, durchschnitt_punkte)
  SELECT 5,  sum(lp_punkte5)/count(lp_punkte5)/(sum(lp_punkte1)/count(lp_punkte1))
  FROM Leistungskurve_Punkte;
INSERT INTO Leistungskurve_verlauf(year_since_birth, durchschnitt_punkte)
  SELECT 6,  sum(lp_punkte6)/count(lp_punkte6)/(sum(lp_punkte1)/count(lp_punkte1))
  FROM Leistungskurve_Punkte;
INSERT INTO Leistungskurve_verlauf(year_since_birth, durchschnitt_punkte)
  SELECT 7,  sum(lp_punkte7)/count(lp_punkte7)/(sum(lp_punkte1)/count(lp_punkte1))
  FROM Leistungskurve_Punkte;

-- hard gecoded die Tabelle mit dem Leistungsverlauf erstellt
DROP TABLE public.leistungskurve_jahr1;
DROP TABLE public.leistungskurve_jahr2;
DROP TABLE public.leistungskurve_jahr3;
DROP TABLE public.leistungskurve_jahr4;
DROP TABLE public.leistungskurve_jahr5;
DROP TABLE public.leistungskurve_jahr6;
DROP TABLE public.leistungskurve_jahr7;



SELECT sum(lp_punkte1)/count(lp_punkte1) FROM leistungskurve_punkte; -- 22

SELECT count(lp_punkte1) from Leistungskurve_Punkte; --101
SELECT sum(lp_punkte1) from Leistungskurve_Punkte; -- 2251

-- Anfrage um die Punkte im ersten Jahr von einem bestimmten Hund (hier zb. Lemon Pluto) zu erfahren

SELECT score --19
FROM participated_in p, dog d
WHERE d.name = 'Lemon Pluto' AND d.name = p.dog_name AND p.race_year = d.year_of_birth+1;

-- wenn unser Beispielhund jetzt an einem imaginären Rennen 2016 teilnehmen soll müssen wir wissen wie alt er zu diesem zeitpunkt ist

SELECT 2016-year_of_birth -- lemon pluto ist 2011 geboren und damit wäre das jetzt das 5. rennen das er läuft, passt
FROM dog
WHERE name = 'Lemon Pluto';

-- Prognose für das imaginäre Rennen von Lemon Pluto 2016 aufgrund seines ersten rennens:

SELECT score*lp.durchschnitt_punkte -- 16.82
FROM Leistungskurve_Verlauf lp, participated_in p , dog d
WHERE p.dog_name='Lemon Pluto' AND d.name = p.dog_name and p.race_year= d.year_of_birth+1 AND lp.year_since_birth=2016-d.year_of_birth;

/*
hard gecodete idee: wir bauen jetzt eine Tabelle wo wir alle Werte für jeden Hund ab 2016 berechnen und die dann einfach nur abfragen müssen
 */


CREATE TABLE zukunft(
  z_name VARCHAR(255),
  z_score DOUBLE PRECISION,
  z_year INT
);

INSERT INTO zukunft(z_name, z_score, z_year)
  SELECT name, score*durchschnitt_punkte, year_since_birth+year_of_birth
  FROM Leistungskurve_verlauf lv, participated_in p, dog d
  WHERE d.name = p.dog_name and p.race_year = d.year_of_birth+1 AND lv.year_since_birth+d.year_of_birth > 2015;

INSERT INTO zukunft(z_name, z_score, z_year)
  SELECT name, score*durchschnitt_punkte, year_since_birth+year_of_birth
  FROM Leistungskurve_verlauf lv, participated_in p, dog d
  WHERE d.name = p.dog_name and p.race_year = d.year_of_birth+2 AND lv.year_since_birth+d.year_of_birth > 2015;

INSERT INTO zukunft(z_name, z_score, z_year)
  SELECT name, score*durchschnitt_punkte, year_since_birth+year_of_birth
  FROM Leistungskurve_verlauf lv, participated_in p, dog d
  WHERE d.name = p.dog_name and p.race_year = d.year_of_birth+3 AND lv.year_since_birth+d.year_of_birth > 2015;

INSERT INTO zukunft(z_name, z_score, z_year)
  SELECT name, score*durchschnitt_punkte, year_since_birth+year_of_birth
  FROM Leistungskurve_verlauf lv, participated_in p, dog d
  WHERE d.name = p.dog_name and p.race_year = d.year_of_birth+4 AND lv.year_since_birth+d.year_of_birth > 2015;

INSERT INTO zukunft(z_name, z_score, z_year)
  SELECT name, score*durchschnitt_punkte, year_since_birth+year_of_birth
  FROM Leistungskurve_verlauf lv, participated_in p, dog d
  WHERE d.name = p.dog_name and p.race_year = d.year_of_birth+5 AND lv.year_since_birth+d.year_of_birth > 2015;

INSERT INTO zukunft(z_name, z_score, z_year)
  SELECT name, score*durchschnitt_punkte, year_since_birth+year_of_birth
  FROM Leistungskurve_verlauf lv, participated_in p, dog d
  WHERE d.name = p.dog_name and p.race_year = d.year_of_birth+6 AND lv.year_since_birth+d.year_of_birth > 2015;

CREATE TABLE zukunft_sauber(
  zs_name VARCHAR(255),
  zs_score DOUBLE PRECISION,
  zs_year INT
);

INSERT INTO zukunft_sauber(zs_name, zs_score, zs_year)
  SELECT z_name, sum(z_score)/count(z_score), z_year
  FROM zukunft
  group by z_name, z_year
  ORDER BY z_name, z_year ASC ;

-- zukunft sauber sind jetzt die gemittelten vorhersagen über alle vorhersagen bezüglich der rennen die der Hund gelauften ist

-- ich starte jetzt mein erstes imaginäres rennen

SELECT zs_name, zs_score, zs_year
from  zukunft_sauber
WHERE zs_year=2017 AND (zs_name = 'AMF Sleekstrangr' OR zs_name = 'Big Surprise' OR zs_name = 'Cuzin Bob' OR zs_name = 'Icandomagic')
ORDER BY zs_score DESC ;

-- zufälligen Hundenamen ausgeben:

SELECT name FROM dog ORDER BY RANDOM() LIMIT 1;