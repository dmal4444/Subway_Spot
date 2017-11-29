package com.sub.VO;

import java.sql.Date;
import java.sql.Time;

public class ReplyVO {

   private int      hotplacecode;
   private String   body;
   private String   nick;
   private String   pw;
   private Date      date;
   private Time      time;
   
   public int getHotplacecode() {
      return hotplacecode;
   }
   public void setHotplacecode(int hotplacecode) {
      this.hotplacecode = hotplacecode;
   }
   public String getBody() {
      return body;
   }
   public void setBody(String body) {
      this.body = body;
   }
   public String getNick() {
      return nick;
   }
   public void setNick(String nick) {
      this.nick = nick;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public Date getDate() {
      return date;
   }
   public void setDate(Date date) {
      this.date = date;
   }
   public Time getTime() {
      return time;
   }
   public void setTime(Time time) {
      this.time = time;
   }
   
}