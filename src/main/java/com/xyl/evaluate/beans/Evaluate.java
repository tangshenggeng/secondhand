package com.xyl.evaluate.beans;

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
 * @since 2019-12-11
 */
@TableName("tb_evaluate")
public class Evaluate extends Model<Evaluate> {

    private static final long serialVersionUID = 1L;

    /**
     * 评价id
     */
    @TableId(value = "evaluate_id", type = IdType.AUTO)
    private Integer evaluateId;
    /**
     * 被评价客户的id
     */
    private Integer ownerId;
    /**
     * 订单id
     */
    private Integer orderId;
    /**
     * 评价人id
     */
    private Integer commentatorId;
    /**
     * 评价人呢称
     */
    private String commentatorNick;
    /**
     * 评价内容
     */
    private String evaluateText;
    /**
     * 评价时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getEvaluateId() {
        return evaluateId;
    }

    public void setEvaluateId(Integer evaluateId) {
        this.evaluateId = evaluateId;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public Integer getCommentatorId() {
        return commentatorId;
    }

    public void setCommentatorId(Integer commentatorId) {
        this.commentatorId = commentatorId;
    }

    public String getCommentatorNick() {
        return commentatorNick;
    }

    public void setCommentatorNick(String commentatorNick) {
        this.commentatorNick = commentatorNick;
    }

    public String getEvaluateText() {
        return evaluateText;
    }

    public void setEvaluateText(String evaluateText) {
        this.evaluateText = evaluateText;
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
        return this.evaluateId;
    }

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Override
	public String toString() {
		return "Evaluate [evaluateId=" + evaluateId + ", ownerId=" + ownerId + ", orderId=" + orderId
				+ ", commentatorId=" + commentatorId + ", commentatorNick=" + commentatorNick + ", evaluateText="
				+ evaluateText + ", createTime=" + createTime + ", isDel=" + isDel + "]";
	}

}
