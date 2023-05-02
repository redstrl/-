package cn.esweb.eswebstore.domain;

import java.io.Serializable;
import java.util.Date;

public class LogoutLog implements Serializable {
    private static final long serialVersionUID = 1L;

    private int userid; //用户id

    private String ipaddress; //ip地址

    private Date date; //时间戳

    public int getUserid() {
        return userid;
    }
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getIpaddress() {
        return ipaddress;
    }
    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
}