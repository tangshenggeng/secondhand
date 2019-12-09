package com.xyl.order.service.impl;

import com.xyl.order.beans.Order;
import com.xyl.order.mapper.OrderMapper;
import com.xyl.order.service.OrderService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-09
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

}
