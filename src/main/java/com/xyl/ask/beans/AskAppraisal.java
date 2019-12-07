package com.xyl.ask.beans;

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
 * @since 2019-12-07
 */
@TableName("tb_ask_appraisal")
public class AskAppraisal extends Model<AskAppraisal> {

    private static final long serialVersionUID = 1L;

    /**
     * 求鉴定id
     */
    @TableId(value = "ask_id", type = IdType.AUTO)
    private Integer askId;
    /**
     * 鉴定的唯一标识
     */
    private String askIdent;
    /**
     * 请求人id
     */
    private Integer custId;
    /**
     * 请求人昵称
     */
    private String custNick;
    /**
     * 鉴定人id
     */
    private Integer apprId;
    /**
     * 鉴定人唯一标识
     */
    private String apprIdent;
    /**
     * 鉴定人昵称
     */
    private String apprNick;
    /**
     * 鉴定价格
     */
    private Float apprPrice;
    /**
     * 商品名称
     */
    private String waresName;
    /**
     * 图片1
     */
    private String waresImgOne;
    /**
     * 图片2
     */
    private String waresImgTwo;
    /**
     * 图片3
     */
    private String waresImgThree;
    /**
     * 商品备注
     */
    private String waresRemark;
    /**
     * 鉴定状态（鉴定中or真品or假货）
     */
    private String askState;
    /**
     * 申请时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 确定时间
     */
    private Date apprTime;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getAskId() {
        return askId;
    }

    public void setAskId(Integer askId) {
        this.askId = askId;
    }

    public String getAskIdent() {
        return askIdent;
    }

    public void setAskIdent(String askIdent) {
        this.askIdent = askIdent;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustNick() {
        return custNick;
    }

    public void setCustNick(String custNick) {
        this.custNick = custNick;
    }

    public Integer getApprId() {
        return apprId;
    }

    public void setApprId(Integer apprId) {
        this.apprId = apprId;
    }

    public String getApprIdent() {
        return apprIdent;
    }

    public void setApprIdent(String apprIdent) {
        this.apprIdent = apprIdent;
    }

    public Float getApprPrice() {
        return apprPrice;
    }

    public void setApprPrice(Float apprPrice) {
        this.apprPrice = apprPrice;
    }

    public String getWaresName() {
        return waresName;
    }

    public void setWaresName(String waresName) {
        this.waresName = waresName;
    }

    public String getWaresImgOne() {
        return waresImgOne;
    }

    public void setWaresImgOne(String waresImgOne) {
        this.waresImgOne = waresImgOne;
    }

    public String getWaresImgTwo() {
        return waresImgTwo;
    }

    public void setWaresImgTwo(String waresImgTwo) {
        this.waresImgTwo = waresImgTwo;
    }

    public String getWaresImgThree() {
        return waresImgThree;
    }

    public void setWaresImgThree(String waresImgThree) {
        this.waresImgThree = waresImgThree;
    }

    public String getWaresRemark() {
        return waresRemark;
    }

    public void setWaresRemark(String waresRemark) {
        this.waresRemark = waresRemark;
    }

    public String getAskState() {
        return askState;
    }

    public void setAskState(String askState) {
        this.askState = askState;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getApprTime() {
        return apprTime;
    }

    public void setApprTime(Date apprTime) {
        this.apprTime = apprTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.askId;
    }

	public String getApprNick() {
		return apprNick;
	}

	public void setApprNick(String apprNick) {
		this.apprNick = apprNick;
	}

	@Override
	public String toString() {
		return "AskAppraisal [askId=" + askId + ", askIdent=" + askIdent + ", custId=" + custId + ", custNick="
				+ custNick + ", apprId=" + apprId + ", apprIdent=" + apprIdent + ", apprNick=" + apprNick
				+ ", apprPrice=" + apprPrice + ", waresName=" + waresName + ", waresImgOne=" + waresImgOne
				+ ", waresImgTwo=" + waresImgTwo + ", waresImgThree=" + waresImgThree + ", waresRemark=" + waresRemark
				+ ", askState=" + askState + ", createTime=" + createTime + ", apprTime=" + apprTime + ", isDel="
				+ isDel + "]";
	}

    
}
