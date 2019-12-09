package com.xyl.order.beans;

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
 * @since 2019-12-09
 */
@TableName("tb_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单表id
     */
    @TableId(value = "order_id", type = IdType.AUTO)
    private Integer orderId;
    /**
     * 订单号
     */
    private String orderNumber;
    /**
     * 价格
     */
    private Float price;
    /**
     * 下单人id
     */
    private Integer originatorId;
    /**
     * 下单人昵称
     */
    private String originatorNick;
    /**
     * 收货人
     */
    private String consigneeName;
    /**
     * 收货人联系方式
     * */
    private String consigneeEmail;
    /**
     * 收货地址
     */
    private String consigneeAddr;
    /**
     * 收货人备注
     */
    private String consigneeRemark;
    /**
     * 鉴定码
     */
    private String apprIdent;
    /**
     * 快递公司
     */
    private String expressCom;
    /**
     * 快递单号
     */
    private String expressNumber;
    /**
     * 商品的id
     * */
    private Integer wareId;
    
    /**
     * 商品名称
     */
    private String wareName;
    /**
     * 商品图片
     */
    private String wareImg;
    /**
     * 商品所属人id
     */
    private Integer ownerId;
    /**
     * 商品所属人昵称
     */
    private String ownerNick;
    /**
     * 订单状态（已下单or已发货or已收货）
     */
    private String orderState;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 收货时间
     */
    private Date confirmTime;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getOriginatorId() {
        return originatorId;
    }

    public void setOriginatorId(Integer originatorId) {
        this.originatorId = originatorId;
    }

    public String getOriginatorNick() {
        return originatorNick;
    }

    public void setOriginatorNick(String originatorNick) {
        this.originatorNick = originatorNick;
    }

    public String getConsigneeName() {
        return consigneeName;
    }

    public void setConsigneeName(String consigneeName) {
        this.consigneeName = consigneeName;
    }

    public String getConsigneeAddr() {
        return consigneeAddr;
    }

    public void setConsigneeAddr(String consigneeAddr) {
        this.consigneeAddr = consigneeAddr;
    }

    public String getConsigneeRemark() {
        return consigneeRemark;
    }

    public void setConsigneeRemark(String consigneeRemark) {
        this.consigneeRemark = consigneeRemark;
    }

    public String getApprIdent() {
        return apprIdent;
    }

    public void setApprIdent(String apprIdent) {
        this.apprIdent = apprIdent;
    }

    public String getExpressCom() {
        return expressCom;
    }

    public void setExpressCom(String expressCom) {
        this.expressCom = expressCom;
    }

    public String getExpressNumber() {
        return expressNumber;
    }

    public void setExpressNumber(String expressNumber) {
        this.expressNumber = expressNumber;
    }

    public String getWareName() {
        return wareName;
    }

    public void setWareName(String wareName) {
        this.wareName = wareName;
    }

    public String getWareImg() {
        return wareImg;
    }

    public void setWareImg(String wareImg) {
        this.wareImg = wareImg;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getOwnerNick() {
        return ownerNick;
    }

    public void setOwnerNick(String ownerNick) {
        this.ownerNick = ownerNick;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getConfirmTime() {
        return confirmTime;
    }

    public void setConfirmTime(Date confirmTime) {
        this.confirmTime = confirmTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.orderId;
    }

	public String getConsigneeEmail() {
		return consigneeEmail;
	}

	public void setConsigneeEmail(String consigneeEmail) {
		this.consigneeEmail = consigneeEmail;
	}

	public Integer getWareId() {
		return wareId;
	}

	public void setWareId(Integer wareId) {
		this.wareId = wareId;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderNumber=" + orderNumber + ", price=" + price + ", originatorId="
				+ originatorId + ", originatorNick=" + originatorNick + ", consigneeName=" + consigneeName
				+ ", consigneeEmail=" + consigneeEmail + ", consigneeAddr=" + consigneeAddr + ", consigneeRemark="
				+ consigneeRemark + ", apprIdent=" + apprIdent + ", expressCom=" + expressCom + ", expressNumber="
				+ expressNumber + ", wareId=" + wareId + ", wareName=" + wareName + ", wareImg=" + wareImg
				+ ", ownerId=" + ownerId + ", ownerNick=" + ownerNick + ", orderState=" + orderState + ", createTime="
				+ createTime + ", confirmTime=" + confirmTime + ", isDel=" + isDel + "]";
	}

	

   
}
