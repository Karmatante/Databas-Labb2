package se.iths.katharina.personalregister;

import se.iths.katharina.personalregister.data.RegisterData;
import se.iths.katharina.personalregister.model.Competence;
import se.iths.katharina.personalregister.model.Employee;

public class Main {
    public static void main(String[] args) {

        RegisterData register = new RegisterData();

        for (Employee employee : register.getEmployees().values()) {
            IO.println("Anställnings-ID: " + employee.getEmployeeId());
            IO.println(employee.getFirstName() + " " + employee.getLastName());
            IO.println("Mejladress: " + employee.getEmail());
            IO.println("Anställd sedan: " + employee.getEmploymentDate());
            if (employee.getAccessCard() == null) {
                IO.println("Inget passerkort registrerat på den anställde.");
            } else {
                IO.println("Passerkort: " + employee.getAccessCard().getAccessCardNumber());
            }
            IO.println("Tillhör avdelning: " + employee.getDepartment().getDepartmentName());
            if (employee.getCompetences().isEmpty()) {
                IO.println("Kompetenser: Inga kompetenser registrerade.");
            } else {
                IO.print("Kompetenser: ");
                for (Competence competence : employee.getCompetences()) {
                    IO.print(competence.getCompetenceName() + " | ");
                }
                IO.println();
            }
            IO.println("------------------------------------------------");
            
        }
    }
}

