package se.iths.katharina.personalregister.model;

import java.time.LocalDate;

public class AccessCard {
    private Integer accessCardId;
    private Integer accessCardNumber;
    private LocalDate issuanceDate;
    private LocalDate expiryDate;
    private Employee employee;

    public AccessCard(Integer accessCardId, Integer accessCardNumber, LocalDate issuanceDate, LocalDate expiryDate, Employee employee) {
        this.accessCardId = accessCardId;
        this.accessCardNumber = accessCardNumber;
        this.issuanceDate = issuanceDate;
        this.expiryDate = expiryDate;
        this.employee = employee;
    }

    public Integer getAccessCardId() {
        return accessCardId;
    }

    public void setAccessCardId(Integer accessCardId) {
        this.accessCardId = accessCardId;
    }

    public Integer getAccessCardNumber() {
        return accessCardNumber;
    }

    public void setAccessCardNumber(Integer accessCardNumber) {
        this.accessCardNumber = accessCardNumber;
    }

    public LocalDate getIssuanceDate() {
        return issuanceDate;
    }

    public void setIssuanceDate(LocalDate issuanceDate) {
        this.issuanceDate = issuanceDate;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
