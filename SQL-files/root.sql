SELECT CURRENT_USER();
CREATE DATABASE databas_labb2;

CREATE USER 'labb2_user'@'localhost'
    IDENTIFIED BY 'PLATSHÅLLARE';

GRANT ALL PRIVILEGES
    ON databas_labb2.*
    TO 'labb2_user'@'localhost';

SHOW GRANTS FOR 'labb2_user'@'localhost';