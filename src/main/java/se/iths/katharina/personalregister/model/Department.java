package se.iths.katharina.personalregister.model;

public class Department {
    private Integer departmentId;
    private String departmentName;
    private String officeLocation;

    public Department(Integer departmentId, String departmentName, String officeLocation) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
        this.officeLocation = officeLocation;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getOfficeLocation() {
        return officeLocation;
    }

    public void setOfficeLocation(String officeLocation) {
        this.officeLocation = officeLocation;
    }
}