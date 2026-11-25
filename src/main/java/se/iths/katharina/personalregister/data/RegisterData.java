package se.iths.katharina.personalregister.data;

import se.iths.katharina.personalregister.model.AccessCard;
import se.iths.katharina.personalregister.model.Competence;
import se.iths.katharina.personalregister.model.Department;
import se.iths.katharina.personalregister.model.Employee;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

public class RegisterData {
    private Map<Integer, Department> departments = new LinkedHashMap<>();
    private Map<Integer, Employee> employees = new LinkedHashMap<>();
    private Map<Integer, Competence> competences = new LinkedHashMap<>();

    public RegisterData() {
        createDepartments();
        createEmployees();
        createAccessCards();
        createCompetences();
        assignCompetences();
    }

    public Map<Integer, Employee> getEmployees() {
        return employees;
    }

    public Map<Integer, Competence> getCompetences() {
        return competences;
    }

    //region Register departments
    private void createDepartments() {
        departments.put(1, new Department(1, "IT", "Stockholm"));
        departments.put(2, new Department(2, "Ekonomi", "Göteborg"));
        departments.put(3, new Department(3, "HR", "Malmö"));
        departments.put(4, new Department(4, "Kundservice", "Uppsala"));
        departments.put(5, new Department(5, "Marknadsföring", "Stockholm"));
        departments.put(6, new Department(6, "Försäljning", "Göteborg"));
        departments.put(7, new Department(7, "Produktutveckling", "Linköping"));
        departments.put(8, new Department(8, "Administration", "Västerås"));
        departments.put(9, new Department(9, "Juridik", "Stockholm"));
        departments.put(10, new Department(10, "Kvalitetssäkring", "Örebro"));
    }
//endregion

    //region Register employees
    private void createEmployees() {

        // 1. Employees with accessCards and competences
        employees.put(1, new Employee(1, "Erik", "Andersson",
                "erik.andersson@personalregister.example",
                LocalDate.of(2020, 3, 15), departments.get(1)));

        employees.put(9, new Employee(9, "Anna", "Svensson",
                "anna.svensson@personalregister.example",
                LocalDate.of(2017, 5, 22), departments.get(2)));

        employees.put(16, new Employee(16, "Sofia", "Larsson",
                "sofia.larsson@personalregister.example",
                LocalDate.of(2018, 8, 20), departments.get(3)));

        employees.put(22, new Employee(22, "Amanda", "Olsson",
                "amanda.olsson@personalregister.example",
                LocalDate.of(2020, 7, 6), departments.get(4)));

        employees.put(28, new Employee(28, "Julia", "Ekström",
                "julia.ekstrom@personalregister.example",
                LocalDate.of(2019, 2, 11), departments.get(5)));


        // 2. Employees without accessCards but with and competences
        employees.put(3, new Employee(3, "Johan", "Bergström",
                "johan.bergstrom@personalregister.example",
                LocalDate.of(2019, 9, 10), departments.get(1)));

        employees.put(10, new Employee(10, "Peter", "Johansson",
                "peter.johansson@personalregister.example",
                LocalDate.of(2020, 10, 1), departments.get(2)));

        employees.put(29, new Employee(29, "Viktor", "Hansson",
                "viktor.hansson@personalregister.example",
                LocalDate.of(2020, 9, 14), departments.get(5)));

        employees.put(35, new Employee(35, "Emilia", "Björk",
                "emilia.bjork@personalregister.example",
                LocalDate.of(2020, 4, 27), departments.get(6)));

        employees.put(41, new Employee(41, "Ebba", "Sundström",
                "ebba.sundstrom@personalregister.example",
                LocalDate.of(2020, 12, 1), departments.get(7)));


        // 3. Employees without accessCards and competences
        employees.put(8, new Employee(8, "Nora", "Ek",
                "nora.ek@personalregister.example",
                LocalDate.of(2025, 2, 3), departments.get(1)));

        employees.put(15, new Employee(15, "Linda", "Nyström",
                "linda.nystrom@personalregister.example",
                LocalDate.of(2024, 3, 18), departments.get(2)));

        employees.put(21, new Employee(21, "Filip", "Åberg",
                "filip.aberg@personalregister.example",
                LocalDate.of(2025, 1, 13), departments.get(3)));

        employees.put(32, new Employee(32, "Clara", "Ström",
                "clara.strom@personalregister.example",
                LocalDate.of(2023, 7, 3), departments.get(5)));

        employees.put(50, new Employee(50, "Therese", "Lindgren",
                "therese.lindgren@personalregister.example",
                LocalDate.of(2024, 11, 4), departments.get(8)));
    }

    //endregion

    //region Register accessCards
    private void createAccessCards() {

        // Erik Andersson – ID 1
        Employee erik = employees.get(1);
        AccessCard erikCard = new AccessCard(
                1, 10001,
                LocalDate.of(2024, 1, 15),
                LocalDate.of(2027, 1, 15),
                erik
        );
        erik.setAccessCard(erikCard);

        // Anna Svensson – ID 9
        Employee anna = employees.get(9);
        AccessCard annaCard = new AccessCard(
                5, 10005,
                LocalDate.of(2025, 5, 20),
                LocalDate.of(2028, 5, 20),
                anna
        );
        anna.setAccessCard(annaCard);

        // Sofia Larsson – ID 16
        Employee sofia = employees.get(16);
        AccessCard sofiaCard = new AccessCard(
                8, 10008,
                LocalDate.of(2025, 2, 14),
                LocalDate.of(2028, 2, 14),
                sofia
        );
        sofia.setAccessCard(sofiaCard);

        // Amanda Olsson – ID 22
        Employee amanda = employees.get(22);
        AccessCard amandaCard = new AccessCard(
                11, 10011,
                LocalDate.of(2025, 4, 17),
                LocalDate.of(2028, 4, 17),
                amanda
        );
        amanda.setAccessCard(amandaCard);

        // Julia Ekström – ID 28
        Employee julia = employees.get(28);
        AccessCard juliaCard = new AccessCard(
                14, 10014,
                LocalDate.of(2025, 8, 1),
                LocalDate.of(2028, 8, 1),
                julia
        );
        julia.setAccessCard(juliaCard);

        // Clara Ström – ID 32
        Employee clara = employees.get(32);
        AccessCard claraCard = new AccessCard(
                16, 10016,
                LocalDate.of(2026, 4, 20),
                LocalDate.of(2029, 4, 20),
                clara
        );
        clara.setAccessCard(claraCard);

        // Therese Lindgren – ID 50
        Employee therese = employees.get(50);
        AccessCard thereseCard = new AccessCard(
                25, 10025,
                LocalDate.of(2026, 8, 17),
                LocalDate.of(2029, 8, 17),
                therese
        );
        therese.setAccessCard(thereseCard);
    }

    //endregion

    //region Register competences
    private void createCompetences() {

        // IT och systemutveckling
        competences.put(1, new Competence(1, "Java",
                "Utveckling, felsökning och underhåll av applikationer i Java."));

        competences.put(2, new Competence(2, "SQL",
                "Hantering och bearbetning av data i relationsdatabaser med SQL."));

        competences.put(4, new Competence(4, "IT-säkerhet",
                "Skydd av system, information och användardata mot säkerhetsrisker."));

        competences.put(8, new Competence(8, "Git",
                "Versionshantering av kod och samarbete i utvecklingsprojekt."));

        competences.put(9, new Competence(9, "Datamodellering",
                "Planering och strukturering av data, tabeller och relationer."));

        competences.put(11, new Competence(11, "Docker",
                "Paketering och körning av applikationer i containrar."));

        competences.put(12, new Competence(12, "Linux",
                "Arbete med Linuxbaserade operativsystem och servermiljöer."));

        // Ekonomi
        competences.put(17, new Competence(17, "Redovisning",
                "Bokföring, ekonomisk rapportering och uppföljning av företagets ekonomi."));

        competences.put(18, new Competence(18, "Budgetering",
                "Planering och uppföljning av intäkter, kostnader och budgetar."));

        competences.put(19, new Competence(19, "Excel",
                "Beräkningar, datahantering och rapportering i kalkylblad."));

        competences.put(20, new Competence(20, "Ekonomisk analys",
                "Granskning av ekonomiska resultat, kostnader och nyckeltal."));

        competences.put(21, new Competence(21, "Fakturahantering",
                "Registrering, kontroll och uppföljning av fakturor och betalningar."));

        competences.put(22, new Competence(22, "Momsredovisning",
                "Beräkning, sammanställning och rapportering av moms."));

        // HR
        competences.put(24, new Competence(24, "Rekrytering",
                "Arbetet med att hitta, intervjua och anställa nya medarbetare."));

        competences.put(25, new Competence(25, "Arbetsrätt",
                "Lagar och regler som styr anställningar och förhållanden på arbetsplatsen."));

        competences.put(29, new Competence(29, "Onboarding",
                "Introduktion och stöd till nya medarbetare under deras första tid."));

        competences.put(31, new Competence(31, "Arbetsmiljöarbete",
                "Arbete för en säker, hälsosam och fungerande arbetsmiljö."));

        // Kundservice
        competences.put(32, new Competence(32, "Kundkommunikation",
                "Tydlig och professionell kommunikation med kunder i olika kanaler."));

        competences.put(33, new Competence(33, "CRM-system",
                "Registrering och uppföljning av kundkontakter i CRM-system."));

        competences.put(35, new Competence(35, "Ärendehantering",
                "Registrering, hantering och uppföljning av inkommande ärenden."));

        // Marknadsföring
        competences.put(39, new Competence(39, "Digital marknadsföring",
                "Marknadsföring av produkter och tjänster genom digitala kanaler."));

        competences.put(40, new Competence(40, "SEO",
                "Sökmotoroptimering för att göra webbplatser lättare att hitta."));

        competences.put(41, new Competence(41, "Innehållsproduktion",
                "Framtagning av texter, bilder och annat innehåll för olika kanaler."));

        competences.put(42, new Competence(42, "Webbanalys",
                "Analys av besöksstatistik och hur människor använder webbplatser."));

        competences.put(43, new Competence(43, "Sociala medier",
                "Planering, publicering och uppföljning av innehåll i sociala medier."));

        // Försäljning
        competences.put(45, new Competence(45, "Försäljning",
                "Försäljning av produkter och tjänster samt utveckling av kundrelationer."));

        competences.put(49, new Competence(49, "Offertarbete",
                "Framtagning, presentation och uppföljning av offerter."));

        // Projekt och produktutveckling
        competences.put(50, new Competence(50, "Projektledning",
                "Planering, samordning och uppföljning av projekt från start till mål."));

        competences.put(51, new Competence(51, "UX-design",
                "Utformning av digitala produkter med fokus på användarupplevelsen."));

        competences.put(54, new Competence(54, "Tillgänglighet",
                "Utformning av digitala tjänster som fungerar för människor med olika behov."));

        competences.put(55, new Competence(55, "Prototypframtagning",
                "Skapande av tidiga produktversioner för att testa idéer och lösningar."));

        //Competence not assigned to any employee
        competences.put(65, new Competence(65, "AI-utveckling",
                "Utveckling av lösningar som använder artificiell intelligens."));

        competences.put(66, new Competence(66, "Blockchain",
                "Utveckling av system för säker och decentraliserad lagring av transaktioner."));

        competences.put(67, new Competence(67, "Robotprocessautomatisering (RPA)",
                "Automatisering av återkommande arbetsuppgifter med hjälp av programvara."));

    }
//endregion

    //region Assigning competences

    private void assignCompetences() {

        Competence java = competences.get(1);
        Competence sql = competences.get(2);
        Competence itSecurity = competences.get(4);
        Competence git = competences.get(8);
        Competence dataModelling = competences.get(9);
        Competence docker = competences.get(11);
        Competence linux = competences.get(12);

        Competence accounting = competences.get(17);
        Competence budgeting = competences.get(18);
        Competence excel = competences.get(19);
        Competence financialAnalysis = competences.get(20);
        Competence invoiceManagement = competences.get(21);
        Competence vatReporting = competences.get(22);

        Competence recruitment = competences.get(24);
        Competence employmentLaw = competences.get(25);
        Competence onboarding = competences.get(29);
        Competence workEnvironmentManagement = competences.get(31);

        Competence customerCommunication = competences.get(32);
        Competence crm = competences.get(33);
        Competence caseManagement = competences.get(35);

        Competence digitalMarketing = competences.get(39);
        Competence seo = competences.get(40);
        Competence contentCreation = competences.get(41);
        Competence webAnalytics = competences.get(42);
        Competence socialMedia = competences.get(43);

        Competence sales = competences.get(45);
        Competence quotationManagement = competences.get(49);
        Competence projectManagement = competences.get(50);

        Competence uxDesign = competences.get(51);
        Competence accessibility = competences.get(54);
        Competence prototyping = competences.get(55);

        //Employees with access cards and competences

        // Erik Andersson - ID 1
        Employee erik = employees.get(1);
        erik.getCompetences().add(java);
        erik.getCompetences().add(sql);
        erik.getCompetences().add(git);
        erik.getCompetences().add(dataModelling);
        erik.getCompetences().add(projectManagement);

        // Anna Svensson - ID 9
        Employee anna = employees.get(9);
        anna.getCompetences().add(accounting);
        anna.getCompetences().add(budgeting);
        anna.getCompetences().add(excel);
        anna.getCompetences().add(financialAnalysis);

        // Sofia Larsson - ID 16
        Employee sofia = employees.get(16);
        sofia.getCompetences().add(recruitment);
        sofia.getCompetences().add(employmentLaw);
        sofia.getCompetences().add(onboarding);
        sofia.getCompetences().add(workEnvironmentManagement);

        // Amanda Olsson - ID 22
        Employee amanda = employees.get(22);
        amanda.getCompetences().add(customerCommunication);
        amanda.getCompetences().add(crm);
        amanda.getCompetences().add(caseManagement);

        // Julia Ekström - ID 28
        Employee julia = employees.get(28);
        julia.getCompetences().add(digitalMarketing);
        julia.getCompetences().add(seo);
        julia.getCompetences().add(contentCreation);

        // Employees without access cards

        // Johan Bergström - ID 3
        Employee johan = employees.get(3);
        johan.getCompetences().add(sql);
        johan.getCompetences().add(itSecurity);
        johan.getCompetences().add(docker);
        johan.getCompetences().add(linux);

        // Peter Johansson - ID 10
        Employee peter = employees.get(10);
        peter.getCompetences().add(accounting);
        peter.getCompetences().add(invoiceManagement);
        peter.getCompetences().add(vatReporting);

        // Viktor Hansson - ID 29
        Employee viktor = employees.get(29);
        viktor.getCompetences().add(digitalMarketing);
        viktor.getCompetences().add(webAnalytics);
        viktor.getCompetences().add(socialMedia);

        // Emilia Björk - ID 35
        Employee emilia = employees.get(35);
        emilia.getCompetences().add(sales);
        emilia.getCompetences().add(crm);
        emilia.getCompetences().add(quotationManagement);

        // Ebba Sundström - ID 41
        Employee ebba = employees.get(41);
        ebba.getCompetences().add(uxDesign);
        ebba.getCompetences().add(accessibility);
        ebba.getCompetences().add(prototyping);

        // Employees without registered competences
        // ID 8  - Nora Ek
        // ID 15 - Linda Nyström
        // ID 21 - Filip Åberg
        // ID 32 - Clara Ström
        // ID 50 - Therese Lindgren

        // Their competence lists remain empty.

    }
    //endregion


}


