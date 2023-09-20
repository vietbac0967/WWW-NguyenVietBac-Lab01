package com.example.lab01.entities;

public class GrantAccess {
    private Role role;
    private Account account;
    private byte isGrant;
    private String note;

    public GrantAccess(Role role, Account account, byte isGrant, String note) {
        this.role = role;
        this.account = account;
        this.isGrant = isGrant;
        this.note = note;
    }

    public GrantAccess() {
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public byte getIsGrant() {
        return isGrant;
    }

    public void setIsGrant(byte isGrant) {
        this.isGrant = isGrant;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
