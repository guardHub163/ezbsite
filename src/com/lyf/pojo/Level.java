package com.lyf.pojo;

import java.util.Date;

public class Level {
    private Integer id;

    private String userid;

    private Integer apply;

    private Integer level;

    private Date applydate;

    private Date confirmdate;

    private User user;
    
    private String pareId;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getApply() {
        return apply;
    }

    public void setApply(Integer apply) {
        this.apply = apply;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Date getApplydate() {
        return applydate;
    }

    public void setApplydate(Date applydate) {
        this.applydate = applydate;
    }

    public Date getConfirmdate() {
        return confirmdate;
    }

    public void setConfirmdate(Date confirmdate) {
        this.confirmdate = confirmdate;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPareId() {
		return pareId;
	}

	public void setPareId(String pareId) {
		this.pareId = pareId;
	}
    
    
}