package vo;

public class ChatVo {
    private String speaker;
    private String speaking;
    private Integer room;

    public String getSpeaker() {
        return speaker;
    }

    public String getSpeaking() {
        return speaking;
    }

    public void setSpeaker(String speaker) {
        this.speaker = speaker;
    }

    public void setSpeaking(String speaking) {
        this.speaking = speaking;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public Integer getRoom() {
        return room;
    }
}
