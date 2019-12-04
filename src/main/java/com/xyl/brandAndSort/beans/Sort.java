package com.xyl.brandAndSort.beans;

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
@TableName("tb_sort")
public class Sort extends Model<Sort> {

    private static final long serialVersionUID = 1L;

    /**
     * 分类id
     */
    @TableId(value = "sort_id", type = IdType.AUTO)
    private Integer sortId;
    /**
     * 分类名称
     */
    private String sortName;
    /**
     * 分类权重(用于展示时的排名数字越大展示越前)
     */
    private Integer sortWeight;
    /**
     * 展示or隐藏
     */
    private String isShow;


    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public Integer getSortWeight() {
        return sortWeight;
    }

    public void setSortWeight(Integer sortWeight) {
        this.sortWeight = sortWeight;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    @Override
    protected Serializable pkVal() {
        return this.sortId;
    }

    @Override
    public String toString() {
        return "Sort{" +
        ", sortId=" + sortId +
        ", sortName=" + sortName +
        ", sortWeight=" + sortWeight +
        ", isShow=" + isShow +
        "}";
    }
}
