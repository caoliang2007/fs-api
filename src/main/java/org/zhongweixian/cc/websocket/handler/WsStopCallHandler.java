package org.zhongweixian.cc.websocket.handler;

import org.apache.commons.lang3.StringUtils;
import org.cti.cc.enums.ErrorCode;
import org.cti.cc.po.AgentInfo;
import org.cti.cc.po.AgentState;
import org.cti.cc.po.CallInfo;
import org.springframework.stereotype.Component;
import org.zhongweixian.cc.configration.HandlerType;
import org.zhongweixian.cc.websocket.event.WsStopCallEvent;
import org.zhongweixian.cc.websocket.handler.base.WsBaseHandler;
import org.zhongweixian.cc.websocket.response.WsResponseEntity;

/**
 * Created by caoliang on 2020/11/6
 */
@Component
@HandlerType("WS_STOP_CALL")
public class WsStopCallHandler extends WsBaseHandler<WsStopCallEvent> {
    @Override
    public void handleEvent(WsStopCallEvent event) {
        logger.info("{}", event.toString());
        AgentInfo agentInfo = getAgent(event);
        CallInfo callInfo = cacheService.getCallInfo(agentInfo.getCallId());
        if (callInfo == null || StringUtils.isBlank(callInfo.getMedia())) {
            logger.warn("agentKey:{} not find call", event.getAgentKey());
            agentInfo.setCallId(null);
            agentInfo.setDeviceId(null);
            agentInfo.setAgentState(AgentState.NOT_READY);
            sendMessgae(event, new WsResponseEntity<String>(ErrorCode.CALL_NOT_EXIST, event.getCmd(), event.getAgentKey()));
            return;
        }
        logger.info("坐席发起挂机 agent:{} callId:{}", event.getAgentKey(), callInfo.getCallId());
        stopCall(callInfo.getMedia(), agentInfo.getDeviceId());
    }
}
