# Laboration 2 – Företagets personalregister

> **Arbetsdokument:** Fyll i varje avsnitt efter hand. Text inom hakparenteser är en platshållare som ska ersättas med
> din egen förklaring. Ta bort instruktioner och ej relevanta platshållare före inlämning.

## 1. Projektöversikt

**Syfte:** [Beskriv kort vad personalregistret ska hantera och vad laborationen visar.]

**Projekt:** `databas_labb2`  
**Databas:** `databas_labb2`  
**Databasanvändare:** `labb2_user` (lösenord dokumenteras genom 'Platshållare')

### 1.1 Miljö och verktyg

- Java: [Version]
- MySQL: [Version]
- IDE: IntelliJ IDEA
- Övriga verktyg: [Ange vid behov]

### 1.2 Databas och behörigheter

```sql
SELECT CURRENT_USER();
CREATE DATABASE databas_labb2;

CREATE USER 'labb2_user'@'localhost'
    IDENTIFIED BY 'PLATSHÅLLARE';

GRANT ALL PRIVILEGES
    ON databas_labb2.*
    TO 'labb2_user'@'localhost';

SHOW GRANTS FOR 'labb2_user'@'localhost';
```

```sql
SELECT CURRENT_USER(), DATABASE();
SHOW GRANTS; 
```

Jag kontrollerade databasanslutningen i IntelliJ genom att köra `SELECT CURRENT_USER();` för att verifiera att jag var
ansluten som `labb2_user@localhost`.
Därefter använde jag `SELECT DATABASE();` för att kontrollera att den aktiva databasen var `databas_labb2`.
Slutligen körde jag `SHOW GRANTS;` för att kontrollera användarens behörigheter. Resultatet visade att `labb2_user` har
behörigheter inom `databas_labb2`, men inga globala databasbehörigheter.
![picture1.png](pictures/picture1.png)
---

## 2. Datamodellering – G

### 2.1 Identifierade entiteter

| Entitet     | Vad representerar den?             | Varför behövs den?                                                                        |
|-------------|------------------------------------|-------------------------------------------------------------------------------------------|
| employee    | Företagets anställda               | För att hålla reda på alla anstälda inom företaget.                                       |
| department  | Företagets olika avdelningar       | För att registrera företagets avdelningar och kunna koppla anställda till rätt avdelning. 
| access_card | Passerkort som anställda kan få/ha | För att hålla reda på de passerkort som har getts ut.                                     |

### 2.2 Attribut

[Beskriv vilka attribut varje entitet behöver och varför. Lägg till eller ta bort rader.]

| Entitet     | Attribut                                                                                                     | Vad lagras?                                                                                                                                                      | Obligatoriskt?                        | Unikt?                                    |
|-------------|--------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|-------------------------------------------|
| employee    | employee_id<br/>first_name<br/>last_name<br/>email<br/>employment_date<br/>department_id<br/>department_name | ett unikt nummer för den anställde<br/>förnamn<br/>efternamn<br/>e-postadress<br/>anställningsdatum<br/>avdelnings-id                                            | ja<br/>ja<br/>ja<br/>ja<br/>ja<br/>ja | ja<br/>nej<br/>nej<br/>ja<br/>nej<br/>nej |
| department  | department_id<br/>office_location                                                                            | ett unikt nummer för avdelningen<br/>kontorsort                                                                                                                  | ja<br/>ja                             | ja<br/>nej                                |
| access_card | access_card_id<br/>access_card_number<br/>issuance_date<br/>expiry_date<br/>employee_id                      | ett unikt nummer för passerkortet<br/>ett unikt nummer för just en specifik passerkort<br/>utfärdandedatum<br/>sista giltighetsdatum<br/>registrerat på anställd | ja<br/>ja<br/>ja<br/>ja<br/>ja        | ja<br/>ja<br/>nej<br/>nej<br/>ja          |

### 2.3 Relationer och kardinalitet

[Beskriv relationerna i ord. Ange exempelvis 1:1 eller 1:N samt om deltagandet är obligatoriskt eller valfritt på respektive sida.]

| Entitet A | Entitet B | Kardinalitet | Obligatoriskt/valfritt | Motivering |
|-----------|-----------|--------------|------------------------|------------|
| [A]       | [B]       | [Ange]       | [Ange för båda sidor]  | [Förklara] |

### 2.4 Nycklar, datatyper och begränsningar

[Redovisa dina val av primärnycklar (PK), främmande nycklar (FK), datatyper samt regler som NOT NULL och UNIQUE. Motivera de viktigaste valen.]

| Tabell   | Kolumn   | Datatyp | PK/FK     | Begränsningar | Motivering |
|----------|----------|---------|-----------|---------------|------------|
| [Tabell] | [Kolumn] | [Typ]   | [PK/FK/–] | [Regler]      | [Varför?]  |

**Regler som modellen måste säkerställa:**

- [Regel 1 och hur den säkerställs]
- [Regel 2 och hur den säkerställs]
- [Regel 3 och hur den säkerställs]

### 2.5 Datamodell – bild

![Datamodell för G](images/datamodell-g.png)

[Förklara kort hur diagrammet visar tabellerna och relationerna. Ersätt bildfilen med din egen.]

---

## 3. SQL-implementation och testdata – G

### 3.1 Skapade tabeller

**SQL-fil:** `[ange sökvägen till din .sql-fil]`

[Förklara i vilken ordning du skapade tabellerna och varför. Beskriv hur tabellerna upprätthåller verksamhetens regler. Själva CREATE TABLE-kommandona finns i SQL-filen.]

### 3.2 Testdata

[Beskriv kort hur din fiktiva testdata är utformad och hur den täcker kraven. INSERT-kommandona finns i SQL-filen.]

- [ ] Flera anställda på samma avdelning
- [ ] Anställda på olika avdelningar
- [ ] Minst en avdelning utan anställda
- [ ] Anställda med passerkort
- [ ] Anställda utan passerkort

### 3.3 G1 – Anställda med avdelning (INNER JOIN)

**Vad frågan ska visa:** Anställdas förnamn, efternamn och avdelningsnamn.

**SQL-fråga:** [Finns i SQL-filen, ange gärna kommentar eller avsnitt.]

![Resultat av G1](images/g1-inner-join.png)

**Förklaring av resultatet:** [Vad visas? Varför fungerar INNER JOIN här?]

### 3.4 G2 – Alla avdelningar med anställda (LEFT JOIN)

**Vad frågan ska visa:** Alla avdelningar och deras anställda, även om en avdelning saknar anställda.

![Resultat av G2](images/g2-left-join.png)

**Förklaring av resultatet:** [Vad händer med den tomma avdelningen? Vad visas i de anställdas kolumner?]

---

## 4. Java-modell – G

### 4.1 Modellklasser

[Beskriv vilka Java-klasser du har skapat och vilka databastabeller de motsvarar.]

| Java-klass | Motsvarande tabell | Viktiga egenskaper |
|------------|--------------------|--------------------|
| [Klass]    | [Tabell]           | [Fält/egenskaper]  |

### 4.2 Relationerna i Java

[Förklara hur en anställd kan nå sin avdelning och sitt eventuella passerkort. Ange vilka referenser du har valt och varför. Kopplingarna behöver bara gå från anställd till de andra objekten.]

### 4.3 Testdata och körresultat

[Beskriv hur du har skapat fiktiva objekt direkt i Java och vad konsolutskriften visar.]

![Konsolutskrift från Java – G](images/java-g.png)

**Så startas programmet:** [Ange klass med main-metod och hur den körs i IntelliJ.]

**Obs:** Denna laboration kräver inte JDBC eller JPA. Java-objekten skapas direkt i programkoden.

---

## 5. Utökad datamodell – VG

### 5.1 Nya entiteter och attribut

[Beskriv vilka ytterligare uppgifter verksamheten vill lagra och hur du utökat modellen.]

### 5.2 Relationer, nycklar och regler

[Förklara hur du modellerar kopplingen mellan anställda och kompetenser, inklusive kardinalitet och valfria kopplingar. Förklara hur du förhindrar att samma kompetens kopplas till samma anställd flera gånger.]

### 5.3 Datamodell – VG

![Utökad datamodell för VG](images/datamodell-vg.png)

[Förklara vad som har ändrats jämfört med G-modellen.]

### 5.4 Testdata för VG

- [ ] En anställd med flera kompetenser
- [ ] Samma kompetens hos flera anställda
- [ ] En anställd utan registrerade kompetenser
- [ ] En kompetens utan kopplad anställd
- [ ] Fortfarande en avdelning utan anställda
- [ ] Fortfarande anställda utan passerkort

---

## 6. SQL-frågor – VG

### 6.1 VG1 – Anställda med avdelning och eventuellt passerkort

![Resultat av VG1](images/vg1.png)

**Förklaring:** [Hur ser du till att även anställda utan passerkort visas?]

### 6.2 VG2 – Avdelningar, anställda och eventuella passerkort

![Resultat av VG2](images/vg2.png)

**Förklaring:** [Hur ser du till att både tomma avdelningar och anställda utan passerkort finns kvar?]

### 6.3 VG3 – En anställds samlade uppgifter

[Beskriv vilken anställd du valt och hur frågan hämtar anställdens uppgifter, avdelning, eventuellt passerkort och samtliga kompetenser.]

**Anställd med flera kompetenser:**

![VG3 – flera kompetenser](images/vg3-flera-kompetenser.png)

**Varför kan samma anställd ge flera resultatrader?** [Förklara.]

**Kontroll: anställd utan passerkort:**

![VG3 – utan passerkort](images/vg3-utan-kort.png)

**Kontroll: anställd utan registrerade kompetenser:**

![VG3 – utan kompetenser](images/vg3-utan-kompetenser.png)

**Varför visas den anställde ändå i båda kontrollerna?** [Förklara hur LEFT JOIN påverkar resultatet.]

### 6.4 VG4 – Jämförelse mellan INNER JOIN och LEFT JOIN

**INNER JOIN – resultat:**

![VG4 – INNER JOIN](images/vg4-inner-join.png)

**LEFT JOIN – resultat:**

![VG4 – LEFT JOIN](images/vg4-left-join.png)

**Jämförelse:**

- Vilken avdelning försvinner med INNER JOIN? [Svar]
- Varför finns den kvar med LEFT JOIN? [Svar]
- Vad visas i kolumnerna för anställda på den raden? [Svar]

---

## 7. Java-modell – VG

### 7.1 Utökning med kompetenser

[Beskriv hur du har utökat modellklasserna så att en anställd kan ha flera kompetenser och flera anställda kan hänvisa till samma kompetensobjekt. Motivera dina val.]

### 7.2 Demonstration i konsolen

[Beskriv hur utskrifterna visar samtliga fall nedan.]

- [ ] Anställds uppgifter, avdelning, passerkort och samtliga kompetenser
- [ ] Samma kompetensobjekt hos flera anställda
- [ ] Anställd utan registrerade kompetenser
- [ ] Kompetens som ännu inte kopplats till någon anställd kan finnas i modellen
- [ ] G-delens funktionalitet fungerar fortfarande

![Konsolutskrift från Java – VG](images/java-vg.png)

---

## 8. Sammanfattning och reflektion

**Databasmodellen:** [Vilka viktiga designval gjorde du och varför?]

**JOIN-frågorna:** [Vad lärde du dig om INNER JOIN respektive LEFT JOIN?]

**Java-modellen:** [Hur skiljer sig objektens referenser från nycklarna i databasen?]

**Utmaningar och lösningar:** [Beskriv kort något du fick felsöka eller tänka om kring.]

---

## 9. Inlämningskontroll

- [ ] En `.sql`-fil innehåller databas, användare, tabeller, INSERT och G/VG-frågor
- [ ] Inga riktiga lösenord eller andra hemligheter finns i GitHub-repot
- [ ] Java-projektet kan startas och visar resultaten i konsolen
- [ ] Entiteter, attribut, relationer, kardinalitet och nycklar är dokumenterade
- [ ] Datamodellen finns som bild i README
- [ ] Skärmdumpar av SQL-frågornas resultat finns med och är förklarade
- [ ] Java-klasserna och hur relationerna representeras är beskrivna
- [ ] Skärmdump av konsolutskrift finns med
- [ ] Instruktion för att starta Java-programmet finns med
- [ ] Alla G-krav är uppfyllda
- [ ] Alla VG-krav är uppfyllda
- [ ] Alla bildlänkar fungerar i GitHub
- [ ] Läraren har tillgång till GitHub-repot

