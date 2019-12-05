package com.xyl.appraisal.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-05
 */
@TableName("tb_appraisal")
public class Appraisal extends Model<Appraisal> {

    private static final long serialVersionUID = 1L;

    /**
     * 鉴定师id
     */
    @TableId(value = "apprer_id", type = IdType.AUTO)
    private Integer apprerId;
    /**
     * 鉴定师唯一标识
     */
    private String apprIdent;
    /**
     * 昵称
     */
    private String apprNick;
    /**
     * 真实姓名
     */
    private String apprName;
    /**
     * 邮箱
     */
    private String apprEmail;
    /**
     * 密码
     */
    private String apprPwd;
    /**
     * 备注
     */
    private String apprRemark;
    /**
     * 状态（待审核or通过or异常）
     */
    private String apprState;
    /**
     * 是否是金牌鉴定师（普通鉴定师，金牌鉴定师）
     */
    private String apprVip;
    /**
     * 积分
     */
    private Float apprIntegral;
    /**
     * 鉴定过的商品（数量）
     */
    private Integer apprNum;
    /**
     * 鉴定的价格
     */
    private Float apprPrice;
    /**
     * 头像
     */
    private String apprHeader;
    /**
     * 审核照片
     */
    private String apprPhoto;
    /**
     * 申请时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;
    
    @TableField(exist=false)
    private String formPwd1;
    
    @TableField(exist=false)
    private String formPwd2;
    
    @TableField(exist=false)
    private String formCode;
    
    @TableField(exist=false)
    private List<Integer> brands;
    
    @TableField(exist=false)
    private List<Integer>  sorts;

   
    
    public Integer getApprerId() {
        return apprerId;
    }

    public void setApprerId(Integer apprerId) {
        this.apprerId = apprerId;
    }

    public String getApprIdent() {
        return apprIdent;
    }

    public void setApprIdent(String apprIdent) {
        this.apprIdent = apprIdent;
    }

    public String getApprNick() {
        return apprNick;
    }

    public void setApprNick(String apprNick) {
        this.apprNick = apprNick;
    }

    public String getApprName() {
        return apprName;
    }

    public void setApprName(String apprName) {
        this.apprName = apprName;
    }

    public String getApprEmail() {
        return apprEmail;
    }

    public void setApprEmail(String apprEmail) {
        this.apprEmail = apprEmail;
    }

    public String getApprPwd() {
        return apprPwd;
    }

    public void setApprPwd(String apprPwd) {
        this.apprPwd = apprPwd;
    }

    public String getApprState() {
        return apprState;
    }

    public void setApprState(String apprState) {
        this.apprState = apprState;
    }

    public String getApprVip() {
        return apprVip;
    }

    public void setApprVip(String apprVip) {
        this.apprVip = apprVip;
    }

    public Float getApprIntegral() {
        return apprIntegral;
    }

    public void setApprIntegral(Float apprIntegral) {
        this.apprIntegral = apprIntegral;
    }

    public Integer getApprNum() {
        return apprNum;
    }

    public void setApprNum(Integer apprNum) {
        this.apprNum = apprNum;
    }

    public Float getApprPrice() {
        return apprPrice;
    }

    public void setApprPrice(Float apprPrice) {
        this.apprPrice = apprPrice;
    }

    public String getApprHeader() {
        return apprHeader;
    }

    public void setApprHeader(String apprHeader) {
        this.apprHeader = apprHeader;
    }

    public String getApprPhoto() {
        return apprPhoto;
    }

    public void setApprPhoto(String apprPhoto) {
        this.apprPhoto = apprPhoto;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	@Override
    protected Serializable pkVal() {
        return this.apprerId;
    }

	public String getFormPwd1() {
		return formPwd1;
	}

	public void setFormPwd1(String formPwd1) {
		this.formPwd1 = formPwd1;
	}

	public String getFormPwd2() {
		return formPwd2;
	}

	public void setFormPwd2(String formPwd2) {
		this.formPwd2 = formPwd2;
	}

	public String getFormCode() {
		return formCode;
	}

	public void setFormCode(String formCode) {
		this.formCode = formCode;
	}

	public String getApprRemark() {
		return apprRemark;
	}

	public void setApprRemark(String apprRemark) {
		this.apprRemark = apprRemark;
	}

	public List<Integer> getBrands() {
		return brands;
	}

	public void setBrands(List<Integer> brands) {
		this.brands = brands;
	}

	public List<Integer> getSorts() {
		return sorts;
	}

	public void setSorts(List<Integer> sorts) {
		this.sorts = sorts;
	}

	@Override
	public String toString() {
		return "Appraisal [apprerId=" + apprerId + ", apprIdent=" + apprIdent + ", apprNick=" + apprNick + ", apprName="
				+ apprName + ", apprEmail=" + apprEmail + ", apprPwd=" + apprPwd + ", apprRemark=" + apprRemark
				+ ", apprState=" + apprState + ", apprVip=" + apprVip + ", apprIntegral=" + apprIntegral + ", apprNum="
				+ apprNum + ", apprPrice=" + apprPrice + ", apprHeader=" + apprHeader + ", apprPhoto=" + apprPhoto
				+ ", createTime=" + createTime + ", isDel=" + isDel + ", formPwd1=" + formPwd1 + ", formPwd2="
				+ formPwd2 + ", formCode=" + formCode + ", brands=" + brands + ", sorts=" + sorts + "]";
	}

	
}
