package com.xyl.integral.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;

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
@TableName("tb_cash_appr")
public class CashAppr extends Model<CashAppr> {

    private static final long serialVersionUID = 1L;

    /**
     * 提现id
     */
    @TableId(value = "cash_id", type = IdType.AUTO)
    private Integer cashId;
    /**
     * 鉴定师id
     */
    private Integer apprId;
    /**
     * 提现的方式（微信、支付宝）
     */
    private String cashWay;
    /**
     * 提现的账号
     */
    private String cashAccount;
    /**
     * 提现的金额
     */
    private Float cashMoney;
    /**
     * 提现之前的积分
     */
    private Float oldIntegral;
    /**
     * 提现的积分
     */
    private Float cashIntegral;
    /**
     * 提现之后的积分
     */
    private Float newIntegral;
    /**
     * 提现时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 提现的状态（100是申请，200是驳回，300同意）
     */
    private String cashState;
    /**
     * 是否删除（-1是删除，1是未删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getCashId() {
        return cashId;
    }

    public void setCashId(Integer cashId) {
        this.cashId = cashId;
    }

    public Integer getApprId() {
        return apprId;
    }

    public void setApprId(Integer apprId) {
        this.apprId = apprId;
    }

    public String getCashWay() {
        return cashWay;
    }

    public void setCashWay(String cashWay) {
        this.cashWay = cashWay;
    }

    public String getCashAccount() {
        return cashAccount;
    }

    public void setCashAccount(String cashAccount) {
        this.cashAccount = cashAccount;
    }

    public Float getCashMoney() {
        return cashMoney;
    }

    public void setCashMoney(Float cashMoney) {
        this.cashMoney = cashMoney;
    }

    public Float getOldIntegral() {
        return oldIntegral;
    }

    public void setOldIntegral(Float oldIntegral) {
        this.oldIntegral = oldIntegral;
    }

    public Float getCashIntegral() {
        return cashIntegral;
    }

    public void setCashIntegral(Float cashIntegral) {
        this.cashIntegral = cashIntegral;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCashState() {
        return cashState;
    }

    public void setCashState(String cashState) {
        this.cashState = cashState;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.cashId;
    }

	public Float getNewIntegral() {
		return newIntegral;
	}

	public void setNewIntegral(Float newIntegral) {
		this.newIntegral = newIntegral;
	}

	@Override
	public String toString() {
		return "CashAppr [cashId=" + cashId + ", apprId=" + apprId + ", cashWay=" + cashWay + ", cashAccount="
				+ cashAccount + ", cashMoney=" + cashMoney + ", oldIntegral=" + oldIntegral + ", cashIntegral="
				+ cashIntegral + ", newIntegral=" + newIntegral + ", createTime=" + createTime + ", cashState="
				+ cashState + ", isDel=" + isDel + "]";
	}

    
}
