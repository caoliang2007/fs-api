package org.zhongweixian.cc.fs.handler;

import com.alibaba.fastjson.JSON;
import org.cti.cc.entity.CallDevice;
import org.cti.cc.entity.CallLog;
import org.cti.cc.enums.CauseEnums;
import org.cti.cc.enums.Direction;
import org.cti.cc.po.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.zhongweixian.cc.configration.HandlerType;
import org.zhongweixian.cc.fs.event.FsExecuteEvent;
import org.zhongweixian.cc.fs.event.FsHangupEvent;
import org.zhongweixian.cc.fs.handler.base.BaseEventHandler;
import org.zhongweixian.cc.websocket.response.WsCallAfterEntity;
import org.zhongweixian.cc.websocket.response.WsResponseEntity;

import java.time.Instant;

/**
 * Created by caoliang on 2020/8/31
 */
@Component
@HandlerType("CHANNEL_EXECUTE")
public class FsExecuteHandler extends BaseEventHandler<FsExecuteEvent> {
    private Logger logger = LoggerFactory.getLogger(FsExecuteHandler.class);

    @Override
    public void handleEvent(FsExecuteEvent event) {

        CallInfo callInfo = cacheService.getCallInfo(event.getDeviceId());
        if (callInfo == null) {
            return;
        }
    }
}
