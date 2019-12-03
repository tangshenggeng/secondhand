package com.xyl.integral.beans;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * <p>
 * 
 * </p>
 *
 * @author ITEr
 * @since 2019-11-28
 */
@TableName("tb_recharge_cust")
public class RechargeCust extends Model<RechargeCust> {

    private static final long serialVersionUID = 1L;

    /**
     * 充值的id
     */
    @TableId(value = "recharge_id", type = IdType.AUTO)
    private Integer rechargeId;
    /**
     * 充值的账号
     */
    private Integer rechargeCustId;
    /**
     * 充值的金额
     */
    private Float rechargeMoney;
    /**
     * 充值之前的积分
     */
    private Float oldIntegral;
    /**
     * 充值的积分
     */
    private Float rechargeIntegral;
    /**
     * 充值之后的积分
     */
    private Float newIntegral;
    /**
     * 类型（充值or消费）
     * */
    private String rechargeSort;
    /**
     * 充值时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 提现的状态（100是同意，200是驳回）
     */
    private String rechargeState;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Integer rechargeId) {
        this.rechargeId = rechargeId;
    }

    public Integer getRechargeCustId() {
        return rechargeCustId;
    }

    public void setRechargeCustId(Integer rechargeCustId) {
        this.rechargeCustId = rechargeCustId;
    }

    public Float getRechargeMoney() {
        return rechargeMoney;
    }

    public void setRechargeMoney(Float rechargeMoney) {
        this.rechargeMoney = rechargeMoney;
    }

    public Float getOldIntegral() {
        return oldIntegral;
    }

    public void setOldIntegral(Float oldIntegral) {
        this.oldIntegral = oldIntegral;
    }

    public Float getRechargeIntegral() {
        return rechargeIntegral;
    }

    public void setRechargeIntegral(Float rechargeIntegral) {
        this.rechargeIntegral = rechargeIntegral;
    }

    public Float getNewIntegral() {
        return newIntegral;
    }

    public void setNewIntegral(Float newIntegral) {
        this.newIntegral = newIntegral;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRechargeState() {
        return rechargeState;
    }

    public void setRechargeState(String rechargeState) {
        this.rechargeState = rechargeState;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.rechargeId;
    }

	public String getRechargeSort() {
		return rechargeSort;
	}

	public void setRechargeSort(String rechargeSort) {
		this.rechargeSort = rechargeSort;
	}

	@Override
	public String toString() {
		return "RechargeCust [rechargeId=" + rechargeId + ", rechargeCustId=" + rechargeCustId + ", rechargeMoney="
				+ rechargeMoney + ", oldIntegral=" + oldIntegral + ", rechargeIntegral=" + rechargeIntegral
				+ ", newIntegral=" + newIntegral + ", rechargeSort=" + rechargeSort + ", createTime=" + createTime
				+ ", rechargeState=" + rechargeState + ", isDel=" + isDel + "]";
	}

  
}
