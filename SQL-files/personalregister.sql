-- Kontroll av anslutning
SELECT CURRENT_USER(), DATABASE();
SHOW GRANTS;

USE databas_labb2;

-- region DATABASENS TABELLER SKAPAS

CREATE TABLE department
(
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    office_location VARCHAR(30) NOT NULL
);

CREATE TABLE employee
(
    employee_id     INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(30) NOT NULL,
    last_name       VARCHAR(30) NOT NULL,
    email           VARCHAR(75) NOT NULL UNIQUE,
    employment_date DATE        NOT NULL,
    department_id   INT         NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department (department_id)
);

CREATE TABLE access_card
(
    access_card_id     INT AUTO_INCREMENT PRIMARY KEY,
    access_card_number INT  NOT NULL UNIQUE,
    issuance_date      DATE NOT NULL,
    expiry_date        DATE NOT NULL,
    employee_id        INT  NOT NULL UNIQUE,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE competence
(
    competence_id   INT AUTO_INCREMENT PRIMARY KEY,
    competence_name VARCHAR(75)  NOT NULL UNIQUE,
    description     VARCHAR(500) NOT NULL
);

CREATE TABLE employee_competence
(
    employee_id   INT NOT NULL,
    competence_id INT NOT NULL,
    PRIMARY KEY (employee_id, competence_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
    FOREIGN KEY (competence_id) REFERENCES competence (competence_id)
);

-- endregion

-- region TESTDATA FÖR DATABASEN

-- Testdata: 10 avdelningar
INSERT INTO department (department_name, office_location)
VALUES ('IT', 'Stockholm'),
       ('Ekonomi', 'Göteborg'),
       ('HR', 'Malmö'),
       ('Kundservice', 'Uppsala'),
       ('Marknadsföring', 'Stockholm'),
       ('Försäljning', 'Göteborg'),
       ('Produktutveckling', 'Linköping'),
       ('Administration', 'Västerås'),
       ('Juridik', 'Stockholm'),
       ('Kvalitetssäkring', 'Örebro');

-- Kontroll: avdelningar
SELECT *
FROM department;

-- Testdata: 50 anställda
INSERT INTO employee
    (first_name, last_name, email, employment_date, department_id)
VALUES ('Erik', 'Andersson', 'erik.andersson@personalregister.example', '2020-03-15', 1),
       ('Sara', 'Lindberg', 'sara.lindberg@personalregister.example', '2021-06-01', 1),
       ('Johan', 'Bergström', 'johan.bergstrom@personalregister.example', '2019-09-10', 1),
       ('Emma', 'Karlsson', 'emma.karlsson@personalregister.example', '2022-01-17', 1),
       ('Marcus', 'Nilsson', 'marcus.nilsson@personalregister.example', '2023-04-03', 1),
       ('Elin', 'Sjöberg', 'elin.sjoberg@personalregister.example', '2024-08-12', 1),
       ('David', 'Holm', 'david.holm@personalregister.example', '2018-11-05', 1),
       ('Nora', 'Ek', 'nora.ek@personalregister.example', '2025-02-03', 1),

       ('Anna', 'Svensson', 'anna.svensson@personalregister.example', '2017-05-22', 2),
       ('Peter', 'Johansson', 'peter.johansson@personalregister.example', '2020-10-01', 2),
       ('Sara', 'Lindberg', 'sara.lindberg2@personalregister.example', '2021-02-15', 2),
       ('Oskar', 'Hedlund', 'oskar.hedlund@personalregister.example', '2022-06-13', 2),
       ('Karin', 'Berg', 'karin.berg@personalregister.example', '2019-04-08', 2),
       ('Felix', 'Sandberg', 'felix.sandberg@personalregister.example', '2023-09-01', 2),
       ('Linda', 'Nyström', 'linda.nystrom@personalregister.example', '2024-03-18', 2),

       ('Sofia', 'Larsson', 'sofia.larsson@personalregister.example', '2018-08-20', 3),
       ('Daniel', 'Forsberg', 'daniel.forsberg@personalregister.example', '2020-01-07', 3),
       ('Malin', 'Eriksson', 'malin.eriksson@personalregister.example', '2021-11-15', 3),
       ('Andreas', 'Wallin', 'andreas.wallin@personalregister.example', '2022-05-02', 3),
       ('Johanna', 'Bäck', 'johanna.back@personalregister.example', '2023-02-20', 3),
       ('Filip', 'Åberg', 'filip.aberg@personalregister.example', '2025-01-13', 3),

       ('Amanda', 'Olsson', 'amanda.olsson@personalregister.example', '2020-07-06', 4),
       ('Lucas', 'Persson', 'lucas.persson@personalregister.example', '2021-03-22', 4),
       ('Maja', 'Gustafsson', 'maja.gustafsson@personalregister.example', '2022-08-15', 4),
       ('Hugo', 'Dahl', 'hugo.dahl@personalregister.example', '2023-01-09', 4),
       ('Isabella', 'Lind', 'isabella.lind@personalregister.example', '2024-06-10', 4),
       ('Adam', 'Öberg', 'adam.oberg@personalregister.example', '2025-04-07', 4),

       ('Julia', 'Ekström', 'julia.ekstrom@personalregister.example', '2019-02-11', 5),
       ('Viktor', 'Hansson', 'viktor.hansson@personalregister.example', '2020-09-14', 5),
       ('Alice', 'Nord', 'alice.nord@personalregister.example', '2021-05-03', 5),
       ('Simon', 'Blom', 'simon.blom@personalregister.example', '2022-10-17', 5),
       ('Clara', 'Ström', 'clara.strom@personalregister.example', '2023-07-03', 5),
       ('Anton', 'Malm', 'anton.malm@personalregister.example', '2025-03-24', 5),

       ('Fredrik', 'Lundqvist', 'fredrik.lundqvist@personalregister.example', '2018-03-12', 6),
       ('Emilia', 'Björk', 'emilia.bjork@personalregister.example', '2020-04-27', 6),
       ('Alexander', 'Wikström', 'alexander.wikstrom@personalregister.example', '2021-09-06', 6),
       ('Matilda', 'Berglund', 'matilda.berglund@personalregister.example', '2022-02-14', 6),
       ('Sebastian', 'Engström', 'sebastian.engstrom@personalregister.example', '2023-11-20', 6),
       ('Olivia', 'Hall', 'olivia.hall@personalregister.example', '2024-09-02', 6),

       ('Benjamin', 'Löfgren', 'benjamin.lofgren@personalregister.example', '2019-06-17', 7),
       ('Ebba', 'Sundström', 'ebba.sundstrom@personalregister.example', '2020-12-01', 7),
       ('William', 'Rosén', 'william.rosen@personalregister.example', '2021-08-09', 7),
       ('Linnea', 'Åkesson', 'linnea.akesson@personalregister.example', '2022-04-04', 7),
       ('Noah', 'Westin', 'noah.westin@personalregister.example', '2023-05-15', 7),
       ('Tilda', 'Falk', 'tilda.falk@personalregister.example', '2025-08-18', 7),

       ('Helena', 'Bergman', 'helena.bergman@personalregister.example', '2017-10-02', 8),
       ('Robert', 'Magnusson', 'robert.magnusson@personalregister.example', '2019-01-21', 8),
       ('Caroline', 'Holm', 'caroline.holm@personalregister.example', '2021-07-12', 8),
       ('Martin', 'Holmberg', 'martin.holmberg@personalregister.example', '2023-03-06', 8),
       ('Therese', 'Lindgren', 'therese.lindgren@personalregister.example', '2024-11-04', 8);


-- Kontroll: anställdas ID
SELECT employee_id, first_name, last_name
FROM employee
ORDER BY employee_id;

-- Testdata: 25 passerkort
INSERT INTO access_card (access_card_number, issuance_date, expiry_date, employee_id)
VALUES (10001, '2024-01-15', '2027-01-15', 1),
       (10002, '2025-03-10', '2028-03-10', 2),
       (10003, '2024-06-01', '2027-06-01', 4),
       (10004, '2026-02-12', '2029-02-12', 6),
       (10005, '2025-05-20', '2028-05-20', 9),
       (10006, '2024-09-15', '2027-09-15', 11),
       (10007, '2026-01-08', '2029-01-08', 13),
       (10008, '2025-02-14', '2028-02-14', 16),
       (10009, '2024-11-01', '2027-11-01', 18),
       (10010, '2026-03-05', '2029-03-05', 20),
       (10011, '2025-04-17', '2028-04-17', 22),
       (10012, '2024-07-22', '2027-07-22', 24),
       (10013, '2026-06-10', '2029-06-10', 26),
       (10014, '2025-08-01', '2028-08-01', 28),
       (10015, '2024-12-12', '2027-12-12', 30),
       (10016, '2026-04-20', '2029-04-20', 32),
       (10017, '2025-01-25', '2028-01-25', 34),
       (10018, '2024-10-07', '2027-10-07', 36),
       (10019, '2026-05-15', '2029-05-15', 38),
       (10020, '2025-06-18', '2028-06-18', 40),
       (10021, '2024-03-11', '2027-03-11', 42),
       (10022, '2026-07-01', '2029-07-01', 44),
       (10023, '2025-09-09', '2028-09-09', 46),
       (10024, '2024-05-30', '2027-05-30', 48),
       (10025, '2026-08-17', '2029-08-17', 50);

-- Kontroll: antal passerkort
SELECT COUNT(*)
FROM access_card;

-- Testdata: 68 kompetenser
INSERT INTO competence (competence_name, description)
VALUES ('Java', 'Utveckling, felsökning och underhåll av applikationer i Java.'),
       ('SQL', 'Hantering och bearbetning av data i relationsdatabaser med SQL.'),
       ('Spring Boot', 'Utveckling av backend, API:er och webbtjänster med Spring Boot.'),
       ('IT-säkerhet', 'Skydd av system, information och användardata mot säkerhetsrisker.'),
       ('Python', 'Programmering, datahantering och automatisering med Python.'),
       ('JavaScript', 'Utveckling av interaktiva funktioner i webbplatser och appar.'),
       ('REST API', 'Utveckling och användning av API:er för kommunikation mellan system.'),
       ('Git', 'Versionshantering av kod och samarbete i utvecklingsprojekt.'),
       ('Datamodellering', 'Planering och strukturering av data, tabeller och relationer.'),
       ('Testautomatisering', 'Automatiserade tester som hjälper till att hitta fel i programvara.'),
       ('Docker', 'Paketering och körning av applikationer i containrar.'),
       ('Linux', 'Arbete med Linuxbaserade operativsystem och servermiljöer.'),
       ('CI/CD', 'Automatisering av kodbyggen, tester och leveranser.'),
       ('Molntjänster', 'Användning och hantering av system och tjänster i molnet.'),
       ('Systemintegration', 'Sammankoppling av system så att de kan utbyta information.'),
       ('SQL-optimering', 'Förbättring av SQL-frågor och databasprestanda.'),

       ('Redovisning', 'Bokföring, ekonomisk rapportering och uppföljning av företagets ekonomi.'),
       ('Budgetering', 'Planering och uppföljning av intäkter, kostnader och budgetar.'),
       ('Excel', 'Beräkningar, datahantering och rapportering i kalkylblad.'),
       ('Ekonomisk analys', 'Granskning av ekonomiska resultat, kostnader och nyckeltal.'),
       ('Fakturahantering', 'Registrering, kontroll och uppföljning av fakturor och betalningar.'),
       ('Momsredovisning', 'Beräkning, sammanställning och rapportering av moms.'),
       ('Ekonomiska prognoser', 'Bedömning av framtida intäkter, kostnader och ekonomiska resultat.'),

       ('Rekrytering', 'Arbetet med att hitta, intervjua och anställa nya medarbetare.'),
       ('Arbetsrätt', 'Lagar och regler som styr anställningar och förhållanden på arbetsplatsen.'),
       ('Löneadministration', 'Hantering av löner, ersättningar och löneunderlag.'),
       ('Kompetensutveckling', 'Planering av utbildningar och andra möjligheter till lärande på jobbet.'),
       ('Konflikthantering', 'Hantering av meningsskiljaktigheter och svåra situationer på arbetsplatsen.'),
       ('Onboarding', 'Introduktion och stöd till nya medarbetare under deras första tid.'),
       ('Medarbetarsamtal', 'Samtal om arbetsmiljö, trivsel, mål och personlig utveckling.'),
       ('Arbetsmiljöarbete', 'Arbete för en säker, hälsosam och fungerande arbetsmiljö.'),

       ('Kundkommunikation', 'Tydlig och professionell kommunikation med kunder i olika kanaler.'),
       ('CRM-system', 'Registrering och uppföljning av kundkontakter i CRM-system.'),
       ('Teknisk support', 'Felsökning och hjälp vid tekniska problem.'),
       ('Ärendehantering', 'Registrering, hantering och uppföljning av inkommande ärenden.'),
       ('Reklamationshantering', 'Hantering av klagomål, reklamationer och möjliga lösningar.'),
       ('Kundnöjdhetsanalys', 'Insamling och analys av kunders upplevelser och synpunkter.'),
       ('Telefonsupport', 'Service, rådgivning och problemlösning via telefon.'),

       ('Digital marknadsföring', 'Marknadsföring av produkter och tjänster genom digitala kanaler.'),
       ('SEO', 'Sökmotoroptimering för att göra webbplatser lättare att hitta.'),
       ('Innehållsproduktion', 'Framtagning av texter, bilder och annat innehåll för olika kanaler.'),
       ('Webbanalys', 'Analys av besöksstatistik och hur människor använder webbplatser.'),
       ('Sociala medier', 'Planering, publicering och uppföljning av innehåll i sociala medier.'),
       ('E-postmarknadsföring', 'Planering, utskick och uppföljning av marknadsföring via e-post.'),

       ('Försäljning', 'Försäljning av produkter och tjänster samt utveckling av kundrelationer.'),
       ('Förhandlingsteknik', 'Förhandlingar om priser, villkor och affärsavtal.'),
       ('Affärsutveckling', 'Arbete med nya affärsmöjligheter, tjänster och sätt att växa.'),
       ('Key Account Management', 'Långsiktigt arbete med företagets strategiskt viktiga kunder.'),
       ('Offertarbete', 'Framtagning, presentation och uppföljning av offerter.'),

       ('Projektledning', 'Planering, samordning och uppföljning av projekt från start till mål.'),
       ('UX-design', 'Utformning av digitala produkter med fokus på användarupplevelsen.'),
       ('Kravanalys', 'Insamling och analys av behov och krav på produkter eller system.'),
       ('Agila metoder', 'Arbetssätt där utvecklingen sker stegvis med löpande återkoppling.'),
       ('Tillgänglighet', 'Utformning av digitala tjänster som fungerar för människor med olika behov.'),
       ('Prototypframtagning', 'Skapande av tidiga produktversioner för att testa idéer och lösningar.'),

       ('Administrativ samordning', 'Planering och koordinering av administrativa uppgifter och rutiner.'),
       ('Dokumenthantering', 'Organisering, uppdatering, lagring och arkivering av dokument.'),
       ('Avtalshantering', 'Administration och uppföljning av avtal, villkor och viktiga datum.'),
       ('Upphandling', 'Arbete med inköp, anbud och val av leverantörer.'),

       ('GDPR', 'Regler och rutiner för säker och korrekt hantering av personuppgifter.'),
       ('Processförbättring', 'Utveckling och förenkling av arbetsprocesser och rutiner.'),
       ('Förändringsledning', 'Planering och stöd vid förändringar i organisationer och arbetssätt.'),
       ('Presentationsteknik', 'Utformning och framförande av tydliga och engagerande presentationer.'),
       ('Verksamhetsanalys', 'Kartläggning av arbetsprocesser, behov och förbättringsmöjligheter.'),

       ('AI-utveckling', 'Utveckling av lösningar som använder artificiell intelligens.'),
       ('Blockchain', 'Utveckling av system för säker och decentraliserad lagring av transaktioner.'),
       ('Robotprocessautomatisering (RPA)', 'Automatisering av återkommande arbetsuppgifter med hjälp av programvara.'),
       ('Digitala tvillingar', 'Skapande av digitala modeller av verkliga produkter, system eller processer.');


-- Kontroll: kompetens-ID
SELECT competence_id, competence_name
FROM competence
ORDER BY competence_id;

-- Testdata: 153 kompetenskopplingar
INSERT INTO employee_competence (employee_id, competence_id)
VALUES (1, 1),
       (1, 2),
       (1, 8),
       (1, 9),
       (1, 50),
       (2, 1),
       (2, 3),
       (2, 7),
       (2, 8),
       (3, 2),
       (3, 4),
       (3, 11),
       (3, 12),
       (4, 6),
       (4, 7),
       (4, 10),
       (4, 53),
       (5, 1),
       (5, 2),
       (5, 13),
       (5, 14),
       (6, 5),
       (6, 2),
       (6, 9),
       (6, 16),
       (7, 1),
       (7, 4),
       (7, 15),
       (7, 60),

       (9, 17),
       (9, 18),
       (9, 19),
       (9, 20),
       (10, 17),
       (10, 21),
       (10, 22),
       (11, 18),
       (11, 19),
       (11, 23),
       (11, 63),
       (12, 17),
       (12, 20),
       (12, 59),
       (13, 17),
       (13, 18),
       (13, 19),
       (13, 60),
       (14, 19),
       (14, 20),
       (14, 2),

       (16, 24),
       (16, 25),
       (16, 29),
       (16, 31),
       (17, 26),
       (17, 19),
       (17, 60),
       (18, 27),
       (18, 30),
       (18, 62),
       (19, 24),
       (19, 28),
       (19, 63),
       (20, 25),
       (20, 31),
       (20, 60),
       (20, 61),

       (22, 32),
       (22, 33),
       (22, 35),
       (23, 34),
       (23, 35),
       (23, 38),
       (24, 32),
       (24, 36),
       (24, 37),
       (25, 33),
       (25, 34),
       (25, 35),
       (26, 32),
       (26, 37),
       (26, 63),
       (27, 32),
       (27, 38),
       (27, 28),

       (28, 39),
       (28, 40),
       (28, 41),
       (29, 39),
       (29, 42),
       (29, 43),
       (30, 41),
       (30, 43),
       (30, 44),
       (31, 39),
       (31, 40),
       (31, 42),
       (31, 2),
       (33, 41),
       (33, 43),
       (33, 63),

       (34, 45),
       (34, 46),
       (34, 48),
       (35, 45),
       (35, 33),
       (35, 49),
       (36, 45),
       (36, 47),
       (36, 50),
       (37, 45),
       (37, 46),
       (37, 63),
       (38, 45),
       (38, 48),
       (38, 49),
       (39, 45),
       (39, 33),
       (39, 47),

       (40, 50),
       (40, 52),
       (40, 53),
       (40, 61),
       (41, 51),
       (41, 54),
       (41, 55),
       (42, 1),
       (42, 3),
       (42, 7),
       (42, 53),
       (43, 52),
       (43, 53),
       (43, 55),
       (43, 9),
       (44, 51),
       (44, 54),
       (44, 62),
       (45, 50),
       (45, 52),
       (45, 63),

       (46, 56),
       (46, 57),
       (46, 58),
       (47, 56),
       (47, 59),
       (47, 19),
       (48, 57),
       (48, 58),
       (48, 60),
       (49, 56),
       (49, 61),
       (49, 63),
       (49, 64);

-- Kontroll: antal kompetenskopplingar
SELECT COUNT(*) AS antal_kopplingar
FROM employee_competence;

-- Kontroll: anställda utan kompetenser
SELECT e.employee_id, e.first_name, e.last_name
FROM employee e
         LEFT JOIN employee_competence ec
                   ON e.employee_id = ec.employee_id
WHERE ec.competence_id IS NULL;

-- endregion

-- region JOIN-frågor för uppgiften

-- G1. Anställda med avdelning
-- Visa anställdas förnamn, efternamn och avdelningsnamn, använd INNER JOIN
SELECT e.first_name, e.last_name, d.department_name
FROM employee e
         INNER JOIN department d
                    ON e.department_id = d.department_id;


-- G2. Avdelningar med anställda
-- Visa alla avdelningars namn och deras anställdas namn.
-- Även avdelningar utan anställda ska finnas med (LEFT JOIN)
SELECT d.department_name,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM department d
         LEFT JOIN employee e
                   ON e.department_id = d.department_id;


-- VG1. Anställda med avdelning och passerkort
-- Visa alla anställdas namn, avdelning och eventuella kortnummer.
-- Anställda utan passerkort ska också finnas med.
SELECT d.department_name,
       a.access_card_number,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employee e
         INNER JOIN department d
                    ON e.department_id = d.department_id
         LEFT JOIN access_card a
                   ON e.employee_id = a.employee_id;

-- VG2. Avdelningar med anställda och passerkort
-- Visa alla avdelningars namn, deras anställdas namn och eventuella
-- kortnummer. Behåll även tomma avdelningar och anställda utan kort.
SELECT d.department_name,
       a.access_card_number,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM department d
         LEFT JOIN employee e
                   ON e.department_id = d.department_id
         LEFT JOIN access_card a
                   ON e.employee_id = a.employee_id;

-- VG3: en anställds samlade uppgifter
-- Välj en av de anställda som har flera kompetenser. Hämta i en fråga med LEFT JOIN
-- Alla uppgifter om den anställde, inklusive: Avdelningens uppgifter. Eventuellt passerkorts uppgifter. Samtliga kompetensers namn och beskrivningar.
SELECT e.employee_id,
       e.employment_date,
       e.email,
       d.department_id,
       d.department_name,
       d.office_location,
       a.access_card_id,
       COALESCE(
               CAST(a.access_card_number AS CHAR),
               'Inget passerkort registrerat'
       )                                      AS access_card,
       a.issuance_date,
       a.expiry_date,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       COALESCE(
               CONCAT(c.competence_id, ' ', c.competence_name, ': ', c.description),
               'Inga kompetenser registrerade för den anställde'
       )                                      AS competences
FROM employee e
         INNER JOIN department d
                    ON e.department_id = d.department_id
         LEFT JOIN access_card a
                   ON e.employee_id = a.employee_id
         LEFT JOIN employee_competence ec
                   ON e.employee_id = ec.employee_id
         LEFT JOIN competence c
                   ON ec.competence_id = c.competence_id
WHERE e.employee_id = 1;

SELECT e.employee_id,
       e.employment_date,
       e.email,
       d.department_id,
       d.department_name,
       d.office_location,
       a.access_card_id,
       COALESCE(
               CAST(a.access_card_number AS CHAR),
               'Inget passerkort registrerat'
       )                                      AS access_card,
       a.issuance_date,
       a.expiry_date,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       COALESCE(
               CONCAT(c.competence_id, ' ', c.competence_name, ': ', c.description),
               'Inga kompetenser registrerade för den anställde'
       )                                      AS competences
FROM employee e
         INNER JOIN department d
                    ON e.department_id = d.department_id
         LEFT JOIN access_card a
                   ON e.employee_id = a.employee_id
         LEFT JOIN employee_competence ec
                   ON e.employee_id = ec.employee_id
         LEFT JOIN competence c
                   ON ec.competence_id = c.competence_id
WHERE e.employee_id = 3;

SELECT e.employee_id,
       e.employment_date,
       e.email,
       d.department_id,
       d.department_name,
       d.office_location,
       a.access_card_id,
       COALESCE(
               CAST(a.access_card_number AS CHAR),
               'Inget passerkort registrerat'
       )                                      AS access_card,
       a.issuance_date,
       a.expiry_date,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       COALESCE(
               CONCAT(c.competence_id, ' ', c.competence_name, ': ', c.description),
               'Inga kompetenser registrerade för den anställde'
       )                                      AS competences
FROM employee e
         INNER JOIN department d
                    ON e.department_id = d.department_id
         LEFT JOIN access_card a
                   ON e.employee_id = a.employee_id
         LEFT JOIN employee_competence ec
                   ON e.employee_id = ec.employee_id
         LEFT JOIN competence c
                   ON ec.competence_id = c.competence_id
WHERE e.employee_id = 32;

SELECT e.employee_id,
       e.employment_date,
       e.email,
       d.department_id,
       d.department_name,
       d.office_location,
       a.access_card_id,
       COALESCE(
               CAST(a.access_card_number AS CHAR),
               'Inget passerkort registrerat'
       )                                      AS access_card,
       a.issuance_date,
       a.expiry_date,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       COALESCE(
               CONCAT(c.competence_id, ' ', c.competence_name, ': ', c.description),
               'Inga kompetenser registrerade för den anställde'
       )                                      AS competences
FROM employee e
         INNER JOIN department d
                    ON e.department_id = d.department_id
         LEFT JOIN access_card a
                   ON e.employee_id = a.employee_id
         LEFT JOIN employee_competence ec
                   ON e.employee_id = ec.employee_id
         LEFT JOIN competence c
                   ON ec.competence_id = c.competence_id
WHERE e.employee_id = 8;

-- VG4: jämför INNER JOIN och LEFT JOIN
-- Utgå från Avdelning och hämta avdelningsnamn samt de anställdas förnamn och efternamn.
-- 1.Kör frågan med INNER JOIN, 2. Kör samma fråga med LEFT JOIN, 3.Visa båda resultaten och förklara skillnaden.
SELECT d.department_name,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM department d
         INNER JOIN employee e
                    ON e.department_id = d.department_id;

SELECT d.department_name,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM department d
         LEFT JOIN employee e
                   ON e.department_id = d.department_id;

-- endregion

