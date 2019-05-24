package com.oralce.web.bean;

public class Book {
    private Integer id;

    private String name;

    private String jiage;

    private String chubanshe;

    private String zhuangtai;

    private String jieshuren;

    private String fenlei;

    private Integer fId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getJiage() {
        return jiage;
    }

    public void setJiage(String jiage) {
        this.jiage = jiage == null ? null : jiage.trim();
    }

    public String getChubanshe() {
        return chubanshe;
    }

    public void setChubanshe(String chubanshe) {
        this.chubanshe = chubanshe == null ? null : chubanshe.trim();
    }

    public String getZhuangtai() {
        return zhuangtai;
    }

    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? null : zhuangtai.trim();
    }

    public String getJieshuren() {
        return jieshuren;
    }

    public void setJieshuren(String jieshuren) {
        this.jieshuren = jieshuren == null ? null : jieshuren.trim();
    }

    public String getFenlei() {
        return fenlei;
    }

    public void setFenlei(String fenlei) {
        this.fenlei = fenlei == null ? null : fenlei.trim();
    }

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", jiage=" + jiage + ", chubanshe=" + chubanshe + ", zhuangtai="
				+ zhuangtai + ", jieshuren=" + jieshuren + ", fenlei=" + fenlei + ", fId=" + fId + "]";
	}
    
}