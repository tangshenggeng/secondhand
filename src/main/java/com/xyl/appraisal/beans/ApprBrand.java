package com.xyl.appraisal.beans;

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
 * @since 2019-12-05
 */
@TableName("tb_appr_brand")
public class ApprBrand extends Model<ApprBrand> {

    private static final long serialVersionUID = 1L;

    /**
     * 品牌鉴定师中间表id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 鉴定师唯一标识
     */
    private String apprIdent;
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

    public String getApprIdent() {
        return apprIdent;
    }

    public void setApprIdent(String apprIdent) {
        this.apprIdent = apprIdent;
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
        return "ApprBrand{" +
        ", id=" + id +
        ", apprIdent=" + apprIdent +
        ", brandId=" + brandId +
        "}";
    }
}
