CREATE TABLE archers AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), getenv('AR_TAB')) );

CREATE TABLE classique AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), getenv('CL_TAB')) );

CREATE TABLE poulie AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), getenv('PO_TAB')) );

CREATE TABLE chasse AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), getenv('CH_TAB')) );

CREATE TABLE sansviseur AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_KEY'), getenv('SV_TAB')) );


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
