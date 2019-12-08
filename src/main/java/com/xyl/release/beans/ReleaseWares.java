package com.xyl.release.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import java.util.List;

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
 * @since 2019-12-08
 */
@TableName("tb_release_wares")
public class ReleaseWares extends Model<ReleaseWares> {

    private static final long serialVersionUID = 1L;

    /**
     * 商品id
     */
    @TableId(value = "ware_id", type = IdType.AUTO)
    private Integer wareId;
    /**
     * 商品唯一标识
     */
    private String wareIdent;
    /**
     * 商品名
     */
    private String wareName;
    /**
     * 商品描述
     */
    private String wareRemark;
    /**
     * 是否鉴定（是or否）
     */
    private String isAppr;
    /**
     * 鉴定码
     */
    private String apprIdent;
    /**
     * 价格
     */
    private Float warePrice;
    /**
     * 上架时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 图片1
     */
    private String imgOne;
    /**
     * 图片2
     */
    private String imgTwo;
    /**
     * 图片3
     */
    private String imgThree;
    /**
     * 是否展示（展示or隐藏）
     */
    private String isShow;
    /**
     * 发布人id
     */
    private Integer custId;
    /**
     * 发布人昵称
     */
    private String custNick;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;

    @TableField(exist=false)
    private List<Integer> brands;
    
    @TableField(exist=false)
    private List<Integer>  sorts;
    
    public Integer getWareId() {
        return wareId;
    }

    public void setWareId(Integer wareId) {
        this.wareId = wareId;
    }

    public String getWareIdent() {
        return wareIdent;
    }

    public void setWareIdent(String wareIdent) {
        this.wareIdent = wareIdent;
    }

    public String getWareName() {
        return wareName;
    }

    public void setWareName(String wareName) {
        this.wareName = wareName;
    }

    public String getWareRemark() {
        return wareRemark;
    }

    public void setWareRemark(String wareRemark) {
        this.wareRemark = wareRemark;
    }

    public String getIsAppr() {
        return isAppr;
    }

    public void setIsAppr(String isAppr) {
        this.isAppr = isAppr;
    }

    public String getApprIdent() {
        return apprIdent;
    }

    public void setApprIdent(String apprIdent) {
        this.apprIdent = apprIdent;
    }

    public Float getWarePrice() {
        return warePrice;
    }

    public void setWarePrice(Float warePrice) {
        this.warePrice = warePrice;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getImgOne() {
        return imgOne;
    }

    public void setImgOne(String imgOne) {
        this.imgOne = imgOne;
    }

    public String getImgTwo() {
        return imgTwo;
    }

    public void setImgTwo(String imgTwo) {
        this.imgTwo = imgTwo;
    }

    public String getImgThree() {
        return imgThree;
    }

    public void setImgThree(String imgThree) {
        this.imgThree = imgThree;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
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

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.wareId;
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
		return "ReleaseWares [wareId=" + wareId + ", wareIdent=" + wareIdent + ", wareName=" + wareName
				+ ", wareRemark=" + wareRemark + ", isAppr=" + isAppr + ", apprIdent=" + apprIdent + ", warePrice="
				+ warePrice + ", createTime=" + createTime + ", imgOne=" + imgOne + ", imgTwo=" + imgTwo + ", imgThree="
				+ imgThree + ", isShow=" + isShow + ", custId=" + custId + ", custNick=" + custNick + ", isDel=" + isDel
				+ ", brands=" + brands + ", sorts=" + sorts + "]";
	}

}
