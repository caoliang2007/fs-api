package org.zhongweixian.cc.service.impl;

import org.cti.cc.mapper.base.BaseMapper;
import org.cti.cc.page.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.zhongweixian.cc.service.BaseService;

import java.util.List;
import java.util.Map;

/**
 * Create by caoliang on 2020/10/28
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    abstract BaseMapper<T> baseMapper();

    @Override
    public int add(T record) {
        return baseMapper().insertSelective(record);
    }

    @Override
    public int deleteById(Long id) {
        return baseMapper().deleteByPrimaryKey(id);
    }

    @Override
    public int editById(T record) {
        return baseMapper().updateByPrimaryKeySelective(record);
    }

    @Override
    public T findById(Long id) {
        return baseMapper().selectByPrimaryKey(id);
    }



}
