package com.xyl.brandAndSort.beans;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
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
 * @since 2019-12-04
 */
@TableName("tb_brand")
public class Brand extends Model<Brand> {

    private static final long serialVersionUID = 1L;

    /**
     * 品牌
     */
    @TableId(value = "brand_id", type = IdType.AUTO)
    private Integer brandId;
    /**
     * 品牌的唯一标识
     */
    private String brandNumber;
    /**
     * 品牌名称
     */
    private String brandName;
    /**
     * 品牌的logo
     */
    private String brandLogo;
    /**
     * 品牌的介绍
     */
    private String brandIntroduce;
    /**
     * 权重(用于展示时的排名数字越大展示越前)
     */
    private Integer brandWeight;
    /**
     * 是否展示
     */
    private String isShow;


    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrandNumber() {
        return brandNumber;
    }

    public void setBrandNumber(String brandNumber) {
        this.brandNumber = brandNumber;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandLogo() {
        return brandLogo;
    }

    public void setBrandLogo(String brandLogo) {
        this.brandLogo = brandLogo;
    }

    public String getBrandIntroduce() {
        return brandIntroduce;
    }

    public void setBrandIntroduce(String brandIntroduce) {
        this.brandIntroduce = brandIntroduce;
    }

    public Integer getBrandWeight() {
        return brandWeight;
    }

    public void setBrandWeight(Integer brandWeight) {
        this.brandWeight = brandWeight;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    @Override
    protected Serializable pkVal() {
        return this.brandId;
    }

    @Override
    public String toString() {
        return "Brand{" +
        ", brandId=" + brandId +
        ", brandNumber=" + brandNumber +
        ", brandName=" + brandName +
        ", brandLogo=" + brandLogo +
        ", brandIntroduce=" + brandIntroduce +
        ", brandWeight=" + brandWeight +
        ", isShow=" + isShow +
        "}";
    }
}
