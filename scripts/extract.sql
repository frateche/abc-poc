CREATE TABLE archers AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), 0) );

CREATE TABLE classique AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), 651308661) );

CREATE TABLE poulie AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), 1949586586) );

CREATE TABLE sansviseur AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), 539639472) );

CREATE TABLE chasse AS
    SELECT *
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), 1377256094) );

.mode json
SELECT archers.fullname AS afullname, *
FROM 
    archers

FULL OUTER JOIN classique
ON archers.fullname = classique.fullname

FULL OUTER JOIN poulie
ON archers.fullname = poulie.fullname

FULL OUTER JOIN chasse
ON archers.fullname = chasse.fullname

FULL OUTER JOIN sansviseur
ON archers.fullname = sansviseur.fullname

ORDER BY archers.fullname
;
