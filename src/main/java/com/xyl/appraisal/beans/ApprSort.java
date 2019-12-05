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
@TableName("tb_appr_sort")
public class ApprSort extends Model<ApprSort> {

    private static final long serialVersionUID = 1L;

    /**
     * 中间表id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 鉴定师唯一标识
     */
    private String apprIdent;
    /**
     * 分类id
     */
    private Integer sortId;


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

    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ApprSort{" +
        ", id=" + id +
        ", apprIdent=" + apprIdent +
        ", sortId=" + sortId +
        "}";
    }
}
