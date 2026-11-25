package se.iths.katharina.personalregister.model;

public class Competence {
    private Integer competenceId;
    private String competenceName;
    private String description;

    public Competence(Integer competenceId, String competenceName, String description) {
        this.competenceId = competenceId;
        this.competenceName = competenceName;
        this.description = description;
    }

    public Integer getCompetenceId() {
        return competenceId;
    }

    public void setCompetenceId(Integer competenceId) {
        this.competenceId = competenceId;
    }

    public String getCompetenceName() {
        return competenceName;
    }

    public void setCompetenceName(String competenceName) {
        this.competenceName = competenceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
