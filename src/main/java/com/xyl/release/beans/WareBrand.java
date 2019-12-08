package com.xyl.release.beans;

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
 * @since 2019-12-08
 */
@TableName("tb_ware_brand")
public class WareBrand extends Model<WareBrand> {

    private static final long serialVersionUID = 1L;

    /**
     * 品牌和商品中间表id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 商品的唯一标识
     */
    private String wareIdent;
    /**
     * 品牌id
     */
    private Integer brandId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWareIdent() {
        return wareIdent;
    }

    public void setWareIdent(String wareIdent) {
        this.wareIdent = wareIdent;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "WareBrand{" +
        ", id=" + id +
        ", wareIdent=" + wareIdent +
        ", brandId=" + brandId +
        "}";
    }
}
