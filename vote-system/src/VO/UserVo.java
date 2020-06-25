package VO;

public class UserVo {
    private String user;
    private String password;
    private Integer who;

    public String getUser() {
        return user;
    }

    public Integer getWho() {
        return who;
    }

    public String getPassword() {
        return password;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setWho(Integer who) {
        this.who = who;
    }
}
