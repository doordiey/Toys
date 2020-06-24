package vo;

import org.omg.PortableInterceptor.INACTIVE;

public class ChartroomVo {
    private String roomname;
    private String roomhost;
    private Integer roomnumber;
    private String content;
    private Integer roomonline;

    public String getContent() {
        return content;
    }

    public String getRoomhost() {
        return roomhost;
    }

    public String getRoomname() {
        return roomname;
    }

    public Integer getRoomnumber() {
        return roomnumber;
    }

    public Integer getRoomonline() {
        return roomonline;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setRoomhost(String roomhost) {
        this.roomhost = roomhost;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public void setRoomnumber(Integer roomnumber) {
        this.roomnumber = roomnumber;
    }

    public void setRoomonline(Integer roomonline) {
        this.roomonline = roomonline;
    }
}
