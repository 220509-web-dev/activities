package com.revature.basketball_team;

public class Basketball_Players extends Basketball_Team{

    private String firstName;
    private String lastName;
    private String number;
    private String position;
    private String overall;

    public Basketball_Players(String firstName, String lastName, String number, String position, String overall) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.number = number;
        this.position = position;
        this.overall = overall;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getOverall() {
        return overall;
    }

    public void setOverall(String overall) {
        this.overall = overall;
    }
}
