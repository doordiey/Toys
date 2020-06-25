package VO;

public class VotingVo {
    private String user;
    private String voting;
    private Integer which;

    public Integer getWhich() {
        return which;
    }

    public void setWhich(Integer which) {
        this.which = which;
    }

    public String getUser() {
        return user;
    }

    public String getVoting() {
        return voting;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setVoting(String voting) {
        this.voting = voting;
    }
}
