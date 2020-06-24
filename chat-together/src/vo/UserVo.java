package vo;

public class UserVo {
    private String client;
    private String password;
    private String nickname;

    public String getPassword() {
        return password;
    }

    public String getClient() {
        return client;
    }

    public String getNickname() {
        return nickname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
