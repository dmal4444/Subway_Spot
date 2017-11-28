package com.sub.VO;

public class HotplaceVO {
   
   private String station;
   private String category;
   private String name;
   private String ename;
   private String address;
   private double xpoint;
   private double ypoint;
   private String info;
   private String imagepath;
   private double lat;
   private double lng;
   
   
   //페이징 처리에 필요한 
   private int start;
   private int end;
   private int nowPage;
   
   
   public int getNowPage() {
	return nowPage;
}
public void setNowPage(int nowPage) {
	this.nowPage = nowPage;
}
public int getStart() {
	return start;
}
public void setStart(int start) {
	this.start = start;
}
public int getEnd() {
	return end;
}
public void setEnd(int end) {
	this.end = end;
}
public double getLat() {
	return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getStation() {
	      return station;
   }
   public void setStation(String station) {
      this.station = station;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEname() {
      return ename;
   }
   public void setEname(String ename) {
      this.ename = ename;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public double getXpoint() {
      return xpoint;
   }
   public void setXpoint(double xpoint) {
      this.xpoint = xpoint;
   }
   public double getYpoint() {
      return ypoint;
   }
   public void setYpoint(double ypoint) {
      this.ypoint = ypoint;
   }
   public String getInfo() {
      return info;
   }
   public void setInfo(String info) {
      this.info = info;
   }
   public String getImagepath() {
      return imagepath;
   }
   public void setImagepath(String imagepath) {
      this.imagepath = imagepath;
   }   
}