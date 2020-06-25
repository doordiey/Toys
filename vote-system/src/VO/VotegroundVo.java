package VO;

public class VotegroundVo {
    private String votename;
    private Integer votes;
    private String detail;
    private String element;
    private Integer elementnumber;
    private Integer checktype;
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getChecktype() {
        return checktype;
    }

    public void setChecktype(Integer checktype) {
        this.checktype = checktype;
    }

    public String getElement() {
        return element;
    }

    public Integer getElementnumber() {
        return elementnumber;
    }

    public void setElement(String element) {
        this.element = element;
    }

    public void setElementnumber(Integer elementnumber) {
        this.elementnumber = elementnumber;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getVotes() {
        return votes;
    }

    public String getVotename() {
        return votename;
    }

    public void setVotename(String votename) {
        this.votename = votename;
    }

    public void setVotes(Integer votes) {
        this.votes = votes;
    }
}
