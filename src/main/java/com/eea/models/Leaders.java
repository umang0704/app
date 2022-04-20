package com.eea.models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "leaders")
public class Leaders {
    @ManyToOne
    private AccountDetails accountDetails;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leaderId;
    @Column(name = "leader_name")
    private String leaderName;
    @Column(name = "leader_from")
    private Date leaderFrom;
    @Column(name = "leader_to")
    private Date leaderTo;
    @Column(name = "is_current")
    private Boolean current;
    @Column(name = "about")
    private String about;
    @Column(name = "city")
    private String city;
    @Column(name = "state")
    private String state;

    public AccountDetails getAccountDetails() {
        return accountDetails;
    }

    public void setAccountDetails(AccountDetails accountDetails) {
        this.accountDetails = accountDetails;
    }

    public Integer getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Integer leaderId) {
        this.leaderId = leaderId;
    }

    public String getLeaderName() {
        return leaderName;
    }

    public void setLeaderName(String leaderName) {
        this.leaderName = leaderName;
    }

    public Date getLeaderFrom() {
        return leaderFrom;
    }

    public void setLeaderFrom(Date leaderFrom) {
        this.leaderFrom = leaderFrom;
    }

    public Date getLeaderTo() {
        return leaderTo;
    }

    public void setLeaderTo(Date leaderTo) {
        this.leaderTo = leaderTo;
    }

    public boolean isCurrent() {
        return current;
    }

    public void setCurrent(boolean current) {
        this.current = current;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
