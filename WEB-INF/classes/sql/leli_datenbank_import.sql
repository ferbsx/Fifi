DROP TABLE tbl_dog CASCADE;
DROP TABLE tbl_participated_in CASCADE;
DROP TABLE tbl_race CASCADE;

CREATE TABLE Dog(
  name varchar(255) NOT NULL,
  year_of_birth int,
  land_of_birth_and_standing nchar(5),
  --land_of_standing nchar(2),
  sex nchar(1),
  father varchar(255),
  mother varchar(255),
  --owner varchar(255),
  --breeder varchar(255),
  CONSTRAINT pk_dog PRIMARY KEY (name)--,
  --CONSTRAINT fk_mother FOREIGN KEY (mother) REFERENCES Dog(name),
  --CONSTRAINT fk_father FOREIGN KEY (father) REFERENCES Dog(name)
);

CREATE TABLE Race(
  country varchar(255),
  year int,
  CONSTRAINT pk_race PRIMARY KEY (country, year)
);

CREATE TABLE participated_in(
  dog_name VARCHAR(255),
  race_country VARCHAR(255),
  race_year INT,
  score FLOAT,
  average_distance INT,
  rank INT,
  number_of_races INT,
  CONSTRAINT fk_dog_name FOREIGN KEY (dog_name) REFERENCES Dog(name),
  CONSTRAINT fk_race FOREIGN KEY (race_country, race_year) REFERENCES Race(country, year)
);


CREATE TABLE import(
  i_country VARCHAR(255),
  i_year int,
  i_rang int,
  i_name VARCHAR(255),
  i_sex CHAR,
  i_vater VARCHAR(255),
  i_mutter VARCHAR(255),
  i_anzahl int,
  i_punkte DOUBLE PRECISION,
  i_durch VARCHAR(30)
);

COPY import(i_country, i_year, i_rang, i_name, i_sex, i_vater, i_mutter, i_anzahl, i_punkte, i_durch)
  FROM '/tmp/greyhounddata.csv'
  WITH DELIMITER ';';

CREATE TABLE import2(
  i2_country VARCHAR(255),
  i2_year INT,
  i2_rang INT,
  i2_name VARCHAR(255),
  i2_year_of_birth VARCHAR(255),
  i2_land_of_birth_and_standing VARCHAR(255),
  i2_sex CHAR,
  i2_vater VARCHAR(255),
  i2_mutter VARCHAR(255),
  i2_anzahl INT,
  i2_punkte FLOAT,
  i2_durch VARCHAR(30)
);

INSERT INTO import2(i2_country, i2_year, i2_rang, i2_name, i2_year_of_birth, i2_land_of_birth_and_standing, i2_sex, i2_vater, i2_mutter, i2_anzahl, i2_punkte, i2_durch)
    SELECT i_country, i_year, i_rang, substring(i_name for position('[' in i_name)-2), substring(i_name, position(']' in i_name)-4 ,4), substring(i_name from position('[' in i_name)+1 for (position(']' in i_name) - position('[' in i_name)-6)  ), i_sex, i_vater, i_mutter, i_anzahl, round(i_punkte), substring(i_durch,1,3)
    FROM import;

INSERT INTO Dog(name, year_of_birth, land_of_birth_and_standing, sex, father, mother)
  SELECT DISTINCT i2_name, i2_year_of_birth::INTEGER , i2_land_of_birth_and_standing, i2_sex, i2_vater, i2_mutter from import2;

INSERT INTO Race(country, year)
    SELECT DISTINCT i2_country, i2_year FROM import2;

INSERT INTO participated_in(dog_name, race_country, race_year, score, average_distance, rank, number_of_races)
    SELECT DISTINCT i2_name, i2_country, i2_year, i2_punkte, i2_durch::INTEGER, i2_rang, i2_anzahl FROM import2;

