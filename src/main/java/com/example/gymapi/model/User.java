package com.example.gymapi.model;

import java.util.Date;

public class User {
    private int id;
    private String login;
    private String password;
    private Date birthDate;
    private boolean plec;

    public User(int id, String login, String password, Date birthDate, boolean plec)
    {
        this.id = id;
        this.login = login;
        this.password = password;
        this.birthDate = birthDate;
        this.plec = plec;
    }

    public int getId() {
        return id;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public boolean isPlec() {
        return plec;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", birthDate=" + birthDate +
                ", plec=" + plec +
                '}';
    }
}
