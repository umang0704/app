package com.eea.dto;

import lombok.Getter;
import lombok.Setter;

public class UpdatePasswordDto {
    private String accountEmail;
    private String oldAccountPassword;
    private String newAccountPassword;
    private String confirmNewAccountPassword;

    public String getAccountEmail() {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }

    public String getOldAccountPassword() {
        return oldAccountPassword;
    }

    public void setOldAccountPassword(String oldAccountPassword) {
        this.oldAccountPassword = oldAccountPassword;
    }

    public String getNewAccountPassword() {
        return newAccountPassword;
    }

    public void setNewAccountPassword(String newAccountPassword) {
        this.newAccountPassword = newAccountPassword;
    }

    public String getConfirmNewAccountPassword() {
        return confirmNewAccountPassword;
    }

    public void setConfirmNewAccountPassword(String confirmNewAccountPassword) {
        this.confirmNewAccountPassword = confirmNewAccountPassword;
    }
}
