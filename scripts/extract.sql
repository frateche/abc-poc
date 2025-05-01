CREATE TABLE result AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_ID'), 2044206807) );

CREATE TABLE archer AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_ID'), 1044942270) );

CREATE TABLE arc AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_ID'), 1378359722) );

CREATE TABLE type AS
    SELECT * 
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_ID'), 230300077) );

CREATE TABLE level AS
    SELECT *
    FROM read_csv( format("https://docs.google.com/spreadsheets/d/{}/export?exportFormat=csv&gid={}", getenv('GSHEET_FLECHES_ID'), 2001880855) );

.mode json
-- .mode csv

SELECT result.*
FROM result, archer, arc, type, level
WHERE
        result.fullname = archer.fullname
AND     archer.disable  = '0'
AND     result.arc      = arc.name
AND     result.type     = type.name
AND     result.level    = level.name
ORDER BY
    result.fullname,
    arc.id, type.id, level.id
;
