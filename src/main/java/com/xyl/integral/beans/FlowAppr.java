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
@TableName("tb_flow_appr")
public class FlowAppr extends Model<FlowAppr> {

    private static final long serialVersionUID = 1L;

    /**
     * 鉴定师资金流动id
     */
    @TableId(value = "flow_id", type = IdType.AUTO)
    private Integer flowId;
    /**
     * 鉴定师id
     */
    private Integer apprId;
    /**
     * 金额
     */
    private Float flowMoney;
    /**
     * 之前的积分
     */
    private Float oldIntegral;
    /**
     * 流动的积分
     */
    private Float flowIntegral;
    /**
     * 之后的积分
     */
    private Float newIntegral;
    /**
     * 类型（充值or消费）
     */
    private String flowSort;
    /**
     * 时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 状态（100是同意，200是异常）
     */
    private String flowState;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getFlowId() {
        return flowId;
    }

    public void setFlowId(Integer flowId) {
        this.flowId = flowId;
    }

    public Integer getApprId() {
        return apprId;
    }

    public void setApprId(Integer apprId) {
        this.apprId = apprId;
    }

    public Float getFlowMoney() {
        return flowMoney;
    }

    public void setFlowMoney(Float flowMoney) {
        this.flowMoney = flowMoney;
    }

    public Float getOldIntegral() {
        return oldIntegral;
    }

    public void setOldIntegral(Float oldIntegral) {
        this.oldIntegral = oldIntegral;
    }

    public Float getFlowIntegral() {
        return flowIntegral;
    }

    public void setFlowIntegral(Float flowIntegral) {
        this.flowIntegral = flowIntegral;
    }

    public Float getNewIntegral() {
        return newIntegral;
    }

    public void setNewIntegral(Float newIntegral) {
        this.newIntegral = newIntegral;
    }

    public String getFlowSort() {
        return flowSort;
    }

    public void setFlowSort(String flowSort) {
        this.flowSort = flowSort;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getFlowState() {
        return flowState;
    }

    public void setFlowState(String flowState) {
        this.flowState = flowState;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.flowId;
    }

    @Override
    public String toString() {
        return "FlowAppr{" +
        ", flowId=" + flowId +
        ", apprId=" + apprId +
        ", flowMoney=" + flowMoney +
        ", oldIntegral=" + oldIntegral +
        ", flowIntegral=" + flowIntegral +
        ", newIntegral=" + newIntegral +
        ", flowSort=" + flowSort +
        ", createTime=" + createTime +
        ", flowState=" + flowState +
        ", isDel=" + isDel +
        "}";
    }
}
